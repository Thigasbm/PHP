<?php
$Tipo = $_GET['Tipo'];
$idusuario = $_GET['idusuario'];

@$conexao = pg_connect("host=localhost port=5432 dbname=GestaoDeTrabalhos user=postgres  password=JovemP*2023");//conexão
pg_set_client_encoding($conexao, 'UNICODE');

if ($Tipo == "ED"):
    $select = "SELECT usuarios.id_usuario, usuarios.nome, usuarios.senha, usuarios.id_cidade, usuarios.email --alimentar aqui com os outros campos
        FROM usuarios
        WHERE usuarios.id_usuario = $idusuario";

    $resultado = pg_query($conexao,$select);
    while ($linha = pg_fetch_array($resultado)){
        $idusuario = $linha[0];
        $nomeusuario = $linha[1];
        $senhausuario = $linha[2];
        $cidadeusuario = $linha[3];
        $emailusuario = $linha[4];

        echo "<script language='javascript'>
            window.parent.document.getElementById('idusuario').value='$idusuario';
            window.parent.document.getElementById('nomeusuario').value='$nomeusuario';
            window.parent.document.getElementById('senhausuario').value='$senhausuario';
            window.parent.document.getElementById('cidadeusuario').value='$cidadeusuario';
            window.parent.document.getElementById('emailusuario').value='$emailusuario';
            </script>";
    }
elseif ($Tipo == 'EX'):
    $delete = "DELETE FROM usuarios
    WHERE usuarios.id_usuario = $idusuario";

    pg_query($conexao, $delete);

    echo "<script language='javascript'>alert('Registro Excluido com Sucesso');
        window.parent.lista();
        </script>"// o que é o window.parent?
endif;
?>