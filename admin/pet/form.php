  <div class='error container-error'><div class='error-icon'>
	Antes de prosseguir preencha corretamente o formulário e revise os campos abaixo:</div>
	<ol> 
		<li><label for="galeria" class="error-validate">Envia alguma <b>imagem</b></label></li> 
		<li><label for="nome" class="error-validate">Informe o <b>nome</b></label></li> 
		<li><label for="codigo" class="error-validate">Informe o <b>código</b> do produto</label></li> 
		<li><label for="data" class="error-validate">Entre com uma data válida</label></li> 
		<li><label for="url" class="error-validate">Informe uma <b>url</b> válida!</label></li> 
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
    	<li>	
    	  <label>Imagem<span class='small'><!--<a href='javascript:void(0);' class='addImagem' id='min'>adicionar + fotos</a></span>--></label>
    	  <?php
    		  
            $num=0;
    	    if ($act=='update') {
    				  
    		    $sql_gal = "SELECT rpg_id, rpg_imagem, rpg_legenda, rpg_pos FROM ".TABLE_PREFIX."_r_${var['pre']}_galeria WHERE rpg_${var['pre']}_id=? AND rpg_imagem IS NOT NULL ORDER BY rpg_pos ASC;"; 
    		    $qr_gal = $conn->prepare($sql_gal);
    		    $qr_gal->bind_param('s',$_GET['item']);
    		    $qr_gal->execute();
    		    $qr_gal->store_result();
    		    $num = $qr_gal->num_rows;
    		    $qr_gal->bind_result($g_id, $g_imagem, $g_legenda, $g_pos);
    		    $i=0;
                
    	    }
                
                if ($num>0) {
    
    		      echo '<table id="posGaleria" cellspacing="0" cellpadding="2">';
    		      while ($qr_gal->fetch()) {
    	  ?>
    		<tr id="<?=$g_id?>">
    		  <td width='20px' title='Clique e arraste para mudar a posição da foto' class='tip'></td>
    
    		  <td class='small'>
    		    [<a href='?p=<?=$p?>&delete_galeria&item=<?=$g_id?>&prefix=r_<?=$var['pre']?>_galeria&pre=rpg&col=imagem&folder=<?=$var['imagem_folderlist']?>&noVisual' title="Clique para remover o ítem selecionado" class='tip trash-galeria' style="cursor:pointer;" id="<?=$g_id?>">remover</a>]
    		  </td>
    		  <td>
    		    <a href='$imagThumb<?=$i?>?width=100%' id='imag<?=$i?>' class='betterTip'>
    			<img src='images/lupa.gif' border='0' style='background-color:none;padding-left:10px;cursor:pointer'></a> &nbsp;<!--<span style='font-size:8pt; color:#777;'><?=!empty($g_legenda) ? $g_legenda : '[sem legenda]'?></span>-->
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
    
    	       } else {
           ?>
    
    
    		 <div class='divImagem'>
    		   <input class="galeria" type='file' name='galeria0' id='galeria' alt='0' style="height:18px;font-size:7pt;margin-bottom:8px; width:500px;">
    		   <!--<br clear='all'/><input class="legenda" type='text' name='legenda0' id='legenda' alt='0' style="height:18px;font-size:7pt;margin-bottom:8px; width:500px;">-->
    		   <br><span class='small'>- JPEG, PNG ou GIF;<?=$var['imagemWidth_texto'].$var['imagemHeight_texto']?></span>
    		   <!--<hr noshade size=1 style='border-color:#C4C4C4; background-color:#FFF; width:520px;'/>-->
    		 </div>
    		 </p>
            <?php
            
    	       }
            ?>
        </li>
    
        <li>
    	  <label>Data *<span class='small'>Entre com a data</span></label>
    	  <input type='text' id='data' name='data' class='required' value='<?=$act=='insert' ? date('d/m/Y') : dateen2pt('-',$val['data'],'/')?>'>
    	</li>
        
        <li>
    	  <label>Código *<span class='small'>Digite o código</span></label>
    	  <input type='text' name='codigo' id='codigo' class='required' value='<?=$val['codigo']?>'>
    	</li>
        
    	<li>
    	  <label>Nome *<span class='small'>Digite o nome</span></label>
    	  <input type='text' name='nome' id='nome' class='required' value='<?=$val['nome']?>'>
    	</li>
    
    <!--
        <li>
    	  <label>URL<span class='small'>Link do produto</span></label>
    	  <input type='text' name='url' id='url' class=' url' value='<?=$val['url']?>'>
    	</li>
    -->
        
    	<li>
    	  <label>Texto *<span class='small'>Digite o texto descritivo</span></label>
    	  <textarea name='texto' id='texto' class='tinymce required' cols='80' rows='10'><?=stripslashes($val['texto'])?></textarea>
    	</li>

    </ol>


    <br>
    <p align='center'>
    <input type='submit' value='ok' class='first'><input type='button' id='form-back' value='voltar'></p>
    <div class='spacer'></div>


</form> 
