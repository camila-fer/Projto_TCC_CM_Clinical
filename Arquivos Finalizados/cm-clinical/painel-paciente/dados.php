<div class="container bg-light">
<h1>Dados Pessoais</h1>
    <?php
      require_once("../conexao.php");
      @session_start();
      $pagina = 'Paciente';

              $cmd = $pdo->query("SELECT nome, cpf, rg, telefone, email, data_nasc, idade, civil, sexo, endereco FROM pacientes");
              $cmd->execute();
      
              $resul = $cmd->fetch(PDO::FETCH_ASSOC);
      
              foreach($resul as $key => $value){
      
              }
    ?>
</div>

<div class="container mb-5 bg-light">
<ul class="list-group">
  <li class="list-group-item">Nome: <?php echo $resul['nome']; ?></li>
  <li class="list-group-item">CPF: <?php echo $resul['cpf']; ?></li>
  <li class="list-group-item">RG: <?php echo $resul['rg']; ?></li>
  <li class="list-group-item">Telefone: <?php echo $resul['telefone']; ?></li>
  <li class="list-group-item">Email: <?php echo $resul['email']; ?></li>
  <li class="list-group-item">Data de Nascimento: <?php echo $resul['data_nasc']; ?></li>
  <li class="list-group-item">Idade: <?php echo $resul['idade']; ?></li>
  <li class="list-group-item">Estado Civil: <?php echo $resul['civil']; ?></li>
  <li class="list-group-item">Sexo: <?php echo $resul['sexo']; ?></li>
  <li class="list-group-item">Endereço: <?php echo $resul['endereco']; ?></li>
</ul>
</div>