<?php
/*
 * LOGIN
 */
session_start();
$rp			= '../admin/';
$_GET['p']  = 'pet';

include_once $rp.'_inc/global.php';
include_once $rp.'_inc/db.php';
include_once $rp.'_inc/global_function.php';
include_once $rp.'pet/mod.var.php';

	/*
	 *antes de tudo verifica se está logado
	 */
	if (!isset($_SESSION['ct']['login']) || empty($_SESSION['ct']['login']))
		die('Usuário não logado!');



	/*
	 *query de listagem
	 */
	$sql = "SELECT
				{$var['pre']}_id,
				{$var['pre']}_nome,
				{$var['pre']}_codigo,
				{$var['pre']}_texto,
				DATE_FORMAT({$var['pre']}_timestamp, '%d/%m/%Y') cadastro,
				DATE_FORMAT({$var['pre']}_data, '%d/%m/%Y') data
			FROM ".TABLE_PREFIX."_${var['path']}";
	$sql.=" WHERE ${var['pre']}_status=1 ORDER BY {$var['pre']}_data DESC";

	if (!$qry=$conn->prepare($sql))
		die('Houve um erro na tentativa de listar os pets! Contate o desenvolvedor.');
		//die($conn->error);

	else {

		$qry->execute();
		$qry->bind_result($id, $nome, $codigo, $texto, $cadastro, $data);
		$qry->store_result();
		$num = $qry->num_rows;


		while($qry->fetch()) {

			$nome	= preg_replace('/[&;]/', '', $nome);
			$codigo = preg_replace('/[&;]/', '', $codigo);
			$texto	= preg_replace('/[&;]/', '', $texto);

			$_SESSION['ct']['pet']['datetime']		= date('Y-m-d H:i:s');
			$_SESSION['ct']['pet']['collection'][$id]['id']		= $id;
			$_SESSION['ct']['pet']['collection'][$id]['nome']		= $nome;
			$_SESSION['ct']['pet']['collection'][$id]['codigo']	= $codigo;
			$_SESSION['ct']['pet']['collection'][$id]['texto']	= $texto;
			$_SESSION['ct']['pet']['collection'][$id]['cadastro'] = $cadastro;
			$_SESSION['ct']['pet']['collection'][$id]['data']		= $data;

		}

		$resp = null;
		foreach ($_SESSION['ct']['pet']['collection'] as $key=>$arr) {

			$subresp = null;
			foreach ($arr as $chave=>$valor)
				$subresp .= $chave.'='.$valor."&";

			$resp .= substr($subresp, 0, -1).';';
		}

		echo substr($resp, 0, -1);


		$qry->close();

	}
