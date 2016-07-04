<?php 
session_start();
$username="";
if(!isset($_SESSION['usr'])){
	header('Location: /cs/login.php');
	exit;
}else{
	$username=$_SESSION['usr'];
	
}

include('../lib/core/dhisAPI.php');
Auth_DHIS2();
?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Gestion des indicateurs</title>

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
	
	<style type="text/css">
    select {
        width: 200px;
        float: left;
    }
    .controls {
        width: 40px;
        float: left;
        margin: 10px;
    }
    .controls a {
        background-color: #222222;
        border-radius: 4px;
        border: 2px solid #000;
        color: #ffffff;
        padding: 2px;
        font-size: 14px;
        text-decoration: none;
        display: inline-block;
        text-align: center;
        margin: 5px;
        width: 20px;
    }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js">
    </script>
    <script>
    function moveAll(from, to) {
        $('#'+from+' option').remove().appendTo('#'+to); 
    }
    
    function moveSelected(from, to) {
        $('#'+from+' option:selected').remove().appendTo('#'+to); 
    }
    function selectAll() {
        $("select option").attr("selected","selected");
    }
    </script>
	

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

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Indicateurs
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.html">Tableau de bord</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-table"></i> Indicateurs
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    
                    <div class="col-lg-12">
                        <h2>Port&eacute;e des indicateurs</h2>
                        <div class="table-responsive">
						
						<?php
							$reportTables = API_reportTables();
						?>
						<form name="selection" method="post" onSubmit="return selectAll()"> 
						<table  style="width:90%">
						<tr>
						<td ><h3>Indicateurs publiques</h3></td>
						<td></td>
						<td><h3>Indicateurs priv&eacute;s</h3></td>
						</tr>
						<tr>
							<td>
							<?php
							include("../lib/inc/indicators.inc.php");
							$privateindlist=privIndList();
						
							?>
							<select multiple size="20" id="from" style="width:100%">
							<?php
						
								foreach ($reportTables["reportTables"] as $i => $value) {									
										
									echo "<option value='" . $value["id"] . "'>" . $value["name"] . "</option>";											
										
								}
							?>	
							  
							</select>
							
							</td> 
							<td>
							<div class="controls" style="float:left"> 
								<a href="javascript:moveAll('from', 'to')">&gt;&gt;</a> 
								<a href="javascript:moveSelected('from', 'to')">&gt;</a> 
								<a href="javascript:moveSelected('to', 'from')">&lt;</a> 
								<a href="javascript:moveAll('to', 'from')" href="#">&lt;&lt;</a> </div>
							</td>
							<td><select multiple id="to" size="20" name="topics[]" style="width:100%">
							
								<?php
								
								foreach ($reportTables["reportTables"] as $i => $value) {
									
										foreach($privateindlist as $arrval){
											$valind=trim($arrval['idind']);
											if( $valind == $value["id"]){
												echo "<option value='" . $value["id"] . "'>" . $value["name"] . "</option>";
												break;
											}
											
										}
										 											
												
										
								}
								
								?>
							</select></td>
						</tr>
						</table>						
							
							<div style="display:block; clear:both; padding:5px;"></div>
							
							<button type="button" class="btn btn-primary" style="display:block; clear:both; margin-top:2px;" id="bntvaliderIndp">Valider</button>
						</form> 						
							
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

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
	
	 <script>
	 $(document).ready(function(e){
		 
		 $("#bntvaliderIndp").click(function(){
			 $('#to option').prop('selected', true);
			 validatePrivateind();
			 return false;
			 
		 });
		 removePrivateInd();
		 
	 });
	 
	 /*functions*/
	 function validatePrivateind(){
				 var indSelected=[];
				 $('#to :selected').each(function(i, selected){
						indSelected[i] = $(selected).val();
				});
				 
				 $.post("../lib/inc/indicators.inc.php",
			{
				
				'ind[]' : indSelected
			},
			function(data, status){
				//alert(data);
				if(status=='success'){
					alert("Indicateurs ajoutes avec succes");
				}
			});
	 } 
	 
	//remove private indicator from public list box
		function removePrivateInd(){
			
			//get all select values from private listbox
			$("#to option").each(function()
				{
					
					$("#from option[value='"+ $(this).val() +"']").remove();
					
				});
		}
		 
	
	
	 </script>

</body>

</html>
