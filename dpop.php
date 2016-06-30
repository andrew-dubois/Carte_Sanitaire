<?php include_once('lib/init.php');?>
<!DOCTYPE html">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Donn&eacute;es Population -  Carte Sanitaire</title>
    <script type="text/javascript" src="js/jquery191.js"></script>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
     <script type="text/javascript">
    	google.load("visualization", "1", {packages:["corechart"]}); 
     </script>
    
    <script type="text/javascript" src="http://geoxml3.googlecode.com/svn/branches/polys/geoxml3.js"></script>
    <script type="text/javascript" src="http://geoxml3.googlecode.com/svn/branches/kmz/ZipFile.complete.js"></script>
    <script type="text/javascript" src="http://geoxml3.googlecode.com/svn/trunk/ProjectedOverlay.js"></script> 
	<script type="text/javascript" src="js/custom.js"></script>    
    <script type="text/javascript" src="js/datapeoplemap.js"></script>
    <script type="text/javascript" src="js/rainbowvis.js"></script>
    <script type="text/javascript" src="js/markercluster.js"></script>
    <script type="text/javascript" src="js/markerwithlabel.js"></script> 
    <link href="css/main.css" rel="stylesheet" type="text/css"> 
    <script type="text/javascript" src="js/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/bootstrap/js/bootstrap-tabs.js"></script>
    
    <link href="js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap-custum.css" rel="stylesheet" type="text/css"> 
  	<link href="js/cs_tree/jquery.treeview.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/slimscroll/jquery.slimscroll.min.js"></script>      
      
</head>

