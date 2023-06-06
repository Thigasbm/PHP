<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Usuários</title>
</head>
<body>
    <script language="javascript">
        //aqui vai uma função
    </script>

    <?php
    @$conexao = pg_connect("host=localhost port=5432 dbname=GestaoDeTrabalhos user=postgres  password=JovemP*2023");//conexão
    pg_set_client_encoding($conexao, 'UNICODE');

    //quando o form for submetido, ele grava informações
    if ($_POST):
        $idusuario = $_POST["idusuario"];
        $nomeusuario = $_POST["nomeusuario"] ;
        $senhausuario = $_POST["senhausuario"];
        $cidadeusuario = $_POST["cidadeusuario"];
        $emailusuario = $_POST["emailusuario"];

        if (@$conexao):
            echo "<script  language='javascript'>alert('não conectou.');</script>";
        else:
            if($idusuario == ''):
                $insert = "INSERT INTO usuarios (nome, senha, id_cidade, email)
                VALUES (UPPER('$nomeusuario'), '$senhausuario', '$cidadeusuario', LOWER('$emailusuario'))";
            
            pg_query($conexao,$insert);

            echo "<script language='javascript'>alert('Registro Gravado com Sucesso!!!');</script>";
            else:
                $update = "UPDATE usuarios
                SET nome = UPPER('$nomeusuario'), '$senhausuario', '$cidadeusuario', LOWER('$emailusuario')
                    WHERE id_usuario = $idusuario";

                pg_query($conexao, $update);

                echo "<script language='javascript'>alert('Registro Atualizado');</script>";
            endif;
        endif;
    endif;
   ?>

   <!--cabeçalho da tela-->
   CADASTRO DE USUARIOS

   <form id="acao" action="index.php" method="POST">
        <input type="text" id="idusuario" name="idusuario"> <!--depois deixar o text como hidden-->
    
    </body>
</html>