<?php

  foreach($_POST as $chave=>$valor) {
   $res[$chave] = $valor;
  }


 //$res['nascimento'] = datept2en('/',$res['nascimento']);
 #include de mensagens do arquivo atual
 include_once 'inc.exec.msg.php';
 include_once '_inc/class.password.php';


 ## verifica se existe um titulo/nome/email com o mesmo nome do que esta sendo inserido
 $sql_valida = "SELECT ${var['pre']}_email retorno FROM ".TABLE_PREFIX."_${var['path']} WHERE ${var['pre']}_email=?";
 $qry_valida = $conn->prepare($sql_valida);
 $qry_valida->bind_param('s', $res['email']); 
 $qry_valida->execute();
 $qry_valida->store_result();

  #se existe um titulo/nome/email assim nao passa
  if ($qry_valida->num_rows<>0 && $act=='insert') {
   echo $msgDuplicado;
   $qry_valida->close();


  #se nao existe faz a inserção
  } else {

     #autoinsert
     include_once $rp.'inc.autoinsert.php';


     $sql= "UPDATE ".TABLE_PREFIX."_${var['path']} SET

  		  ${var['pre']}_nome=?,
  		  ${var['pre']}_login=?,
  		  ${var['pre']}_email=?
	";
     $sql.=" WHERE ${var['pre']}_id=?";
     $qry=$conn->prepare($sql);
     $qry->bind_param('sssi',$res['nome'], $res['login'], $res['email'], $res['item']); 
     $qry->execute();


   if ($qry==false) echo $msgExiste;
    else {
     
     $qry->close();

      /*
      *se for inserçao é cria uma senha e envia por email
      */
     if ($act=='insert') {

		/*
		 *call Password
		 */
		$senha	    = gera_senha(4);
		$password   = new Password;
		$res['senha'] = $password->hash($senha, 'mcrypt', SITE_NAME.'salt');


		$sql_senha = "UPDATE ".TABLE_PREFIX."_${var['path']} SET ${var['pre']}_senha=?, ${var['pre']}_senhaAberta=?";
		$sql_senha.=" WHERE ${var['pre']}_id=?";
		$qry_senha=$conn->prepare($sql_senha);
		$qry_senha->bind_param('ssi', $res['senha'], $senha, $res['item']); 
		$qry_senha->execute();


     }
   
     echo $msgSucesso;

	 if ($act<>'update')
		include_once 'inc.email.php';

    }

 }