<body>
<div id="test"></div>
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
    
    <div id="mainContent">
              
             <div class="container-fluid">
              	<div class="row-fluid">
                  <div class="span2" id="leftmenu">
                  <div id="data-year">
                  	<h2>S&eacute;l&eacute;ctionner une ann&eacute;e</h2>
                     <form action="" method="get" name="data-year-list-form">
                        	<select name="data-year-list" id="data-year-list">                              
                            <option value="2014">2014</option>  
                            <!--<option value="2015">2015</option>   
                            <option value="2016">2016</option> -->                    
                                                 
                            </select>
                        </form>
                  </div>
                  	<!--departement list-->
                    <div id="department-list">
                    	<h3>Choisir une carte &agrave; afficher</h3>
                        <form action="" method="get" name="departmentlist">
                        	<select name="dep-list-dropdmenu" id="datap-dep-list">                            
                             <optgroup label="Carte Nationale">
                             	<option value="Haiti"  selected>Haiti</option>
                             <optgroup/>
                              <optgroup label="Carte D&eacute;partementale">
                             	<option value="Artibonite">Artibonite</option>
                                <option value="Centre">Centre</option>
                                <option value="Grand-Anse">Grand'Anse</option>
                                <option value="Nippes">Nippes</option>
                                <option value="Nord">Nord</option>
                                <option value="Nord-Est">Nord-Est</option>
                                <option value="Nord-Ouest">Nord-Ouest</option>
                                <option value="Ouest">Ouest</option>
                                <option value="Sud">Sud</option>
                                <option value="Sud-Est">Sud-Est</option>                                
                             <optgroup/>
                             
                            </select>
                        </form>
                    </div>
                    <div id="req-anal">
                    	<h3>Requ&ecirc;te et analyse</h3>
                        
                        <div class="accordion" id="accordion2">
                          <div class="accordion-group">
                            <div class="accordion-heading">
                              <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
                                Infrastructure <span class="icon-chevron-down pull-right"></span>
                              </a>
                            </div>
                            <div id="collapseOne" class="accordion-body collapse">
                              <div class="accordion-inner">
                                <table class="table table-condensed table-hover table-striped">
                                	<tr>
                                        <td><input type="radio" name="opt_infrac" value="1" id="infrac_laboratory" class="opt_infrac" data-column="laboratory"/></td>
                                        <td><label for="infrac_laboratory">Institutions disposant d’une infrastructure de laboratoire</label></td>
                                    </tr>
                                    <tr>
                                        <td><input type="radio" name="opt_infrac" value="1" id="Noncomdiseases" data-column="noncomdiseases"/></td>
                                        <td><label for="Noncomdiseases">Insitutions fournissant des soins et traitement de maladies non Infectieuses</label></td>
                                    </tr>
                                    <tr>
                                        <td><input type="radio" name="opt_infrac" value="2" id="Hopitalisatioselmen" data-column="hopitalisatioselmen"/></td>
                                        <td><label for="Hopitalisatioselmen">Institutions avec capacit&eacute; d’hospitalisation pour plus de 24 h</label></td>
                                    </tr>
                                    <tr>
                                        <td><input type="radio" name="opt_infrac" value="0" id="nombredelithospi1nuit" data-column="nombredelithospi1nuit"/></td>
                                        <td><label for="nombredelithospi1nuit">Institutions avec capacit&eacute; d’hospitalisation par nombre de lit Disponibles</label></td>
                                    </tr>                                
                                    
                                </table>
                              </div>
                            </div>
                          </div>
                          
                          <div class="accordion-group">
                            <div class="accordion-heading">
                              <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
                               	Ressources humaines <span class="icon-chevron-down pull-right"></span>
                              </a>
                            </div>
                            <div id="collapseTwo" class="accordion-body collapse">
                              <div class="accordion-inner">
                               <table class="table table-condensed table-hover table-striped">
                                	<tr>
                                        <td><input type="radio" name="opt_ress" value="" id="ress_compo1" data-column=""/></td>
                                        <td><label for="ress_compo1">Institutions disposant d’un m&eacute;decin g&eacute;n&eacute;raliste</label></td>
                                    </tr>
                                    
                                    <tr>
                                        <td><input type="radio" name="opt_ress" value="" id="ress_compo2" data-column=""/></td>
                                        <td><label for="ress_compo2">Institutions disposant de m&eacute;decin sp&eacute;cialiste</label></td>
                                    </tr>
                                    
                                    <tr>
                                        <td><input type="radio" name="opt_ress" value="" id="ress_compo3" data-column=""/></td>
                                        <td><label for="ress_compo3">Institutions disposant d’infirmi&egrave;re et d’auxiliaires uniquement</label></td>
                                    </tr>
                                    
                                    <tr>
                                        <td><input type="radio" name="opt_ress" value="" id="ress_compo4" data-column=""/></td>
                                        <td><label for="ress_compo4">Institutions fournissant des activit&eacute;s de soins et traitements par nombre de m&eacute;decin disponible</label></td>
                                    </tr>
                                    
                                    <tr>
                                        <td><input type="radio" name="opt_ress" value="" id="ress_compo5" data-column=""/></td>
                                        <td><label for="ress_compo5">Insitutions fournissant des activit&eacute;s de soins et traitements  sp&eacute;cialis&eacute;es par nombre de m&eacute;decin sp&eacute;cialiste disponible</label></td>
                                    </tr>                            
                                </table>
                              </div>
                            </div>
                          </div>
                          
                          <div class="accordion-group">
                            <div class="accordion-heading">
                              <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree">
                               Disponibilité des ressources <span class="icon-chevron-down pull-right"></span>
                              </a>
                            </div>
                            <div id="collapseThree" class="accordion-body collapse">
                              <div class="accordion-inner">
                                 <table class="table table-condensed table-hover table-striped">
                                	<tr>
                                        <td><input type="radio" name="opt_disp_ress" value="" id="disp_ress_compo1" data-column=""/></td>
                                        <td><label for="disp_ress_compo1">Institutions fournissant des Services Obst&eacute;triques N&eacute;nonatals d’Urgence(SONU)</label></td>
                                    </tr>
                                    
                                    <tr>
                                        <td><input type="radio" name="opt_disp_ress" value="" id="disp_ress_compo2" data-column=""/></td>
                                        <td><label for="disp_ress_compo2">Institutions fournissant des services p&eacute;diatriques</label></td>
                                    </tr>
                                    
                                    <tr>
                                        <td><input type="radio" name="opt_disp_ress" value="" id="disp_ress_compo3" data-column=""/></td>
                                        <td><label for="disp_ress_compo3">Institutions avec capacit&eacute; de fournir des services de transfusion sanguine</label></td>
                                    </tr>
                                    
                                    <tr>
                                        <td><input type="radio" name="opt_disp_ress" value="" id="disp_ress_compo4" data-column=""/></td>
                                        <td><label for="disp_ress_compo4">Institutions fournissant des services de traitement de la tuberculose</label></td>
                                    </tr>                                                      
                                </table>
                              </div>
                            </div>
                          </div>
                          
                        </div>
                        
                    </div>
                  	
                  </div>
                  <div class="span10" id="mapViewDiv">
                  <div id="legendFac_btnShow"><a href="#" title="Afficher la l&eacute;gende">&laquo; L&eacute;gende</a></div>
                  <div id="legendFac" style="display:block">
                  	<h3>L&eacute;gende <a href="#" class="btn pull-right" id="btn_arrow">&raquo;</a></h3>
                    <table class="table table-condensed table-striped table-hover legend_dpop">
                        <tr>
                            <td>Aucune donn&eacute;e n'est encore affich&eacute;e</td>                            
                        </tr>                     
                    </table>
                    
                  </div>
                  	<!--<div id="moh_div">
                    	<div class="logo_moh">
                          <img src="images/mspp_contentlogo.png" width="509" height="414">
                          </div>
                         <br/><span>S&eacute;lectionner la carte &agrave; afficher dans le panel de gauche</span>
                        
                    </div>-->
                  	<div id="cs_map" style="width:100%; height:80.51030927835052%;"></div>
                    <div id="overlayDiv">
                    	<div id="ball">
                            <div class="ball_loading"></div>
                            <div class="ball_loading1"></div>
                            <p>Veuillez patienter...</p>
                        </div>
                    </div>
                  </div>
                </div>
            </div>
                      
             
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
                <input type="checkbox"> Remember me
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


<!--collapse-->
<script>
$(document).ready(function(){
	
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
