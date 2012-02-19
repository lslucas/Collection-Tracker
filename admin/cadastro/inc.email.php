<?php

$msg = $user_email_header;
  if ($act=='insert') {
    $email_subject = SITE_NAME.": Seus dados de acesso";
    $msg .= "
	     <center><img src='".URL_ADMLOGO."'></center><p />
	     Olá ".$res['login'].", abaixo estão seus dados de acesso ao ".SITE_NAME.":

	     <p><b>Usuário:</b> ".$res['login']."
	     <br><b>Senha:</b> ".$senha."
	     <br><b>URL: </b> <a href='".SITE_URL."' target='_blank'>".SITE_URL."</a>

	     <p>Lembrando que é possível alterar sua senha!</p>";

   } elseif ($act=='alterasenha') {
    $email_subject = SITE_NAME.": Senha alterada";
    $msg .= "
	     <center><img src='".URL_ADMLOGO."'></center><p />
	     Olá ".$res['login'].", sua senha foi alterada!

	     <p><b>Usuário:</b> ".$res['login']."
	     <br><b>Senha:</b> ".$senha." 
	     <br><b>URL:</b> <a href='".SITE_URL."' target='_blank'>".SITE_URL."</a>
	    ";
   }
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

		include_once 'inc.sendmail.header.php';

		if ($sended)
			echo '<span class="discret">E-mail enviado!</span>';
		else
			echo '<span class="discret">Houve um <b>erro</b> ao enviar o email para '.$toEmail.', envie manualmente, depois entre em contato com o desenvolvedor.</span>';
