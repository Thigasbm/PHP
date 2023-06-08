<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Usuários</title>

    <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.js"></script>
    
    <script type="text/javascript">
        //função que chama a lista da tabela

        function lista(){ //pedir como funciona essa função (em relação aos comandos $.get, $, etc.)
            var url = 'listaRegistros.php?consulta=Sim';
            $.get(url, function (dataReturn){
                $('#listaRegistros').html(dataReturn);
            });
        }
    </script>

</head>
<body>
    <!--quando o formulario for submetido, grava as informações-->
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


  

        if (!@$conexao):
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
    <!--caixa que executa a ação dos botes editar e excluir-->
    <iframe name="acao" width="100%" height="100" frameborder="1" marginheight="10" marginwidth="10" scrolling="auto"></iframe>

    <!--form de preenchimento-->
<form id="acao" action="usuarios.php" method="POST">
        <input type="text" id="idusuario" name="idusuario"> <!--depois deixar o text como hidden-->
    <div style="height:20px">
        <label for="nomeusuario">NOME:</label>
        <input type="text" id="nomeusuario" name="nomeusuario" placeholder="Digite seu nome" maxlength="80" required>
    </div>
    
    <div style="height:20px">
        <label for="emailusuario">EMAIL:</label>
        <input type="text" id="emailusuario" name="emailusuario" placeholder="Digite seu email" maxlength="80" required>
    </div>

    <div style="height:20px">
        <label for="senhasuario">SENHA:</label>
        <input type="text" id="senhausuario" name="senhausuario" placeholder="Digite sua senha" maxlength="80" required>
    </div>

    <div style="height:20px">
        <label for="cidadeusuario">CIDADE:</label>
        <select id="cidadeusuario" name="cidadeusuario" required>
            <option value="" selected>SELECIONE:</option>
        <?php
        $select = "SELECT id_cidade, nome
            FROM cidades
            ORDER BY nome";

        $resultado = pg_query($conexao, $select);//talvez um erro aqui
            while ($linha = pg_fetch_array($resultado)){
                $idcidade = $linha[0];
                $nomecidade = $linha[1];

                echo "<option value='$idcidade'>$nomecidade</option>";
            }
        ?>
        </select>
    </div>

    <div style="height:20px">
        <button type="submit" name="btsalvar" id="btsalvar">SALVAR</button>
        </div>

    <div style="height=30px">
        <a href=""><button type="button">VOLTAR</button></a><!--ver o nome da pasta pra colocar no href-->
    </div>
</form>

    <!--lista dos registros gravados no banco-->
    <div id="listaUsuarios">
        <?php include "listaRegistros.php"?>
    </div>
    </body>
</html>

    <script language="javascript">
        function AcaoUsuario(id,acao){
            window.open('acao.php?Tipo=' + acao + '&idusuario' + id, 'acao');
        }
    </script>