<?php
include_once('lib/core/orgunitSPA.php');
include_once('lib/core/orgunitDHIS.php');
?>
<?php
$inst = array();
$orgunit = new OrgUnitDHIS();
if (isset($_GET['c'])) {
    $code_inst = $_GET['c'];
    $inst = $orgunit->getDHISfac_byID($code_inst);
    $orgunitSPA = new OrgUnitSPA();
    $instSPA = $orgunitSPA->getSPAfac_bymohcode($inst['code']);
    // Need to set this incase there is no SPA data for the facility
    // the page will then display IND (unknown)
    if (count($instSPA) < 1) {
        $instSPA[0] = [];
        $instSPA[0]['fp'] = -1;
        $instSPA[0]['anc'] = -1;
        $instSPA[0]['pmtct'] = -1;
        $instSPA[0]['delivery'] = -1;
        $instSPA[0]['malaria'] = -1;
        $instSPA[0]['tb'] = -1;
        $instSPA[0]['hivct'] = -1;
        $instSPA[0]['noncomdiseases'] = -1;
        $instSPA[0]['minorsurgery'] = -1;
        $instSPA[0]['csections'] = -1;
        $instSPA[0]['laboratory'] = -1;
        $instSPA[0]['bloodtransf'] = -1;
        $instSPA[0]['generalmeds'] = -1;
        $instSPA[0]['hopitalisatioselmen'] = -1;
        $instSPA[0]['nombredelithospi1nuit'] = '';
        $instSPA[0]['ambulancedispo'] = '';
        $instSPA[0]['servicedisp024h'] = '';
        $instSPA[0]['nobrlitmaternite'] = '';
        $instSPA[0]['nombrelitaccouchment'] = '';
        $instSPA[0]['nombremedgeneralist'] = '';
        $instSPA[0]['nombremedspecialist'] = '';
        $instSPA[0]['nombrparamedical'] = '';
        $instSPA[0]['nombranesthesit'] = '';
        $instSPA[0]['nombrinfirmierprofess'] = '';
        $instSPA[0]['nombrauxilair'] = '';
        $instSPA[0]['nombrsagefemeprof'] = '';
        $instSPA[0]['nombresagefemmediplome'] = '';
        $instSPA[0]['nimbrpharmacien'] = '';
        $instSPA[0]['nombrpharmtechnologist'] = '';
        $instSPA[0]['nombrassistanpharmacie'] = '';
        $instSPA[0]['nombrlabscientist'] = '';
        $instSPA[0]['nombrlabtechnologis'] = '';
        $instSPA[0]['nombrlabtechnicien'] = '';
        $instSPA[0]['childvacc'] = -1;
        $instSPA[0]['growthmon'] = -1;
        $instSPA[0]['sickchild'] = -1;
        $instSPA[0]['sti'] = -1;
        $instSPA[0]['bloodtype'] = -1;
    }
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
        <script type="text/javascript" src="js/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?libraries=geometry&key=AIzaSyBKTJn79hsRgdkWhnJr8QxodRTidYVFTKs"></script>
        <script type="text/javascript" src="js/inst.js"></script>                 

        <link href="css/main.css" rel="stylesheet" type="text/css"> 
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Open+Sans">
        <link href="js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/bootstrap-custum.css" rel="stylesheet" type="text/css">
    </head>

    <body>
        <div id="wrapper">
            <!-- Header -->
            <?php include 'lib/inc/head.php'; ?>

            <!--Navbar-->
            <nav class="navbar navbar-default" id="navbar" role="navigation">
                <div class="container-fluid">
                    <!--mobile nav-->
                    <div id="navbar-mob">
                        <span id="nav-mob-menu"><i class="fa fa-bars"></i></span>
                        <span id="nav-mob-menu-rightOpt"><i class="fa fa-user"></i></span>
                    </div>

                    <div id="navbar-inner">
                        <ul>
                            <?php include 'lib/inc/nav.php'; ?>
                        </ul>
                    </div>
                </div>
            </nav>

            <div id="mainContent">
                <div class="container">
                    <div class="row">
                        <div class="span12">
                            <div class="alert alert-info"><h1 id="inst_title"><?php echo $inst['displayName']; ?>&nbsp;<span class="badge badge-warning pull-right"><?php echo $inst['deptname']; ?>, <?php echo $inst['communename']; ?> / lat:<?php echo json_decode($inst['coordinates'])[1]; ?>, lng:<?php echo json_decode($inst['coordinates'])[0]; ?></span></h1></div>
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
                                        <td width="86%"><strong>D&eacute;partement: </strong><?php echo $inst['deptname']; ?></td>                            
                                    </tr> 
                                    <tr>
                                        <td width="14%"><img src="images/mapicons/communeIcon.png"></td>
                                        <td><strong>Commune: </strong><?php echo $inst['communename']; ?></td>                            
                                    </tr>
                                    <tr>
                                        <td width="14%"><img src="images/mapicons/inst_markerIcon.png"></td>
                                        <td><strong>Location: </strong> lat:<?php echo json_decode($inst['coordinates'])[1]; ?>, lng:<?php echo json_decode($inst['coordinates'])[0]; ?></td>                            
                                    </tr> 

                                    <tr>
                                        <td><img src="images/mapicons/inst_hostIcon.png"></td>
                                        <td><strong>Type d'institution :</strong> <?php echo $inst['managauthority']; ?></td>                            
                                    </tr>   

                                    <tr>
                                        <td><img src="images/mapicons/inst_codeInst.png"></td>
                                        <td><strong>Code MSPP :</strong> <?php echo $inst['code']; ?></td>                            
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
                                <li class="active"><a href="#tab-services" role="tab" data-toggle="tab" class="link-infoinst">Services</a></li>
                                <li><a href="#tab-insfrast" role="tab" data-toggle="tab" class="link-infoinst">Infrastructures</a></li>
                                <li><a href="#tab-activites" role="tab" data-toggle="tab" class="link-infoinst">Activit&eacute;s</a></li>                  
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab-services"><table class="table table-condensed table-striped">
                                        <tr>
                                            <td>Planification Familiale</td>
                                            <td><?php serviceSPAfac_check($instSPA[0]['fp']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Soins pr&eacute;nataux</td>
                                            <td><?php serviceSPAfac_check($instSPA[0]['anc']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Soin des PTME</td>
                                            <td><?php serviceSPAfac_check($instSPA[0]['pmtct']) ?></td>
                                        </tr>

                                        <tr>
                                            <td>Accouchement</td>
                                            <td><?php serviceSPAfac_check($instSPA[0]['delivery']) ?></td>
                                        </tr>

                                        <tr>
                                            <td>Prise en charge malaria</td>
                                            <td><?php serviceSPAfac_check($instSPA[0]['malaria']) ?></td>
                                        </tr>

                                        <tr>
                                            <td>Prise en charge TB</td>
                                            <td><?php serviceSPAfac_check($instSPA[0]['tb']) ?></td>
                                        </tr>

                                        <tr>
                                            <td>Soin traitement VIH</td>
                                            <td><?php serviceSPAfac_check($instSPA[0]['hivct']) ?></td>
                                        </tr>

                                        <tr>
                                            <td>Noncomdiseases</td>
                                            <td><?php serviceSPAfac_check($instSPA[0]['noncomdiseases']) ?></td>
                                        </tr>

                                        <tr>
                                            <td>Chirurgie mineure</td>
                                            <td><?php serviceSPAfac_check($instSPA[0]['minorsurgery']) ?></td>
                                        </tr>

                                        <tr>
                                            <td>C&eacute;sariennes</td>
                                            <td><?php serviceSPAfac_check($instSPA[0]['csections']) ?></td>
                                        </tr>

                                        <tr>
                                            <td>Laboratoire</td>
                                            <td><?php serviceSPAfac_check($instSPA[0]['laboratory']) ?></td>
                                        </tr>

                                        <tr>
                                            <td>Transfusion sanguine</td>
                                            <td><?php serviceSPAfac_check($instSPA[0]['bloodtransf']) ?></td>
                                        </tr>

                                        <tr>
                                            <td>M&eacute;decine g&eacute;n&eacute;rale</td>
                                            <td><?php serviceSPAfac_check($instSPA[0]['generalmeds']) ?></td>
                                        </tr>

                                        <tr>
                                            <td>Hopitalisation</td>
                                            <td><?php serviceSPAfac_check($instSPA[0]['hopitalisatioselmen']) ?></td>
                                        </tr>
                                    </table></div>
                                <div class="tab-pane fade" id="tab-insfrast"><table class="table table-striped">
                                        <tr>
                                            <td>Nombre de lits disponibles</td>
                                            <td><?php getNbInfrast($instSPA[0]['nombredelithospi1nuit']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Ambulance disponible</td>
                                            <td><?php getNbInfrast($instSPA[0]['ambulancedispo']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Service disponible 24/24</td>
                                            <td><?php getNbInfrast($instSPA[0]['servicedisp024h']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Nombre de lit maternit&eacute;</td>
                                            <td><?php getNbInfrast($instSPA[0]['nobrlitmaternite']) ?></td>
                                        </tr>                        
                                        <tr>
                                            <td>Nombre de lit d'accouchment</td>
                                            <td><?php getNbInfrast($instSPA[0]['nombrelitaccouchment']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Nombre de m&eacute;decin g&eacute;n&eacute;raliste</td>
                                            <td><?php getNbInfrast($instSPA[0]['nombremedgeneralist']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Nombre de m&eacute;decin sp&eacute;cialiste</td>
                                            <td><?php getNbInfrast($instSPA[0]['nombremedspecialist']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>nombrparamedical</td>
                                            <td><?php getNbInfrast($instSPA[0]['nombrparamedical']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Nombre de m&eacute;decin anesth&eacute;siste</td>
                                            <td><?php getNbInfrast($instSPA[0]['nombranesthesit']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Nombre d'infirmi&egrave;re</td>
                                            <td><?php getNbInfrast($instSPA[0]['nombrinfirmierprofess']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Nombre d'auxilaire</td>
                                            <td><?php getNbInfrast($instSPA[0]['nombrauxilair']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Nombre de sage femme</td>
                                            <td><?php getNbInfrast($instSPA[0]['nombrsagefemeprof']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Nombre de sage femme dipl&ocirc;m&eacute;</td>
                                            <td><?php getNbInfrast($instSPA[0]['nombresagefemmediplome']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Nombre de pharmacien</td>
                                            <td><?php getNbInfrast($instSPA[0]['nimbrpharmacien']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Nombre de technicien en pharmacie</td>                            
                                            <td><?php getNbInfrast($instSPA[0]['nombrpharmtechnologist']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Nombre d'assistant pharmacien</td>
                                            <td><?php getNbInfrast($instSPA[0]['nombrassistanpharmacie']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Nombre de laborantin(e)</td>
                                            <td><?php getNbInfrast($instSPA[0]['nombrlabscientist']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Nombre de technologiste de laboratoire</td>
                                            <td><?php getNbInfrast($instSPA[0]['nombrlabtechnologis']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Nombre de technicien de laboratoire</td>
                                            <td><?php getNbInfrast($instSPA[0]['nombrlabtechnicien']) ?></td>
                                        </tr>

                                    </table></div>
                                <div class="tab-pane fade" id="tab-activites"><table class="table table-striped">
                                        <tr>
                                            <td>Vaccination des enfants</td>
                                            <td><?php serviceSPAfac_check($instSPA[0]['childvacc']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>P&eacute;s&eacute;e des enfants</td>
                                            <td><?php serviceSPAfac_check($instSPA[0]['growthmon']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Prise en charge sp&eacute;cialis&eacute; p&eacute;diatrique</td>
                                            <td><?php serviceSPAfac_check($instSPA[0]['sickchild']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Maladie Sexuellement Transmissible(STI)</td>
                                            <td><?php serviceSPAfac_check($instSPA[0]['sti']) ?></td>
                                        </tr>
                                        <tr>
                                            <td>Groupe sanguin</td>
                                            <td><?php serviceSPAfac_check($instSPA[0]['bloodtype']) ?></td>
                                        </tr>
                                    </table></div>
                            </div>
                            <!--end tab section-->
                        </div>
                    </div>

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
                var lat =<?php echo json_decode($inst['coordinates'])[1]; ?>;
                var lng =<?php echo json_decode($inst['coordinates'])[0]; ?>;
                var latlng = new google.maps.LatLng(lat, lng);
                map.panTo(latlng);

                //adding the marker representing the facility					
                var marker = new google.maps.Marker({
                    position: latlng,
                    map: map,
                    title: "<?php echo $inst['name']; ?>"
                });

                //infobulle on the marker
                marker.html = "<div id='inst_infobulle'><h2><?php echo $inst['name']; ?>&nbsp;<span class='badge badge-important'><?php echo $inst['deptname']; ?>, <?php echo $inst['communename']; ?></span></h2></div>";
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
                    var comm_id = "<?php echo $inst['communeid'] ?>";
                    $.get("lib/inc/orgunitDHIS.inc.php?comm_id=" + comm_id, function (data) {
                        var nearby_inst = '';
                        //facility coord
                        var lat =<?php echo json_decode($inst['coordinates'])[1]; ?>;
                        var lng =<?php echo json_decode($inst['coordinates'])[0]; ?>;
                        var facCoord = new google.maps.LatLng(lat, lng);
                        //fetching data
                        var obj = jQuery.parseJSON(data);
                        var nearby_facs = [];
                        $.each(obj, function () {
                            var latlng_otherFacs = new google.maps.LatLng(this['latitude'], this['longitude']);
                            var distance = google.maps.geometry.spherical.computeDistanceBetween(facCoord, latlng_otherFacs);
                            var distance_km = Math.round(distance / 1000);
                            if (distance_km > 0 && distance_km <= 15) {
                                nearby_fac = {
                                    id: this['id'],
                                    name: this['name'],
                                    distance: distance_km
                                };
                                nearby_facs.push(nearby_fac);
                            }
                        });
                        //sort by distance: closest to furthest
                        nearby_facs.sort(function (a, b) {
                            return a.distance - b.distance;
                        });
                        for (var x in nearby_facs) {
                            nearby_inst += '<div class="inst-nearby-item" data-id="' + nearby_facs[x].id + '"><div class="img-inst"></div><div class="inst-info"><h3>' + nearby_facs[x].name + '</h3><a href="/cs/inst.php?c=' + nearby_facs[x].id + '" title="Voir la fiche compl&egrave;te"><i class="icon-search"></i> Parcourir</a><br/><span>' + nearby_facs[x].distance + ' kms environs</span></div></div>';
                        }
                        $('#nearby-inst').html(nearby_inst);
                    });
                });
            </script>


    </body>
</html>
