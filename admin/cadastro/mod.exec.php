<?php

  foreach($_POST as $chave=>$valor) {
   $res[$chave] = $valor;
  }


  $res['nascimento'] = datept2en('/',$res['nascimento']);
# include de mensagens do arquivo atual
 include_once 'inc.exec.msg.php';


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
  		  ${var['pre']}_email=?,
		  ${var['pre']}_nascimento=?,
		  ${var['pre']}_telefone=?,
		  ${var['pre']}_celular=?,
		  ${var['pre']}_endereco=?,
		  ${var['pre']}_sexo=?,
		  ${var['pre']}_estado_civil=?,
		  ${var['pre']}_filhos=?,
		  ${var['pre']}_facebook=?,
		  ${var['pre']}_twitter=?,
		  ${var['pre']}_ja_comprou=?,
		  ${var['pre']}_cep=?,
		  ${var['pre']}_cidade=?,
		  ${var['pre']}_estado=?
	";
     $sql.=" WHERE ${var['pre']}_id=?";
     $qry=$conn->prepare($sql);
     $qry->bind_param('ssssssssissssssi',$res['nome'],$res['email'],$res['nascimento'],$res['telefone'], $res['celular'], $res['endereco'], $res['sexo'], $res['estado_civil'], $res['filhos'], $res['facebook'], $res['twitter'], $res['ja_comprou'], $res['cep'],$res['cidade'],$res['estado'],$res['item']); 
     $qry->execute();


   if ($qry==false) echo $msgExiste;
    else {
     
     $qry->close();

      /*
      *se for inserçao é cria uma senha e envia por email
      */
     if ($act=='insert') {
      $senha	     = gera_senha(4);
      $form['senha'] = md5($senha);

       $sql_senha = "UPDATE ".TABLE_PREFIX."_${var['path']} SET ${var['pre']}_senha=?";
       $sql_senha.=" WHERE ${var['pre']}_id=?";
       $qry_senha=$conn->prepare($sql_senha);
       $qry_senha->bind_param('si',$res['senha'],$res['item']); 
       $qry_senha->execute();


     }
   


     echo $msgSucesso;
	 //include_once 'inc.email.php';
	 include_once 'mod.exec.perfil.php';

    }

 }
