<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Usuários</title>
</head>

<body>
    <?php
    $_GETconsulta = ['consulta'];

    if ($consulta = "Sim"):
        @$conexao = pg_connect("host=localhost port=5432 dbname=GestaoDeTrabalhos user=postgres  password=JovemP*2023");//conexão
        pg_set_client_encoding($conexao, 'UNICODE');
    endif;
    ?>

    <table width="100%" border="1">
        <thead>
            <th>NOME</th>
            <th>CIDADE</th>
            <th>EMAIL</th>
            <th colspan="2">AÇÕES</th>
        </thead>
        <tdbody>
            <?php
            $select = "SELECT usuarios.id_usuario, usuarios.nome, cidades.nome, usuarios.email
            FROM usuarios INNER JOIN cidades ON usuarios.id_cidade = cidades.id_cidade
            ORDER BY usuarios.nome";//colocar mais campos aqui

            $resultado = pg_query($conexao, $select);
            while ($linha = pg_fetch_array($resultado)){//pedir o que é pg_fetch_array
                $idusuario = $linha[0];
                $nomeusuario = $linha[1];
                $cidadeusuario = $linha[2];
                $emailusuario = $linha[3];
            ?>
        <tr>
            <td><?php echo $nomeusuario;?></td>
            <td><?php echo $cidadeusuario;?></td>
            <td><?php echo $emailusuario;?></td>
            <td width="10%" align="center"><a href="#" onclick="AcaoUsuario(<?php echo $idusuario;?>, 'EX')">EXCLUIR</a></td>
            <td width="10%" align="center"><a href="#" onclick="AcaoUsuario(<?php echo $idusuario;?>, 'ED')">EDITAR</a></td>
        </tr>
                <?php
            }
            ?>
        <tdbody>
    </table>
</body>
</html>