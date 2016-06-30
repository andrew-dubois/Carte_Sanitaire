<?php include_once('lib/core/orgunit.php'); ?>
<?php
$inst = array();
$orgunit = new OrgUnit;
if (isset($_GET['c'])) {
    $code_inst = $_GET['c'];
    $inst = $orgunit->getSPAfac_byID($code_inst);
} else {
    header('Location:search.php');
}

//Check if service and activites available
function serviceSPAfac_check($valService) {
    switch ($valService) {
        case 1:
            ?><span class="badge badge-info pull-right">Oui</span><?php
            break;
        case 0:
            ?><span class="badge badge-warning pull-right">Non</span><?php
            break;
        default:
            ?><span class="badge badge-inverse pull-right" title="Informations Non Disponibles">IND</span><?php
    }
}

//Get the number of each infrastructure
function getNbInfrast($valInfrast) {
    if ($valInfrast == '') {
        ?><span class="badge badge-warning pull-right" title="Informations Non Disponibles">IND</span><?php
    } else {
        if ($valInfrast == 0) {
            ?><span class="badge badge-info pull-right" style="opacity:.5;-moz-opacity:.5"><?php echo $valInfrast ?></span><?php
        } else {
            ?><span class="badge badge-info pull-right"><?php echo $valInfrast ?></span><?php
        }
    }
}
?>
<!DOCTYPE html">
<html><head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>MSPP -  Carte Sanitaire</title>
        <script type="text/javascript" src="js/jquery191.js"></script>
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&libraries=geometry"></script>
        <script type="text/javascript" src="js/inst.js"></script> 
        <script type="text/javascript" src="js/custom.js"></script>    
        <link href="css/main.css" rel="stylesheet" type="text/css"> 
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Open+Sans">
        <script type="text/javascript" src="js/bootstrap/js/bootstrap.min.js"></script>

        <link href="js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/bootstrap-custum.css" rel="stylesheet" type="text/css">     

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
                        <li><a href="index.php" class="mIcon homeicon">Accueil</a></li>
                        <!--<li><a href="#" class="mIcon abouticon">A-Propos</a></li>-->
                        <li><a href="dcart.php" class="mIcon mapicon focusMenuItem">Cartographie</a></li>
                        <!--<li><a href="#" class="mIcon sitemapicon">Plan du site</a></li>-->
                        <li><a href="#" class="mIcon docicon">Documentation</a></li>
                    </ul>
                </div>
            </div>

            <div id="mainContent">
                <div class="container">
                    <div class="row">
                        <div class="span12">
                            <div class="alert alert-info"><h1 id="inst_title"><?php echo $inst[0]['nameoffacility']; ?>&nbsp;<span class="badge badge-warning pull-right"><?php echo $inst[0]['deptname']; ?>, <?php echo $inst[0]['commune_name']; ?> / lat:<?php echo $inst[0]['latitude']; ?>, lng:<?php echo $inst[0]['longitude']; ?></span></h1></div>
                        </div>
                    </div>
                    <div class="row">
                        <div id="info-inst" class="span4">
                            <div class="host_image">
                                <img src="images/no_host_thumb_266.jpg" width="266" height="181">
                            </div>
                            <div class="baseInfoFac">
                                <table class="table table-condensed">

                                    <tr>
                                        <td width="14%"><img src="images/mapicons/deptIcon.png"></td>
                                        <td width="86%"><strong>D&eacute;partement: </strong><?php echo $inst[0]['deptname']; ?></td>                            
                                    </tr> 
                                    <tr>
                                        <td width="14%"><img src="images/mapicons/communeIcon.png"></td>
                                        <td><strong>Commune: </strong><?php echo $inst[0]['commune_name']; ?></td>                            
                                    </tr>
                                    <tr>
                                        <td width="14%"><img src="images/mapicons/inst_markerIcon.png"></td>
                                        <td><strong>Location: </strong> lat:<?php echo $inst[0]['latitude']; ?>, lng:<?php echo $inst[0]['longitude']; ?></td>                            
                                    </tr> 

                                    <tr>
                                        <td><img src="images/mapicons/inst_hostIcon.png"></td>
                                        <td><strong>Type d'institution :</strong> <?php echo $inst[0]['managauthority']; ?></td>                            
                                    </tr>   

                                    <tr>
                                        <td><img src="images/mapicons/inst_codeInst.png"></td>
                                        <td><strong>Code MSPP :</strong> <?php echo $inst[0]['moh_facility_code']; ?></td>                            
                                    </tr>                      
                                </table>
                            </div>
                        </div>

                        <div id="mapinst" class="span8" style="background:#F5F5F5;height:386px">                	
                        </div>
                    </div>
                    <div id="tab-section-sia" class="row" style="margin-top:20px">
                        <div class="span12">
                            <!--tab section-->            
                            <ul class="nav nav-tabs" role="tablist">
                                <li><a href="#tab-services" role="tab" data-toggle="tab" class="link-infoinst">Services</a></li>
                                <li><a href="#tab-insfrast" role="tab" data-toggle="tab" class="link-infoinst">Infrastructures</a></li>
                                <li><a href="#tab-activites" role="tab" data-toggle="tab" class="link-infoinst">Activit&eacute;s</a></li>                  
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane fade" id="tab-services"><table class="table table-condensed table-striped">
                                        <tr>
                                            <td>Planification Familiale</td>
                                            <td><?php serviceSPAfac_check($inst[0]['fp']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Soins pr&eacute;nataux</td>
                                            <td><?php serviceSPAfac_check($inst[0]['anc']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Soin des PTME</td>
                                            <td><?php serviceSPAfac_check($inst[0]['pmtct']) ?></td>
                                        </tr>

                                        <tr>
                                            <td>Accouchement</td>
                                            <td><?php serviceSPAfac_check($inst[0]['delivery']) ?></td>
                                        </tr>

                                        <tr>
                                            <td>Prise en charge malaria</td>
                                            <td><?php serviceSPAfac_check($inst[0]['malaria']) ?></td>
                                        </tr>

                                        <tr>
                                            <td>Prise en charge TB</td>
                                            <td><?php serviceSPAfac_check($inst[0]['tb']) ?></td>
                                        </tr>

                                        <tr>
                                            <td>Soin traitement VIH</td>
                                            <td><?php serviceSPAfac_check($inst[0]['hivct']) ?></td>
                                        </tr>

                                        <tr>
                                            <td>Noncomdiseases</td>
                                            <td><?php serviceSPAfac_check($inst[0]['noncomdiseases']) ?></td>
                                        </tr>

                                        <tr>
                                            <td>Chirurgie mineure</td>
                                            <td><?php serviceSPAfac_check($inst[0]['minorsurgery']) ?></td>
                                        </tr>

                                        <tr>
                                            <td>C&eacute;sariennes</td>
                                            <td><?php serviceSPAfac_check($inst[0]['csections']) ?></td>
                                        </tr>

                                        <tr>
                                            <td>Laboratoire</td>
                                            <td><?php serviceSPAfac_check($inst[0]['laboratory']) ?></td>
                                        </tr>

                                        <tr>
                                            <td>Transfusion sanguine</td>
                                            <td><?php serviceSPAfac_check($inst[0]['bloodtransf']) ?></td>
                                        </tr>

                                        <tr>
                                            <td>M&eacute;decine g&eacute;n&eacute;rale</td>
                                            <td><?php serviceSPAfac_check($inst[0]['generalmeds']) ?></td>
                                        </tr>

                                        <tr>
                                            <td>Hopitalisation</td>
                                            <td><?php serviceSPAfac_check($inst[0]['hopitalisatioselmen']) ?></td>
                                        </tr>
                                    </table></div>
                                <div class="tab-pane fade" id="tab-insfrast"><table class="table table-striped">
                                        <tr>
                                            <td>Nombre de lits disponibles</td>
                                            <td><?php getNbInfrast($inst[0]['nombredelithospi1nuit']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Ambulance disponible</td>
                                            <td><?php getNbInfrast($inst[0]['ambulancedispo']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Service disponible 24/24</td>
                                            <td><?php getNbInfrast($inst[0]['servicedisp024h']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Nombre de lit maternit&eacute;</td>
                                            <td><?php getNbInfrast($inst[0]['nobrlitmaternite']) ?></td>
                                        </tr>                        
                                        <tr>
                                            <td>Nombre de lit d'accouchment</td>
                                            <td><?php getNbInfrast($inst[0]['nombrelitaccouchment']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Nombre de m&eacute;decin g&eacute;n&eacute;raliste</td>
                                            <td><?php getNbInfrast($inst[0]['nombremedgeneralist']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Nombre de m&eacute;decin sp&eacute;cialiste</td>
                                            <td><?php getNbInfrast($inst[0]['nombremedspecialist']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>nombrparamedical</td>
                                            <td><?php getNbInfrast($inst[0]['nombrparamedical']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Nombre de m&eacute;decin anesth&eacute;siste</td>
                                            <td><?php getNbInfrast($inst[0]['nombranesthesit']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Nombre d'infirmi&egrave;re</td>
                                            <td><?php getNbInfrast($inst[0]['nombrinfirmierprofess']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Nombre d'auxilaire</td>
                                            <td><?php getNbInfrast($inst[0]['nombrauxilair']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Nombre de sage femme</td>
                                            <td><?php getNbInfrast($inst[0]['nombrsagefemeprof']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Nombre de sage femme dipl&ocirc;m&eacute;</td>
                                            <td><?php getNbInfrast($inst[0]['nombresagefemmediplome']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Nombre de pharmacien</td>
                                            <td><?php getNbInfrast($inst[0]['nombresagefemmediplome']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Nombre de technicien en pharmacie</td>                            
                                            <td><?php getNbInfrast($inst[0]['nimbrpharmacien']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Nombre d'assistant pharmacien</td>
                                            <td><?php getNbInfrast($inst[0]['nombrassistanpharmacie']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Nombre de laborantin(e)</td>
                                            <td><?php getNbInfrast($inst[0]['nombrlabscientist']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Nombre de technologiste de laboratoire</td>
                                            <td><?php getNbInfrast($inst[0]['nombrlabtechnologis']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Nombre de technicien de laboratoire</td>
                                            <td><?php getNbInfrast($inst[0]['nombrlabtechnicien']) ?></td>
                                        </tr>

                                    </table></div>
                                <div class="tab-pane fade" id="tab-activites"><table class="table table-striped">
                                        <tr>
                                            <td>Vaccination des enfants</td>
                                            <td><?php serviceSPAfac_check($inst[0]['childvacc']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>P&eacute;s&eacute;e des enfants</td>
                                            <td><?php serviceSPAfac_check($inst[0]['growthmon']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Prise en charge sp&eacute;cialis&eacute; p&eacute;diatrique</td>
                                            <td><?php serviceSPAfac_check($inst[0]['sickchild']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Maladie Sexuellement Transmissible(STI)</td>
                                            <td><?php serviceSPAfac_check($inst[0]['sti']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Groupe sanguin</td>
                                            <td><?php serviceSPAfac_check($inst[0]['bloodtype']) ?></td>
                                        </tr>
                                    </table></div>
                            </div>
                            <!--end tab section-->
                        </div>
                    </div>

                    <!-- <div class="row" style="margin-top:20px">
                         <div class="span4 services">                	
                                 <h2>Services</h2>
                             <table class="table table-condensed table-striped">
                                 <tr>
                                         <td>Planification Familiale</td>
                                     <td><?php serviceSPAfac_check($inst[0]['fp']) ?></td>
                                 </tr>
                                 <tr>
                                         <td>Soins pr&eacute;nataux</td>
                                     <td><?php serviceSPAfac_check($inst[0]['anc']) ?></td>
                                 </tr>
                                 <tr>
                                         <td>Soin des PTME</td>
                                     <td><?php serviceSPAfac_check($inst[0]['pmtct']) ?></td>
                                 </tr>
                                 
                                 <tr>
                                         <td>Accouchement</td>
                                     <td><?php serviceSPAfac_check($inst[0]['delivery']) ?></td>
                                 </tr>
                                 
                                 <tr>
                                         <td>Prise en charge malaria</td>
                                     <td><?php serviceSPAfac_check($inst[0]['malaria']) ?></td>
                                 </tr>
                                 
                                 <tr>
                                         <td>Prise en charge TB</td>
                                     <td><?php serviceSPAfac_check($inst[0]['tb']) ?></td>
                                 </tr>
                                 
                                 <tr>
                                         <td>Soin traitement VIH</td>
                                     <td><?php serviceSPAfac_check($inst[0]['hivct']) ?></td>
                                 </tr>
                                 
                                 <tr>
                                         <td>Noncomdiseases</td>
                                     <td><?php serviceSPAfac_check($inst[0]['Noncomdiseases']) ?></td>
                                 </tr>
                                 
                                 <tr>
                                         <td>Chirurgie mineure</td>
                                     <td><?php serviceSPAfac_check($inst[0]['minorsurgery']) ?></td>
                                 </tr>
                                 
                                 <tr>
                                         <td>C&eacute;sariennes</td>
                                     <td><?php serviceSPAfac_check($inst[0]['csections']) ?></td>
                                 </tr>
                                 
                                 <tr>
                                         <td>Laboratoire</td>
                                     <td><?php serviceSPAfac_check($inst[0]['laboratory']) ?></td>
                                 </tr>
                                 
                                 <tr>
                                         <td>Transfusion sanguine</td>
                                     <td><?php serviceSPAfac_check($inst[0]['bloodtransf']) ?></td>
                                 </tr>
                                 
                                 <tr>
                                         <td>M&eacute;decine g&eacute;n&eacute;rale</td>
                                     <td><?php serviceSPAfac_check($inst[0]['generalmeds']) ?></td>
                                 </tr>
                                 
                                 <tr>
                                         <td>Hopitalisation</td>
                                     <td><?php serviceSPAfac_check($inst[0]['hospitalisatioselmen']) ?></td>
                                 </tr>
                             </table>
                         </div>
                        
                         <div class="span4 infrast">   
                              <h2>Infrastructures</h2> 
                              <table class="table table-striped">
                                 <tr>
                                         <td>Nombre de lits disponibles</td>
                                     <td><?php getNbInfrast($inst[0]['nombredelithospi1nuit']) ?></td>
                                 </tr>
                                 <tr>
                                         <td>Ambulance disponible</td>
                                     <td><?php getNbInfrast($inst[0]['ambulancedispo']) ?></td>
                                 </tr>
                                 <tr>
                                         <td>Service disponible 24/24</td>
                                     <td><?php getNbInfrast($inst[0]['servicedisp024h']) ?></td>
                                 </tr>
                                 <tr>
                                         <td>Nombre de lit maternit&eacute;</td>
                                     <td><?php getNbInfrast($inst[0]['nobrlitmaternite']) ?></td>
                                 </tr>                        
                                 <tr>
                                         <td>Nombre de lit d'accouchment</td>
                                     <td><?php getNbInfrast($inst[0]['nombrelitaccouchment']) ?></td>
                                 </tr>
                                 <tr>
                                         <td>Nombre de m&eacute;decin g&eacute;n&eacute;raliste</td>
                                     <td><?php getNbInfrast($inst[0]['nombremedgeneralist']) ?></td>
                                 </tr>
                                 <tr>
                                         <td>Nombre de m&eacute;decin sp&eacute;cialiste</td>
                                     <td><?php getNbInfrast($inst[0]['nombremedspecialist']) ?></td>
                                 </tr>
                                 <tr>
                                         <td>nombrparamedical</td>
                                     <td><?php getNbInfrast($inst[0]['nombrparamedical']) ?></td>
                                 </tr>
                                 <tr>
                                         <td>Nombre de m&eacute;decin anesth&eacute;siste</td>
                                     <td><?php getNbInfrast($inst[0]['nombranesthesit']) ?></td>
                                 </tr>
                                 <tr>
                                         <td>Nombre d'infirmi&egrave;re</td>
                                     <td><?php getNbInfrast($inst[0]['nombrinfirmierprofess']) ?></td>
                                 </tr>
                                 <tr>
                                         <td>Nombre d'auxilaire</td>
                                     <td><?php getNbInfrast($inst[0]['nombrauxilair']) ?></td>
                                 </tr>
                                 <tr>
                                         <td>Nombre de sage femme</td>
                                     <td><?php getNbInfrast($inst[0]['nombrsagefemeprof']) ?></td>
                                 </tr>
                                 <tr>
                                         <td>Nombre de sage femme dipl&ocirc;m&eacute;</td>
                                     <td><?php getNbInfrast($inst[0]['nombresagefemmediplome']) ?></td>
                                 </tr>
                                 <tr>
                                         <td>Nombre de pharmacien</td>
                                     <td><?php getNbInfrast($inst[0]['nombresagefemmediplome']) ?></td>
                                 </tr>
                                 <tr>
                                         <td>Nombre de technicien en pharmacie</td>                            
                                     <td><?php getNbInfrast($inst[0]['nimbrpharmacien']) ?></td>
                                 </tr>
                                 <tr>
                                         <td>Nombre d'assistant pharmacien</td>
                                     <td><?php getNbInfrast($inst[0]['nombrassistanpharmacie']) ?></td>
                                 </tr>
                                 <tr>
                                         <td>Nombre de laborantin(e)</td>
                                     <td><?php getNbInfrast($inst[0]['nombrlabscientist']) ?></td>
                                 </tr>
                                 <tr>
                                         <td>Nombre de technologiste de laboratoire</td>
                                     <td><?php getNbInfrast($inst[0]['nombrlabtechnologis']) ?></td>
                                 </tr>
                                 <tr>
                                         <td>Nombre de technicien de laboratoire</td>
                                     <td><?php getNbInfrast($inst[0]['nombrlabtechnicien']) ?></td>
                                 </tr>
                                 
                              </table>       	
                         </div>
                         
                         <div class="span4 activites">  
                                 <h2>Activit&eacute;s</h2> 
                             <table class="table table-striped">
                                 <tr>
                                         <td>Vaccination des enfants</td>
                                     <td><?php serviceSPAfac_check($inst[0]['childvacc']) ?></td>
                                 </tr>
                                 <tr>
                                         <td>P&eacute;s&eacute;e des enfants</td>
                                     <td><?php serviceSPAfac_check($inst[0]['growthmon']) ?></td>
                                 </tr>
                                 <tr>
                                         <td>Prise en charge sp&eacute;cialis&eacute; p&eacute;diatrique</td>
                                     <td><?php serviceSPAfac_check($inst[0]['sickchild']) ?></td>
                                 </tr>
                                 <tr>
                                         <td>Maladie Sexuellement Transmissible(STI)</td>
                                     <td><?php serviceSPAfac_check($inst[0]['sti']) ?></td>
                                 </tr>
                                 <tr>
                                         <td>Groupe sanguin</td>
                                     <td><?php serviceSPAfac_check($inst[0]['bloodtype']) ?></td>
                                 </tr>
                             </table>          	
                         </div>
                     </div>-->

                    <div class="row" style="margin-top:20px">
                        <div class="span12">
                            <div class="alert alert-info">               
                                <h1>Institutions aux environs de 15 km <a href="#" id="view-hide-rel-inst" class="btn pull-right" style="font-weight:normal; margin-top:-5px;font-size:12px"><span>Afficher</span> <i class="icon-chevron-down"></i></a></h1>
                            </div>

                            <div id="nearby-inst">
                                <div class="inst-nearby-item">
                                    <div class="img-inst"></div>
                                    <div class="inst-info">
                                        <h3>Nom Inst</h3>                                  
                                        <a href="#" title="Positionner l'institution sur la carte"><i class="icon-globe"></i> Afficher</a> / <a href="#" title="Voir la fiche compl&egrave;te"><i class="icon-search"></i> Parcourir</a><br/> 
                                        <span>14 kilom&egrave;tres environs</span>
                                    </div>
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

            <!--Facility localization-->
            <script>
                var mapDiv = document.getElementById('mapinst');
                var latlng = new google.maps.LatLng(19.02577027586866, -72.70854949951172);
                var opts = {
                    zoom: 16,
                    center: latlng,
                    background: '#b3d1ff',
                    scrollwheel: false,
                    mapTypeControl: false,
                    /*mapTypeControlOptions: {
                     style: google.maps.MapTypeControlStyle.HORIZONTAL_MENU,
                     position:google.maps.ControlPosition.TOP_RIGHT,
                     mapTypeIds: [							
                     google.maps.MapTypeId.ROADMAP,
                     google.maps.MapTypeId.SATELLITE,
                     google.maps.MapTypeId.TERRAIN
                     ]
                     },	*/
                    mapTypeId: google.maps.MapTypeId.SATELLITE,
                    zoomControl: true,
                    zoomControlOptions: {
                        style: google.maps.ZoomControlStyle.SMALL
                    }
                };
                map = new google.maps.Map(mapDiv, opts);

                //positioning the facility on the map					
                var lat =<?php echo $inst[0]['latitude']; ?>;
                var lng =<?php echo $inst[0]['longitude']; ?>;
                var latlng = new google.maps.LatLng(lat, lng);
                map.panTo(latlng);

                //adding the marker representing the facility					
                var marker = new google.maps.Marker({
                    position: latlng,
                    map: map,
                    title: "<?php echo $inst[0]['nameoffacility']; ?>"
                });

                //infobulle on the marker
                marker.html = "<div id='inst_infobulle'><h2><?php echo $inst[0]['nameoffacility']; ?>&nbsp;<span class='badge badge-important'><?php echo $inst[0]['deptname']; ?>, <?php echo $inst[0]['commune_name']; ?></span></h2></div>";
                infoWindow = new google.maps.InfoWindow();
                infoWindow.setContent(marker.html);
                infoWindow.open(map, marker);

                //click event on the marker								
                google.maps.event.addListener(marker, 'click', function () {
                    infoWindow.open(map, this);
                });



                /************** JQUERY SEGMENT ****************/
                $(document).ready(function (e) {
                    //View nearby facilities from a distance of 15km
                    var comm_name = "<?php echo $inst[0]['commune_name'] ?>";
                    $.get("lib/inc/orgunit.inc.php?comm_name=" + comm_name, function (data) {
                        var nearby_inst = '';
                        //facility coord
                        var lat =<?php echo $inst[0]['latitude'] ?>;
                        var lng =<?php echo $inst[0]['longitude'] ?>;
                        var facCoord = new google.maps.LatLng(lat, lng);
                        //fetching data
                        var obj = jQuery.parseJSON(data);
                        $.each(obj, function () {
                            var latlng_otherFacs = new google.maps.LatLng(this['latitude'], this['longitude']);
                            var distance = google.maps.geometry.spherical.computeDistanceBetween(facCoord, latlng_otherFacs);
                            var distance_km = Math.round(distance / 1000);
                            if (distance_km > 0 && distance_km <= 15) {
                                nearby_inst += '<div class="inst-nearby-item" data-id="' + this["id"] + '"><div class="img-inst"></div><div class="inst-info"><h3>' + this["nameoffacility"] + '</h3><a href="/cs/inst.php?c=' + this["id"] + '" title="Voir la fiche compl&egrave;te"><i class="icon-search"></i> Parcourir</a><br/><span>' + distance_km + ' kms environs</span></div></div>';

                            }
                        });
                        $('#nearby-inst').html(nearby_inst);
                    });
                });
            </script>


    </body>
</html>
