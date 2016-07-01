/* 
 For current use on the DCart (Cartographie) page
 Handles the clustering functions for the map
 */

var markerclusterer;                // global array of markers for clustering
var facTypeCount = [];
facTypeCount['lab'] = 0;            // Preset lab var (count of lab service facilities)
facTypeCount['hiv'] = 0;            // preset hiv var (count of hiv service facilities)
var FullInstlist = "";              // First time page is loaded, this will be filled with institutions, from there filtering by type can be done on this list
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
    FullInstlist = markers;
    facTypeCount = [];
    facTypeCount['lab'] = 0;
    facTypeCount['hiv'] = 0;
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

        var isLab = markers[i].getAttribute("is_Lab");
        var isHIV = markers[i].getAttribute("is_HIVService");

        // Rather do a count of facilities here instead of another db call
        if (!(facType in facTypeCount))
        {
            facTypeCount[facType] = 1;
        } else
        {
            facTypeCount[facType] += 1;
        }

        if (isLab === "1")
            facTypeCount['lab'] += 1;

        if (isHIV === "1")
            facTypeCount['hiv'] += 1;

        facTypeIcon = facType;
        addMarkerOnMap(id, lat, lng, facType, title, manag_authority, vComm_name, deptname, nb_bed_overnight, nb_gen_medPrac, nb_spePrac, typ_service_avail, ChildVacc, GrowthMon, Sickchild, FP, ANC, PMTCT, delivery, malaria, sti, tb, hivct, minorsurgery, csections);
    }
}

function FilterMapByType(facilityType) {
    removeClusterOnMap();//remove markers from the map

    var facTypes = facilityType.split(':');

    var services = [];
    var optF = '';

    if ($('#cbxFilterbyServs').prop('checked')) {
        optF = $(".opt_filter_r:checked").val();
        facTypeCount = [];
        facTypeCount['lab'] = 0;
        facTypeCount['hiv'] = 0;
        $('#clFilters .cbxServFil:checked').each(function (i) {
            services.push($(this).val());
        });
    }

    var markers = FullInstlist;
    for (var i = 0; i < markers.length; i++) {
        if (facilityType != 'all')
            if (facilityType == "lab" || facilityType == 'vih')
            {
                if (facilityType == "lab" && !(markers[i].getAttribute("is_Lab") == "1"))
                    continue;
                if (facilityType == "vih" && !(markers[i].getAttribute("is_HIVService") == "1"))
                    continue;
            } else
            if (facTypes.indexOf(markers[i].getAttribute("facility_type")) === -1)
                continue;

        var ServicesAvailable = [];

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
        if (ChildVacc == 1)
            ServicesAvailable.push('childvacc');
        var GrowthMon = markers[i].getAttribute("GrowthMon");
        if (GrowthMon == 1)
            ServicesAvailable.push('growthmon');
        var Sickchild = markers[i].getAttribute("Sickchild");
        if (Sickchild == 1)
            ServicesAvailable.push('sickchild');
        var FP = markers[i].getAttribute("FP");
        if (FP == 1)
            ServicesAvailable.push('fp');
        var ANC = markers[i].getAttribute("ANC");
        if (ANC == 1)
            ServicesAvailable.push('anc');
        var PMTCT = markers[i].getAttribute("PMTCT");
        if (PMTCT == 1)
            ServicesAvailable.push('pmtct');
        var delivery = markers[i].getAttribute("delivery");
        if (delivery == 1)
            ServicesAvailable.push('delivery');
        var malaria = markers[i].getAttribute("malaria");
        if (malaria == 1)
            ServicesAvailable.push('malaria');
        var sti = markers[i].getAttribute("sti");
        if (sti == 1)
            ServicesAvailable.push('sti');
        var tb = markers[i].getAttribute("tb");
        if (tb == 1)
            ServicesAvailable.push('tb');
        var hivct = markers[i].getAttribute("hivct");
        if (hivct == 1)
            ServicesAvailable.push('hivct');
        var minorsurgery = markers[i].getAttribute("minorsurgery");
        if (minorsurgery == 1)
            ServicesAvailable.push('minorsurgery');
        var csections = markers[i].getAttribute("csections");
        if (csections == 1)
            ServicesAvailable.push('csections');

        if (services.length > 0)
        {
            if (filterByService(services, ServicesAvailable, optF))
                continue;

            var isLab = markers[i].getAttribute("is_Lab");
            var isHIV = markers[i].getAttribute("is_HIVService");

            // Rather do a count of facilities here instead of another db call
            if (!(facType in facTypeCount))
            {
                facTypeCount[facType] = 1;
            } else
            {
                facTypeCount[facType] += 1;
            }

            if (isLab === "1")
                facTypeCount['lab'] += 1;

            if (isHIV === "1")
                facTypeCount['hiv'] += 1;
        }

        facTypeIcon = facType;
        addMarkerOnMap(id, lat, lng, facType, title, manag_authority, vComm_name, deptname, nb_bed_overnight, nb_gen_medPrac, nb_spePrac, typ_service_avail, ChildVacc, GrowthMon, Sickchild, FP, ANC, PMTCT, delivery, malaria, sti, tb, hivct, minorsurgery, csections);
    }
}

