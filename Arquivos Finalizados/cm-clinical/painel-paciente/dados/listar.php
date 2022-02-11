<?php

    $cmd = $pdo->prepare("SELECT * FROM consultas WHERE paciente = :paciente");
    $cmd->bindValue(":paciente", 2);
    $cmd->execute();
    $resul = $cmd->fetch();

    print_r($cmd);

?>