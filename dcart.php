<?php
include_once('lib/init.php');
?>
<!DOCTYPE html">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>MSPP -  Carte Sanitaire</title>
        <script type="text/javascript" src="js/jquery191.js"></script>
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyBKTJn79hsRgdkWhnJr8QxodRTidYVFTKs"></script>  
        <script type="text/javascript" src="js/markerClusterer/markerclusterer_packaged.js"></script>

<!--<script type="text/javascript" src="http://google-maps-utility-library-v3.googlecode.com/svn/trunk/markerclustererplus/src/markerclusterer.js"></script>-->

        <script type="text/javascript" src="js/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/bootstrap/js/bootstrap-slider.js"></script>
        <script type="text/javascript" src="js/cs_tree/lib/jquery.cookie.js"></script>
        <script type="text/javascript" src="js/cs_tree/jquery.treeview.js"></script> 

        <script type="text/javascript" src="js/custom.js"></script>
        <script type="text/javascript" src="js/map.js"></script>        
        <script type="text/javascript" src="js/map_clustering.js"></script>
        <script type="text/javascript" src="js/dcart_legend.js"></script>
        <script type="text/javascript" src="js/dcart_leftmenu.js"></script>

        <link href="css/main.css" rel="stylesheet" type="text/css">         

        <link href="js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="js/bootstrap/css/slider.css" rel="stylesheet" type="text/css">
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
                <div id="hdlink"><a href="login.php">Se Connecter</a></div>
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
                                <!--<h3>Choisir une carte &agrave; afficher</h3>-->
                                <h3>Choisir D&eacute;partementale</h3>
                                <form action="" method="get" name="departmentlist">
                                    <select name="dep-list-dropdmenu" id="dep-list-dropdmenu">
                                        <option value="none">---</option>
                                        <optgroup label="Carte Nationale">
                                            <option value="Haiti">Haiti</option>
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
                            <div id="layer-type1">
                                <h3>Couche</h3>
                                <table class="table table-condensed table-hover">
                                    <tr>
                                        <td> <input type="checkbox" id="health_fac" checked class="layerOpt"/></td>
                                        <td><label for="health_fac">Institutions sanitaires</label>&nbsp;<span id="fac_typeTotal" class="badge badge-info">-</span>
                                            <ul id="fac_type" class="treeview">
                                                <li>
                                                    <input type="checkbox" value="CAL" class="opt_fac_type" id="chk_health_a_lit" checked />&nbsp;<span><label for="chk_health_a_lit" title="Centre de sant&eacute; &agrave; lit">CAL</label></span>&nbsp;<span class="badge badge-info stotal">-</span>
                                                </li>
                                                <li>
                                                    <input type="checkbox" value="CSL" class="opt_fac_type" id="chk_health_sans_lit" checked/>&nbsp;<span><label for="chk_health_sans_lit" title="Centre de sant&eacute; sans lit">CSL</label></span>&nbsp;<span class="badge badge-info stotal">-</span>
                                                </li>
                                                <li>
                                                    <input type="checkbox" value="Hopital" class="opt_fac_type" id="chk_health_h" checked/>&nbsp;<span><label for="chk_health_h" title="Hopitale">Hopital</label></span>&nbsp;<span class="badge badge-info stotal">-</span>
                                                </li>
                                                <li>
                                                    <input type="checkbox" value="HCR" class="opt_fac_type" id="chk_health_hcr" checked/>&nbsp;<span><label for="chk_health_hcr" title="Hopital Communautaire de r&eacute;f&eacute;rence">HCR</label></span>&nbsp;<span class="badge badge-info stotal">-</span>
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
                            <input type="button" class="btn btn-primary" id="btn_serv_filter" value="Filtrer les services (-/14)" style="margin-left: auto; margin-right: auto; display: block" />                          
                            <br/>
                            <input type="button" class="btn btn-primary" id="btn_report" value="Compte-rendu" style="margin-left: auto; margin-right: auto; display: block" />                          
                        </div>

                        <!-- Legend -->
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

            <!--footer-->
            <div id="footer">
                <span>Carte Sanitaire &copy; 2014</span> - <a href="#">Site web MSPP</a> | <a href="#">Documentation</a> 
            </div>

            <!--Service Filter-->
            <div class="modal hide fade" id="servModWin" data-backdrop="static">                
                <form role="form" method="get" id="servForm">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h3>Sélectionnez services (-/14)</h3>
                    </div>
                    <div class="modal-body">
                        <div class="checkbox">
                            <input type="checkbox" id="cbxFilterbyServs" name="cbxFilterbyServs"/>
                            <label class="bold" for="cbxFilterbyServs">Filtrer par services offerts</label>  
                        </div> 
                        <div id="servChecks">
                            <div class="radio span3">
                                <input id="ou_opt" type="radio" value="OR" name="opt_filter_radio" class="opt_filter_r" checked/>
                                <label for="ou_opt">Au moins un des services coch&eacute;s</label>
                            </div>
                            <div class="radio span3">
                                <input type="radio" id="et_opt" value="AND" name="opt_filter_radio" class="opt_filter_r"/>
                                <label for="et_opt">&Agrave; la fois les services coch&eacute;s</label>
                            </div>
                            <div class="clearfix" style="margin-bottom: 8px"></div>
                            <div class="checkbox" style="margin-bottom: 3px">
                                <input type="checkbox" id="cbxSelAllFilters" name="cbxSelAllFilters" checked="checked"/>
                                <label for="cbxSelAllFilters">Sélectionner tout</label>  
                            </div>
                            <div id="clFilters">
                                <div class="checkbox span3">
                                    <input type="checkbox" id="cbxPlanificationfamiliale" name="servFilter[]" value="fp" checked="checked" class="cbxServFil"/>
                                    <label for="cbxPlanificationfamiliale">Planification familiale</label>                                    
                                </div>
                                <div class="checkbox span3">
                                    <input type="checkbox" id="cbxSoinsprénataux" name="servFilter[]" value="anc" checked="checked" class="cbxServFil"/>
                                    <label for="cbxSoinsprénataux">Soins prénataux</label>
                                </div>
                                <div class="checkbox span3">
                                    <input type="checkbox" id="cbxSoindesPTME" name="servFilter[]" value="pmtct" checked="checked" class="cbxServFil"/>
                                    <label for="cbxSoindesPTME">Soin des PTME</label>
                                </div>
                                <div class="checkbox span3">
                                    <input type="checkbox" id="cbxAccouchement" name="servFilter[]" value="delivery" checked="checked" class="cbxServFil"/>
                                    <label for="cbxAccouchement">Accouchement</label>
                                </div>
                                <div class="checkbox span3">
                                    <input type="checkbox" id="cbxPriseenchargemalaria" name="servFilter[]" value="malaria"  checked="checked" class="cbxServFil"/>
                                    <label for="cbxPriseenchargemalaria">Prise en charge malaria</label>
                                </div>
                                <div class="checkbox span3">
                                    <input type="checkbox" id="cbxPriseenchargeTB" name="servFilter[]" value="tb" checked="checked" class="cbxServFil"/>
                                    <label for="cbxPriseenchargeTB">Prise en charge TB</label>
                                </div>
                                <div class="checkbox span3">
                                    <input type="checkbox" id="cbxSointraitementVIH" name="servFilter[]" value="hivct" checked="checked" class="cbxServFil"/>
                                    <label for="cbxSointraitementVIH">Soin traitement VIH</label>
                                </div>
                                <div class="checkbox span3">
                                    <input type="checkbox" id="cbxNoncomdiseases" name="servFilter[]" value="noncomdiseases" checked="checked" class="cbxServFil"/>
                                    <label for="cbxNoncomdiseases">Noncomdiseases</label>
                                </div>
                                <div class="checkbox span3">
                                    <input type="checkbox" id="cbxChirurgiemineure" name="servFilter[]" value="minorsurgery" checked="checked" class="cbxServFil"/>
                                    <label for="cbxChirurgiemineure">Chirurgie mineure</label>
                                </div>
                                <div class="checkbox span3">
                                    <input type="checkbox" id="cbxCésariennes" name="servFilter[]" value="csections" checked="checked" class="cbxServFil"/>
                                    <label for="cbxCésariennes">Césariennes</label>
                                </div>
                                <div class="checkbox span3">
                                    <input type="checkbox" id="cbxLaboratoire" name="servFilter[]" value="laboratory" checked="checked" class="cbxServFil"/>
                                    <label for="cbxLaboratoire">Laboratoire</label>
                                </div>
                                <div class="checkbox span3">
                                    <input type="checkbox" id="cbxTransfusionsanguine" name="servFilter[]" value="bloodtransf" checked="checked" class="cbxServFil"/>
                                    <label for="cbxTransfusionsanguine">Transfusion sanguine</label>
                                </div>
                                <div class="checkbox span3">
                                    <input type="checkbox" id="cbxMédecinegénérale" name="servFilter[]" value="generalmeds" checked="checked" class="cbxServFil"/>
                                    <label for="cbxMédecinegénérale">Médecine générale</label>
                                </div>
                                <div class="checkbox span3">
                                    <input type="checkbox" id="cbxHopitalisation" name="servFilter[]" value="hopitalisatioselmen" checked="checked" class="cbxServFil"/>   
                                    <label for="cbxHopitalisation">Hopitalisation</label>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div id="rangefilter">
                            <div class="checkbox">
                                <input type="checkbox" id="cbxFilterbyRange" name="cbxFilterbyRange"/>
                                <label class="bold" for="cbxFilterbyRange">Filtrer par services offerts Range</label>
                            </div>
                            <br />
                            <div id="sliderCont" style="margin-left: 15px;">
                                <input id="sldDistance" type="text" value="" style="width: 250px;" />
                                <label id="lblSldDistance" style="margin-left:10px;">0 km</label>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-success"  name="btnServFilter" id="btnServFilter" value="filterServs">Appliquer le filtre</button>
                    </div>
                </form>
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

            <!-- Report Popup -->
            <div class="modal hide fade" id="RepWin" data-backdrop="static"> 
                <form role="form" method="get" action="lib/inc/reports.php" id="repForm" name="repForm">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h3>Sélectionnez Paramètres Rapport</h3>
                    </div>
                    <div class="modal-body">                        

                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-success"  name="btnGenReport" id="btnGenReport" value="GenRep"> Générer un rapport</button>
                    </div>  
                </form>
            </div>

            <script>
                // Below handles offline alert                
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
