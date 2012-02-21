  <div class='error container-error'><div class='error-icon'>
	Antes de prosseguir preencha corretamente o formulário e revise os campos abaixo:</div>
	<ol> 
		<li><label for="galeria" class="error-validate">Envia alguma imagem/foto</label></li> 
		<li><label for="titulo" class="error-validate">Informe o título</label></li> 
		<li><label for="area" class="error-validate">Selecione uma <b>área</b> para o artigo</label></li> 
		<li><label for="autor" class="error-validate">Informe um <b>autor</b></label></li> 
		<li><label for="data" class="error-validate">Entre com uma data válida</label></li> 
		<li><label for="resumo" class="error-validate">Você precisa informar algum <b>resumo</b></label></li> 
		<li><label for="texto" class="error-validate">Você precisa informar algum <b>texto</b></label></li> 
	</ol> 
  </div>



<form method='post' action='?<?=$_SERVER['QUERY_STRING']?>' id='form_<?=$p?>' class='form cmxform' enctype="multipart/form-data">
 <input type='hidden' name='act' value='<?=$act?>'>
<?php
  if ($act=='update')
    echo "<input type='hidden' name='item' value='${_GET['item']}'>";
?>

<h1>
<?php 
  if ($act=='insert') echo $var['insert'];
   else echo $var['update'];
