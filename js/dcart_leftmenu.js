function SetupLeftMenu() {
    /*
     *      Setup the left menu events 
     */

    //****** view facilities on a national district view***
    $('#dep-list-dropdmenu').change(function () {
        // Hide the cover page after they 
        $('#moh_div').hide();

        // Handles the selection of the dropdown, if nothing is selected, i.e. not in the array, don't show facility options
        var arr = ["Haiti", "Artibonite", "Centre", "Grand Anse", "Nippes", "Nord", "Nord-Est", "Nord-Ouest", "Ouest", "Sud", "Sud-Est"];
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

        //Get the class of the element - dcartservices.php
        var class_list_dep = $(this).attr('class');
        switch (class_list_dep) {
            //use in dcartservices.php
            case "dcartserv":
                //Add communes for the dept selected
                viewCommDept(depname);
                $.get("lib/inc/marker.inc.php?allFSPA=" + depname, function (data) {
                    getXmlData(data);
                    addClusterOnMap();//clustering
                });//end get
                $('.service_fac').prop('checked', false);
                //removeColorDep();
                //executeColorizeDep();//colorize the departement.
                break;
            default:
                // use in dcart.php
                // the following two lines cause department selection to reset when changing regions
                $('.layerOpt').prop('checked', false);
                $('#health_fac').prop('checked', true);
                // set the first facility type to checked
                $('#fac_type li input[type=checkbox]').prop('checked', true);

                $.get("lib/inc/marker.inc.php?allFSPA=" + depname, function (data) {
                    getXmlData(data);//retrieving xml data from database    //map_clustering.js									
                    addClusterOnMap();//clustering
                    //removeColorDep();
                    //executeColorizeDep();//colorize the departement.
                    // Need to change the selected department to white here
                    WhiteSelectDepartment(depname);
                    getNumFacTypeByDep();//Get the facility number by department
                    getNumFacLabDep();// get the facility number with lab by dep
                    getNumFacHIVDep();//get the facility number with hiv by dep
                });//end get	
        }
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
            typeFac_checked += $(this).val() + ':';
            if ($('.opt_fac_type:checked').length == i + 1) {
                typeFac_checked += $(this).val();
            }
        });
        //alert(typeFac_checked);
        var depname = $('#dep-list-dropdmenu').val();

        $.get("lib/inc/marker.inc.php?factypeDep=" + depname + "&factype=" + typeFac_checked, function (data) {
            getXmlData(data);

            addClusterOnMap();//clustering
        });
    });

    // view facility by services used in dcartservices.php
    $('.service_fac').change(function () {
        //show custom button in control option area	
        showBtnMaptypeContrl();

        var typeFac_checked = '';
        $('.service_fac:checked').each(function (i) {

            if ($('.service_fac:checked').length == i + 1) {
                typeFac_checked += $(this).val();
            } else {
                typeFac_checked += $(this).val() + ':';
            }
        });

        var depname = $('#dep-list-dropdmenu').val();
        var opt_filter = $('.opt_filter_r:checked').val();
        var pathget = "lib/inc/marker.inc.php?depname=" + depname + "&serv_selected=" + typeFac_checked + "&opt_filter=" + opt_filter;
        if (COMMUNE_NAME_GLOBAL != '') {
            pathget = "lib/inc/marker.inc.php?depname=" + depname + "&commName=" + COMMUNE_NAME_GLOBAL + "&serv_selected=" + typeFac_checked + "&opt_filter=" + opt_filter;

        }
        $.get(pathget, function (data) {
            getXmlData(data);
            addClusterOnMap();//clustering
        });
    });

    // View facilities with vih services by dep
    $('#vih_fac').change(function () {
        if ($('#vih_fac').is(':checked')) {
            var depname = $('#dep-list-dropdmenu').val();
            $.get("lib/inc/marker.inc.php?depname=" + depname + "&hivopt=1", function (data) {
                getXmlData(data);//retrieving xml data from database								
                addClusterOnMap();//clustering
            });
        } else {
            removeClusterOnMap();//remove markers form the map
        }
    });

    // View facilities with lab services by dep
    $('#lab_infr').change(function () {
        if ($('#lab_infr').is(':checked')) {
            //uncheck other options
            var depname = $('#dep-list-dropdmenu').val();
            $.get("lib/inc/marker.inc.php?depname=" + depname + "&labopt=1", function (data) {
                getXmlData(data);//retrieving xml data from database								
                addClusterOnMap();//clustering
            });
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
                $.get("lib/inc/marker.inc.php?allFSPA=" + depname, function (data) {
                    getXmlData(data);//retrieving xml data from database								
                    addClusterOnMap();//clustering									
                });//end get
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
}

