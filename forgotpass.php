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
<?php
// Le message
$message = "Line 1\r\nLine 2\r\nLine 3";

// Dans le cas où nos lignes comportent plus de 70 caractères, nous les coupons en utilisant wordwrap()
$message = wordwrap($message, 70, "\r\n");

// Envoi du mail
mail('saintvictor.wigens@gmail.com', 'Carte sanitaire - Recuperez votre mot de passe', $message);
?>
<div class="module form-module" style="max-width:600px">
  <div class="toggle">
    
  </div>
  <div class="form" style="width:500px">
    <h2>Recuperation de mot de passe</h2>
    <form action="forgotpass.php" id="form_login">
	 <div class="">Saisissez votre adresse email. Un lien vous sera envoy&eacute; pour la reinitialisation de votre mot de passe</div></br>
      <input type="text" id="emailtext" placeholder="Saisir votre email" required />      
      <button type="submit" class="btn btn-info" id="btn_connect">Envoyer</button>
    </form>
  </div>
  
</div>
      
    
    
  </body>
</html>