?>
</h1>
<p class='header'>Todos os campos com <b>- * -</b> são obrigatórios.</p>



    <ol>


	<li class='anti-horoscopo anti-tv'>	
	  <label>Imagem<span class='small'><a href='javascript:void(0);' class='addImagem' id='min'>adicionar + fotos</a></span></label>
	  <?php
		  
	    if ($act=='update') {
				  
		    $sql_gal = "SELECT rag_id, rag_imagem, rag_legenda, rag_pos FROM ".TABLE_PREFIX."_r_${var['pre']}_galeria WHERE rag_${var['pre']}_id=? AND rag_imagem IS NOT NULL ORDER BY rag_pos ASC;"; 
		    $qr_gal = $conn->prepare($sql_gal);
		    $qr_gal->bind_param('s',$_GET['item']);
		    $qr_gal->execute();
		    $qr_gal->bind_result($g_id, $g_imagem, $g_legenda, $g_pos);
		    $i=0;

		      echo '<table id="posGaleria" cellspacing="0" cellpadding="2">';
		      while ($qr_gal->fetch()) {
	  ?>
		<tr id="<?=$g_id?>">
		  <td width='20px' title='Clique e arraste para mudar a posição da foto' class='tip'></td>

		  <td class='small'>
		    [<a href='?p=<?=$p?>&delete_galeria&item=<?=$g_id?>&prefix=r_<?=$var['pre']?>_galeria&pre=rag&col=imagem&folder=<?=$var['imagem_folderlist']?>&noVisual' title="Clique para remover o ítem selecionado" class='tip trash-galeria' style="cursor:pointer;" id="<?=$g_id?>">remover</a>]
		  </td>

		  <td>

		    <a href='$imagThumb<?=$i?>?width=100%' id='imag<?=$i?>' class='betterTip'>
			<img src='images/lupa.gif' border='0' style='background-color:none;padding-left:10px;cursor:pointer'></a> &nbsp; <span style='font-size:8pt; color:#777;'><?=!empty($g_legenda) ? $g_legenda : '[sem legenda]'?></span>

			 <div id='imagThumb<?=$i?>' style='float:left;display:none;'>
			 <?php 
			 
			    if (file_exists(substr($var['path_thumb'],0)."/".$g_imagem))
			     echo "<img src='".substr($var['path_thumb'],0)."/".$g_imagem."'>";

			       else echo "<center>imagem não existe.</center>";
			  ?>
			 </div>

		  </td>
		</tr>

	      <?php
		      $i++;	

			}
		   echo '</table><br>';

	       }
	       ?>


		 <div class='divImagem'>
		   <input class="galeria" type='file' name='galeria0' id='galeria' alt='0' style="height:18px;font-size:7pt;margin-bottom:8px; width:500px;">
		   <br clear='all'/><input class="legenda" type='text' name='legenda0' id='legenda' alt='0' style="height:18px;font-size:7pt;margin-bottom:8px; width:500px;">
		   <br><span class='small'>- JPEG, PNG ou GIF;<?=$var['imagemWidth_texto'].$var['imagemHeight_texto']?></span>
		   <hr noshade size=1 style='border-color:#C4C4C4; background-color:#FFF; width:520px;'/>
		 </div>
		 </p>
        </li>

	<li class='anti-horoscopo tv'>
	  <label>Vídeo *<span class='small'>URL do Youtube, exe: http://www.youtube.com/watch?v=0hhiEjf7_NA</span></label>
	  <input type='text' name='video' id='video' class='required' value='<?=$val['video']?>'>
	  <br/><br/><br/>
	</li>

	<li>	
	  <label>Área *<span class='small'>Área do artigo</span></label>
	  <select name='area' id='area' class='required'>
		<option>Selecione</option>
		<?php
		  $sql_area = "SELECT cat_titulo, cat_id FROM ".TABLE_PREFIX."_categoria WHERE cat_status=1 AND cat_area='Area'";
		  $qry_area = $conn->prepare($sql_area);
		  $qry_area->bind_result($nome, $id);
		  $qry_area->execute();
		 
			  while ($qry_area->fetch()) {
		?>
		   <option value='<?=$id?>'<?php if ($act=='update' && $val['area']==$id) echo ' selected';?>> <?=$nome?></option>
		<?php } $qry_area->close(); ?>
	  </select>
	</li>


	<li class='horoscopo' style='display:none;'>
	  <label>Signo *<span class='small'>Selecione um signo</span></label>
	  <select name='signo' id='signo' class='required' disabled=true>
		<option>Selecione</option>
		<?php foreach ($getSignos as $signo) { ?>
 	    <option value='<?=$signo?>'<?php if ($act=='update' && $val['signo']==$signo) echo ' selected';?>> <?=$signo?></option>
		<?php } ?>
	  </select>
	</li>


	<li class='anti-horoscopo'>
	  <label>Título *<span class='small'>Digite o título</span></label>
	  <input type='text' name='titulo' id='titulo' class='required' value='<?=$val['titulo']?>'>
	</li>

	<li>
	  <label>Linha Fina <span class='small'>Pequeno trecho depois do título da matéria</span></label>
	  <textarea name='linhafina' id='linhafina' class='' cols='80' rows='2'><?=stripslashes($val['linhafina'])?></textarea>
	</li>

	<li>
	  <label>Data *<span class='small'>Entre com a data</span></label>
	  <input type='text' id='data' name='data' class='required' value='<?=$act=='insert' ? date('d/m/Y') : dateen2pt('-',$val['data'],'/')?>'>
	</li>


	<li>
	  <label>Resumo *<span class='small'>Digite o resumo para a listagem</span></label>
	  <textarea name='resumo' id='resumo' class='required' cols='80' rows='10'><?=stripslashes($val['resumo'])?></textarea>
	</li>


	<li class='anti-tv'>
	  <label>Texto *<span class='small'>Digite o texto<br/>Se deseja colar diretamente do Word ou qualquer outro editor de texto que permite formatação (negrito, itálico, etc), use o botão "Paste as Plain Text" ou "Paste from Word"</span></label>
	  <textarea name='texto' id='texto' class='required tv-unblock tinymce' cols='80' rows='35'><?=stripslashes($val['texto'])?></textarea>
	</li>

	<li class='anti-horoscopo'>	
	  <label>Autor <span class='small'>Digite o nome do autor do artigo</span></label>
	  <input type='text' name='autor' id='autor' value='<?=$val['autor']?>'>
	</li>


	<li class='anti-horoscopo'>	
	  <label>Palavras Chave <span class='small'>Palavras chave para busca e Matérias Relacionadas. Separe com vírgula</span></label>
	  <input type='text' name='palavrachave' id='palavrachave' class='' value='<?=$val['palavrachave']?>'>
	</li>


    </ol>



    <br>
    <p align='center'>
    <input type='submit' value='ok' class='first'><input type='button' id='form-back' value='voltar'></p>
    <div class='spacer'></div>


</form>


