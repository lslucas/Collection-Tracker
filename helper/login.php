<?php
/*
 * LOGIN
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

		foreach ($_SESSION['ct'] as $key=>$val)
			echo $key.'='.$val."\n";

		die();

	} else
		unset($_SESSION['ct']);


	/*
	 *verifica se todos os parametros estao ok
	 */
	if (!isset($_REQUEST['login']) || !isset($_REQUEST['senha']))
		die('Atenção: Faltam parâmetros!');


	/*
	 *começa as validações
	 */
	$res['login'] = trim($_REQUEST['login']);
	$res['senha'] = trim($_REQUEST['senha']);

	if (empty($res['login']) || empty($res['senha']))
		echo 'Login ou senha em branco!';

	elseif(!validaLogin($res['login']))
		echo 'Login inválido! É permitido apenas letras, números, ponto e _';

	else {

		$sql = "SELECT
					{$var['pre']}_id,
					{$var['pre']}_login,
					{$var['pre']}_email,
					{$var['pre']}_senha,
					{$var['pre']}_status,
					DATE_FORMAT({$var['pre']}_timestamp, '%d/%m/%Y') cadastro,
					DATE_FORMAT({$var['pre']}_ultimo_login, '%d/%m/%Y') ultimo_login
				FROM ".TABLE_PREFIX."_${var['path']}";
		$sql.=" WHERE ${var['pre']}_login=? OR ${var['pre']}_email=?";

		if (!$qry=$conn->prepare($sql))
			die('Houve um erro na tentativa de realizar a consulta de cadastro! Contate o desenvolvedor.');
			//die($conn->error);

		else {

			$qry->bind_param('ss', $res['login'], $res['login']);
			$qry->execute();
			$qry->bind_result($id, $login, $email, $senha, $status, $dt_cadastro, $dt_ultimoLogin);
			$qry->store_result();
			$num = $qry->num_rows;
			$qry->fetch();
			$qry->close();

			/*
			 *call Password
			 */
			$password   = new Password;
			$securePass = $password->hash($res['senha'], 'mcrypt', SITE_NAME.'salt');


			if ($num==0 || $securePass<>$senha)
				echo 'Usuário ou senha inválido!';

			else {


				/*
				 *atualiza data do ultimo login
				 */
				$sql_updlogin = "UPDATE ".TABLE_PREFIX."_${var['path']} SET ${var['pre']}_ultimo_login=NOW()";
				if (!$qry_updlogin=$conn->prepare($sql_updlogin))
				   echo $conn->error;

				else {

					$qry_updlogin->execute();
					$qry_updlogin->close();


					$_SESSION['ct']['id'] = $id;
					$_SESSION['ct']['login'] = $login;
					$_SESSION['ct']['email'] = $email;
					$_SESSION['ct']['status'] = $status;
					$_SESSION['ct']['dataCadastro'] = $dt_cadastro;
					$_SESSION['ct']['dataUltimoLogin'] = $dt_ultimoLogin;

					foreach ($_SESSION['ct'] as $key=>$val)
						echo $key.'='.$val."\n";

				}

			}


		}

	}

