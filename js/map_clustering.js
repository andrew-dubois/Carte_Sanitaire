/* 
 For current use on the DCart (Cartographie) page
 Handles the clustering functions for the map
 */

var markerclusterer;                // global array of markers for clustering

/*
 * Retrieve xml data from database for viewing markers
 * @param data
 * @return void
 */
function getXmlData(data) {
    var xml = xmlParse(data);
    FACILITY_ID = [];	//clear this array			  
    var markers = xml.documentElement.getElementsByTagName("marker");
    removeClusterOnMap();//remove markers from the map
    for (var i = 0; i < markers.length; i++) {
        var lat = parseFloat(markers[i].getAttribute("lat"));
        var lng = parseFloat(markers[i].getAttribute("lng"));
        var facType = markers[i].getAttribute("facility_type");
        var id = markers[i].getAttribute("id_code");
        var title = markers[i].getAttribute("titre");
        var manag_authority = markers[i].getAttribute("manag_authority");
        var vComm_name = markers[i].getAttribute("vComm_name");
        var deptname = markers[i].getAttribute("departement_name");
        var nb_bed_overnight = markers[i].getAttribute("nb_bed_overnight");
        var nb_gen_medPrac = markers[i].getAttribute("nb_gen_medPrac");
        var nb_spePrac = markers[i].getAttribute("nb_spePrac");
        var typ_service_avail = markers[i].getAttribute("typ_service_avail");
        //services variables
        var ChildVacc = markers[i].getAttribute("ChildVacc");
        var GrowthMon = markers[i].getAttribute("GrowthMon");
        var Sickchild = markers[i].getAttribute("Sickchild");
        var FP = markers[i].getAttribute("FP");
        var ANC = markers[i].getAttribute("ANC");
        var PMTCT = markers[i].getAttribute("PMTCT");
        var delivery = markers[i].getAttribute("delivery");
        var malaria = markers[i].getAttribute("malaria");
        var sti = markers[i].getAttribute("sti");
        var tb = markers[i].getAttribute("tb");
        var hivct = markers[i].getAttribute("hivct");
        var minorsurgery = markers[i].getAttribute("minorsurgery");
        var csections = markers[i].getAttribute("csections");

        facTypeIcon = facType;
        addMarkerOnMap(id, lat, lng, facType, title, manag_authority, vComm_name, deptname, nb_bed_overnight, nb_gen_medPrac, nb_spePrac, typ_service_avail, ChildVacc, GrowthMon, Sickchild, FP, ANC, PMTCT, delivery, malaria, sti, tb, hivct, minorsurgery, csections);

    }
    //store fac id in session								
    storeFacID();
}

var clusterInfoWindow;

//Add markers by group using clusters
function addClusterOnMap() {
    clusterInfoWindow = new google.maps.InfoWindow({
        pixelOffset: new google.maps.Size(0, -20)
    });
    markerclusterer.addMarkers(markersM);
    google.maps.event.addListener(markerclusterer, "mouseover", function (mcluster) {
        clusterInfoWindow.setPosition(mcluster.getCenter());
        var markers = mcluster.getMarkers();
        var facTypes_in_marker = new Array();
        for (var marker in markers)
        {
            var marker_props = markers[marker];
            if (!(marker_props.facType in facTypes_in_marker))
                facTypes_in_marker[marker_props.facType] = 1;
            else
                facTypes_in_marker[marker_props.facType] = facTypes_in_marker[marker_props.facType] + 1
        }
        var htmlString = "";
        for (var facType in facTypes_in_marker)
        {
            htmlString += "<strong>" + facTypes_in_marker[facType] + "</strong> " + facType + "<br />";
        }
        clusterInfoWindow.setContent(htmlString);
        clusterInfoWindow.open(map);
    });
    
    google.maps.event.addListener(markerclusterer, "click", function (mcluster) {
        clusterInfoWindow.close();
    });

    google.maps.event.addListener(markerclusterer, "mouseout", function (mcluster) {
        clusterInfoWindow.close();
    });
}
//Remove clusters
function removeClusterOnMap() {
    markerclusterer.clearMarkers();
    markersM = [];
}

