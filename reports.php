<?php ?>
<!DOCTYPE html">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>MSPP -  Carte Sanitaire</title>
        <script type="text/javascript" src="js/jquery191.js"></script>        
        <script src="js/jquery-ui.min.js" type="text/javascript"></script>
        <script src="js/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <script src="js/geersch-bootstrap-spinedit/js/bootstrap-spinedit.js" type="text/javascript"></script>


        <link href="js/jquery-ui.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/main.css" rel="stylesheet" type="text/css">   
        <link href="js/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/bootstrap-custum.css" rel="stylesheet" type="text/css">
        <link href="js/geersch-bootstrap-spinedit/css/bootstrap-spinedit.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript">
            $(document).ready(function () {

                // Spinedits for the fields that have numbers
                $('.number').spinedit({
                    minimum: -10,
                    maximum: 50,
                    step: 1
                });

                /**** Click and drag for column selection start ****/

                // makes use of jquery sortable: https://jqueryui.com/sortable/
                // Uses a few modifications to allow for multiple item dragging
                $("#sortable1, #sortable2").sortable({
                    connectWith: ".connectedSortable",
                    cursor: 'move',
                    helper: function (event, item) {
                        // make sure at least one item is selected.
                        if (!item.hasClass("selected")) {
                            item.addClass("selected").siblings().removeClass("selected");
                        }

                        var $helper = $("<ul class='helperlist'></ul>");
                        $helper.width(item.parent().width());
                        var $selected = item.parent().children(".selected");
                        var $cloned = $selected.clone();
                        $helper.append($cloned);

                        item.parent().sortable("option", "cursorAt", {
                            left: Math.floor(item[0].clientWidth / 2),
                            top: Math.floor(item[0].clientHeight / 2)
                        });

                        // hide it, don't remove!
                        $selected.hide();

                        // save the selected items
                        item.data("multi-sortable", $cloned);

                        return $helper;
                    },
                    stop: function (event, ui) {
                        // add the cloned ones
                        var $cloned = ui.item.data("multi-sortable");
                        ui.item.removeData("multi-sortable");

                        // append it
                        ui.item.after($cloned);

                        //deselect
                        $cloned.each(function () {
                            $(this).removeClass('selected')
                        });

                        //re-add click event, since they are clones, they lose the click even
                        $cloned.on('click', function () {
                            if ($(this).hasClass('selected')) {
                                $(this).removeClass('selected');
                            } else
                            {
                                $(this).addClass('selected');
                            }
                        });

                        // remove the hidden ones
                        ui.item.siblings(":hidden").remove();

                        // remove self, it's duplicated
                        ui.item.remove();
                    }
                }).disableSelection();

                // handles the selection of the column items
                $('#sortable1 li, #sortable2 li').on('click', function () {
                    if ($(this).hasClass('selected')) {
                        $(this).removeClass('selected');
                    } else
                    {
                        $(this).addClass('selected');
                    }
                });

                /**** Click and drag for column selection end ****/

                /**** Column button controls start ****/
                $('#addOne').on('click', function () {
                    $('#sortable1 .selected').appendTo('#sortable2');
                    $('#sortable2 .selected').removeClass('selected');
                });

                $('#addAll').on('click', function () {
                    $('#sortable1 li').appendTo('#sortable2');
                });

                $('#removeOne').on('click', function () {
                    $('#sortable2 .selected').appendTo('#sortable1');
                    $('#sortable1 .selected').removeClass('selected');
                });

                $('#removeAll').on('click', function () {
                    $('#sortable2 li').appendTo('#sortable1');
                });

                /**** Column button controls end ****/

                // Setup the popover hint for the columns selection
                $('#column-hint').popover({
                    html: true,
                    content: '<p>Click and drag to move from one column to another<br />Click item to select<br />Center controls apply to selected items</p>',
                    trigger: "hover"
                });

                // If the user selects a specific departmen, then we can't group by department
                $('#dep-list-dropdmenu').on('change', function () {
                    if ($(this).val() !== 'Haiti')
                    {
                        if ($('#rbGDepartment').prop('checked')) {
                            $('#rbGType').prop('checked', 'checked');
                        }

                        $('#rbGDepartment').prop('disabled', true);
                    } else
                    {
                        $('#rbGDepartment').prop('disabled', false);
                    }
                });
            });

            // this is run just before the form is submitted to update the hidden variable with the selected
            // columns since we can't pass li (html) elements
            function updateColumns() {
                var cols = [];
                $('#sortable2 li').each(function () {
                    cols.push($(this).attr('value'));
                });

                if (cols.length < 1) {
                    $('#alertWin .modal-body p').html('Vous devez sélectionner au moins une colonne pour afficher.');
                    $('#alertWin').modal('show');
                    return false;
                }

                if ($('#rgPdf').prop('checked'))
                {
                    if (cols.length > 10)
                    {
                        $('#alertWin .modal-body p').html('Limité à 8 colonnes pour pdf.');
                        $('#alertWin').modal('show');
                        return false;
                    }
                }

                $('#hdnColumns').val(cols.join(';'));

                return true;
            }
        </script>
        <style type="text/css">
            .two-col li{
                float:left;
                width: 50%;
            }

            #dep-list-dropdmenu{
                margin-left: 20px;
            }

            .number{
                width: 50px;
                height: 30px !important; 
                margin-bottom: 2px !important;
            }

            #cblInfrastructures select{
                width: 150px;
                margin-bottom: 2px !important;
            }

            #cblInfrastructures label{
                width: 250px;
                display: inline-block;
                vertical-align: middle;
            }           

            h3{
                border-radius: 0 0 4px 4px;
                border-style: solid;                
                border: 1px solid transparent;
                border-bottom-width: 4px;                
                display: inline-block;
            }

            /* orange border */
            .ob{
                border-bottom-color: #F60;
            }

            /* blue border */
            .bb{
                border-bottom-color: #175F9C;
            }

            /* red border */
            .rb{
                border-bottom-color: #B94A48;
            }

            .nb{
                border-bottom-color: #333;
            }

            #sortable1, #sortable2 {
                border: 1px solid #000;                
                min-height: 20px;
                list-style-type: none;                
                padding: 10px;                                
                background-color: #FFF;                
            }
            #sortable1 li, #sortable2 li, .helperlist li {
                margin: 0 5px 5px 5px;
                padding: 2px;                
                text-align: center;  
                cursor: move;
                background-color: #c9e2f7;
                color: black;
            }

            input[type="radio"], input[type="checkbox"]{
                margin:0;
            }

            #rbGDepartment{
                margin-left: 20px;
            }

            .list-control:first-child{
                margin-top:60px;
            }

            .list-control{
                margin: 5px 0;
                width: 50px !important;
            }

            .selected{
                background-color: #8ccaff !important;
            }

            .well{
                width:inherit;
            }

            .center{
                text-align: center;
            }

            .typeGroup{
                margin-top: 5px;
            }

            .typeGroup label{
                margin-right: 10px;
            }
        </style>
    </head>
    <body>
        <div id="wrapper">
            <!-- Header -->
            <?php include 'lib/inc/head.php'; ?>

            <!--Navbar-->
            <div id="navbar">
                <div id="navbar-inner">
                    <ul>
                        <?php include 'lib/inc/nav.php'; ?>
                    </ul>
                </div>
            </div>

            <form onsubmit="return updateColumns();" action="lib/inc/advreps.php" method="post">
                <div id="mainContent" style="margin: 0 10px">                
                    <div class="container-fluid">
                        <div class="row-fluid">
                            <div class="span12">
                                <h1>Sélectionnez Les Filtres de Rapport</h1>
                            </div>                          
                        </div>
                        <div class="row-fluid well">                                                                    
                            <div class="row-fluid">
                                <div class="span3">
                                    <h3 class="nb">Choisir Département</h3>                        
                                    <select name="dep-list-dropdmenu" id="dep-list-dropdmenu">                    
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
                                </div>
                                <div class="span2">
                                    <h3 class="nb">Sélectionnez le Format</h3>     
                                    <br/>
                                    <div class="typeGroup">
                                        <input id="rgPdf" checked type="radio" value="PDF" name="type" class="radio" />
                                        <label for="rgPdf">PDF</label>    
                                        <input id="fgCsv" type="radio" value="CSV" name="type" class="radio" />
                                        <label for="fgCsv">CSV</label>   
                                    </div>                                    
                                </div>
                            </div>
                            <div class="row-fluid">
                                <div class="span3">
                                    <h3 class="nb">Institutions Sanitaires</h3>                        
                                    <ul id="cblFacType">
                                        <li>
                                            <input name="facType[]" type="checkbox" value="CAL" class="opt_fac_type" id="chk_health_a_lit" checked />&nbsp;<label for="chk_health_a_lit" title="Centre de sant&eacute; &agrave; lit">CAL</label>
                                        </li>
                                        <li>
                                            <input name="facType[]" type="checkbox" value="CSL" class="opt_fac_type" id="chk_health_sans_lit" checked/>&nbsp;<label for="chk_health_sans_lit" title="Centre de sant&eacute; sans lit">CSL</label>
                                        </li>
                                        <li>
                                            <input name="facType[]" type="checkbox" value="Hopital" class="opt_fac_type" id="chk_health_h" checked/>&nbsp;<label for="chk_health_h" title="Hopitale">Hopital</label>
                                        </li>
                                        <li>
                                            <input name="facType[]" type="checkbox" value="HCR" class="opt_fac_type" id="chk_health_hcr" checked/>&nbsp;<label for="chk_health_hcr" title="Hopital Communautaire de r&eacute;f&eacute;rence">HCR</label>
                                        </li>
                                        <li>
                                            <input name="facType[]" type="checkbox" value="Hopital universitaire" class="opt_fac_type" id="chk_health_hu" checked/>&nbsp;<label for="chk_health_hu" title="Hopital universitaire">HU</label>
                                        </li>

                                        <li>
                                            <input name="facType[]" type="checkbox" value="Dispensaire" class="opt_fac_type" id="chk_health_dis" checked/>&nbsp;<label for="chk_health_dis" title="Dispensaire">Dispensaire</label>
                                        </li>

                                        <li>
                                            <input name="facType[]" type="checkbox" value="Hopital departemental" class="opt_fac_type" id="chk_health_dep" checked/>&nbsp;<label for="chk_health_dep" title="Hopital d&eacute;partemental">Hop. d&eacute;partemental</label>
                                        </li>
                                    </ul>                                
                                </div>   
                                <div class="span3">
                                    <h3 class="rb">Sélectionnez Activités</h3>
                                    <ul id="cblActivities">
                                        <li>
                                            <input type="checkbox" id="cbxChildVacc" name="servFilter[]" value="childvacc" class="cbxServFil"/>
                                            <label for="cbxChildVacc">Vaccination des enfants</label>                                    
                                        </li>
                                        <li>
                                            <input type="checkbox" id="cbxGrowthMon" name="servFilter[]" value="growthmon" class="cbxServFil"/>
                                            <label for="cbxGrowthMon">Pésée des enfants</label>
                                        </li>                                    
                                        <li>
                                            <input type="checkbox" id="cbxSickChild" name="servFilter[]" value="sickchild" class="cbxServFil"/>
                                            <label for="cbxSickChild">Prise en charge spécialisé pédiatrique</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="cbxSTI" name="servFilter[]" value="sti" class="cbxServFil"/>
                                            <label for="cbxSTI">Maladie Sexuellement Transmissible(STI)</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="cbxGroupeSanguin" name="servFilter[]" value="bloodtype" class="cbxServFil"/>
                                            <label for="cbxGroupeSanguin">Groupe sanguin</label>
                                        </li>                                    
                                    </ul>
                                </div>                            
                                <div class="span4">
                                    <h3 class="ob">Sélectionnez Services</h3>
                                    <ul id="cblServices" class="two-col">
                                        <li>
                                            <input type="checkbox" id="cbxSoinsprénataux" name="servFilter[]" value="ambulancedispo"  class="cbxServFil"/>
                                            <label for="cbxSoinsprénataux">Ambulance disponible</label>
                                        </li> 
                                        <li>
                                            <input type="checkbox" id="cbxServiceDisp" name="servFilter[]" value="servicedisp024h"  class="cbxServFil"/>
                                            <label for="cbxServiceDisp">Service disponible 24/24</label>
                                        </li>   
                                        <li>
                                            <input type="checkbox" id="cbxPlanificationfamiliale" name="servFilter[]" value="fp"  class="cbxServFil"/>
                                            <label for="cbxPlanificationfamiliale">Planification familiale</label>                                    
                                        </li>
                                        <li>
                                            <input type="checkbox" id="cbxANC" name="servFilter[]" value="anc"  class="cbxServFil"/>
                                            <label for="cbxANC">Soins prénataux</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="cbxSoindesPTME" name="servFilter[]" value="pmtct"  class="cbxServFil"/>
                                            <label for="cbxSoindesPTME">Soin des PTME</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="cbxAccouchement" name="servFilter[]" value="delivery"  class="cbxServFil"/>
                                            <label for="cbxAccouchement">Accouchement</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="cbxPriseenchargemalaria" name="servFilter[]" value="malaria"   class="cbxServFil"/>
                                            <label for="cbxPriseenchargemalaria">Prise en charge malaria</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="cbxPriseenchargeTB" name="servFilter[]" value="tb"  class="cbxServFil"/>
                                            <label for="cbxPriseenchargeTB">Prise en charge TB</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="cbxSointraitementVIH" name="servFilter[]" value="hivct"  class="cbxServFil"/>
                                            <label for="cbxSointraitementVIH">Soin traitement VIH</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="cbxNoncomdiseases" name="servFilter[]" value="noncomdiseases"  class="cbxServFil"/>
                                            <label for="cbxNoncomdiseases">Noncomdiseases</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="cbxChirurgiemineure" name="servFilter[]" value="minorsurgery"  class="cbxServFil"/>
                                            <label for="cbxChirurgiemineure">Chirurgie mineure</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="cbxCésariennes" name="servFilter[]" value="csections"  class="cbxServFil"/>
                                            <label for="cbxCésariennes">Césariennes</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="cbxLab" name="servFilter[]" value="laboratory"  class="cbxServFil"/>
                                            <label for="cbxLab">Laboratoire</label>
                                        </li>                               
                                        <li>
                                            <input type="checkbox" id="cbxTransfusionsanguine" name="servFilter[]" value="bloodtransf" class="cbxServFil"/>
                                            <label for="cbxTransfusionsanguine">Transfusion sanguine</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="cbxMédecinegénérale" name="servFilter[]" value="generalmeds"  class="cbxServFil"/>
                                            <label for="cbxMédecinegénérale">Médecine générale</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="cbxHopitalisation" name="servFilter[]" value="hopitalisatioselmen"  class="cbxServFil"/>   
                                            <label for="cbxHopitalisation">Hopitalisation</label>
                                        </li>
                                    </ul>
                                </div>      
                            </div>
                            <div class="row-fluid">
                                <div class="span12">
                                    <h3 class="bb">Sélectionnez Infrastructures</h3>
                                    <ul id="cblInfrastructures" class="two-col">
                                        <li>                                        
                                            <label for="nmbDisponibles">Nombre de lits disponibles</label>
                                            <select name="cmbDisponibles">
                                                <option value="" selected>--</option>
                                                <option value=">">(>)greater-than</option>
                                                <option value="<">(<)less-than</option>
                                                <option value="=">(=)equal-to</option>
                                            </select>
                                            <input id="nmbDisponibles" name="nmbDisponibles" type="text" value="0" class="number">
                                        </li>
                                        <li>                                       
                                            <label for="nmbMaternite">Nombre de lit maternité</label>
                                            <select name="cmbMaternite">
                                                <option value="" selected>--</option>
                                                <option value=">">(>)greater-than</option>
                                                <option value="<">(<)less-than</option>
                                                <option value="=">(=)equal-to</option>
                                            </select>
                                            <input id="nmbMaternite" name="nmbMaternite" type="text" value="0" class="number">
                                        </li>
                                        <li>                                        
                                            <label for="nmbAccouchment">Nombre de lit d'accouchment</label>
                                            <select name="cmbAccouchment">
                                                <option value="" selected>--</option>
                                                <option value=">">(>)greater-than</option>
                                                <option value="<">(<)less-than</option>
                                                <option value="=">(=)equal-to</option>
                                            </select>
                                            <input id="nmbAccouchment" name="nmbAccouchment" type="text" value="0" class="number">
                                        </li>
                                        <li>                                      
                                            <label for="nmbGeneraliste">Nombre de médecin généraliste</label>
                                            <select name="cmbGeneraliste">
                                                <option value="" selected>--</option>
                                                <option value=">">(>)greater-than</option>
                                                <option value=">=">(>)greater-than-equal-to</option>
                                                <option value="<">(<)less-than</option>
                                                <option value="<=">(<)less-than-equal-to</option>
                                                <option value="=">(=)equal-to</option>
                                            </select>
                                            <input id="nmbGeneraliste" name="nmbGeneraliste" type="text" value="0" class="number">
                                        </li>     
                                        <li>                                       
                                            <label for="nmbSpecialiste">Nombre de médecin spécialiste</label>
                                            <select name="cmbSpecialiste">
                                                <option value="" selected>--</option>
                                                <option value=">">(>)greater-than</option>
                                                <option value=">=">(>)greater-than-equal-to</option>
                                                <option value="<">(<)less-than</option>
                                                <option value="<=">(<)less-than-equal-to</option>
                                                <option value="=">(=)equal-to</option>
                                            </select>
                                            <input id="nmbSpecialiste" name="nmbSpecialiste" type="text" value="0" class="number">
                                        </li>  
                                        <li>                                        
                                            <label for="nmbParamedical">Nombre paramédical</label>
                                            <select name="cmbParamedical">
                                                <option value="" selected>--</option>
                                                <option value=">">(>)greater-than</option>
                                                <option value=">=">(>)greater-than-equal-to</option>
                                                <option value="<">(<)less-than</option>
                                                <option value="<=">(<)less-than-equal-to</option>
                                                <option value="=">(=)equal-to</option>
                                            </select>
                                            <input id="nmbParamedical" name="nmbParamedical" type="text" value="0" class="number">
                                        </li>  
                                        <li>
                                            <label for="nmbAnesthesiste">Nombre de médecin anesthésiste</label>
                                            <select name="cmbAnesthesiste">
                                                <option value="" selected>--</option>
                                                <option value=">">(>)greater-than</option>
                                                <option value=">=">(>)greater-than-equal-to</option>
                                                <option value="<">(<)less-than</option>
                                                <option value="<=">(<)less-than-equal-to</option>
                                                <option value="=">(=)equal-to</option>
                                            </select>
                                            <input id="nmbAnesthesiste" name="nmbAnesthesiste" type="text" value="0" class="number">
                                        </li>  
                                        <li>                                     
                                            <label for="nmbInfirmiere">Nombre d'infirmière</label>
                                            <select name="cmbInfirmiere">
                                                <option value="" selected>--</option>
                                                <option value=">">(>)greater-than</option>
                                                <option value=">=">(>)greater-than-equal-to</option>
                                                <option value="<">(<)less-than</option>
                                                <option value="<=">(<)less-than-equal-to</option>
                                                <option value="=">(=)equal-to</option>
                                            </select>
                                            <input id="nmbInfirmiere" name="nmbInfirmiere" type="text" value="0" class="number">
                                        </li>  
                                        <li>                                       
                                            <label for="nmbAuxilaire">Nombre d'auxilaire</label>
                                            <select name="cmbAuxilaire">
                                                <option value="" selected>--</option>
                                                <option value=">">(>)greater-than</option>
                                                <option value=">=">(>)greater-than-equal-to</option>
                                                <option value="<">(<)less-than</option>
                                                <option value="<=">(<)less-than-equal-to</option>
                                                <option value="=">(=)equal-to</option>
                                            </select>
                                            <input id="nmbAuxilaire" name="nmbAuxilaire" type="text" value="0" class="number">
                                        </li>  
                                        <li>
                                            <label for="nmbFemme">Nombre de sage femme</label>
                                            <select name="cmbFemme">
                                                <option value="" selected>--</option>
                                                <option value=">">(>)greater-than</option>
                                                <option value=">=">(>)greater-than-equal-to</option>
                                                <option value="<">(<)less-than</option>
                                                <option value="<=">(<)less-than-equal-to</option>
                                                <option value="=">(=)equal-to</option>
                                            </select>
                                            <input id="nmbFemme" name="nmbFemme" type="text" value="0" class="number">
                                        </li>  
                                        <li>
                                            <label for="nmbDiplome">Nombre de sage femme diplômé</label>
                                            <select name="cmbDiplome">
                                                <option value="" selected>--</option>
                                                <option value=">">(>)greater-than</option>
                                                <option value=">=">(>)greater-than-equal-to</option>
                                                <option value="<">(<)less-than</option>
                                                <option value="<=">(<)less-than-equal-to</option>
                                                <option value="=">(=)equal-to</option>
                                            </select>
                                            <input id="nmDiplome" name="nmDiplome" type="text" value="0" class="number">
                                        </li>  
                                        <li>
                                            <label for="nmbPharmacien">Nombre de pharmacien</label>
                                            <select name="cmbPharmacien">
                                                <option value="" selected>--</option>
                                                <option value=">">(>)greater-than</option>
                                                <option value=">=">(>)greater-than-equal-to</option>
                                                <option value="<">(<)less-than</option>
                                                <option value="<=">(<)less-than-equal-to</option>
                                                <option value="=">(=)equal-to</option>
                                            </select>
                                            <input id="nmbPharmacien" name="nmbPharmacien" type="text" value="0" class="number">
                                        </li>  
                                        <li>
                                            <label for="nmbTPharmacie">Nombre de technicien en pharmacie</label>
                                            <select name="cmbTPharmacie">
                                                <option value="" selected>--</option>
                                                <option value=">">(>)greater-than</option>
                                                <option value=">=">(>)greater-than-equal-to</option>
                                                <option value="<">(<)less-than</option>
                                                <option value="<=">(<)less-than-equal-to</option>
                                                <option value="=">(=)equal-to</option>
                                            </select>
                                            <input id="nmbTPharmacie" name="nmbTPharmacie" type="text" value="0" class="number">
                                        </li>  
                                        <li>
                                            <label for="nmbAPharmacie">Nombre d'assistant pharmacien</label>
                                            <select name="cmbAPharmacie">
                                                <option value="" selected>--</option>
                                                <option value=">">(>)greater-than</option>
                                                <option value=">=">(>)greater-than-equal-to</option>
                                                <option value="<">(<)less-than</option>
                                                <option value="<=">(<)less-than-equal-to</option>
                                                <option value="=">(=)equal-to</option>
                                            </select>
                                            <input id="nmbAPharmacie" name="nmbAPharmacie" type="text" value="0" class="number">
                                        </li>  
                                        <li>
                                            <label for="nmbLaborantin">Nombre de laborantin(e)</label>
                                            <select name="cmbLaborantin">
                                                <option value="" selected>--</option>
                                                <option value=">">(>)greater-than</option>
                                                <option value=">=">(>)greater-than-equal-to</option>
                                                <option value="<">(<)less-than</option>
                                                <option value="<=">(<)less-than-equal-to</option>
                                                <option value="=">(=)equal-to</option>
                                            </select>
                                            <input id="nmbLaborantin" name="nmbLaborantin" type="text" value="0" class="number">
                                        </li>  
                                        <li>
                                            <label for="nmbTechnologisteL">Nombre de technologiste de laboratoire</label>
                                            <select name="cmbTechnologisteL">
                                                <option value="" selected>--</option>
                                                <option value=">">(>)greater-than</option>
                                                <option value=">=">(>)greater-than-equal-to</option>
                                                <option value="<">(<)less-than</option>
                                                <option value="<=">(<)less-than-equal-to</option>
                                                <option value="=">(=)equal-to</option>
                                            </select>
                                            <input id="nmbTechnologisteL" name="nmbTechnologisteL" type="text" value="0" class="number">
                                        </li>  
                                        <li>
                                            <label for="nmbTechnicienL">Nombre de technicien de laboratoire</label>
                                            <select name="cmbTechnicienL">
                                                <option value="" selected>--</option>
                                                <option value=">">(>)greater-than</option>
                                                <option value=">=">(>)greater-than-equal-to</option>
                                                <option value="<">(<)less-than</option>
                                                <option value="<=">(<)less-than-equal-to</option>
                                                <option value="=">(=)equal-to</option>
                                            </select>
                                            <input id="nmbTechnicienL" name="nmbTechnicienL" type="text" value="0" class="number">
                                        </li> 
                                    </ul>
                                </div>                        
                            </div>
                        </div>
                        <div class="row-fluid">
                            <div class="span12">
                                <h1>Sélectionnez Formatage du Rapport</h1>
                            </div>
                        </div>
                        <div class="row-fluid well">
                            <div class="row-fluid">
                                <div class="span12">   
                                    <h1>Sélectionnez groupement</h1>     
                                </div>
                            </div>
                            <div class="row-fluid">   
                                <div class="span4">                                
                                    <input id="rbGDepartment" checked type="radio" value="Department" name="grouping[]" class="radio" />
                                    <label for="rbGDepartment">Par Département</label>                           
                                </div>
                                <div class="span4">
                                    <input id="rbGType" type="radio" value="Department" name="grouping[]" class="radio" />
                                    <label for="rbGType">Par Type</label>                           
                                </div>
                                <div class="span4">
                                    <input id="rbGService" type="radio" value="Department" name="grouping[]" class="radio" />
                                    <label for="rbGService">Par Service Fourni</label>                           
                                </div>                         
                            </div>                        
                            <div class="row-fluid"> 
                                <div class="span5">
                                    <h3>Colonnes Disponibles</h3><img id="column-hint" src="images/hint-icon.png" style="margin-left: 10px; cursor: pointer"/>
                                    <ul id="sortable1" class="connectedSortable">                                    
                                        <li value="managauthority" class="ui-state-default">Managing Authority</li>                                    
                                        <li value="uasname" class="ui-state-default">UAS</li>
                                        <li value="communename" class="ui-state-default">Commune</li>
                                        <li value="seccomname" class="ui-state-default">Section Commune</li>
                                        <li value="coordinates" class="ui-state-default">Coordinates</li>
                                        <li value="childvacc" class="ui-state-default">Vaccination des enfants</li>
                                        <li value="growthmon" class="ui-state-default">Pésée des enfants</li>
                                        <li value="sickchild" class="ui-state-default">Prise en charge spécialisé pédiatrique</li>
                                        <li value="sti" class="ui-state-default">Maladie Sexuellement Transmissible(STI)</li>
                                        <li value="bloodtype" class="ui-state-default">Groupe sanguin</li>
                                        <li value="hopitalisatioselmen" class="ui-state-default">Hopitalisation</li>
                                        <li value="ambulancedispo" class="ui-state-default">Ambulance disponible</li>
                                        <li value="delivery" class="ui-state-default">Accouchement</li>
                                        <li value="fp" class="ui-state-default">Planification familiale</li>
                                        <li value="pmtct" class="ui-state-default">Soin des PTME</li>
                                        <li value="malaria" class="ui-state-default">Prise en charge malaria</li>
                                        <li value="hivct" class="ui-state-default">Soin traitement VIH</li>
                                        <li value="minorsurgery" class="ui-state-default">Chirurgie mineure</li>
                                        <li value="laboratory" class="ui-state-default">Laboratoire</li>
                                        <li value="generalmeds" class="ui-state-default">Médecine générale</li>
                                        <li value="servicedisp024h" class="ui-state-default">Service disponible 24/24</li>
                                        <li value="anc" class="ui-state-default">Soins prénataux</li>
                                        <li value="tb" class="ui-state-default">Prise en charge TB</li>
                                        <li value="noncomdiseases" class="ui-state-default">Noncomdiseases</li>
                                        <li value="csections" class="ui-state-default">Césariennes</li>
                                        <li value="bloodtransf" class="ui-state-default">Transfusion sanguine</li>
                                        <li value="nombredelithospi1nuit" class="ui-state-default">Nombre de lits disponibles</li>
                                        <li value="nombrelitaccouchment" class="ui-state-default">Nombre de lit d'accouchment</li>
                                        <li value="nombremedspecialist" class="ui-state-default">Nombre de médecin spécialiste</li>
                                        <li value="nombranesthesit" class="ui-state-default">Nombre de médecin anesthésiste</li>
                                        <li value="nombrauxilair" class="ui-state-default">Nombre d'auxilaire</li>
                                        <li value="nombresagefemmediplome" class="ui-state-default">Nombre de sage femme diplômé</li>
                                        <li value="nombrpharmtechnologist" class="ui-state-default">Nombre de technicien en pharmacie</li>
                                        <li value="nombrlabscientist" class="ui-state-default">Nombre de laborantin(e)</li>
                                        <li value="nombrlabtechnicien" class="ui-state-default">Nombre de technicien de laboratoire</li>
                                        <li value="nobrlitmaternite" class="ui-state-default">Nombre de lit maternité</li>
                                        <li value="nombremedgeneralist" class="ui-state-default">Nombre de médecin généraliste</li>
                                        <li value="nombrparamedical" class="ui-state-default">Nombre paramédical</li>
                                        <li value="nombrinfirmierprofess" class="ui-state-default">Nombre d'infirmière</li>
                                        <li value="nombrsagefemeprof" class="ui-state-default">Nombre de sage femme</li>
                                        <li value="nimbrpharmacien" class="ui-state-default">Nombre de pharmacien</li>
                                        <li value="nombrassistanpharmacie" class="ui-state-default">Nombre d'assistant pharmacien</li>
                                        <li value="nombrlabtechnologis" class="ui-state-default">Nombre de technologiste de laboratoire</li>
                                    </ul>
                                </div>
                                <div class="span2 center">
                                    <input id="addOne" type="button" value=">" class="btn btn-primary list-control" />
                                    <br />
                                    <input id="addAll" type="button" value=">>" class="btn btn-primary list-control" />
                                    <br />
                                    <input id="removeOne" type="button" value="<" class="btn btn-primary list-control" />
                                    <br />
                                    <input id="removeAll" type="button" value="<<" class="btn btn-primary list-control" />
                                </div>
                                <div class="span5">
                                    <h3>Colonnes Sélectionnées</h3>
                                    <ul id="sortable2" name="sortable2" class="connectedSortable">
                                        <li value="code" class="ui-state-default">MOH Facility Code</li>
                                        <li value="name" class="ui-state-default">Name of Facility</li>
                                        <li value="facilitytype" class="ui-state-default">Facility Type</li>
                                        <li value="deptname" class="ui-state-default">Department</li>                                    
                                    </ul>
                                    <input type="hidden" id="hdnColumns" name="hdnColumns" value="" />
                                    <div class="span12 center">
                                        <input type="submit" class="btn btn-success" value="Generate Report" style="margin: auto;" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!--footer-->
            <div id="footer">
                <span>Carte Sanitaire &copy; 2014</span> - <a href="#">Site web MSPP</a> | <a href="#">Documentation</a> 
            </div>
        </div>
        <div class="modal hide fade" id="alertWin" data-backdrop="static">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3>Erreur dans la sélection</h3>
            </div>
            <div class="modal-body">
                <p>Vous devez sélectionner au moins une colonne pour afficher.</p>
            </div>
            <div class="modal-footer">
                <a href="#" class="btn btn-danger" data-dismiss="modal" id="closeModOff">Annuler</a>
            </div>
        </div>
    </body>
</html>