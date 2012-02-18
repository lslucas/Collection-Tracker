  <div class='error container-error'><div class='error-icon'>
	Antes de prosseguir preencha corretamente o formulário e revise os campos abaixo:</div>
	<ol> 
		<li><label for="nome" class="error-validate">Digite o nome</label></li> 
		<li><label for="email" class="error-validate">Tem que informar o email</label></li> 
		<li><label for="nascimento" class="error-validate">Entre com uma data de nascimento válida</label></li> 
		<li><label for="telefone" class="error-validate">Você precisa informar algum <b>telefone</b></label></li> 
		<li><label for="endereco" class="error-validate">Entre com algum endereço</label></li> 
		<li><label for="numero" class="error-validate">Número inválido ou não informado</label></li> 
		<li><label for="complemento" class="error-validate">Digite algum complemento</label></li> 
		<li><label for="cep" class="error-validate">Informe o cep</label></li> 
		<li><label for="bairro" class="error-validate">Informe o bairro</label></li> 
		<li><label for="cidade" class="error-validate">Digite a cidade</label></li> 
		<li><label for="estado" class="error-validate">Digite o estado</label></li> 
		<li><label for="facebook" class="error-validate">Informe uma url válida para o facebook: http://facebook.com/perfil</label></li> 
		<li><label for="twitter" class="error-validate">Informe uma url válida para o twitter: http://twitter.com/perfil</label></li> 
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
	  <label>Nome *<span class='small'>Nome do cadastrado</span></label>
	  <input type='text' name='nome' id='nome' class='required' value='<?=$val['nome']?>'>
	</li>


	<li>	
	  <label>E-mail *<span class='small'>Digite o e-mail</span></label>
	  <input type='text' name='email' id='email' class='required email' value='<?=$val['email']?>'>
	</li>


	<li>	
	  <label>Telefone <span class='small'>Informe o telefone</span></label>
	  <input type='text' name='telefone' id='telefone' value='<?=$val['telefone']?>'>
	</li>


	<li>	
	  <label>Celular <span class='small'>Informe o celular</span></label>
	  <input type='text' name='celular' id='celular' value='<?=$val['celular']?>'>
	</li>


	<li>
	  <label>Nascimento <span class='small'>Entre com a data de nascimento</span></label>
	  <input type='text' id='nascimento' name='nascimento' value='<?=dateen2pt('-',$val['nascimento'],'/')?>'> 
	  <?php if($act=='update' && !empty($val['nascimento'])) echo diferencaAnos($val['nascimento'],date('Y-m-d')).' anos'; ?>
	</li>

	<li>	
	  <label>CEP <span class='small'>CEP, 12.248-000</span></label>
	  <input type='text' name='cep' id='cep' value='<?=$val['cep']?>'>
	</li>

	<li>	
	  <label>Endereço <span class='small'>Informe o endereço</span></label>
	  <input type='text' name='endereco' id='endereco' value='<?=$val['endereco']?>'>
	</li>

	<li>	
	  <label>Cidade <span class='small'>Informe a cidade</span></label>
	  <input type='text' name='cidade' id='cidade' value='<?=$val['cidade']?>'>
	</li>


	<li>	
	  <label>Estado <span class='small'>Informe o estado</span></label>
	  <input type='text' name='estado' id='estado' value='<?=$val['estado']?>'>
	</li>

	<li>
	  <label>Perfil<span class='small'>Para a pesquisa</span></label>
		<div align='left'>
		<?php

		   if ($act=='insert') {

				$sql_perfil = "SELECT cat_titulo, cat_id FROM ".TABLE_PREFIX."_categoria WHERE cat_status=1 AND cat_idrel=0 AND cat_area='Perfil' ORDER BY cat_pos ASC";

				$qry_perfil = $conn->prepare($sql_perfil);
				$qry_perfil->bind_result($nome, $id);

			} else {

				$sql_perfil = "SELECT cat_titulo, cat_id, (SELECT COUNT(rcp_cat_id) FROM ".TABLE_PREFIX."_r_cad_perfil WHERE rcp_cat_id=cat_id and rcp_cad_id=".$val['id'].") checked FROM ".TABLE_PREFIX."_categoria WHERE cat_status=1 AND cat_idrel=0 AND cat_area='Perfil' ORDER BY cat_pos ASC";
				$qry_perfil = $conn->prepare($sql_perfil);
				$qry_perfil->bind_result($nome, $id,$checked);

		   }


		  $qry_perfil->execute();
		 
		  while ($qry_perfil->fetch()) {

			if ($act=='update') {
			  $check[$id] = ($checked>0)?' checked':''; 

			} else $check[$id] = null;


			$width = $nome=='Mais de dois filhos' ? 'width:520px;' : 'width:320px';
		?>
		   <span style='<?=$width?>;display:inline-block;text-align:left;'><input type='checkbox' name='perfil[]' value='<?=$id?>'<?=$check[$id]?>> <?=$nome?></option></span>
		<?php } $qry_perfil->close(); ?>
		</div>
	</li>


	<li>	
	  <label>Sexo <span class='small'>Informe o sexo</span></label>
		<select name='sexo'>
			<option>Selecione</option>
			<option value='Masculino'<?=$act=='update' && $val['sexo']=='Masculino' ? ' selected':null?>>Masculino</option>
			<option value='Feminino'<?=$act=='update' && $val['sexo']=='Feminino' ? ' selected':null?>>Feminino</option>
		</select>
	</li>


	<li>	
	  <label>Estado Civil <span class='small'>Informe o estado civil</span></label>
		<select name='estado_civil'>
				<option>Selecione</option>
				<option value='Solteiro'<?=$act=='update' && $val['estado_civil']=='Solteiro' ? ' selected':null?>>Solteiro</option>
				<option value='Casado'<?=$act=='update' && $val['estado_civil']=='Casado' ? ' selected':null?>>Casado</option>
				<option value='Divorciado'<?=$act=='update' && $val['estado_civil']=='Divorciado' ? ' selected':null?>>Divorciado</option>
				<option value='Separado Judicialmente'<?=$act=='update' && $val['estado_civil']=='Separado Judicialmente' ? ' selected':null?>>Separado Judicialmente</option>
				<option value='Viuvo'<?=$act=='update' && $val['estado_civil']=='Viuvo' ? ' selected':null?>>Viuvo</option>
				<option value='Companheiro'<?=$act=='update' && $val['estado_civil']=='Companheiro' ? ' selected':null?>>Companheiro</option>
		</select>
	</li>


