<?php include_once('lib/init.php'); 
//include_once('lib/inc/polygons.php');
?>
<!DOCTYPE html">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>MSPP -  Carte Sanitaire</title>
        <script type="text/javascript" src="js/jquery191.js"></script>
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyBKTJn79hsRgdkWhnJr8QxodRTidYVFTKs"></script>   
        <!--<script type="text/javascript" src="js/markercluster.js"></script>-->
		<script type="text/javascript" src="js/markerClusterer/markerclusterer_packaged.js"></script>
       
        
        <script type="text/javascript" src="js/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/cs_tree/lib/jquery.cookie.js"></script>
        <script type="text/javascript" src="js/cs_tree/jquery.treeview.js"></script> 
        
        <script type="text/javascript" src="js/custom.js"></script>
        <script type="text/javascript" src="js/map.js"></script>        
        <script type="text/javascript" src="js/map_clustering.js"></script>
        <script type="text/javascript" src="js/dcart_legend.js"></script>
        <script type="text/javascript" src="js/dcart_leftmenu.js"></script>
        
        <link href="css/main.css" rel="stylesheet" type="text/css">         

        <link href="js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/bootstrap-custum.css" rel="stylesheet" type="text/css"> 
        <link href="js/cs_tree/jquery.treeview.css" rel="stylesheet" type="text/css">     
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

            <div id="mainContent">

                <div class="container-fluid">
                    <div class="row-fluid">
                        <div class="span2" id="leftmenu">
                            <!--departement list-->
                            <div id="department-list">
                                <h3>Choisir une carte &agrave; afficher</h3>
                                <form action="" method="get" name="departmentlist">
                                    <select name="dep-list-dropdmenu" id="dep-list-dropdmenu">
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
                            <div id="layer-type1">
                                <h3>Couche</h3>
                                <table class="table table-condensed table-hover">
                                    <tr>
                                        <td> <input type="checkbox" id="health_fac" checked class="layerOpt"/></td>
                                        <td><label for="health_fac">Institutions sanitaires</label>&nbsp;<span id="fac_typeTotal" class="badge badge-info">-</span>
                                            <ul id="fac_type" class="treeview">
                                                <li>
                                                    <input type="checkbox" value="Centre de sante a lit" class="opt_fac_type" id="chk_health_a_lit" checked />&nbsp;<span><label for="chk_health_a_lit" title="Centre de sant&eacute; &agrave; lit">CAL</label></span>&nbsp;<span class="badge badge-info stotal">-</span>
                                                </li>
                                                <li>
                                                    <input type="checkbox" value="Centre de sante sans lit" class="opt_fac_type" id="chk_health_sans_lit" checked/>&nbsp;<span><label for="chk_health_sans_lit" title="Centre de sant&eacute; sans lit">CSL</label></span>&nbsp;<span class="badge badge-info stotal">-</span>
                                                </li>
                                                <li>
                                                    <input type="checkbox" value="Hopital" class="opt_fac_type" id="chk_health_h" checked/>&nbsp;<span><label for="chk_health_h" title="Hopitale">Hopital</label></span>&nbsp;<span class="badge badge-info stotal">-</span>
                                                </li>
                                                <li>
                                                    <input type="checkbox" value="Hopital communautaire de reference" class="opt_fac_type" id="chk_health_hcr" checked/>&nbsp;<span><label for="chk_health_hcr" title="Hopital Communautaire de r&eacute;f&eacute;rence">HCR</label></span>&nbsp;<span class="badge badge-info stotal">-</span>
                                                </li>

                                                <li>
                                                    <input type="checkbox" value="Hopital universitaire" class="opt_fac_type" id="chk_health_hu" checked/>&nbsp;<span><label for="chk_health_hu" title="Hopital universitaire">HU</label></span>&nbsp;<span class="badge badge-info stotal">-</span>
                                                </li>

                                                <li>
                                                    <input type="checkbox" value="Dispensaire" class="opt_fac_type" id="chk_health_dis" checked/>&nbsp;<span><label for="chk_health_dis" title="Dispensaire">Dispensaire</label></span>&nbsp;<span class="badge badge-info stotal">-</span>
                                                </li>

                                                <li>
                                                    <input type="checkbox" value="Hopital departemental" class="opt_fac_type" id="chk_health_dep" checked/>&nbsp;<span><label for="chk_health_dep" title="Hopital d&eacute;partemental">Hop. d&eacute;partemental</label></span>&nbsp;<span class="badge badge-info stotal">-</span>
                                                </li>
                                            </ul>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td> <input type="checkbox"  id="lab_infr" class="layerOpt"/></td>
                                        <td><label for="lab_infr">Infrastructures de laboratoires</label>&nbsp;<span id="NB_lab_infr" class="badge badge-info">-</span></td>
                                    </tr>
                                    <tr>
                                        <td> <input type="checkbox" id="vih_fac" class="layerOpt"/></td>
                                        <td><label for="vih_fac">Institutions offrant le programme VIH</label>&nbsp;<span id="NB_vih_fac" class="badge badge-info">-</span></td>
                                    </tr>        

                                </table>
                            </div>                            
                        </div>
                        <div class="span10" id="mapViewDiv">
                            <div id="legendFac_btnShow"><a href="#" title="Afficher la l&eacute;gende">&laquo; L&eacute;gende</a></div>
                            <div id="legendFac">
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
            <!--<div id="chartContainer" style="max-width:700px;height: 300px;"></div>-->
            <script>
                     $('#myTab a').click(function (e) {
                         e.preventDefault();
                         $(this).tab('show');
                     })
            </script>

            <script>
                var winOn = false;
                setInterval(function () {
                    if (navigator.onLine) {
                        $("#offModWin").modal('hide');
                        winOn = false;
                    } else {
                        if (!winOn) {
                            $("#offModWin").modal('show');
                            winOn = true;
                        }
                    }
                }, 1000);
            </script>
    </body>
</html>
