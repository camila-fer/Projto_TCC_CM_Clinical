<?php 

require_once("../../conexao.php");
@session_start();

$tipo = $_POST['tipo'];
$forma = $_POST['forma'];


$id = $_POST['id'];
$id_consulta = $_POST['id_consulta'];


$email_usuario = $_SESSION['email_usuario'];





//BUSCAR O CPF DO USUÁRIO LOGADO (NESSE CASO UM TESOUREIRO)
$res_excluir = $pdo->query("select * from recepcionistas where email = '$email_usuario'");
$dados_excluir = $res_excluir->fetchAll(PDO::FETCH_ASSOC);
$func= $dados_excluir[0]['cpf'];


$res = $pdo->prepare("UPDATE contas_receber set data_baixa = curDate(), forma_pgto = :forma, tipo_pgto = :tipo, recepcionista = :recepcionista where id = :id ");

$res->bindValue(":forma", $forma);
$res->bindValue(":tipo", $tipo);
$res->bindValue(":recepcionista", $func);
$res->bindValue(":id", $id);

$res->execute();



$res = $pdo->query("UPDATE consultas set pgto_confirmado = 'Sim', status = 'Aguardando' where id = '$id_consulta' ");


//LANÇAR NA TABELA DE MOVIMENTAÇÕES

//BUSCAR O VALOR DA CONSULTA FEITA
$res_valor = $pdo->query("select * from contas_receber where id = '$id'");
$dados_valor  = $res_valor ->fetchAll(PDO::FETCH_ASSOC);
$valor = $dados_valor [0]['valor'];



echo "Salvo com Sucesso!!";





?>