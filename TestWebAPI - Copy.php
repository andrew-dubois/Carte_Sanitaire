<?php include_once('lib/init.php'); ?>
<!DOCTYPE html">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>DHIS Demo -  Carte Sanitaire</title>

        <script type="text/javascript" src="js/jquery191.js"></script>    

        <script type="text/javascript" src="js/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="http://dhis2-cdn.org/v216/ext/ext-all.js"></script>
<script type="text/javascript" src="js/plugin.js"></script>
		<link rel="stylesheet" href="http://dhis2-cdn.org/v216/ext/resources/css/ext-plugin-gray.css">
       <script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=false"></script>
        <script type="text/javascript" src="http://dhis2-cdn.org/v216/openlayers/OpenLayers.js"></script>
		 
  <!--       <script type="text/javascript" src="http://dhis2-cdn.org/v216/plugin/map.js"></script>-->

        <link href="css/main.css" rel="stylesheet" type="text/css"> 
        <link href="js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/bootstrap-custum.css" rel="stylesheet" type="text/css">     

        <script type="text/javascript">
            var base = "http://192.168.1.10:8081/dhis/";

            // Login - if OK, call the setLinks function
            $(document).ready(function ()
            {
                $.ajax({
                    type: "POST",
                    url: base + "dhis-web-commons-security/login.action?authOnly=true",
                    //url: base + "dhis-web-commons/security/login.action?authOnly=true", this is for the actual login page, don't use for actual login!
                    data: {j_username: "admin", j_password: "Password001"},
                    success: setLinks,
                });
            });

			//Use this if you want to set a map image (no interaction)
//            function setLinks() {
//                jQuery("#cs_map").attr("src", base + "api/maps/cH1M9AjUaIZ/data?width=800");
//            }

			//this is using the ext framework (not going to be used to to bugs)
//            Ext.onReady(function () {
//                Ext.Ajax.request({
//                    url: base + "dhis-web-commons/security/login.action?authOnly=true",
//                    method: "POST",
//                    params: {j_username: "admin", j_password: "district"},
//                    success: setLinks,
//                    crossDomain: true
//                });
//            });

			// This uses the GIS plugin from DHIS which relies on the EXT framework and loads the map into a div (using Iframe -> Interactive)
function checkVariable() {

  

 }

  

            function setLinks() {
 if(typeof GIS !== 'undefined'){
    GIS.plugin.getMap({url: base, el: "cs_map", id: "dKg3Gs19fpC"});
				LoadFromAPI();
   }
else{
setTimeout(setLinks, 1000)
}
				
            }
			
			function LoadFromAPI()
			{
				$.get(base + "api/maps.json)", function(data){
					for(var x in data.maps)
					{
						$('#data-maps-list').html($('#data-maps-list').html() + '<option id="'+data.maps[x].id+'">' +data.maps[x].name+'</option>');
					}
					
				});
				// $.ajax({
					// type: "GET",
					// url: base + "api/maps"
			}
        </script>
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
                <div id="navbar-inner" style="width:700px">
                    <ul>
                        <li><a href="index.php" class="mIcon homeicon">Accueil</a></li>
                        <!--<li><a href="#" class="mIcon abouticon">A-Propos</a></li>-->
                        <li><a href="dcart.php" class="mIcon mapicon ">Cartographie</a></li>
                        <li><a href="dcart.php" class="mIcon peopleicon focusMenuItem">Population</a></li>
                        <!--<li><a href="#" class="mIcon sitemapicon">Plan du site</a></li>-->
                        <li><a href="#" class="mIcon docicon">Documentation</a></li>
                    </ul>
                </div>
            </div>

            <div id="mainContent">
                <div class="container-fluid">
                    <div class="row-fluid">
                        <div class="span2" id="leftmenu">
                            <div id="data-year">
                                <h2>Select Map</h2>
                                <select name="data-maps-list" id="data-maps-list">                                          
                                    <!-- need to load map options here -->                         
                                </select>
                            </div>
                            <!--departement list-->
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

                            <div id="cs_map" style="width:100%; height:100%;"></div>
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

    </body>
</html>
