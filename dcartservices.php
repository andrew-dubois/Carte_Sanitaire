<?php include_once('lib/init.php');
session_start();
?>
<!DOCTYPE html">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>MSPP -  Services des institutions</title>
    <script type="text/javascript" src="js/jquery191.js"></script>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript" src="http://geoxml3.googlecode.com/svn/branches/polys/geoxml3.js"></script>
    <script type="text/javascript" src="http://geoxml3.googlecode.com/svn/branches/kmz/ZipFile.complete.js"></script>
    <script type="text/javascript" src="http://geoxml3.googlecode.com/svn/trunk/ProjectedOverlay.js"></script> 
	<script type="text/javascript" src="js/custom.js"></script>
    <!--<script type="text/javascript" src="https://www.google.com/jsapi"></script>
     <script type="text/javascript">
    	google.load("visualization", "1", {packages:["corechart"]}); 
     </script>-->
    <script type="text/javascript" src="js/map.js"></script>    
     <script type="text/javascript" src="js/markercluster.js"></script>
    <link href="css/main.css" rel="stylesheet" type="text/css">         
    <script type="text/javascript" src="js/accordion.js"></script>
    <script type="text/javascript" src="js/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/bootstrap/js/bootstrap-tabs.js"></script>    
    <link href="js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap-custum.css" rel="stylesheet" type="text/css"> 
    <script type="text/javascript" src="js/slimscroll/jquery.slimscroll.min.js"></script>
    <script type="text/javascript" src="js/users.js"></script>  
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">     
</head>