function filterByService(services, servicesAvail, optF)
{
    var intersect = $(services).filter(servicesAvail);

    if (optF === 'OR')
    {
        if (intersect.length > 0)
            return false;
        else
            return true
    } else    // = AND
    {
        if (intersect.length == services.length)
            return false;
        else
            return true;
    }
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

    if (fac_services.length == 0)
        fac_services = 'Inconnu';

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
    //reset the number of facility by type	
    $('#fac_type li span.badge.badge-info.stotal').each(function () {
        $(this).text("-");
    });
    //Update the number of facility by type	
    var facTypeTotal = 0;

    $('#fac_type li').eq(0).find('span.badge.badge-info.stotal').text(facTypeCount["CAL"]);
    if ("CAL" in facTypeCount)
        facTypeTotal += facTypeCount["CAL"];

    $('#fac_type li').eq(1).find('span.badge.badge-info.stotal').text(facTypeCount["CSL"]);
    if ("CSL" in facTypeCount)
        facTypeTotal += facTypeCount["CSL"];

    $('#fac_type li').eq(2).find('span.badge.badge-info.stotal').text(facTypeCount["Hopital"]);
    if ("Hopital" in facTypeCount)
        facTypeTotal += facTypeCount["Hopital"];

    $('#fac_type li').eq(3).find('span.badge.badge-info.stotal').text(facTypeCount["HCR"]);
    if ("HCR" in facTypeCount)
        facTypeTotal += facTypeCount["HCR"];

    $('#fac_type li').eq(4).find('span.badge.badge-info.stotal').text(facTypeCount["Hopital universitaire"]);
    if ("Hopital universitaire" in facTypeCount)
        facTypeTotal += facTypeCount["Hopital universitaire"];

    $('#fac_type li').eq(5).find('span.badge.badge-info.stotal').text(facTypeCount["Dispensaire"]);
    if ("Dispensaire" in facTypeCount)
        facTypeTotal += facTypeCount["Dispensaire"];

    $('#fac_type li').eq(6).find('span.badge.badge-info.stotal').text(facTypeCount["Hopital departemental"]);
    if ("Hopital departemental" in facTypeCount)
        facTypeTotal += facTypeCount["Hopital departemental"];

    $('#fac_typeTotal').text(facTypeTotal);
}

/*
 * Icon Marker for each facility
 * @param facility type
 * @return icon path
 */
function typeFacIconMarker(facType) {
    var path = 'images/mapicons/';
    switch (facType) {
        case 'CSL':
            path = path + 'csl22.png';
            break;

        case 'CAL':
            path = path + 'cal22.png';
            break;

        case 'Dispensaire':
            path = path + 'disp22.png';
            break;

        case 'Hopital':
            path = path + 'hcr2_22.png';
            break;

        case 'HCR':
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