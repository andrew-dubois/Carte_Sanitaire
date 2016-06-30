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

           <div class="container-fluid">
			  <div class="row">
				<div class="col-md-12">
				  <div class="panel panel-default">
					<div class="panel-body">
					  <div class="row">
						<div class="col-md-12 lead">Profil d'utilisateur<hr></div>
					  </div>
					  <div class="row">
						<div class="col-md-4 text-center">
						  <img class="img-circle avatar avatar-original" style="-webkit-user-select:none; 
						  display:block; margin:auto;" src="http://robohash.org/sitsequiquia.png?size=120x120">
						</div>
						<div class="col-md-8">
						  <div class="row">
							<div class="col-md-12">
							  <h1 class="only-bottom-margin">Nom d'utilisateur</h1>
							</div>
						  </div>
						  <div class="row">
							<div class="col-md-6">
							  <span class="text-muted">Email:</span> email@test.com<br>
							  <span class="text-muted">Date de naissance:</span> 01.01.2001<br>
							  <span class="text-muted">Genre:</span> male<br><br>
							  <small class="text-muted">Date de creation: 01.01.2015</small>
							</div>
							<!--<div class="col-md-6">
							  <div class="activity-mini">
								<i class="glyphicon glyphicon-comment text-muted"></i> 500
							  </div>
							  <div class="activity-mini">
								<i class="glyphicon glyphicon-thumbs-up text-muted"></i> 1500
							  </div>
							</div>-->
						  </div>
						</div>
					  </div>
					  <div class="row">
					  <div class="col-md-8">
						  <hr><a href="userregistration.php" class="btn btn-info"><i class="glyphicon glyphicon-user"></i> Nouvel utilisateur</a>
						</div>
						<div class="col-md-4">
						  <hr><button class="btn btn-default pull-right"><i class="glyphicon glyphicon-pencil"></i> Modifier profil</button>
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
