<?php include_once('lib/init.php'); ?>
<!DOCTYPE html">
<?php
include('lib/core/dhisAPI.php');
Auth_DHIS2();
?>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Tableau de bord - Carte Sanitaire</title>        
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

        <script type="text/javascript" src="//cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="js/dashb.js"></script> 
        <script type="text/javascript" src="js/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="http://dhis2-cdn.org/v216/ext/ext-all.js"></script>
        <script type="text/javascript" src="http://dhis2-cdn.org/v216/openlayers/OpenLayers.js"></script>
        <script type="text/javascript" src="js/plugin.js"></script>
        <script type="text/javascript" src="https://dhis2-cdn.org/v216/plugin/table.js"></script>
        <script type="text/javascript" src="http://dhis2-cdn.org/v216/plugin/chart.js"></script>
        <link href="css/main.css" rel="stylesheet" type="text/css"> 
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/bootstrap-custum.css" rel="stylesheet" type="text/css">         
        <link rel="stylesheet" href="http://dhis2-cdn.org/v216/ext/resources/css/ext-plugin-gray.css">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <link rel="stylesheet" href="//cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css">


        <style type="text/css">
            .pointer{
                cursor: default !important;
            }

            .nav-list>li>a:focus {
                background:#08c;
                color:white;
            }

            .dataTables_filter {

                float: left !important;
                text-align: left;
            }

            table.pivot{
                width:100%
            }

            .dataTables_wrapper .dataTables_filter{
                text-align: center;                
            }

            .dataTables_wrapper .dataTables_filter label{
                font-weight: bold;
            }

            .dataTables_wrapper .dataTables_filter input{
                margin-left: 0px;
            }
        </style>

        <?php
        $reportTables = API_reportTables();
        ?>

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

                        <!--Dashboard welcome are-->
                        <div id="dboardViewDiv_welcome">
                            <h1>TABLEAU DE BORD</h1>
                            <p>Utiliser le panel gauche pour faire une requ&ecirc;te d'apr&egrave;s le proc&eacute;d&eacute; suivant</p>
                        </div>
                        <!--Dashboard area-->
                        <div id="dboardViewDiv">                

                            <div id="content-dbord-inner" style="width:100%; min-height:80.51030927835052%;">
                                <ul class="nav nav-tabs" role="tablist">
                                    <li class="active"><a href="#tab-services" role="tab" data-toggle="tab" class="link-infoinst" style="cursor: pointer;"><i class="fa fa-table fa-1"></i> Pivot Table</a></li>
                                    <li><a href="#tab-insfrast" role="tab" data-toggle="tab" class="link-infoinst" style="cursor: pointer;"><i class="fa fa-area-chart fa-1"></i> Graphes</a></li>
                                    <li><a href="#tab-map" role="tab" data-toggle="tab" class="link-infoinst" style="cursor: pointer;"><i class="fa fa-map-marker fa-1"></i> Carte geographique</a></li>             
                                </ul>

                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab-services">
                                        <div class="well" style="width: 20%; max-width: 250px; min-width: 200px; padding:8px 0; display: inline-block;">
                                            <!--<label for="search"><strong>Recherche : </strong></label><br/>
                                            <input id="search" placeholder="Tapez le nom de l'indicateur" />-->
                                            <?php ?>
                                            <table id="indTable">
                                                <thead>
                                                    <tr>															
                                                        <th>Indicateur</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php
                                                    foreach ($reportTables["reportTables"] as $i => $value) {
                                                        if ($i == 0)
                                                            echo "<tr><td><a href='javascript:void(0)' class='indlist' id='" . $value["id"] . "'>" . $value["name"] . "</a></td></tr>";
                                                        else
                                                            echo "<tr><td><a href='javascript:void(0)' class='indlist' id='" . $value["id"] . "'>" . $value["name"] . "</a></td></tr>";
                                                    }
                                                    ?>													

                                                </tbody>
                                            </table>
                                        </div>
                                        <div style="width: 80%; float: right;">
                                            <h2 id="tableTitle" style="text-align:center;font-size:16px"></h2>
                                            <div id="pivot"></div>                                     
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="tab-insfrast">                                        
                                        <div class="well" style="max-width: 250px; min-width: 250px; padding:8px 2px; display: inline-block;">
                                            <table id="indTablechart">
                                                <thead>
                                                    <tr>
                                                        <th>Indicateur</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php
                                                    $reportCharts = API_reportCharts();

                                                    foreach ($reportCharts["charts"] as $i => $value) {
                                                        if ($i == 0)
                                                            echo "<tr><td><a href='javascript:void(0)' class='indlistChart' id='" . $value["id"] . "'>" . $value["name"] . "</a></td></tr>";
                                                        else
                                                            echo "<tr><td><a href='javascript:void(0)' class='indlistChart' id='" . $value["id"] . "'>" . $value["name"] . "</a></td></tr>";
                                                    }
                                                    ?>													

                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <th>Indicateur</th>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                        <div style="width: 80%; float: right;">
                                            <div id="chart" style="width:100%; height:70%"></div>
                                        </div>
                                    </div> 

                                    <div class="tab-pane fade" id="tab-map">
                                        <div class="well" style="max-width: 250px; min-width: 250px; padding:8px 0; display: inline-block;">
                                            <ul class="nav nav-list">

                                                <?php
                                                /* $reportMaps = API_reportMaps();

                                                  foreach ($reportMaps["maps"] as $i => $value) {
                                                  if ($i == 0)
                                                  echo "<li class='active'><a href='javascript:void(0)' class='indlistMap' id='".$value["id"]."'>" . $value["name"] . "</a></li>";
                                                  else
                                                  echo "<li><a href='javascript:void(0)' class='indlistMap' id='". $value["id"] ."'>" . $value["name"] . "</a></li>";
                                                  } */
                                                ?>
                                            </ul>
                                            <table id="indTablemap">
                                                <thead>
                                                    <tr>
                                                        <th>Indicateur</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php
                                                    $reportMaps = API_reportMaps();

                                                    foreach ($reportMaps["maps"] as $i => $value) {
                                                        if ($i == 0)
                                                            echo "<tr><td><a href='javascript:void(0)' class='indlistMap' id='" . $value["id"] . "'>" . $value["name"] . "</a></td></tr>";
                                                        else
                                                            echo "<tr><td>" . $i . "</td><td><a href='javascript:void(0)' class='indlistMap' id='" . $value["id"] . "'>" . $value["name"] . "</a></td></tr>";
                                                    }
                                                    ?>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div style="width: 80%; float: right;">
                                            <div id="cs_map" style="width:100%; height:70%"></div>  
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--<span class="badge badge-info">Source: <strong>DHIS2</strong></span>-->
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
                                    <input type="checkbox"> Se souvenir de moi
                                </label>
                                <button type="submit" class="btn">Se connecter</button>
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

            <!--WARNING MESSAGE -->
            <div class="modal fade" id="warnmsg" data-backdrop="static">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3>Cette page est en cours de maintenance !</h3>
                </div>
                <div class="modal-body">
                    <p>Des modifications peuvent &ecirc;tre effectu&eacute;es durant votre navigation sur cette page, veuillez nous excuser de cet inconvenient</p>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-warning" data-dismiss="modal" id="closeModOff2">Je comprends</a>
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

                //show warning message
                $(window).load(function () {
                    //$('#warnmsg').modal('show');
                });
            </script>

            <script>
                var base = "http://localhost:8000/dhis/";

                Ext.onReady(function () {
                    $('a.indlist')[0].click();
                });

                // Deals with the the coloring of the background of a selection
                // Store the previous selection to reset the color, storage so the dom doesn't need to be searched
                var previousPivot;
                var previousGraph;
                var previousMap;
                $(document).ready(function () {
                    // Referring to an existing table through the id parameter, render to "table1" div
                    $('a.indlist').click(function () {
                        // Get link id
                        linkid = $(this).attr("id");
                        setLinks(linkid);
                        textlink = $(this).text();
                        $("#tableTitle").html(textlink);
                        if (previousPivot !== undefined)
                            previousPivot.css("background-color", "#FFF");
                        // Color selection background
                        $(this).parent().css("background-color", "#DAE6F8");
                        previousPivot = $(this).parent();
                    });

                    $('a.indlistChart').click(function () {
                        // Get link id
                        linkid = $(this).attr("id");
                        setLinkschart(linkid);
                        if (previousGraph !== undefined)
                            previousGraph.css("background-color", "#FFF");
                        // Color selection background
                        $(this).parent().css("background-color", "#DAE6F8");
                        previousGraph = $(this).parent();
                    });

                    $('a.indlistMap').click(function () {
                        // Get link id
                        linkid = $(this).attr("id");
                        setLinksmap(linkid);
                        if (previousMap !== undefined)
                            previousMap.css("background-color", "#FFF");
                        // Color selection background
                        $(this).parent().css("background-color", "#DAE6F8");
                        previousMap = $(this).parent();
                    });

                    //datatables
                    $('#indTable').DataTable({
                        "sDom": '<"top" f>t<"bottom"<"clear">>',
                        "scrollY": "300px",
                        "scrollCollapse": true,
                        "oLanguage": {
                            "oPaginate": {
                                "sFirst": "First page", // This is the link to the first page
                                "sPrevious": "Prec.", // This is the link to the previous page
                                "sNext": "Suiv.", // This is the link to the next page
                                "sLast": "Last page" // This is the link to the last page
                            },
                            "sSearch": "Filtrer un indicateur"
                        }
                    });

                    //datatables chart
                    $('#indTablechart').DataTable({
                        "sDom": '<"top" f>t<"bottom"<"clear">>',
                        "scrollY": "300px",
                        "scrollCollapse": true,
                        "oLanguage": {
                            "oPaginate": {
                                "sFirst": "First page", // This is the link to the first page
                                "sPrevious": "Prec.", // This is the link to the previous page
                                "sNext": "Suiv.", // This is the link to the next page
                                "sLast": "Last page" // This is the link to the last page
                            },
                            "sSearch": "Filtrer un indicateur"
                        }
                    });

                    //indTablemap

                    $('#indTablemap').DataTable({
                        "sDom": '<"top" f>t<"bottom"<"clear">>',
                        "scrollY": "300px",
                        "scrollCollapse": true,
                        "oLanguage": {
                            "oPaginate": {
                                "sFirst": "First page", // This is the link to the first page
                                "sPrevious": "Prec.", // This is the link to the previous page
                                "sNext": "Suiv.", // This is the link to the next page
                                "sLast": "Last page" // This is the link to the last page
                            },
                            "sSearch": "Filtrer un indicateur"
                        }
                    });
                });

                function setLinks(linkid, elm) {
                    DHIS.getTable({url: base, el: "pivot", id: "" + linkid});
                }

                function setLinkschart(linkid) {
                    DV.plugin.getChart({url: base, el: 'chart', id: linkid});
                }

                function setLinksmap(linkid) {
                    GIS.plugin.getMap({url: base, el: "cs_map", id: linkid});
                }
                var firedGraph, firedMap = false;

                $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                    var target = $(e.target).attr("href"); // activated tab
                    switch (target) {
                        case '#tab-insfrast': //do something
                            if (!firedGraph)
                            {
                                firedGraph = true;
                                $('a.indlistChart')[0].click();
                            }
                            break;
                        case '#tab-map': //do something
                            if (!firedMap)
                            {
                                firedMap = true;
                                $('a.indlistMap')[0].click();
                            }
                            break;
                    }
                    //alert(target);
                });
            </script>
    </body>
</html>