<!--
	<li>	
	  <label>Filhos <span class='small'>Informe o número de filhos</span></label>
	  <input type='text' name='filhos' class='number' id='filhos' value='<?=$val['filhos']?>'>
	</li>
-->

	<li>	
	  <label>Facebook <span class='small'>Informe o perfil do facebook</span></label>
	  <input type='text' name='facebook' class='url' id='facebook' value='<?=$val['facebook']?>'>
	</li>


	<li>	
	  <label>Twitter <span class='small'>Informe o perfil do twitter</span></label>
	  <input type='text' name='twitter' class='url' id='twitter' value='<?=$val['twitter']?>'>
	</li>


	<li>	
	  <label>Já comprou no kikoautos <span class='small'>Houve uma compra passada?</span></label>
		<select name='ja_comprou'>
			<option>Selecione</option>
			<option value='Sim'<?=$act=='update' && $val['ja_comprou']=='Sim' ? ' selected':null?>>Sim</option>
			<option value='Não'<?=$act=='update' && $val['ja_comprou']=='Não' ? ' selected':null?>>Não</option>
		</select>
	</li>

    </ol>



    <br>
    <p align='center'>
    <input type='submit' value='ok' class='first'><input type='button' id='form-back' value='voltar'></p>
    <div class='spacer'></div>


</form>


