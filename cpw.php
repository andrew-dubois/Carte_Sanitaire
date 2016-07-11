<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>Carte sanitaire - Connexion</title>
    
    <!-- Bootstrap Core CSS -->
    <link href="admin/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/reset.css">
	

    <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'>
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

        <link rel="stylesheet" href="css/loginPage.css">

    <script type="text/javascript" src="js/jquery191.js"></script>
    
    
  </head>

  <body>

<div id="head">
            <!--head-->
            <div id="content-head"> 
                <a href="/cs/index.php">
                    <div id="logocard">
                        <div id="logocard_desc">
                            <h2>CARTOGRAPHIE</br>
                                SANITAIRE D'HAITI </h2>
                            <p>UNITÉ D'ÉTUDES ET DE PROGRAMMATION</p>
                        </div>
                    </div>
                </a>
                <a>
                    <div id="logosite">
                        <div id="logosite_desc">
                            <h2>RÉPUBLIQUE D'HAITI</h2>
                            <p>MINISTÈRE DE LA SANTÉ PUBLIQUE </br>
                                ET DE LA POPULATION</p>
                        </div>
                    </div>
                </a>
                <!--<div id="language" title="Changer la langue"><a href="#">Fran&ccedil;ais</a></div>-->
            </div>
        </div>
<!-- Form Module-->

<div class="module form-module" style="max-width:600px">
  <div class="toggle">
    
  </div>
  <div class="form" style="width:auto">
    
    <?php
		  
		if($_GET['email']){
			//Check if the email adress exist
			include('lib/core/users.php');
		    $usr= new Users;
			$emailtext=$_GET['email'];
		    $userEmail= $usr-> checkUserEmail($emailtext);
			if($userEmail){
				?>
				
				<form action="lib/inc/users.inc.php" id="form_login" method="post">
				 <div class="">Veuillez saisir votre nouveau mot de passe</div></br>
				  <input type="password" name="cpwpasstext" id="npasstext" placeholder="Votre nouveau mot de passe" required />      
				  <input type="password" name="2cpwpasstext" id="2npasstext" placeholder="Confirmez votre mot de passe" required />
				  <input type="hidden" name="email" value="<?php echo $emailtext ?>"/>
				  <button type="submit" class="btn btn-info" id="btnchanger">Valider</button>
				</form>
				
				<?php
				
				
			}else{
				
				?>
				<div class="alert alert-warning"> Desolé l'adresse E-mail  pour laquelle vous voulez changer le mode passe n'existe pas. </div>				
				<?php
			}
			
		
		}
		
		

	?>
	
  </div>
  
</div>
      
    <!-- jQuery -->
    <script src="js/jquery.js"></script>
	
    <script>
	$(document).ready(function(){
		
		$('#btnchanger').click(function(e){
				var pass1=$('#npasstext').val();
				var pass2=$('#2npasstext').val();
				if(pass1!==pass2){
					alert("Les mots de passe ne sont pas identiques. Veuillez verifier et essayer à nouveau");
					return false;
				}
				
			
		});
		
	});
	</script>
    
  </body>
</html>
