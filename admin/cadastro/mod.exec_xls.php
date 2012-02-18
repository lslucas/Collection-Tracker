<?php

  include_once '../_inc/global.php';
  include_once '../_inc/db.php';
  include_once '../_inc/global_function.php';




   /*
    *pega o nome da festa e verifica se ela existe
    */
   $sql_cad = "SELECT cad_nome,cad_email, DATE_FORMAT(cad_nascimento, '%d/%m/%Y'), DATE_FORMAT(cad_timestamp,'%d/%m/%Y') cad_data, cad_status, cad_cep, cad_cidade, cad_estado, cad_endereco, cad_sexo, cad_estado_civil, cad_telefone, cad_celular, cad_filhos, cad_twitter, cad_facebook
               FROM ".TABLE_PREFIX."_cadastro 
               WHERE cad_email IS NOT NULL ORDER BY cad_nome";
   if ($qry_cad = $conn->prepare($sql_cad)){

     $qry_cad->execute();
     $qry_cad->store_result();
     $qry_cad->bind_result($cad_nome,$cad_email,$cad_nasc, $cad_data, $cad_status, $cad_cep, $cad_cidade, $cad_estado, $cad_endereco, $cad_sexo, $cad_estado_civil, $cad_telefone, $cad_celular, $cad_filhos, $cad_twitter, $cad_facebook);
     $num = $qry_cad->num_rows;

   } else echo $qry_cad->error;




   if($num==0)
     die('Nenhum cadastro');

   else {


      function cleanData(&$str) {
        $str = preg_replace("/\t/", "\\t", $str);
        $str = preg_replace("/\r?\n/", "\\n", $str);
        if(strstr($str, '"')) $str = '"' . str_replace('"', '""', $str) . '"';
        return html_entity_decode($str);
      }

      # file name for download
      $filename = "cadastros_".date('Ymd').".xls";

      header("Content-Disposition: attachment; filename=\"$filename\"");
      header("Content-Type: application/vnd.ms-excel");


       $flag=false;
          $arrNome = $arrEmail = $arrNasc = $arrData = $arrCep = $arrCidade = $arrEstado = $arrStatus = $cadEndereco = $cadSexo = $cadEstado_civil = $cadTelefone = $cadCelular = $cadFilhos = $cadTwitter = $cadFacebook ='';
          while($qry_cad->fetch()){

            $arrNome .= $cad_nome.',';
            $arrEmail .= $cad_email.',';
            $arrNasc.= $cad_nasc.',';
            $arrData .= $cad_data.',';
            $arrCep .= $cad_cep.',';
            $arrCidade .= $cad_cidade.',';
            $arrEstado .= $cad_estado.',';
            $arrEndereco .= $cad_endereco.',';
            $arrSexo .= $cad_sexo.',';
            $arrEstado_civil .= $cad_estado_civil.',';
            $arrTelefone .= $cad_telefone.',';
            $arrCelular .= $cad_celular.',';
            $arrFilhos .= $cad_filhos.',';
            $arrTwitter .= $cad_twitter.',';
            $arrFacebook .= $cad_facebook.',';
            $arrStatus .= ($cad_status==1)?'ativo':'inativo';
            $arrStatus .= ',';

          }

        $qry_cad->close();


        /*
         *cabeçalho dos dados
         */
        $row = array('nome'=>explode(',',substr($arrNome,0,-1)),
                      'email'=>explode(',',substr($arrEmail,0,-1)),
                      'nasc'=>explode(',',substr($arrNasc,0,-1)),
                      'data'=>explode(',',substr($arrData,0,-1)),
                      'cep'=>explode(',',substr($arrCep,0,-1)),
                      'endereco'=>explode(',',substr($arrEndereco,0,-1)),
                      'cidade'=>explode(',',substr($arrCidade,0,-1)),
                      'estado'=>explode(',',substr($arrEstado,0,-1)),
                      'status'=>explode(',',substr($arrStatus,0,-1)),
                      'sexo'=>explode(',',substr($arrSexo,0,-1)),
                      'estado_civil'=>explode(',',substr($arrEstado_civil,0,-1)),
                      'telefone'=>explode(',',substr($arrTelefone,0,-1)),
                      'celular'=>explode(',',substr($arrCelular,0,-1)),
                      'filhos'=>explode(',',substr($arrFilhos,0,-1)),
                      'twitter'=>explode(',',substr($arrTwitter,0,-1)),
                      'facebook'=>explode(',',substr($arrFacebook,0,-1))
                    );




          if($num>0) {

              if(!$flag) {
                # display field/column names as first row
                echo "Lista de Cadastros\n";
                echo "Gerado em ".date('d/m/Y H:i')."\n\n";
                echo "Nome\t";
                echo "E-mail\t";
                echo "Sexo\t";
                echo "Estado Civil\t";
                echo "Nascimento\t";
                echo "Endereço\t";
                echo "CEP\t";
                echo "Cidade\t";
                echo "Estado\t";
                echo "Telefone\t";
                echo "Celular\t";
                echo "N. de filhos\t";
                echo "Twitter\t";
                echo "Facebook\t";
                echo "Data de Cadastro na Lista\t";
                echo "Status\t";
                echo "\n";
                $flag = true;
              }



              for($i=0;$i<count($row['nome']);$i++){

                echo cleanData($row['nome'][$i])."\t";
                echo cleanData($row['email'][$i])."\t";
                echo cleanData($row['sexo'][$i])."\t";
                echo cleanData($row['estado_civil'][$i])."\t";
                echo cleanData($row['nasc'][$i])."\t";
                echo cleanData($row['endereco'][$i])."\t";
                echo cleanData($row['cep'][$i])."\t";
                echo cleanData($row['cidade'][$i])."\t";
                echo cleanData($row['estado'][$i])."\t";
                echo cleanData($row['telefone'][$i])."\t";
                echo cleanData($row['celular'][$i])."\t";
                echo cleanData($row['filhos'][$i])."\t";
                echo cleanData($row['twitter'][$i])."\t";
                echo cleanData($row['facebook'][$i])."\t";
                echo cleanData($row['data'][$i])."\t";
                echo cleanData($row['status'][$i])."\t";
                echo "\n";

              }

          }



   }
