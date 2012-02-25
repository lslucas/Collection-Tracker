<?php
/*
 * NEW USER
 */
$rp			= '../admin/';
$_GET['p']  = 'cadastro';

include_once $rp.'_inc/global.php';
include_once $rp.'_inc/db.php';
include_once $rp.'_inc/global_function.php';
require_once $rp.'_inc/class.password.php';
include_once $rp.'cadastro/mod.var.php';

	if (!isset($_REQUEST['login']) || !isset($_REQUEST['senha']) || !isset($_REQUEST['email']))
		die('Atenção: Faltam parâmetros!');

	$res['login'] = trim($_REQUEST['login']);
	$res['senha'] = trim($_REQUEST['senha']);
	$res['email'] = trim($_REQUEST['email']);

	if (empty($res['login']) || empty($res['senha']) || empty($res['email']))
		echo 'Preencha todos os campos antes de continuar o cadastro!';

	elseif(!validaEmail($res['email']))
		echo 'Email inválido, tente novamente!';

	elseif(!validaLogin($res['login']))
		echo 'Login inválido! É permitido apenas letras, números, ponto e _';

	else {

		$sql = "SELECT NULL FROM ".TABLE_PREFIX."_${var['path']} ";
		$sql.=" WHERE ${var['pre']}_login=? OR ${var['pre']}_email=?";

		if (!$qry=$conn->prepare($sql))
			die('Houve um erro na tentativa de realizar a consulta de cadastro! Contate o desenvolvedor.');

		else {
			$qry->bind_param('ss', $res['login'], $res['email']);
			$qry->execute();
			$qry->store_result();
			$num = $qry->num_rows;
			$qry->fetch();
			$qry->close();
		}

		if ($num>0)
			echo "Já existe um usuário com o login ({$res['login']}) ou email ({$res['email']})";

		else {

			$password   = new Password;
			$senha	    = $res['senha'];
			$securePass = $password->hash($senha, 'mcrypt', SITE_NAME.'salt');

			/*
			 *SQL cadastro
			 */
			$sql= "INSERT INTO ".TABLE_PREFIX."_${var['path']}
					(${var['pre']}_nome, ${var['pre']}_login, ${var['pre']}_email, ${var['pre']}_senha, ${var['pre']}_senhaaberta)
					VALUES (?, ?, ?, ?, ?) ";

			if (!$qry=$conn->prepare($sql))
				echo 'Houve um erro na tentativa de realizar o cadastro! Contate o desenvolvedor.';
				//echo $conn->error;

			else {

			 $qry->bind_param('sssss', $res['nome'], $res['login'], $res['email'], $securePass, $senha); 
			 $qry->execute();
			 $qry->close();

				/*
				 *html do email
				 */
				$email_subject = SITE_NAME.": Nova senha de acesso!";
				$msg = $user_email_header;
				$msg .= "
					 <center><img src='".URL_ADMLOGO."'></center><p />
					 Olá ".$res['login'].", sua senha foi alterada!

					 <p><b>Usuário:</b> ".$res['login']."
					 <br><b>Senha:</b> ".$senha." 
					 <br><b>URL:</b> <a href='".SITE_URL."' target='_blank'>".SITE_URL."</a>
					";
				$msg .= $user_email_footer;


				/*
				 *vars to send a email
				 */
				$htmlMensage= utf8_decode($msg);
				$subject	= utf8_decode($email_subject);
				$fromEmail	= EMAIL;
				$fromName	= utf8_decode(SITE_NAME);
				$toName		= utf8_decode($res['login']);
				$toEmail	= $res['email'];

				include_once $rp.'inc.sendmail.header.php';

				if ($sended)
					echo 'Cadastro realizado com êxito!';

				else
					echo 'Cadastro realizado mas não foi possível enviar confirmação ao email: '.$res['email'];

			}

		}

	}
