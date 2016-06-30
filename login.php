<?php 
session_start();
if(isset($_GET['logout'])){
	session_unset();
}else{
	if(isset($_SESSION['usr'])){
		header('Location: admin/index.php');   
		exit;
	}
	
}

?>
<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>Carte sanitaire - Connexion</title>
    
    
    <link rel="stylesheet" href="css/reset.css">

    <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'>
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

        <link rel="stylesheet" href="css/loginPage.css">

    <script type="text/javascript" src="js/jquery191.js"></script>
    <script type="text/javascript" src="js/login.js"></script>  
    
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
<div class="module form-module">
  <div class="toggle">
    
  </div>
  <div class="form">
    <h2>Se connecter</h2>
    <form action="admin" id="form_login">
      <input type="text" id="usernametext" placeholder="Nom d'utilisateur" required />
      <input type="password" id="passwtext" placeholder="Mot de passe" required />
      <button type="submit" class="btn btn-info" id="btn_connect">Se connecter</button>
    </form>
  </div>
  
  <div class="cta"><a href="forgotpass.php">Mode passe oublié?</a></div>
</div>
      
    
    
  </body>
</html>
