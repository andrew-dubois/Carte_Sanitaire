var distanceSearch = false;

function SetupLeftMenu() {
    /*
     *      Setup the left menu events 
     */

    //****** view facilities on a national district view***
    $('#dep-list-dropdmenu').change(function () {
        // Hide the cover page after they 
        $('#moh_div').hide();

        // Handles the selection of the dropdown, if nothing is selected, i.e. not in the array, don't show facility options
        var arr = ["Haiti", "Artibonite", "Centre", "Grand-Anse", "Nippes", "Nord", "Nord-Est", "Nord-Ouest", "Ouest", "Sud", "Sud-Est"];
        if (jQuery.inArray($(this).val(), arr) !== -1) {
            $('#layer-type1').slideDown();
        } else {
            $('#layer-type1').slideUp();
        }

        // Show the legend ( functions defined in dcart_legend
        $('#legendFac').show();
        $('#legendFac_btnShow').css('right', '0');
        $('#legendTable_btnShow').css('right', '0');
        $('#legendTable').css('right', '-600px');

        //Global var (selected department)
        var depname = $('#dep-list-dropdmenu').val();

        // the following two lines cause department selection to reset when changing regions
        $('.layerOpt').prop('checked', false);
        $('#health_fac').prop('checked', true);
        // set the first facility type to checked
        $('#fac_type li input[type=checkbox]').prop('checked', true);

        var services = $('#servForm').serialize();

        $.get("lib/inc/marker.inc.php?allFDHIS=" + depname, services, function (data) {
            getXmlData(data);//retrieving xml data from database    //map_clustering.js									
            addClusterOnMap();//clustering
            // Need to change the selected department to white here
            WhiteSelectDepartment(depname);
            getNumFacTypeByDep();//Get the facility number by department
            getNumFacLabDep();// get the facility number with lab by dep
            getNumFacHIVDep();//get the facility number with hiv by dep
        });//end get	
    });

    // view facility by type
    $('.opt_fac_type').change(function () {
        if ($(this).is(':checked')) {
            var nb_brotherOpt = $('.opt_fac_type').siblings().length;
            var nb_brotherCheckOpt = $('.opt_fac_type:checked').siblings().length;
            if (nb_brotherOpt == nb_brotherCheckOpt) {
                $('#health_fac').prop('checked', true);
            }
        } else {
            $('#health_fac').prop('checked', false);
        }

        //collect all checked fac type
        var typeFac_checked = '';
        $('.opt_fac_type:checked').each(function (i) {
            if ($('.opt_fac_type:checked').length == i + 1)
                typeFac_checked += $(this).val()
            else
                typeFac_checked += $(this).val() + ':';
        });

        FilterMapByType(typeFac_checked);
        addClusterOnMap();
    });

    // View facilities with lab services by dep
    $('#lab_infr').change(function () {
        if ($('#lab_infr').is(':checked')) {
            //uncheck other options
            FilterMapByType('lab');
            addClusterOnMap();//clustering

        } else {
            removeClusterOnMap();//remove markers form the map
        }
    });

    // View facilities with vih services by dep
    $('#vih_fac').change(function () {
        if ($('#vih_fac').is(':checked')) {
            FilterMapByType('vih');
            addClusterOnMap();//clustering
        } else {
            removeClusterOnMap();//remove markers form the map
        }
    });

    // Left menu checkboxes - Layer options (Which institution/facility is being selected)
    $('.layerOpt').change(function () {
        // first get checked property of one being changed
        var isChecked = $(this).prop('checked');
        $('.layerOpt').prop('checked', false);
        if (isChecked) {
            $(this).prop('checked', true);
        }

        if ($(this).attr('id') == 'health_fac') {
            if ($(this).is(':checked')) {
                $(".opt_fac_type").prop('checked', true);
                $('#fac_type').slideDown();
                var depname = $('#dep-list-dropdmenu').val();
                //$.get("lib/inc/marker.inc.php?allFSPA=" + depname, function (data) {
                //getXmlData(data);//retrieving xml data from database								
                FilterMapByType('all');
                addClusterOnMap();//clustering									
                //});//end get
            } else {
                $(".opt_fac_type").prop('checked', false);
                //$('#fac_type').slideUp();
                removeClusterOnMap();//remove markers form the map
            }
        } else {
            $('#fac_type').slideUp();
        }
    });

    //left pane event - Zooming by departement
    $('#dep-list-dropdmenu').on("change", function () {
        var valNameDep = $(this).val();
        zoomDep(valNameDep);
    });

    var numServChecked = "-"; // Store number of services checked for label updates

    $('#servChecks input').prop('disabled', true);

    $('#cbxFilterbyServs').on('click', function () {
        if ($(this).prop('checked'))
        {
            $('#servChecks input').prop('disabled', false);
            numServChecked = $('#clFilters input[type=checkbox]:checked').length;
        } else
        {
            $('#servChecks input').prop('disabled', true);
            numServChecked = "-";

        }
        updServSel();
    });

    $("#btn_report").on("click", function () {
        $("#RepWin").modal('show');
    });

    var servFilterShown = false;

    $("#btn_serv_filter").on("click", function () {
        $("#servModWin").modal('show').on('shown', function () {
            if (!servFilterShown)
            {// initiate slider
                $('#sldDistance').slider({min: 0, max: 5000, value: 0}).on('slide', function (ev) {
                    $('#lblSldDistance').text(ev.value + 'km');
                });
                servFilterShown = true;
            }
        });
    });

    $('#servModWin .cbxServFil').on('click', function () {
        if ($(this).prop('checked')) {
            numServChecked++;
        } else
        {
            numServChecked--;
        }
        updServSel();
        if (numServChecked == 14)
        {
            $('#cbxSelAllFilters').prop('checked', true);
        } else
        {
            $('#cbxSelAllFilters').prop('checked', false);
        }
    });

    $('#cbxSelAllFilters').on('change', function () {
        if (!($(this).prop('checked')))
        {
            $('#clFilters input[type=checkbox]').prop('checked', false);
            numServChecked = 0;
        } else
        {
            $('#clFilters input[type=checkbox]').prop('checked', true);
            numServChecked = 14;
        }
        updServSel();
    });

    $('#btnServFilter').on('click', function (e) {
        // TODO: Modify this to include filters
        //       Update any other calls to take services into account
        //collect all checked fac type
        e.preventDefault();

        var typeFac_checked = '';
        if ($('#health_fac').prop('checked')) {
            $('.opt_fac_type:checked').each(function (i) {
                if ($('.opt_fac_type:checked').length == i + 1)
                    typeFac_checked += $(this).val()
                else
                    typeFac_checked += $(this).val() + ':';
            });
        } else if ($('#lab_infr').prop('checked'))
        {
            typeFac_checked = 'lab';
        } else
        {
            typeFac_checked = 'vih';
        }

        if ($('#cbxFilterbyRange').prop('checked'))
        {
            distanceSearch = true;
        } else
        {
            FilterMapByType(typeFac_checked);

            addClusterOnMap();

            getNumFacTypeByDep();//Get the facility number by department
            getNumFacLabDep();// get the facility number with lab by dep
            getNumFacHIVDep();//get the facility number with hiv by dep
        }
        $("#servModWin").modal('hide');
    });

    $('#repForm').submit(function (e) {
        e.preventDefault();
        $.ajax({
            type: 'POST',
            data: $('#repForm').serialize(),
            url: 'lib/inc/reports.php',
            success: function (data) {
                //document.location.href = data;
                var seeData = data;
            }
        });
    });
}

// updates the labels for number of services selected
function updServSel() {
    $('#servModWin .modal-header h3').text('Sélectionnez services (' + numServChecked + '/14)');
    $('#btn_serv_filter').val('Filtrer les services (' + numServChecked + '/14)');
}