// Sets the map on all markers in the array.
function setAllMap(map) {
    for (var i = 0; i < markersM.length; i++) {
        markersM[i].setMap(map);
    }
}

// Removes the markers from the map, but keeps them in the array.
function clearMarkers() {
    setAllMap(null);
}

// Shows any markers currently in the array.
function showMarkers() {
    setAllMap(map);
}

// Deletes all markers in the array by removing references to them.
function deleteMarkers() {
    clearMarkers();
    markersM = [];
}

/*
 * Creates markerCluster for each department
 * @param lng lat
 * @return none
 */

function createMarkerClusterforDep(lat, lng, idDep) {
    var latlng = new google.maps.LatLng(lat, lng);
    var marker = new google.maps.Marker({
        position: latlng
    });
    //adding coord to the markersClus variables by idDep
    if (idDep == 1) {
        markersClus[1].push(marker);
    }
    if (idDep == 8) {
        markersClus[8].push(marker);
    }
}
// adding marker to a markerClusterer
function addMarkerToMc(markersClus) {
    for (i = 0; i < markersClus.length; i++) {
        if (markersClus[i]) {
            mc.addMarkers(markersClus[i]);
            mc.setMaxZoom(8);
        }
    }
}
//remove markers from the map
function removeMarkersClMap(mc) {
    map.setZoom(8);
    mc.clearMarkers();
    clearMarkerCluster();
}
//clear markerCluster array
function clearMarkerCluster() {
    for (i = 0; i < markersClus.length; i++) {
        markersClus[i] = new Array();
    }
}

/*
 * Creates marker and add info on markers
 * @param lng lat
 * @return none
 */
function addMarkerOnMap(id, lat, lng, facType, tit, manag_authority, vComm_name, deptname, nb_bed_overnight, nb_gen_medPrac, nb_spePrac, typ_service_avail, ChildVacc, GrowthMon, Sickchild, FP, ANC, PMTCT, delivery, malaria, sti, tb, hivct, minorsurgery, csections) {
    // get all facility services and their names
    var fac_services = '';
    // Get an array of services available for this facility
    var services = facilityServices(ChildVacc, GrowthMon, Sickchild, FP, ANC, PMTCT, delivery, malaria, sti, tb, hivct, minorsurgery, csections);
    for (var i = 0; i < services.length; i++) {
        var fac_aliasName = services[i];
        // get a user friendly version of the service e.g. FP = Planification familiale (Family Planning)
        var fac_name = facilityServicesName(fac_aliasName);
        // comma seperate the string
        if ((i + 1) == services.length) {
            fac_services += fac_name;
        } else {
            fac_services += fac_name + ', ';
        }
    }

    //check service 24/24h available
    if (typ_service_avail == '1') {
        typ_service_avail = 'Oui';
    } else {
        if (typ_service_avail == '2') {
            typ_service_avail = 'Non'
        } else {
            typ_service_avail = 'Inconnu'
        }
    }
    var iconImage = typeFacIconMarker(facTypeIcon);
    var latlng = new google.maps.LatLng(lat, lng);
    var marker = new google.maps.Marker({
        position: latlng,
        icon: iconImage,
        //map: map,
        title: tit
    });
    marker.setAnimation(google.maps.Animation.DROP);
    markersM.push(marker);

    /*if(infoWindow){
     infoWindow.close()
     }*/
    marker.facType = facType;
    marker.html = "<div class='infoWin'> <h2>" + tit + "&nbsp;&nbsp;<span class='badge badge-important'>" + deptname + ", " + vComm_name + "</span></h2>\n\
                  <table class='table table-striped table-condensed table-hover'><tr><td><strong>Type:</strong></td><td>" + facType + "</td>\n\</tr> \n\
                  <tr><td><strong>Statut:</strong></td><td>" + manag_authority + "</td></tr> \n\
                  <tr><td><strong>Nombre de lits pour hospitalisation:</strong></td><td>" + nb_bed_overnight + "</td></tr> \n\
                  <tr><td><strong>Nombre de medcins generalistes</strong></td><td>" + nb_gen_medPrac + "</td></tr> \n\
                  <tr><td><strong>Nombre de specialites generalistes</strong></td><td>" + nb_spePrac + "</td></tr> \n\
                  <tr><td><strong>Service disponible 24h/24</strong></td><td>" + typ_service_avail + "</td></tr> \n\
                  <tr><td colspan='2'><strong>Service(s) offert(s):</strong></td></tr>\n\
                  <tr><td colspan='2'>" + fac_services + "</td></tr> </table> \n\
                  <a href='inst.php?c=" + id + "' class='btn btn-danger pull-right'>En savoir plus &raquo;</a></div>";
    infoWindow = new google.maps.InfoWindow();
    google.maps.event.addListener(marker, 'click', function () {
        infoWindow.setContent(this.html);
        infoWindow.open(map, this);
    });

    /***Store makers values for the printing page**/
    /*var fac_services=ChildVacc+','+GrowthMon+','+Sickchild+','+FP+','+ANC+','+PMTCT+','+delivery+','+malaria+','+sti+','+tb+','+hivct+','+minorsurgery+','+csections;
     var tempArray={facid:id,latitude:lat,longitude:lng,facilitietype:facType,services:fac_services}
     printing_markers.push(tempArray);*/

    /*Stores facility id in session for mapprinter*/
    FACILITY_ID.push(id);
}

