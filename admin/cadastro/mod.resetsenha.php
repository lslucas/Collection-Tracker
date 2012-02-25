<?php

$rp			= '../';
$_GET['p']  = 'cadastro';

include_once $rp.'_inc/global.php';
include_once $rp.'_inc/db.php';
include_once $rp.'_inc/global_function.php';
include_once 'mod.var.php';


	$res['item'] = apenasNumeros($_POST['item']);
	if (isset($res['item'])) {

		$sql = "SELECT ${var['pre']}_login, ${var['pre']}_email, ${var['pre']}_senhaaberta FROM ".TABLE_PREFIX."_${var['path']} ";
		$sql.=" WHERE ${var['pre']}_id=?";

		if (!$qry=$conn->prepare($sql))
		   die($conn->error);

		else {
			$qry->bind_result($login, $email, $senhaaberta);
			$qry->bind_param('i', $res['item']);
			$qry->execute();
			$qry->fetch();
			$qry->close();
		}


		/*
		 *html do email
		 */
		$email_subject = SITE_NAME.": Sua senha de acesso!";
		$msg = $user_email_header;
		$msg .= "
			 <center><img src='".URL_ADMLOGO."'></center><p />
			 Olá ".$login.", abaixo os seus dados para login:

			 <p><b>Usuário:</b> ".$login."
			 <br><b>Senha:</b> ".$senhaaberta." 
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
			echo 'Senha reenviada a '.$email;

		else
			echo 'Senha não foi enviada ao email '.$email;


	}
