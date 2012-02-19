<?php

 if (isset($_FILES)) {

  include_once "_inc/class.upload.php";
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


	   if (isset($res['video']) && !empty($res['video'])) {

		/*
		 *REMOVE ANTIGAS
		 */
		$sql_dmod = "DELETE FROM ".TABLE_PREFIX."_r_art_galeria WHERE rag_art_id=?";
		$qry_dmod = $conn->prepare($sql_dmod);
		$qry_dmod->bind_param('i', $res['item']);
		$qry_dmod->execute();
		$qry_dmod->close();

		     $folder = explode(',',$var['imagem_folderlist']);
		     for($j=0;$j<count($folder);$j++) {
				$arquivo = $folder[$j].'/'.$imgold;

				if (!empty($folder[$j]) && is_file($arquivo))
					unlink($arquivo);
			 }

		
 	    $pos=0;
		$videoid = getYoutubeVideoId($res['video']);
		$filename= "http://img.youtube.com/vi/{$videoid}/hqdefault.jpg";

		// Get new dimensions
		list($width, $height) = getimagesize($filename);

		/*
		 *ORIGINAL
		 */
		$image_p = imagecreatetruecolor($width, $height);
		$image = imagecreatefromjpeg($filename);
		imagecopyresampled($image_p, $image, 0, 0, 0, 0, $width, $height, $width, $height);

		// Output
		imagejpeg($image_p, $var['path_original'].'/'.$videoid.'.jpg', 100);
		imagedestroy($image_p);

		/*
		 *IMAGEM
		 */
		$image_p = imagecreatetruecolor($var['imagemWidth'], $var['imagemHeight']);
		$image = imagecreatefromjpeg($filename);
		imagecopyresampled($image_p, $image, 0, 0, 0, 0, $var['imagemWidth'], $var['imagemHeight'], $width, $height);

		// Output
		imagejpeg($image_p, $var['path_imagem'].'/'.$videoid.'.jpg', 100);
		imagedestroy($image_p);

		/*
		 *THUMB
		 */
		$image_p = imagecreatetruecolor($var['thumbWidth'], $var['thumbHeight']);
		$image = imagecreatefromjpeg($filename);
		imagecopyresampled($image_p, $image, 0, 0, 0, 0, $var['thumbWidth'], $var['thumbHeight'], $width, $height);

		// Output
		imagejpeg($image_p, $var['path_thumb'].'/'.$videoid.'.jpg', 100);
		imagedestroy($image_p);


		/*
		 *HOME
		 */
		$image_p = imagecreatetruecolor($var['homeWidth'], $var['homeHeight']);
		$image = imagecreatefromjpeg($filename);
		imagecopyresampled($image_p, $image, 0, 0, 0, 0, $var['homeWidth'], $var['homeHeight'], $width, $height);

		// Output
		imagejpeg($image_p, $var['path_home'].'/'.$videoid.'.jpg', 100);
		imagedestroy($image_p);


		/*
		 *LARGE
		 */
		$image_p = imagecreatetruecolor($var['largeWidth'], $var['largeHeight']);
		$image = imagecreatefromjpeg($filename);
		imagecopyresampled($image_p, $image, 0, 0, 0, 0, $var['largeWidth'], $var['largeHeight'], $width, $height);

		// Output
		imagejpeg($image_p, $var['path_large'].'/'.$videoid.'.jpg', 100);
		imagedestroy($image_p);

		/*
		 *BIG
		 */
		$image_p = imagecreatetruecolor($var['bigWidth'], $var['bigHeight']);
		$image = imagecreatefromjpeg($filename);
		imagecopyresampled($image_p, $image, 0, 0, 0, 0, $var['bigWidth'], $var['bigHeight'], $width, $height);

		// Output
		imagejpeg($image_p, $var['path_big'].'/'.$videoid.'.jpg', 100);
		imagedestroy($image_p);

		/*
		 *REL
		 */
		$image_p = imagecreatetruecolor($var['relWidth'], $var['relHeight']);
		$image = imagecreatefromjpeg($filename);
		imagecopyresampled($image_p, $image, 0, 0, 0, 0, $var['relWidth'], $var['relHeight'], $width, $height);

		// Output
		imagejpeg($image_p, $var['path_rel'].'/'.$videoid.'.jpg', 100);
		imagedestroy($image_p);



		/*
		 *GUARDA NO BANCO
		 */
		$name = $videoid.'.jpg';
		$legenda = null;
		$qry->bind_param('issi', $res['item'], $name, $legenda, $pos); 
		$qry->execute();


	   } else {


		   for ($i=0;$i<=count($_FILES);$i++) {

			   if (isset($_FILES['galeria'.$i]['name']) && is_file($_FILES['galeria'.$i]['tmp_name']) ) {

				$legenda = !isset($_POST['legenda'.$i]) ? null : $_POST['legenda'.$i];
				$filename = $res['item'].'_'.rand();
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


	   }

   $qry->close();


 }
