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
		  
		if($_POST['emailtext']){
			//Check if the email adress exist
			include('lib/core/users.php');
		    $usr= new Users;
			$emailtext=$_POST['emailtext'];
		    $userEmail= $usr-> checkUserEmail($emailtext);
			if($userEmail){
				//check GUID of the userEmail if exits, delete it
				$chkUseremail= $usr->checkGUIDuseremail($emailtext);
				if($chkUseremail){
					$del=$usr->deleteGUID($emailtext);
				}
				
				//create and insert the the GUID
				 $guid=$usr->getGUID();
				// Le message
				$message = "Bonjour,\r\n\r\nVeuillez cliquer le lien ci-dessous pour reinitialiser votre mot de passe \r\n\r\n http://200.113.242.50:8000/cs/cpw.php?guid=".$guid." \r\n\r\nL'Equipe de Support de la Carte Sanitaire";
				

				// Dans le cas où nos lignes comportent plus de 70 caractères, nous les coupons en utilisant wordwrap()
				$message = wordwrap($message, 70, "\r\n");
				$emailFrom = "cartesanitaire@gmail.com";
				$headers = "From: <" . $emailFrom . ">" . "\r\n";
				 //Envoi du mail
		
				if(mail('cartesanitaire@gmail.com', 'Carte sanitaire - Recuperez votre mot de passe', $message, $headers)){
					?>
					<div class="alert alert-success">
					Votre demande de recuperation de mot de passe a été envoyée avec succes. Merci de verifier votre adresse e-mail.
					</div>
					<?php
					//record guid
					$recordguid=$usr->insertGUID($emailtext,$guid);//
				}else{
					?>
					<div class="alert alert-danger">
					Desolé Votre demande de recuperation de mot de passe n'a été envoyée. Veuillez recommencer plus tard.
					</div>
					<?php
				}
				
			}else{
				
				?>
				<div class="alert alert-warning"> Desolé l'adresse E-mail saisi n'existe pas. </div>
				<form action="sendemail.php" id="form_login" method="post">
				 <div class="">Saisissez votre adresse email. Un lien vous sera envoy&eacute; pour la reinitialisation de votre mot de passe</div></br>
				  <input type="text" name="emailtext" id="emailtext" placeholder="Saisir votre email" required />      
				  <button type="submit" class="btn btn-info" id="fbtn_connect">Envoyer</button>
				</form>
				<?php
			}
			
			//Send the email if exists
		}
		
		

	?>
	
  </div>
  
</div>
      
    
    
  </body>
</html>