//XML parser
function xmlParse(str) {
    if (typeof ActiveXObject != 'undefined' && typeof GetObject != 'undefined') {
        var doc = new ActiveXObject('Microsoft.XMLDOM');
        doc.loadXML(str);
        return doc;
    }
    if (typeof DOMParser != 'undefined') {
        return (new DOMParser()).parseFromString(str, 'text/xml');
    }
    return createElement('div', null);
}

/*
 * View the facility type number by department
 * @param none
 * @return void
 */
function getNumFacTypeByDep() {
    var depname = $('#dep-list-dropdmenu').val();
    $.get("lib/inc/orgunit.inc.php?facSPAtypeDep=" + depname, function (data) {
        var obj = jQuery.parseJSON(data);
        //reset the number of facility by type	
        $('#fac_type li span.badge.badge-info.stotal').each(function () {
            $(this).text("-");
        });
        //Update the number of facility by type	
        var facTypeTotal = 0;
        $.each(obj, function () {

            var facTypeName = this['facilitytype'];
            var facTypeNumber = this['count'];
            switch (facTypeName) {
                case "Centre de sante a lit":
                    $('#fac_type li:eq(0) span.badge.badge-info.stotal').text(facTypeNumber);
                    facTypeTotal += parseInt(facTypeNumber);

                    break;
                case "Centre de sante sans lit":
                    $('#fac_type li:eq(1) span.badge.badge-info.stotal').text(facTypeNumber);
                    facTypeTotal += parseInt(facTypeNumber);
                    break;

                case "Hopital":
                    $('#fac_type li:eq(2) span.badge.badge-info.stotal').text(facTypeNumber);
                    facTypeTotal += parseInt(facTypeNumber);
                    break;

                case "Hopital communautaire de reference":
                    $('#fac_type li:eq(3) span.badge.badge-info.stotal').text(facTypeNumber);
                    facTypeTotal += parseInt(facTypeNumber);
                    break;

                case "Hopital universitaire":
                    $('#fac_type li:eq(4) span.badge.badge-info.stotal').text(facTypeNumber);
                    facTypeTotal += parseInt(facTypeNumber);
                    break;

                case "Dispensaire":
                    $('#fac_type li:eq(5) span.badge.badge-info.stotal').text(facTypeNumber);
                    facTypeTotal += parseInt(facTypeNumber);
                    break;

                case "Hopital departemental":
                    $('#fac_type li:eq(6) span.badge.badge-info.stotal').text(facTypeNumber);
                    facTypeTotal += parseInt(facTypeNumber);
                    break;
            }
        });
        $('#fac_typeTotal').text(facTypeTotal);
    });
}

