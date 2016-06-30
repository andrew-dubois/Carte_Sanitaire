<?php 
session_start();
$username="";
if(!isset($_SESSION['usr'])){
	header('Location: /cs/login.php');
	exit;
}else{
	$username=$_SESSION['usr'];
	
}

?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Profil d'utilisateur</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

       <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.php">Carte Sanitaire</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">                
                
                <?php include('admin-head.inc.php'); ?>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <?php include_once('right-menu-inc.php'); ?>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

           <div class="container-fluid">
			  <div class="row">
				<div class="col-md-12">
				  <div class="panel panel-default">
					<div class="panel-body">
					  <div class="row">
						<div class="col-md-12 lead">Profil d'utilisateur<hr></div>
					  </div>
					  <?php
					  include('../lib/core/users.php');
					  $usr= new Users;
					  $userinfo= $usr-> userinfobyusername($username);
						
					  ?>
					  <div class="row">
						<div class="col-md-4 text-center">
						  <img class="img-circle avatar avatar-original" width="200" style="-webkit-user-select:none; 
						  display:block; margin:auto;" src="http://i1.wp.com/www.techrepublic.com/bundles/techrepubliccore/images/icons/standard/icon-user-default.png">
						</div>
						<div class="col-md-8">
						  <div class="row">
							<div class="col-md-12">
							  <h1 class="only-bottom-margin"><?php echo $userinfo[0]['fullname']?></h1>
							</div>
						  </div>
						  <div class="row">
							<div class="col-md-6">
							  <span class="text-muted">Email:</span> <?php echo $userinfo[0]['usremail']?><br>							
							  
							  
							</div>
							
						  </div>
						</div>
					  </div>
					  <div class="row">
					  <div class="col-md-8">
						  <a href="edituser.php?iduser=<?php echo $userinfo[0]['id']?>" class="btn btn-default "><i class="glyphicon glyphicon-pencil"></i> Modifier profil</a>
						</div>
						<div class="col-md-4">
						  <hr>
						</div>
						
					  </div>
					</div>
				  </div>
				</div>
			  </div>
			</div>
						<!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
