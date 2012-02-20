<?php
/*
 *RESET PASSWORD
 */
$rp			= '../admin/';
$_GET['p']  = 'cadastro';

include_once $rp.'_inc/global.php';
include_once $rp.'_inc/db.php';
include_once $rp.'_inc/global_function.php';
include_once $rp.'cadastro/mod.var.php';


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

		$sql = "SELECT ${var['pre']}_id, ${var['pre']}_login, ${var['pre']}_email FROM ".TABLE_PREFIX."_${var['path']} ";
		$sql.=" WHERE ${var['pre']}_login=?";

		if (!$qry=$conn->prepare($sql))
		   die($conn->error);

		else {
			$qry->bind_result($item, $login, $email);
			$qry->bind_param('s', $res['login']);
			$qry->execute();
			$qry->fetch();
			$qry->close();
		}


		$senha	      = gera_senha(4);
		$res['senha'] = md5($senha);

		$sql_senha = "UPDATE ".TABLE_PREFIX."_${var['path']} SET ${var['pre']}_senha=?";
		$sql_senha.=" WHERE ${var['pre']}_id=?";

		if (!$qry_senha=$conn->prepare($sql_senha))
		   echo $conn->error;

		else {

			$qry_senha->bind_param('si', $res['senha'], $item); 
			$qry_senha->execute();
			$qry_senha->close();

			/*
			 *html do email
			 */
			$email_subject = SITE_NAME.": Nova senha de acesso!";
			$msg = $user_email_header;
			$msg .= "
				 <center><img src='".URL_ADMLOGO."'></center><p />
				 Olá ".$login.", sua senha foi alterada!

				 <p><b>Usuário:</b> ".$login."
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
			$toName		= utf8_decode($login);
			$toEmail	= $email;

			include_once $rp.'inc.sendmail.header.php';

			if ($sended)
				echo 'Senha resetada e enviada a '.$email;

			else
				echo 'Senha resetada MAS não foi enviada ao email '.$email;

		 }


	}
