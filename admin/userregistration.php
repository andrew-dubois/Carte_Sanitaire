<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Nouvel utilisateur</title>

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
                <a class="navbar-brand" href="index.html">Carte Sanitaire</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">                
                
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Utilisateur <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> Profil</a>
                        </li>
                        
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i> Parametres</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-power-off"></i> Se deconnecter</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li class="active">
                        <a href="index.html"><i class="fa fa-fw fa-dashboard"></i> Tableau de bord</a>
                    </li>
                    <li>
                        <a href="facilities.php"><i class="fa fa-fw fa-bar-chart-o"></i> Institutions</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-fw fa-table"></i> Indicateurs</a>
                    </li>   
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">
			
			<div class="container">
			<div class="row">
						<div class="col-md-12 lead">Ajout d'utilisateur<hr></div>
					  </div>
				<div class="row">
					<form role="form">
						<div class="col-lg-6">
							<div class="well well-sm"><strong><span class="glyphicon glyphicon-asterisk"></span>Champs obligatoires</strong></div>
							<div class="form-group">
								<label for="InputName">Nom complet</label>
								<div class="input-group">
									<input type="text" class="form-control" name="InputName" id="InputName" placeholder="Nom et prenom" required>
									<span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
								</div>
							</div>
							<div class="form-group">
								<label for="InputName">Nom d'utilisateur</label>
								<div class="input-group">
									<input type="text" class="form-control" name="InputName" id="InputName" placeholder="Nom d'utilisateur" required>
									<span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
								</div>
							</div>
							<div class="form-group">
								<label for="InputName">Mode de passe</label>
								<div class="input-group">
									<input type="password" class="form-control" name="InputName" id="InputName" placeholder="Mot de passe d'utilisateur" required>
									<span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
								</div>
							</div>
							<div class="form-group">
								<label for="InputEmail">Adresse Email</label>
								<div class="input-group">
									<input type="email" class="form-control" id="InputEmailFirst" name="InputEmail" placeholder="Saisir l'adresse email" required>
									<span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
								</div>
							</div>
							<div class="form-group">
								<label for="InputEmail">Role</label>
								<div class="input-group">
									<input type="email" class="form-control" id="InputEmailSecond" name="InputEmail" placeholder="Role d'utilisateur" required>
									<span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
								</div>
							</div>
							
							<div class="form-group">
								<label for="InputEmail">Photo</label>
								<div class="input-group">
									<input type="file" class="form-control" id="InputFile" name="InputFile" placeholder="" required>
									<span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
								</div>
							</div>
							
							<input type="submit" name="submit" id="submit" value="Submit" class="btn btn-info pull-right">
						</div>
					</form>
					<!--<div class="col-lg-5 col-md-push-1">
						<div class="col-md-12">
							<div class="alert alert-success">
								<strong><span class="glyphicon glyphicon-ok"></span> Success! Message sent.</strong>
							</div>
							<div class="alert alert-danger">
								<span class="glyphicon glyphicon-remove"></span><strong> Error! Please check all page inputs.</strong>
							</div>
						</div>
					</div>-->
				</div>
			</div>
			
			
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