/*
 * Icon Marker for each facility
 * @param facility type
 * @return icon path
 */
function typeFacIconMarker(facType) {
    var path = 'images/mapicons/';
    switch (facType) {
        case 'Centre de sante sans lit':
            path = path + 'csl22.png';
            break;

        case 'Centre de sante a lit':
            path = path + 'cal22.png';
            break;

        case 'Dispensaire':
            path = path + 'disp22.png';
            break;

        case 'Hopital':
            path = path + 'hcr2_22.png';
            break;

        case 'Hopital communautaire de reference':
            path = path + 'hcr22.png';
            break;

        case 'Hopital departemental':
            path = path + 'hdep22.png';
            break;

        case 'Hopital universitaire':
            path = path + 'hu22.png';
            break;
    }
    return path;
}


/*
 * Return facility services names
 * @param lng lat
 * @return none
 */
function facilityServicesName(serviceNameAlias) {

    var serviceName = "";
    switch (serviceNameAlias) {
        case 'ChildVacc':
            serviceName = 'Vaccination';
            break;

        case 'GrowthMon':
            serviceName = 'Pes&eacute;es de l\'enfant';
            break;

        case 'Sickchild':
            serviceName = 'Services p&eacute;diatriques';
            break;

        case 'FP':
            serviceName = 'Planification familiale';
            break;

        case 'ANC':
            serviceName = 'Clinique pr&eacutenatale';
            break;

        case 'PMTCT':
            serviceName = 'PTME';
            break;

        case 'delivery':
            serviceName = 'Accouchement';
            break;

        case 'malaria':
            serviceName = 'Prise en charge malaria';
            break;

        case 'sti':
            serviceName = 'Prise en charge MST';
            break;

        case 'tb':
            serviceName = 'Prise en charge en TB';
            break;

        case 'hivct':
            serviceName = 'Soin et traitement VIH';
            break;

        case 'minorsurgery':
            serviceName = 'Chirurgie mineure';
            break;

        case 'csections':
            serviceName = 'C&eacute;sarienne';
            break;

        default:
            serviceName = 'Inconnu';
    }

    return serviceName;
}
/*
 * Return facility services
 * @param services values
 * @return array
 */
function facilityServices(ChildVacc, GrowthMon, Sickchild, FP, ANC, PMTCT, delivery, malaria, sti, tb, hivct, minorsurgery, csections) {
    var service_given = [];

    if (malaria == 1) {
        service_given.push("malaria");
    }

    if (sti == 1) {
        service_given.push("sti");
    }

    if (tb == 1) {
        service_given.push("tb");
    }

    if (hivct == 1) {
        service_given.push("hivct");
    }

    if (minorsurgery == 1) {
        service_given.push("minorsurgery");
    }

    if (csections == 1) {
        service_given.push("csections");
    }

    if (delivery == 1) {
        service_given.push("delivery");
    }

    if (ChildVacc == 1) {
        service_given.push("ChildVacc");
    }

    if (GrowthMon == 1) {
        service_given.push("GrowthMon");
    }

    if (Sickchild == 1) {
        service_given.push("Sickchild");
    }

    if (FP == 1) {
        service_given.push("FP");
    }

    if (ANC == 1) {
        service_given.push("ANC");
    }

    if (PMTCT == 1) {
        service_given.push("PMTCT");
    }
    return service_given;
}