<?php include_once('lib/init.php');?>
<!DOCTYPE html">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>MSPP -  Carte Sanitaire</title>
    <script type="text/javascript" src="js/jquery191.js"></script>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true&key=AIzaSyBKTJn79hsRgdkWhnJr8QxodRTidYVFTKs"></script>
<!--    <script type="text/javascript" src="http://geoxml3.googlecode.com/svn/branches/polys/geoxml3.js"></script>
    <script type="text/javascript" src="http://geoxml3.googlecode.com/svn/branches/kmz/ZipFile.complete.js"></script>
    <script type="text/javascript" src="http://geoxml3.googlecode.com/svn/trunk/ProjectedOverlay.js"></script> -->
	<script type="text/javascript" src="js/custom.js"></script>
    
   
     <!--<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=weather"></script>-->
   <!-- <script type="text/javascript" src="https://www.google.com/jsapi"></script>
     <script type="text/javascript">
    	google.load("visualization", "1", {packages:["corechart"]}); 
     </script>-->
    <script type="text/javascript" src="js/mapsearch.js"></script>
    
     <script type="text/javascript" src="js/markercluster.js"></script>
    <link href="css/main.css" rel="stylesheet" type="text/css"> 
        
    <script type="text/javascript" src="js/accordion.js"></script>
    <script type="text/javascript" src="js/bootstrap/js/bootstrap.min.js"></script>
    
    <link href="js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap-custum.css" rel="stylesheet" type="text/css"> 
  	<link href="js/cs_tree/jquery.treeview.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="js/cs_tree/lib/jquery.cookie.js"></script>
	<script type="text/javascript" src="js/cs_tree/jquery.treeview.js"></script>
    <script type="text/javascript" src="js/slimscroll/jquery.slimscroll.min.js"></script>      
      
</head>

<body>
<div id="wrapper">
    <div id="head">
      <div id="logosite">
        <div id="logosite_desc">
          <h2>R&Eacute;PUBLIQUE D'HAITI</h2>
          <p>MINIST&Egrave;RE DE LA SANT&Eacute; PUBLIQUE <br>
            ET DE LA POPULATION</p>
        </div>
      </div>
      <div id="logocard"> <img src="images/cardlogo.png" width="51" height="61" alt="Logo - Cartographie sanitaire d'haiti">
        <h2>CARTOGRAPHIE<br>
          SANITAIRE D'HAITI </h2>
        <p>UNIT&Eacute; D'&Eacute;TUDES ET DE PROGRAMMATION</p>
      </div>
      <div id="hdlink"><a href="#myModal" data-toggle="modal">Se Connecter</a></div>
    </div>
    
    <!--Navbar-->
      <div id="navbar">
        <div id="navbar-inner">
          <ul>
            <?php include 'lib/inc/nav.php'; ?>
          </ul>
        </div>
      </div>
<div id="searchbar-content">
  <div class="searchbar-inner">
  			
    <form name="form1" method="post" action="" id="formsearch">
       	    <input type="text" name="search-field" id="search-field" autocomplete="off">
       	    <input type="submit" name="btnsearch" id="btnsearch" value="">
      	  </form>
          <div id="placeholder">
            	<p>Rechercher une institution par nom, filtrer par d&eacute;partement ou commnune</p>
            </div>
	    <!--Search results-->
        <div id="search-result">
        	<p class="initial-text">COMMENCER &Agrave; TAPER<br/><span>e.g. Sanatorium</span></p>
        </div>
    </div>
</div>
    <div id="mainContent">
    		<div id="search-result-occ">
            	<div class="alert alert-info">Resultats trouv&eacute;s pour "<strong class="keywordtosearch"></strong>"</div>
                <!--<table class="table table-condensed table-hover table-striped">
                	<tr>
                    	<td>1</td>
                        <td>Sanotaoriem de carrefour</td>                        
                    </tr>
                    
                    <tr>
                    	<td>1</td>
                        <td>Sanotaoriem de carrefour</td>                        
                    </tr>
                </table>-->
                <div class="result-occ">
                </div>
            </div>
            <div id="mapSearch" ></div>          
    </div>
    <!--Login form modal box-->
    <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel">MSPP - Se connecter</h3>
      </div>
      <div class="modal-body">
        
        <!--login form-->
        <form class="form-horizontal">
          <div class="control-group">
            <label class="control-label" for="inputEmail">Nom d'utilisateur</label>
            <div class="controls">
              <input type="text" id="inputEmail" required >
            </div>
          </div>
          <div class="control-group">
            <label class="control-label" for="inputPassword">Mot de passe</label>
            <div class="controls">
              <input type="password" id="inputPassword" required>
            </div>
          </div>
          <div class="control-group">
            <div class="controls">
              <label class="checkbox">
                <input type="checkbox"> Me rappeler plus tard
              </label>
              <button type="submit" class="btn">Sign in</button>
            </div>
          </div>
        </form>
        
      </div>
      <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
      </div>
    </div>
   <!--OFFLINE POPUP WINDOW-->
<div class="modal hide fade" id="offModWin" data-backdrop="static">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h3>Ooops!! Vous &ecirc;tes hors ligne</h3>
    </div>
    <div class="modal-body">
    	<p>On dirait que vous êtes hors ligne, vous voudrez peut-être attendre que votre réseau revient avant de poursuivre.
Ce message s'auto-détruira une fois que vous êtes de nouveau en ligne.</p>
    </div>
    <div class="modal-footer">
        <a href="#" class="btn btn-danger" data-dismiss="modal" id="closeModOff">Je continue hors ligne</a>
    </div>
</div>
    <!--footer-->
    
<div id="footer">

  	<span>Carte Sanitaire &copy; 2014</span> - <a href="#">Site web MSPP</a> | <a href="#">Documentation</a> 
  </div>
<!--<div id="chartContainer" style="max-width:700px;height: 300px;"></div>-->
<script>
 $('#myTab a').click(function (e) {
  e.preventDefault();
  $(this).tab('show');
})
</script>

<!--tree view-->
<script>
$(document).ready(function(){
	//treeview setup
	$("#sitelist").treeview({
		animated: "fast",
		collapsed: true,
		unique: true,
		persist: "cookie"		
	});
	
	//scroll setup
	 $('#sitelist').slimScroll({
		height: '400px',
		alwaysVisible: true,
		railColor:'#D6D6D6',
		railVisible:true
    });
});

</script>

<script>
var winOn=false;
setInterval(function(){
    if(navigator.onLine){
        $("#offModWin").modal('hide');
		winOn=false;
    }else{
	  if(!winOn){
		  $("#offModWin").modal('show');
		  winOn=true;
		  }       
    }
},1000);
</script>

</body>
</html>
