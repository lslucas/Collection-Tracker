<?php

 if (isset($_FILES)) {

require_once 'Zend/Filter/ImageSize.php';
require_once 'Zend/Filter/ImageSize/Strategy/Crop.php';
$filter = new Zend_Filter_ImageSize();


   $sqlImagem = '';
   $w=$pos=0;

   $sql_smod = "SELECT rag_pos, rag_imagem FROM ".TABLE_PREFIX."_r_${var['pre']}_galeria WHERE rag_${var['pre']}_id=? ORDER BY rag_pos DESC LIMIT 1";
   $qry_smod = $conn->prepare($sql_smod);
   $qry_smod->bind_param('i',$res['item']);
   $qry_smod->execute();
   $qry_smod->bind_result($pos, $imgold);
   $qry_smod->fetch();
   $qry_smod->close();
   $pos = ($pos!==0)?$pos=$pos+1:$pos;



       $sql= "INSERT INTO ".TABLE_PREFIX."_r_${var['pre']}_galeria 

		    (rag_${var['pre']}_id,
		     rag_imagem,
		     rag_legenda,
		     rag_pos
		     )
		    VALUES (?, ?, ?, ?)";
       $qry=$conn->prepare($sql);
       $qry->store_result();


	   for ($i=0;$i<=count($_FILES);$i++) {

		   if (isset($_FILES['galeria'.$i]['name']) && is_file($_FILES['galeria'.$i]['tmp_name']) ) {

			$legenda = !isset($_POST['legenda'.$i]) ? null : $_POST['legenda'.$i];
			$filename = $res['item'].'_'.rand();


			$output = $filter->setHeight($var['imagemWidth'])
				->setWidth($var['imagemWidth'])
				->setQuality(75)
				->setOverwriteMode(Zend_Filter_ImageSize::OVERWRITE_ALL)
				->setThumnailDirectory($var['path_imagem'])
				->setType('jpeg')
				->setStrategy(new Zend_Filter_Imagesize_Strategy_Crop())
				->filter($_FILES['galeria'.$i);


			$handle = new Upload($_FILES['galeria'.$i]);

		 // then we check if the file has been uploaded properly
		 // in its *temporary* location in the server (often, it is /tmp)
		 if ($handle->uploaded) {
		   $handle->file_new_name_body  = $filename;
		   $handle->Process($var['path_original']);
		   #$handle->jpeg_quality        = 90;
		   if (!$handle->processed) echo 'error : ' . $handle->error;

		   $handle->file_new_name_body  = $filename;
		   $handle->image_resize        = true;
		   $handle->image_ratio_fill    = '#FFFFFF';
		   $handle->image_x             = $var['imagemWidth'];
		   $handle->image_y             = $var['imagemHeight'];
		   $handle->jpeg_quality        = 90;
		   $handle->process($var['path_imagem']);
		   if (!$handle->processed) echo 'error : ' . $handle->error;

		   $handle->file_new_name_body  = $filename;
		   $handle->image_resize        = true;
		   $handle->image_ratio_fill    = '#FFFFFF';
		   $handle->image_x             = $var['thumbWidth'];
		   $handle->image_y             = $var['thumbHeight'];
		   $handle->jpeg_quality        = 90;
		   $handle->process($var['path_thumb']);
		   if (!$handle->processed) echo 'error : ' . $handle->error;

		   $handle->file_new_name_body  = $filename;
		   $handle->image_resize        = true;
		   $handle->image_ratio_fill    = '#FFFFFF';
		   $handle->image_x             = $var['homeWidth'];
		   $handle->image_y             = $var['homeHeight'];
		   $handle->jpeg_quality        = 90;
		   $handle->process($var['path_home']);
		   if (!$handle->processed) echo 'error : ' . $handle->error;

		   $handle->file_new_name_body  = $filename;
		   $handle->image_resize        = true;
		   $handle->image_ratio_fill    = '#FFFFFF';
		   $handle->image_x             = $var['bigWidth'];
		   $handle->image_y             = $var['bigHeight'];
		   $handle->jpeg_quality        = 90;
		   $handle->process($var['path_big']);
		   if (!$handle->processed) echo 'error : ' . $handle->error;

		   $handle->file_new_name_body  = $filename;
		   $handle->image_resize        = true;
		   $handle->image_ratio_crop    = true;
		   $handle->image_x             = $var['largeWidth'];
		   $handle->image_y             = $var['largeHeight'];
		   $handle->jpeg_quality        = 90;
		   $handle->process($var['path_large']);
		   if (!$handle->processed) echo 'error : ' . $handle->error;

		   $handle->file_new_name_body  = $filename;
		   $handle->image_resize        = true;
		   $handle->image_ratio_fill    = '#EBEBEB';
		   $handle->image_background_color = '#EBEBEB';
		   $handle->image_x             = $var['relWidth'];
		   $handle->image_y             = $var['relHeight'];
		   $handle->jpeg_quality        = 90;
		   $handle->process($var['path_rel']);
		   if (!$handle->processed) echo 'error : ' . $handle->error;

			 $imagem = $handle->file_dst_name;


			 $qry->bind_param('issi', $res['item'], $imagem, $legenda, $pos); 
			 $qry->execute();

			 }
		  }

		$pos++;

	   }


   $qry->close();


 }
