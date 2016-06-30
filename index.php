<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Carte sanitaire haitienne - Accueil</title>
        <script type="text/javascript" src="js/jquery191.js"></script>	  
        <script src="js/bootstrap/js/bootstrap.js" ></script>
        <link href="js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>		
        <link href="css/home.css" rel="stylesheet" type="text/css"/>
		<link href="css/responsive.css" rel="stylesheet" type="text/css"/>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    </head>

    <body class="mapbg">
        <div id="head">
            <!--head-->
            <div id="content-head"> 
                <a href="/cs/index.php">
                    <div id="logocard">
                        <div id="logocard_desc">
                            <h2>CARTOGRAPHIE<br>
                                SANITAIRE D'HAITI </h2>
                            <p>UNIT&Eacute; D'&Eacute;TUDES ET DE PROGRAMMATION</p>
                        </div>
                    </div>
                </a>
                <a>
                    <div id="logosite">
                        <div id="logosite_desc">
                            <h2>RÉPUBLIQUE D'HAITI</h2>
                            <p>MINISTÈRE DE LA SANTÉ PUBLIQUE <br>
                                ET DE LA POPULATION</p>
                        </div>
                    </div>
                </a>
                <!--<div id="language" title="Changer la langue"><a href="#">Fran&ccedil;ais</a></div>-->
            </div>
        </div>
        <!-- end head-->
        <!--Navbar-->
        <nav class="navbar navbar-default" id="navbar" role="navigation">
            <div class="container-fluid">
			<!--mobile nav-->
				<div id="navbar-mob">
					<span id="nav-mob-menu"><i class="fa fa-bars"></i></span>
					<span id="nav-mob-menu-rightOpt"><i class="fa fa-user"></i></span>
				</div>
				
                <div id="navbar-inner">
                    <ul>
                        <?php include 'lib/inc/nav.php'; ?>
                    </ul>
                </div>
            </div>
        </nav>
        <!--Navbar Mobile-->
        <nav class="navbar navbar-default" id="mobile-nav" role="navigation">
            <div>
                <div>
                    <ul>
                        <?php include 'lib/inc/nav.php'; ?>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container-fluid">
            <div id="main-content">
                <div class="container">
                    <div class="row">
                        <div class="span6">
                            <a href="dcart.php"><div class="link-section">
                                    <h1>CARTOGRAPHIE INSTITUTIONNELLE</h1>
                                    <img src="images/haitiIcon.png" alt="Cartographie institutionnelle" width="169" height="118"> 
                                    <div class="caption-section">
                                        <span>Repr&eacute;senter g&eacute;ographiquement  les institutions sanitaires</span>
                                    </div>
                                </div></a>
                        </div>
                        <div class="span6">
                            <a href="dashboard.php"><div class="link-section">
                                    <h1>TABLEAU DE BORD</h1>
                                    <img src="images/dashboardIcon.png" alt="Tableau de board" width="194" height="94"> 
                                    <div class="caption-section">
                                        <span>Représenter graphiquement les données sanitaires</span>
                                    </div>
                                </div></a>
                        </div>
                    </div>

                    <div class="row">
                        <div class="span6">
                            <a href="dpop.php"><div class="link-section">
                                    <h1>DONN&Eacute;ES D&Eacute;MOGRAPHIQUES</h1>
                                    <img src="images/peopleIcon.png" width="167" height="108">
                                    <div class="caption-section">
                                        <span>Mettre à jour la base d’information d&eacute;mographique</span>
                                    </div>
                                </div></a>
                        </div>
                        <div class="span6">
                            <a href="search.php"><div class="link-section">
                                    <h1>RECHERCHE</h1>
                                    <img src="images/searchIcon.png" width="138" height="135">
                                    <div class="caption-section">
                                        <span>Effectuer une recherche</span>
                                    </div>
                                </div></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--  footer-->
        <div id="footer">
            <div class="container">
                <p class="footer-text">
                    <span>Carte Sanitaire &copy; 2014</span> - <a href="#">Site web MSPP</a> | <a href="#">Documentation</a> 
                </p>
            </div>
        </div>

    </body>
</html>
