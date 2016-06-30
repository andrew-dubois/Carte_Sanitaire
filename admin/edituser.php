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

    <title>Modifier un utilisateur</title>

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
                <?php include_once('right-menu-inc.php'); ?>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">
			
			<div class="container">
			<div class="row">
						<div class="col-md-12 lead">Modification d'utilisateur<hr></div>
					  </div>
					  
					  <?php
						  include('../lib/core/users.php');
						  $usr= new Users;
						  $userid="";
						  if(isset($_GET['iduser'])){
							  
							  $userid=$_GET['iduser'];
						  }
						  $userinfo= $usr-> userinfobyId($userid);
						
					  ?>
					  
				<div class="row">
					<form id="formuser" role="form" method="post" action="userprofile.php">
						<div class="col-lg-6">
							<div class="well well-sm"><strong><span class="glyphicon glyphicon-asterisk"></span>Champs obligatoires</strong></div>
							<div class="form-group">
								<label for="InputName">Nom complet</label>
								<div class="input-group">
									<input type="text" value="<?php echo trim($userinfo[0]['fullname'])?>" class="form-control" name="InputFullName" id="InputName" placeholder="Nom et prenom" required>
									<span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
								</div>
							</div>
							<div class="form-group">
								<label for="InputName">Nom d'utilisateur</label>
								<div class="input-group">
									<input disabled type="text" value="<?php echo trim($userinfo[0]['username'])?>" class="form-control" name="InputuserName" id="InputuserName" placeholder="Nom d'utilisateur" required>
									<span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
								</div>
							</div>
							<div class="form-group">
								<label for="InputName">Mode de passe</label>
								<div class="input-group">
									<input type="password" class="form-control" value="<?php echo trim($userinfo[0]['pass'])?>" name="pass" id="Inputpass" placeholder="Mot de passe d'utilisateur" required>
									<span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
								</div>
							</div>
							
							<div class="form-group">
								<label for="InputName">Confirmation de mode de passe</label>
								<div class="input-group">
									<input type="password" class="form-control" value="<?php echo trim($userinfo[0]['pass'])?>" name="pass" id="Inputpass2" placeholder="Mot de passe d'utilisateur" required>
									<span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
								</div>
							</div>
							
							<div class="form-group">
								<label for="InputEmail">Adresse Email</label>
								<div class="input-group">
									<input type="email" class="form-control" id="InputEmailFirst" value="<?php echo trim($userinfo[0]['usremail'])?>" name="InputEmail" placeholder="Saisir l'adresse email" required>
									<span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
								</div>
							</div>
							
							
							<input type="submit" name="submit" id="submit" value="Modifier" class="btn btn-info pull-right">
							
							
						</div>
					</form>
					
				</div>
			</div>
			
			
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>
	 <script>
	 $(document).ready(function(e){
		 $("#submit").click(function(e){
			 
			 validModif();
			 
		 });
		 
		 
		 
	 });
	 
	 function validModif(){
				 var nomComplet = $("#InputName").val();
				 var password = $("#Inputpass").val();
				 var confpass = $("#Inputpass2").val();
				 var emailuser = $("#InputEmailFirst").val();
				 var username = $("#InputuserName").val();	 
				 
				 
				 if(password !== confpass){
					 alert("Les deux mots de passe ne sont pas identiques");
					 return false;
				 }
				 
				 
				 $.post("../lib/inc/users.inc.php",
			{
				
				nomcomp : nomComplet,
				passusr : password,
				emailusr : emailuser,
				usrname : username
			},
			function(data, status){
				
				if(status=='success'){
					alert("Modification effectuee avec succes");
					
				}
			});
	 } 
	 </script>
	 

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
