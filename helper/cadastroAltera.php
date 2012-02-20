<?php
/*
 * UPDATE USER
 */
session_start();
$rp			= '../admin/';
$_GET['p']  = 'cadastro';

include_once $rp.'_inc/global.php';
include_once $rp.'_inc/db.php';
include_once $rp.'_inc/global_function.php';
require_once $rp.'_inc/class.password.php';
include_once $rp.'cadastro/mod.var.php';


	/*
	 *antes de tudo verifica se está logado
	 */
	if (isset($_SESSION['ct']['login']) && !empty($_SESSION['ct']['login'])) {

		$item = $_SESSION['ct']['id'];
		$userLogin = $_SESSION['ct']['login'];
		$userEmail = $_SESSION['ct']['email'];

	} else
		die('Você precisa estar logado para poder alterar seu cadastro!');


	/*
	 *verifica se todos os parametros estao ok
	 */
	if (!isset($_REQUEST['login']) || !isset($_REQUEST['senha']) || !isset($_REQUEST['email']))
		die('Atenção: Faltam parâmetros!');


	/*
	 *começa as validações
	 */
	$res['login'] = trim($_REQUEST['login']);
	$res['senha'] = trim($_REQUEST['senha']);
	$res['novasenha'] = isset($_REQUEST['novasenha']) && !empty($_REQUEST['novasenha']) ? trim($_REQUEST['novasenha']) : null;
	$res['email'] = trim($_REQUEST['email']);

	if (empty($res['login']) || empty($res['senha']) || empty($res['email']))
		echo 'Preencha todos os campos antes de continuar o cadastro!';

	elseif(!validaEmail($res['email']))
		echo 'Email inválido, tente novamente!';

	elseif(!validaLogin($res['login']))
		echo 'Login inválido! É permitido apenas letras, números, ponto e _';

	else {

		$sql = "SELECT
					{$var['pre']}_id,
					{$var['pre']}_login,
					{$var['pre']}_email,
					{$var['pre']}_senha,
					{$var['pre']}_status
				FROM ".TABLE_PREFIX."_${var['path']}";
		$sql.=" WHERE ${var['pre']}_email=?";

		if (!$qry=$conn->prepare($sql))
			die('Houve um erro na tentativa de realizar a consulta de cadastro! Contate o desenvolvedor.');
			//die($conn->error);

		else {

			$qry->bind_param('s', $res['email']);
			$qry->execute();
			$qry->bind_result($id, $login, $email, $senha, $status);
			$qry->store_result();
			$num = $qry->num_rows;
			$qry->fetch();
			$qry->close();

			/*
			 *call Password
			 */
			$password   = new Password;
			$securePass = $password->hash($res['senha'], 'mcrypt', SITE_NAME.'salt');
			$secureNewPass = !empty($res['novasenha']) ? $password->hash($res['novasenha'], 'mcrypt', SITE_NAME.'salt') : null;


			if ($num>0 && $item<>$id)
				echo "Já existe um usuário com o email ({$res['email']})";

			elseif ($securePass<>$senha)
				echo 'Senha atual inválida!';

			else {

				/*
				 *SQL de atualização do cadastro
				 */
				$sql= "UPDATE ".TABLE_PREFIX."_${var['path']} SET
						${var['pre']}_nome=?, ${var['pre']}_login=?, ${var['pre']}_email=?
						WHERE ${var['pre']}_id=?";

				if (!$qry=$conn->prepare($sql))
					echo 'Houve um erro na tentativa de realizar a atualização do cadastro! Contate o desenvolvedor.';
					//echo $conn->error;

				else {

				 $qry->bind_param('sssi', $res['nome'], $res['login'], $res['email'], $item); 
				 $qry->execute();
				 $qry->close();


					 if (!empty($secureNewPass)) {

						 $sqlpass = "UPDATE ".TABLE_PREFIX."_${var['path']} SET ${var['pre']}_senha=?";
						 $sqlpass.= " WHERE ${var['pre']}_id=?";

						if (!$qrypass=$conn->prepare($sqlpass))
							echo 'Houve um erro na tentativa de cadastrar nova senha! Contate o desenvolvedor.';
							//echo $conn->error;

						else {

						 $qrypass->bind_param('si', $secureNewPass, $item); 
						 $qrypass->execute();
						 $qrypass->close();


						/*
						 *html do email
						 */
						$email_subject = SITE_NAME.": Informações de usuário alteradas!";
						$msg = $user_email_header;
						$msg .= "
							 <center><img src='".URL_ADMLOGO."'></center><p />
							 Olá ".$res['login'].", suas informações de usuário foram alteradas!

							 <p><b>Usuário:</b> ".$res['login']."
							 <br><b>Senha:</b> ".$res['novasenha']." 
							 <br><b>URL:</b> <a href='".SITE_URL."' target='_blank'>".SITE_URL."</a>
							";
						$msg .= $user_email_footer;


						}

					 } else {

						/*
						 *html do email
						 */
						$email_subject = SITE_NAME.": Informações de usuário alteradas!";
						$msg = $user_email_header;
						$msg .= "
							 <center><img src='".URL_ADMLOGO."'></center><p />
							 Olá ".$res['login'].", suas informações de usuário foram alteradas!

							 <p><b>Usuário:</b> ".$res['login']."
							 <br><b>Senha:</b> continua a mesma!
							 <br><b>URL:</b> <a href='".SITE_URL."' target='_blank'>".SITE_URL."</a>
							";
						$msg .= $user_email_footer;

					 }


					/*
					 *vars to send a email
					 */
					if (!isset($email_subject))
						echo 'Houve um problema, contate o desenvolvedor!';
					else {

						$htmlMensage= utf8_decode($msg);
						$subject	= utf8_decode($email_subject);
						$fromEmail	= EMAIL;
						$fromName	= utf8_decode(SITE_NAME);
						$toName		= utf8_decode($res['login']);
						$toEmail	= $res['email'];

						include_once $rp.'inc.sendmail.header.php';


						//atualiza session vars de login e email
						$_SESSION['ct']['login'] = $res['login'];
						$_SESSION['ct']['email'] = $res['email'];

						if ($sended)
							echo 'Cadastro atualizado com êxito!';

						else
							echo 'Cadastro atualizado mas não foi possível enviar confirmação ao email: '.$res['email'];
					}


				}

			}
		}

	}
