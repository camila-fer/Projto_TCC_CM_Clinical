<?php 	

//verficações para o Login
require_once("../conexao.php");
require_once("../config.php");

@session_start();
if(!isset($_SESSION['nome_usuario']) || $_SESSION['nivel_usuario'] != 'Medico'){
	header("location:../index.php");
}


$notificacoes = 3;

//VARIÁVEIS DOS MENUS
$item1 = 'home';
$item2 = 'consultas';
$item5 = 'prescricoes';
$item6 = 'atestados';
$item7 = 'pacientes';

//VERIFICAR QUAL O MENU CLICADO E PASSAR A CLASSE ATIVO
if(@$_GET['acao'] == $item1){
	$item1ativo = 'active';
}elseif(@$_GET['acao'] == $item2){
	$item2ativo = 'active';
}elseif(@$_GET['acao'] == $item5){
	$item5ativo = 'active';
}elseif(@$_GET['acao'] == $item6){
	$item6ativo = 'active';
}elseif(@$_GET['acao'] == $item7){
	$item7ativo = 'active';
}else{
	$item1ativo = 'active';
}


?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
	<title>Painel Médico</title>

	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <link rel="stylesheet" href="../css/painel.css">

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/logo.css">
    <!--REFERENCIA PARA O FAVICON -->
    <link rel="shortcut icon" href="../img/logo-pag.png" type="image/x-icon">
    <link rel="icon" href="../img/logo-pag.png" type="image/x-icon">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</head>
<body>

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-info sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <div class="container ">    
            <a class="sidebar-brand align-items-center justify-content-center" href="index.php">
                <div class="logo img-fluid">
                    <img src="img/logo-CMClinical.png" alt="CM Clinical">
                </div>
            </a>
        </div>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="index.php">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Médico</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Interface
            </div>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>Gerenciar</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Cadastro:</h6>
                        <a class="collapse-item <?php echo @$item1ativo ?>" href="index.php?acao=<?php echo $item1 ?>">Home</a>

                        <a class="collapse-item <?php echo @$item2ativo ?>" href="index.php?acao=<?php echo $item2 ?>">Consultas</a>

                        <a class="collapse-item <?php echo @$item7ativo ?>" href="index.php?acao=<?php echo $item7 ?>">Pacientes</a>

                        <a class="collapse-item <?php echo @$item5ativo ?>" href="index.php?acao=<?php echo $item5 ?>">Prescrições</a>

                        <a class="collapse-item <?php echo @$item6ativo ?>" href="index.php?acao=<?php echo $item6 ?>">Atestados</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>
        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Médico - <?php echo $_SESSION['nome_usuario']; ?></span>
                                <img class="img-profile rounded-circle"
                                    src="img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Sair
                                </a>
								<a class="dropdown-item" data-toggle="modal" data-target="#modal">Alterar Senha</a>
                            </div>
                        </li>
                    </ul>
                </nav>


    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Pronto para partir?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Selecione "Sair" abaixo se estiver pronto para encerrar sua sessão atual.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
                    <a class="btn btn-primary" href="../index.php">Sair</a>
                </div>
            </div>
        </div>
    </div>
    
        <div class="container-fluid mt-4">		
			<div class="col-md-9 col-sm-12">
				<div class="tab-content" id="v-pills-tabContent">

					
					<div class="tab-pane fade show active"  role="tabpanel">
						<?php if(@$_GET['acao'] == $item1){
							include_once($item1.".php"); 
						}elseif(@$_GET['acao'] == $item2){
							include_once($item2.".php"); 
						}elseif(@$_GET['acao'] == $item5){
							include_once($item5.".php"); 
						}elseif(@$_GET['acao'] == $item6){
							include_once($item6.".php"); 
						}elseif(@$_GET['acao'] == $item7){
							$pag = 'externa';
							include_once("../painel-atend/".$item7.".php"); 
						
						}else{
							include_once($item1.".php"); 
						}
						?>
					</div>

					

				</div>
			</div>
		</div>
	</div>


</body>
</html>




<!-- Modal -->
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">
					Alterar Senha
				</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">


				<form method="post">
					

					
					
					<div class="form-group">
						<label for="exampleFormControlInput1">Senha</label>
						<input type="password" class="form-control" id="" placeholder="Insira a Senha" name="senha" >
					</div>

					<div class="form-group">
						<label for="exampleFormControlInput1">Confirmar Senha</label>
						<input type="password" class="form-control" id="" placeholder="Insira a Senha" name="confirmar-senha">
					</div>
					
					


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>

					<button type="submit" name="btn-senha" class="btn btn-primary">Alterar</button>
				</form>
			</div>
		</div>
	</div>
</div>




<!--CÓDIGO DO BOTÃO SALVAR -->
<?php 
if(isset($_POST['btn-senha'])){
	$senha = $_POST['senha'];
	$confirmar_senha = $_POST['confirmar-senha'];



	$email_usuario = $_SESSION['email_usuario'];


	$res_usuario = $pdo->query("SELECT * from usuarios where usuario = '$email_usuario'");
	$dados_usuario = $res_usuario->fetchAll(PDO::FETCH_ASSOC);
    $id_adm = $dados_usuario[0]['id'];	
								
   

    if($senha == $confirmar_senha){
	

		$res = $pdo->prepare("UPDATE usuarios SET senha = :senha, senha_original = :senha_original where id = :id");

		$res->bindValue(":senha", md5($senha));
		$res->bindValue(":senha_original", $senha);
		$res->bindValue(":id", $id_adm);

		$res->execute();

		
		echo "<script language='javascript'>window.location='../index.php'; </script>";

	}else{
		echo "<script language='javascript'>window.alert('As senhas não coincidem!!'); </script>";
	}

	

}

?>