<?php

  foreach($_POST as $chave=>$valor) {
   $res[$chave] = $valor;
  }


  $res['data'] = datept2en('/',$res['data']);
  $res['titulo'] = isset($res['titulo']) ? $res['titulo'] : null;
  # include de mensagens do arquivo atual
  include_once 'inc.exec.msg.php';

 ## verifica se existe um titulo/nome/email com o mesmo nome do que esta sendo inserido

 $sql_valida = "SELECT ${var['pre']}_titulo FROM ".TABLE_PREFIX."_${var['path']} WHERE ${var['pre']}_titulo=?";
 $qry_valida = $conn->prepare($sql_valida);
 $qry_valida->bind_param('s', $res['titulo']); 
 $qry_valida->execute();
 $qry_valida->store_result();

  #se existe um titulo/nome/email assim nao passa
  if ($qry_valida->num_rows<>0 && $act=='insert' && empty($res['signo'])) {
   echo $msgDuplicado;
   $qry_valida->close();


  #se nao existe faz a inserção
  } else {

     #autoinsert
     include_once $rp.'inc.autoinsert.php';


    $texto = isset($res['texto']) && !empty($res['texto']) ? txt_bbcode($res['texto']) : null;
    $resumo = isset($res['resumo']) && !empty($res['resumo']) ? $res['resumo'] : null;
    $linhafina = strip_tags($res['linhafina']);
	$palavrachave = remove_accents($res['palavrachave']);
	$palavrachave = preg_replace('/-/', null, $palavrachave);
	$res['signo'] = isset($res['signo']) ? $res['signo'] : null;

    $sql= "UPDATE ".TABLE_PREFIX."_${var['path']} SET

            ${var['pre']}_area=?,
            ${var['pre']}_signo=?,
            ${var['pre']}_titulo=?,
            ${var['pre']}_linhafina=?,
            ${var['pre']}_data=?,
            ${var['pre']}_resumo=?,
            ${var['pre']}_autor=?,
            ${var['pre']}_palavrachave=?,
            ${var['pre']}_texto=?,
            ${var['pre']}_video=?
          	";
     $sql.=" WHERE ${var['pre']}_id=?";
     $qry=$conn->prepare($sql);
     $qry->bind_param('isssssssssi', $res['area'], $res['signo'], $res['titulo'], $linhafina, $res['data'], $resumo, $res['autor'], $palavrachave, $texto, $res['video'], $res['item']); 
     $qry->execute();


   if ($qry==false) echo $msgExiste;
    else {
     
     $qry->close();
     #insere as fotos/galeria do artigo
     include_once 'mod.exec.galeria.php';
    
     echo $msgSucesso;

    }

 }