<body>
<div id="wrapper">
    <div id="head">
      <div id="logosite" style="background-image: url(images/unicef.jpg);">
        <div id="logosite_desc">
          <h2>UNICEF MAP MASHUP</h2>
          <p>Institutions sanitaires d'Haiti <br>
            et services offerts</p>
        </div>
      </div>
      <div id="logocard"> <img src="images/cardlogo.png" width="51" height="61" alt="Logo - Cartographie sanitaire d'haiti">
        <h2>CARTOGRAPHIE<br>
          SANITAIRE D'HAITI </h2>
        <p>UNIT&Eacute; D'&Eacute;TUDES ET DE PROGRAMMATION</p>
      </div>
      <div id="hdlink">
      	
        <ul>
        	<li class="<?php echo (isset($_SESSION['usr']))?"user_signed":"user_not_signed";?>">
				<?php
                
                if(isset($_SESSION['usr'])){
                    ?><a href="#" data-toggle="" class="usrlink"><?php echo $_SESSION['usr'] ?></a><?php
                    }else{
                        ?><a href="#myModal" data-toggle="modal" class="usrlink">Se Connecter</a><?php
                        }
                ?>
                <div id="usermenu">
                    <table class="table table-condensed table-striped table-hover">
                        <tr><td><a href="#" id="signout_link"><i class="fa fa-sign-out"></i> Se deconnecter</a></td></tr>
                        <tr><td><a href="#"><i class="fa fa-cogs"></i> Param&egrave;tres</a></td></tr>
                        <tr><td><a href="#"><i class="fa fa-key"></i> Change password</a></td></tr>                  
                    </table>
                </div>
        	</li>
      	</ul>
      </div>
    </div>
    
    <!--Navbar-->
      <div id="navbar">
        <div id="navbar-inner">
          <ul>
            <li><a href="#" class="mIcon homeicon">Accueil</a></li>
            <!--<li><a href="#" class="mIcon abouticon">A-Propos</a></li>-->
            <li><a href="#" class="mIcon mapicon focusMenuItem">Cartographie</a></li>
            <!--<li><a href="#" class="mIcon sitemapicon">Plan du site</a></li>-->
            <li><a href="#" class="mIcon docicon">Documentation</a></li>
          </ul>
        </div>
      </div>
    
    <div id="mainContent">
              
             <div class="container-fluid">
              	<div class="row-fluid">
                  <div class="span2" id="leftmenu">
                  	<!--departement list-->
                    <div id="department-list">
                    	<h3>Choisir une carte &agrave; afficher</h3>
                        <form action="" method="get" name="departmentlist">
                        	<select name="dep-list-dropdmenu" id="dep-list-dropdmenu" class="dcartserv">
                            <option value="none">---</option>
                             <optgroup label="Carte Nationale">
                             	<option value="Haiti">Haiti</option>
                             <optgroup/>
                             <optgroup label="Carte D&eacute;partementale">
                             	<option value="Artibonite">Artibonite</option>
                                <option value="Centre">Centre</option>
                                <option value="Grand Anse">Grand'Anse</option>
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
                    <div id="commune-list">
                    
                    </div>
                    <div id="layer-type1">
                    <!--Options filter menu-->
                        <div id="opt_filter_dcartserv_menu">                        	
                            <h2>Filtrer les institutions ayant</h2>                                                	
                            <table class="table table-condensed table-striped table-hover">
                                <tbody>
                                	<tr>
                                    	<td><input id="ou_opt" type="radio" value="OR" name="opt_filter_radio" class="opt_filter_r" checked/></td>
                                    	<td><label for="ou_opt">Au moins un des services coch&eacute;s</label></td>
                                    </tr>
                                    <tr>
                                    	<td><input type="radio" id="et_opt" value="AND" name="opt_filter_radio" class="opt_filter_r"/></td>
                                    	<td><label for="et_opt">&Agrave; la fois les services coch&eacute;s</label></td>
                                    </tr>                                                      
                            	</tbody>
                            </table>
                        </div>
                    	<!--Options filter-->
                    	<span id="opt_filter_dcartserv" title="Options"><a href="#"><i class="fa fa-gear"></i></a></span>                      
                        
                        <h3>Services</h3>
                        <table class="table table-condensed table-hover">
                          <tr>
                            <td> <input type="checkbox" value="anc" id="fac_cpn_ck" class="service_fac"/></td>
                            <td><label for="fac_cpn_ck">Clinique pr&eacute;natale(CPN)</label>&nbsp;<span id="fac_cpn" class="badge badge-info pull-right">-</span></td>                           
                          </tr>      
                          
                          <tr>
                          	<td> <input type="checkbox" value="delivery" id="fac_acc_ck" class="service_fac"/></td>
                          	<td><label for="fac_acc_ck">Accouchement</label>&nbsp;<span id="fac_cpn" class="badge badge-info pull-right">-</span></td>
                          </tr>   
                          
                          <!--<tr>
                          	<td> <input type="checkbox" value="" id="fac_pn_ck" class="service_fac" disabled /></td>
                          	<td><label for="fac_pn_ck">Post Natal(PN)</label>&nbsp;<span id="fac_cpn" class="badge badge-info pull-right">-</span></td>
                          </tr>-->
                          
                          <tr>
                          	<td> <input type="checkbox" value="sickchild" id="fac_pd_ck" class="service_fac" /></td>
                          	<td><label for="fac_pd_ck">P&eacute;diatrie</label>&nbsp;<span id="fac_cpn" class="badge badge-info pull-right">-</span></td>
                          </tr>
                          
                          <tr>
                          	<td> <input type="checkbox" value="childvacc" id="fac_vacc_ck" class="service_fac" /></td>
                          	<td><label for="fac_vacc_ck">Vaccination</label>&nbsp;<span id="fac_cpn" class="badge badge-info pull-right">-</span></td>
                          </tr>     
                          
                          <tr>
                          	<td> <input type="checkbox" value="hivcss" id="fac_vih_ck" class="service_fac" /></td>
                          	<td><label for="fac_vih_ck">VIH</label>&nbsp;<span id="fac_cpn" class="badge badge-info pull-right">-</span></td>
                          </tr>   
                          
                          <tr>
                          	<td> <input type="checkbox" value="sti" id="fac_syp_ck" class="service_fac" /></td>
                          	<td><label for="fac_syp_ck">Syphilis</label>&nbsp;<span id="fac_cpn" class="badge badge-info pull-right">-</span></td>
                          </tr>
                          
                          <tr>
                          	<td> <input type="checkbox" value="pmtct" id="fac_ptme_ck" class="service_fac" /></td>
                          	<td><label for="fac_ptme_ck">PTME</label>&nbsp;<span id="fac_cpn" class="badge badge-info pull-right">-</span></td>
                          </tr>
                          
                          <tr>
                          	<td> <input type="checkbox" value="art" id="fac_arv_ck" class="service_fac" /></td>
                          	<td><label for="fac_arv_ck">ARV</label>&nbsp;<span id="fac_cpn" class="badge badge-info pull-right">-</span></td>
                          </tr>
                          
                          <tr>
                          	<td> <input type="checkbox" value="fp" id="fac_pf_ck" class="service_fac" /></td>
                          	<td><label for="fac_pf_ck">PF</label>&nbsp;<span id="fac_cpn" class="badge badge-info pull-right">-</span></td>
                          </tr>
                          
                        </table>
                    </div>
                  	
                    <!-- END - Left side menu-->
                  </div>
                  <div class="span10" id="mapViewDiv">
                  <!--legend for icon type-->
                  <div id="legendFac_btnShow" class="dcartserv"><a href="#" title="Afficher la l&eacute;gende">&laquo; L&eacute;gende</a></div>
                  <div id="legendFac" class="dcartserv">
                  	<h3>L&eacute;gende <a href="#" class="btn pull-right" id="btn_arrow">&raquo;</a></h3>
                    <table class="table table-condensed table-hover">
                      <tr class="cluster">
                          <td><img src="images/mapicons/bluecluster32.png" width="32" height="31"></td>
                          <td>Regroupement faible des institutions(1-10)</td>
                      </tr>
                      <tr class="cluster">
                          <td><img src="images/mapicons/yellowcluster32.png" width="32" height="31"></td>
                          <td>Regroupement Moyen des institutions(10-100)</td>
                      </tr>
                      
                      <tr class="cluster">
                          <td><img src="images/mapicons/redcluster32.png" width="32" height="32"></td>
                          <td>Regroupement &eacute;lev&eacute; des institutions(100-x)</td>
                      </tr>
                      <tr class="markers">
                          <td><img src="images/mapicons/cal.png" width="32" height="37"></td>
                          <td>Centre de sant&eacute; &agrave; lit</td>
                      </tr>
                      <tr class="markers">
                          <td><img src="images/mapicons/csl.png" width="32" height="37"></td>
                          <td>Centre de sant&eacute; sans lit</td>
                      </tr>
                      
                      <tr class="markers">
                          <td><img src="images/mapicons/disp.png" width="32" height="37"></td>
                          <td>Dispensaire</td>
                      </tr>
					  <tr class="markers">
                          <td><img src="images/mapicons/hcr2.png" width="32" height="37"></td>
                          <td>Hopital</td>
                      </tr>
                      <tr class="markers">
                          <td><img src="images/mapicons/hcr.png" width="32" height="37"></td>
                          <td>Hopital communautaire de r&eacute;f&eacute;rence</td>
                      </tr>
                       <tr class="markers">
                          <td><img src="images/mapicons/hdep.png" width="32" height="37"></td>
                          <td>Hopital d&eacute;partemental</td>
                      </tr>
                      <tr class="markers">
                          <td><img src="images/mapicons/hu.png" width="32" height="37"></td>
                          <td>Hopital universitaire</td>
                      </tr>
                    </table>
                    
                  </div>
                  
                  <!--legend for table using for facilities listing-->
                  <div id="legendTable_btnShow" class="dcartserv_tab"><a href="#" title="Afficher la l&eacute;gende">&laquo; Tableau</a></div>
                  <div id="legendTable" class="dcartserv_tab">
                  	<h3>Liste des institutions sanitaires de carrefour <a href="#" class="btn pull-right dcartserv_tab" id="btn_arrow_tab">&raquo;</a></h3>
                    <table class="table table-condensed table-hover table-striped">
                    	<tr>               
                            <th>Code</th>
                        	<th>Nom</th>
                            <th>Lieu</th>
                            <th>Services</th>
                        </tr>
                        <tr>
                        	<td>0003</td>
                            <td>La roche de</td>
                            <td>Carrefour / Port-au-prince</td>
                            <td>Arv, ptme, croissance</td>
                        </tr>
                        <tr>
                        	<td>0003</td>
                            <td>La roche de</td>
                            <td>Carrefour / Port-au-prince</td>
                            <td>Arv, ptme, croissance</td>
                        </tr>
                        <tr>
                        	<td>0003</td>
                            <td>La roche de</td>
                            <td>Carrefour / Port-au-prince</td>
                            <td>Arv, ptme, croissance</td>
                        </tr>
                    </table>
                  </div>
                  
                  	<div id="moh_div">
                    	<div class="logo_moh">
                          <img src="images/mspp_contentlogo.png" width="509" height="414">
                          </div>
                         <br/><span>S&eacute;lectionner la carte &agrave; afficher dans le panel de gauche</span>
                        
                    </div>
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
    <div id="myModal" class="modal hide fade"  role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-header">        
        <h3 id="myModalLabel">MSPP - Connexion</h3>
        <h3 id="changingpassw">Changement de mot de passe</h3>
      </div>
      <div class="modal-body">
        
        <!--login form-->
        <form class="form-horizontal" id="form_login">
          <div class="control-group">
            <label class="control-label" for="usernametext">Nom d'utilisateur</label>
            <div class="controls">
              <input type="text" id="usernametext" required autocomplete='off'/>
            </div>
          </div>
          <div class="control-group">
            <label class="control-label" for="passwtext">Mot de passe</label>
            <div class="controls">
              <input type="password" id="passwtext" required>
            </div>
          </div>
          <div class="control-group">
            <div class="controls">
              <!--<label class="checkbox">
                <input type="checkbox" title="Cochez pour enregistrer votre connexion. Ne pas cocher si cet ordinateur est partag&eacute;"/> 
              </label>-->
              <button type="submit" class="btn" id="btn_connect">Se connecter</button>
            </div>
          </div>
        </form>
        <!--Form changing password-->
        <div id="changingpassw_body">
        	<div class="alert alert-error">
            Pour des raisons de s&eacute;curit&eacute;, vous &ecirc;tes invit&eacute;s &agrave; changer votre mode de passe avant de continuer
            </div>
        	<form class="form-horizontal" id="form_passw">
          <div class="control-group">
            <label class="control-label" for="oldpasstext">Ancien mot de passe</label>
            <div class="controls">
              <input type="password" id="oldpasstext" required name="oldpasstext" />
            </div>
          </div>
          <div class="control-group">
            <label class="control-label" for="newpasstext">Nouveau mot de passe</label>
            <div class="controls">
              <input type="password" id="newpasstext" name="newpasstext" required>
            </div>
          </div>
          
          <div class="control-group">
            <label class="control-label" for="confnewpasstext">Confirmer le mot de passe</label>
            <div class="controls">
              <input type="password" id="confnewpasstext" name="confnewpasstext" required>
            </div>
          </div>
          <div class="control-group">
            <div class="controls">      
              <button type="submit" class="btn" id="btn_changepass">Changer</button>
            </div>
          </div>
        </form>
        </div>
        
      </div>
      <div class="modal-footer">
        <a href="#">Mot de passe oubli&eacute ?</a>
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

<script>
 $('#myTab a').click(function (e) {
  e.preventDefault();
  $(this).tab('show');
})
</script>

<!--tree view-->
<script>
$(document).ready(function(){
	<?php
	if(! isset($_SESSION['usr'])){
		?>$('#myModal').modal({backdrop:'static'});<?php
		}
	?>
	
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
