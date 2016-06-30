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

    <title>Liste des institutions</title>

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
                <?php 
				
				include_once('right-menu-inc.php'); 
				
				
				?>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Institutions
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.html">Tableau de bord</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-table"></i> Utilisateurs
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    
                    <div class="col-lg-12">
                        <h2>Listes des utilisateurs</h2>
						<?php
						if(isset($_GET['adduser'])){
							if($_GET['adduser']=='success'){
								
								?>
								<div class="alert alert-success" role="alert"><strong>Nouvel Utilisateur ajout&eacute; avec succes !</strong></div>
								<?php
							}
						}
						?>
						
                        <div class="table-responsive">
						<?php
						include('../lib/core/users.php');
				$usr= new Users;
				$userslist=$usr->userslist();

						?>
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>Nom</th>
                                        <th>Nom d'utilisateur</th>
                                        
                                        <th style="text-align:center; width: 250px">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
									<?php
									foreach ($userslist as $i => $value) {			
										
							
										
										
										?>
										
										<tr>
											<td><?php echo $value["fullname"] ?></td>
											<td><?php echo $value["username"] ?></td>
											
											<td style="text-align:center"><a href="edituser.php?iduser=<?php echo $value["id"]?>" id="<?php echo $value["id"]?>"> <i class="fa fa-pencil" aria-hidden="true"></i>
 Modifier</a>
 <a href="users.php?info=delsuccess" class="dellink" user="<?php echo $value["username"] ?>" id="<?php echo $value["id"]?>"> <i class="fa fa-trash" aria-hidden="true"></i> Supprimer</a>
 </td>
										</tr>
										
										<?php
										
									}
									?>	
									
									
                                </tbody>
                            </table>
							<a href="userregistration.php" class="btn btn-primary">Ajouter un utilisateur</a>
                        </div>
                    </div>
                </div>
                <!-- /.row -->

                
                <!-- /.row -->

               
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>
	<script>
	 $(document).ready(function(e){
		 
		 $(".dellink").click(function(){
			 var iduser = $(this).attr('id');
			 var currentUser= $.trim("<?php echo $value["username"] ?>");
			 var username = $.trim($(this).attr('user'));
			 
			 
			 if( username == currentUser ){
				 alert("Impossible de supprimer votre compte d'utilisateur");
				 return false;
			 }
			 
			 if (confirm('Voulez-vous vraiment supprimer cet utilisateur ? ')) {
					validDelLink(iduser);
				}else{
					
					return false;
				}
			 //
			 //return false;
			 
		 });
		
		 
	 });
	 
	  /*functions*/
	 function validDelLink(id){
				 var idlinkUser=id;
				 
				 
				 $.post("../lib/inc/users.inc.php",
			{
				
				iduser : idlinkUser
			},
			function(data, status){
				//alert(data);
				if(status=='success'){
					alert("Suppression effectuee avec succes");
					//window.location.href = window.location.href + "?single";
				}
			});
	 } 
	 
	 </script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
	

</body>

</html>
