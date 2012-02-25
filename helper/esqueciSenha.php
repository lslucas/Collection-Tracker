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


	$res['login'] = isset($_REQUEST['login']) ? trim($_REQUEST['login']) : null;
	if (empty($res['login']) || !validaLogin($res['login']))
		echo 'Login inválido! É permitido apenas letras, números, ponto e _';

	else {

		$sql = "SELECT ${var['pre']}_id, ${var['pre']}_login, ${var['pre']}_email, ${var['pre']}_senhaaberta FROM ".TABLE_PREFIX."_${var['path']} ";
		$sql.=" WHERE ${var['pre']}_login=?";

		if (!$qry=$conn->prepare($sql))
			die('Houve um erro na tentativa de realizar a consulta de cadastro! Contate o desenvolvedor.');
			//die($conn->error);

		else {
			$qry->bind_result($item, $login, $email, $senhaaberta);
			$qry->bind_param('s', $res['login']);
			$qry->execute();
			$qry->store_result();
			$num = $qry->num_rows;
			$qry->fetch();
			$qry->close();
		}

		if ($num==0 || !validaEmail($email))
			echo "Usuário não existe!";

		else {

			/*
			 *html do email
			 */
			$email_subject = SITE_NAME.": Dados de acesso!";
			$msg = $user_email_header;
			$msg .= "
				 <center><img src='".URL_ADMLOGO."'></center><p />
				 Olá ".$login.", abaixo seus dados de acesso:

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
				echo 'Senha reenviada para '.$email;

			else
				echo 'NÃO foi enviada ao email '.$email;


		}

	}
