<?php include_once('lib/init.php'); ?>
<!DOCTYPE html">
<?php
include('lib/inc/dashdata.inc.php');
Auth_DHIS2();
?>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Tableau de bord - Carte Sanitaire</title>
        <script type="text/javascript" src="js/jquery191.js"></script>	    
        <link href="css/main.css" rel="stylesheet" type="text/css"> 
        <script type="text/javascript" src="js/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/bootstrap/js/bootstrap-tabs.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/bootstrap-custum.css" rel="stylesheet" type="text/css"> 
        <link href="css/dataTables.bootstrap.css" rel="stylesheet" type="text/css">
        <link href="js/cs_tree/jquery.treeview.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="js/slimscroll/jquery.slimscroll.min.js"></script>     
        <script type="text/javascript" src="js/dashb.js"></script> 

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
                            <!--<div id="content-info-dboard">
                               <div class="alert alert-info" role="alert">
                           <strong>Tableau de board des indicateurs</strong><br/>
                           <span>S&eacute;lectionner une periode, un indicateur puis cliquez le bouton mise &agrave; jour</span>
                           </div>                                            
                        </div>-->
                            <form action="" method="get" name="dboard-panel-form">
                                <div id="year-dashboard">         
                                    <h2>Choisir une P&eacute;riode</h2>
                                    <table>
                                        <tr>
                                            <td>Mois</td>
                                            <td>Ann&eacute;e</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <select name="dboard-data-month-list" id="dboard-data-month-list">                              
                                                    <option value="01">Janvier</option>                
                                                    <option value="02">F&eacute;vrier</option> 
                                                    <option value="03">Mars</option>
                                                    <option value="04">Avril</option> 
                                                    <option value="05">Mai</option>
                                                    <option value="06">Juin</option>
                                                    <option value="07">Juillet</option>
                                                    <option value="08">Ao&ucirc;t</option>
                                                    <option value="09">Septembre</option>
                                                    <option value="10">Octobre</option>
                                                    <option value="11">Novembre</option>
                                                    <option value="12">D&eacute;cembre</option>
                                                </select>
                                            </td>
                                            <td>
                                                <select name="dboard-data-year-list" id="dboard-data-year-list">
                                                    <option value="2013">2013</option>                              
                                                    <option value="2014">2014</option>                     
                                                </select>

                                            </td>
                                        </tr>
                                    </table>



                                </div>

                                <div id="dboard-indicator-list">
                                    <h2>Liste des indicateurs</h2>

                                    <select name="dboard-ind-list" id="dboard-ind-list">                              	
                                        <option value="">--</option>

                                        <?php
                                        
                                        $indicatorGroups = API_indicatorGroups();
                                        
                                        foreach ($indicatorGroups['indicatorGroups'] as $value) {
                                            echo '<option val="' . $value['id'] . '">' . $value['name'] . '</option>';
                                        }
                                        
                                        //getAllindicatorsName();
                                        ?>
                                    </select>

                                </div>
                                <div id="dboard-orgUnit-list">
                                    <h2>Liste des Unité Organisationnelle</h2>
                                </div>
                                <input type="button" class="btn" value="Mettre &agrave; jour" id="btnupdatedbrd"/>
                            </form>

                        </div><!--#leftmenu-->

                        <!--Dashboard welcome are-->
                        <div id="dboardViewDiv_welcome">
                            <h1>TABLEAU DE BORD</h1>
                            <p>Utiliser le panel gauche pour faire une requ&ecirc;te d'apr&egrave;s le proc&eacute;d&eacute; suivant</p>
                            <p>
                            <ul>
                                <li>- Choisir une date(mois et ann&eacute;e</li>
                                <li>- Selectionner un indicateur)</li>
                                <li>- Appuyer sur le bouton <strong>Mettre &agrave; jour</strong> pour terminer</li>
                            </ul>
                            </p>
                        </div>
                        <!--Dashboard area-->
                        <div class="span10" id="dboardViewDiv">                

                            <div id="content-dbord-inner" style="width:100%; min-height:80.51030927835052%;">
                                <div class="bs-callout bs-callout-info">
                                    <h4 id="indicator-name">Tous les indicateurs</h4>
                                </div>

                                <ul class="nav nav-tabs" role="tablist">
                                    <li class="active"><a href="#tab-services" role="tab" data-toggle="tab" class="link-infoinst" style="cursor: pointer;"><i class="fa fa-table fa-1"></i> Tableau</a></li>
                                    <li><a href="#tab-insfrast" role="tab" data-toggle="tab" class="link-infoinst" style="cursor: pointer;"><i class="fa fa-area-chart fa-1"></i> Graphes</a></li>
                                    <li><a href="#tab-map" role="tab" data-toggle="tab" class="link-infoinst" style="cursor: pointer;"><i class="fa fa-map-marker fa-1"></i> Carte geographique</a></li>             
                                </ul>

                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab-services">
                                        <div class="table-responsive">
                                            <!--table 1-->
                                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                <thead>
                                                    <tr>
                                                        <th>R&eacute;gion</th>
                                                        <th>Nombre populationnel</th>
                                                        <th>Quantit&eacute;</th>
                                                        <th>P&eacute;riode</th>
                                                    </tr>
                                                </thead>

                                            </table>
                                            <!--table 2 : accouchement indicator-->
                                            <table class="table table-striped table-bordered table-hover" id="dataTables-acc">
                                                <thead>
                                                    <tr>
                                                        <th>Estimation des femmes enceintes</th>                                            
                                                        <th>C&eacute;sarienne</th>
                                                        <th>Accouchement normal</th>
                                                        <th>Matronne</th>
                                                        <th>Region</th>
                                                    </tr>
                                                </thead>

                                            </table>
                                        </div><!--./table responsive-->
                                        <span class="badge badge-info">Source: <strong>DHIS2</strong></span>

                                    </div>
                                    <div class="tab-pane fade" id="tab-insfrast">
                                        <div id="cs-chart-area">
                                            <iframe id="chart-ifrm" src="chartdashb.php?access=<?php echo hash('ripemd160', '1'); ?>" frameborder="0" scrolling="no"></iframe>                            	
                                        </div>
                                    </div> 

                                    <div class="tab-pane fade" id="tab-map">
                                        <div id="cs-mapchart-area">
                                            <iframe id="mapchart-ifrm" src="mapchartdashb.php?access=<?php echo hash('ripemd160', '1'); ?>" frameborder="0" scrolling="no"></iframe>                            	
                                        </div>
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

            <!-- DataTables JavaScript -->
            <script src="js/dataTables/jquery.dataTables.js"></script>
            <script src="js/dataTables/dataTables.bootstrap.js"></script>
            <script>
                $(document).ready(function () {                    
                    $('#btnupdatedbrd').click(function (e) {
                        //hide dashboard welcome
                        $('#dboardViewDiv_welcome').fadeOut(function () {
                            $('#dboardViewDiv').fadeIn();
                        });
                        //check if the item selected is a mixin
                        if ($('#dboard-ind-list').find(":selected").attr("mix")) {
                            //View table for this indicator
                            $('#dataTables-acc').parents('div.dataTables_wrapper').first().show();
                            $('#dataTables-acc').show();
                            $('#dataTables-example').parents('div.dataTables_wrapper').first().hide();
                            $('#dataTables-example').hide();
                            /////

                            var indgroup = $('#dboard-ind-list').find(":selected").attr("parent");
                            var month_ind = $('#dboard-data-month-list').val();
                            var year_ind = $('#dboard-data-year-list').val();
                            $('#dataTables-acc').dataTable().fnDestroy();
                            $('#dataTables-acc').dataTable({
                                "ajax": "lib/inc/dashdata.inc.php?dhisdata=all&groupindname=" + indgroup + "&querydate=" + month_ind + ":" + year_ind
                            });

                            //reload mapchart iframe
                            var currSrc = $("#mapchart-ifrm").attr("src");
                            currSrc = currSrc + "&dhisdata=all&groupindname=" + indgroup + "&querydate=" + month_ind + ":" + year_ind
                            $("#mapchart-ifrm").attr("src", currSrc);

                            return;
                        } else {
                            $('#dataTables-example').parents('div.dataTables_wrapper').first().show();
                            $('#dataTables-example').show();
                            $('#dataTables-acc').parents('div.dataTables_wrapper').first().hide();
                            $('#dataTables-acc').hide();
                        }

                        $('#dataTables-example').dataTable().fnDestroy();
                        val_ind = $('#dboard-ind-list').val();
                        month_ind = $('#dboard-data-month-list').val();
                        year_ind = $('#dboard-data-year-list').val();

                        $('#dataTables-example').dataTable({
                            "ajax": "lib/inc/dashdata.inc.php?dhisdata=all&filter=" + val_ind + ":" + month_ind + ":" + year_ind
                        });
                        //hide column
                        //array storing indicators when selected to hide the column
                        var indArrayTohideCol = new Array(
                                "Accouchement_Institutionel(15_19_ans, Normal)",
                                "Accouchement_Institutionel(20_34_ans, Normal)",
                                "Accouchement_Institutionel(35ans_et_Plus, Normal)",
                                "Accouchement_Institutionel(Moins_15ans, Autres)",
                                "Accouchement_Institutionel(Moins_15ans, Normal)",
                                "Accouchement_Non_Institutionel(Moins_15ans, Autres)",
                                "Accouchement_Non_Institutionel(Moins_15ans, Matrone)"
                                );
                        if (jQuery.inArray(val_ind, indArrayTohideCol) !== -1) {
                            var table = $('#dataTables-example').DataTable();
                            table.column(1).visible(false);
                        }


                        //change the title	
                        if (val_ind == 'all') {
                            $('#indicator-name').text("Tous les indicateurs" + '-' + month_ind + ' ' + year_ind);
                        } else {
                            month_ind2 = $('#dboard-data-month-list').find(":selected").text();
                            val_ind2 = $('#dboard-ind-list').find(":selected").text();
                            $('#indicator-name').text(val_ind2 + ' - ' + month_ind2 + ' ' + year_ind);
                        }

                        //reload chart iframe
                        var currSrc = $("#chart-ifrm").attr("src");
                        currSrc = currSrc + "&dhisdata=all&filter=" + val_ind + ":" + month_ind + ":" + year_ind;
                        $("#chart-ifrm").attr("src", currSrc);

                    });

                });
            </script>


    </body>
</html>
