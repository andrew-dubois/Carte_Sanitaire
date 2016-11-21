/* GLOBAL Variables initialisation */
var geoXml = null;
var geoXmlDoc = null;
var removPoly = Array();
var infoWindow = null;
var map = null;

// Create an array of styles for the map.
var styles = [
    {
        stylers: [
            {hue: "#D4E8F9"},
            {saturation: -10}
        ]
    }, {
        featureType: "road",
        elementType: "geometry",
        stylers: [
            {color: "#dd61a3"},
            {visibility: "off"}
        ]
    }, {
        featureType: "road",
        elementType: "labels",
        stylers: [
            {visibility: "off"}
        ]
    }, {
        featureType: "administrative.locality",
        elementType: "labels.text.fill",
        stylers: [
            {visibility: "on"},
            {color: "#000000"}
        ]
    }, {
        featureType: "administrative.province",
        elementType: "geometry.stroke",
        stylers: [
            {color: "#dd61a3"},
            {weight: 1},
            {visibility: "on"}
        ]
    }
];

/***JQUERY STATEMENT***/
$(document).ready(function (e) {
    var styledMap = new google.maps.StyledMapType(styles, {name: "Principale"});
    var mapDiv = document.getElementById('cs_map');
    var latlng = new google.maps.LatLng(19.02577027586866, -72.70854949951172);

    var opts = {
        zoom: 9,
        center: latlng,
        background: '#b3d1ff',
        mapTypeControl: true,
        mapTypeControlOptions: {
            style: google.maps.MapTypeControlStyle.HORIZONTAL_MENU,
            position: google.maps.ControlPosition.TOP_RIGHT,
            mapTypeIds: [
                'cs_map_style_id',
                google.maps.MapTypeId.ROADMAP,
                google.maps.MapTypeId.SATELLITE,
                google.maps.MapTypeId.TERRAIN
            ]
        }
        //mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(mapDiv, opts);
    //Associate the styled map with the MapTypeId and set it to display.
    map.mapTypes.set('cs_map_style_id', styledMap);
    map.setMapTypeId('cs_map_style_id');

    //Setup The cluster variable
    var mcOptions = {gridSize: 60, maxZoom: 10};
    markerclusterer = new MarkerClusterer(map, [], mcOptions);

    loadCommunePolys();

    /*****************************************GOOGLE MAP EVENTS****************************************/
    google.maps.event.addListenerOnce(map, 'idle', function () {
        executeRemoveDom();
        $('#overlayDiv').css('visibility', 'hidden');
    });

    /*****************************************END GOOGLE MAP EVENT*************************************/

    /*****************************************COMPONENTS EVENT*****************************************/

    // Query per indicators
    $('input[type=radio]').on('change', function () {
        var yeardata = $('data-year-list').val();
        var nameDep = $('#datap-dep-list').val();
        var indicator_name = $(this).attr('data-column');
        var indicator_val = $(this).attr('value');
        //removeColorDep();
        useTheData_colorizeHTCommDep();//executeColorizeComm();
        //runColorizeHTICommDep();
        //pan to the departement								
        zoomDep(nameDep);
        $.get("lib/inc/orgunit.inc.php?ind_name=" + indicator_name + "&ind_val=" + indicator_val + "&deptname=" + nameDep, function (data) {
            chartmarkerOnMap(data, 'commune');
        });//end get
    });
});

var domInfoWindow;
//Execute remove dominican area
function executeRemoveDom() {
    $.get("lib/inc/polygons.inc.php?DomRep=1", function (data) {
        var coords = $.parseJSON(data);

        var DomRep = new google.maps.Polygon({
            paths: coords,
            strokeColor: '#B7DCFC',
            strokeOpacity: 0.8,
            strokeWeight: 3,
            fillColor: '#B7DCFC',
            fillOpacity: 0.8
        });
        DomRep.setMap(map);

        domInfoWindow = new google.maps.InfoWindow({content: "Dominican Republic"});

        DomRep.addListener('click', function (event) {
            domInfoWindow.setPosition(event.latLng);
            domInfoWindow.open(map);
        });
    });
}

//////////////// SHAPE COLOR FUNCTION /////////////////////

//function reading the kml file
function useTheData_colorizeHT(doc) {
    geoXmlDoc = doc;

    for (var j = 0; j < geoXmlDoc.length; j++) {
        for (var i = 0; i < geoXmlDoc[j].placemarks.length; i++) {
            placemark = geoXmlDoc[j].placemarks[i];
            placemarkName = placemark.name;
            removPoly.push(placemark.polygon);
            colorizeHT(placemark.polygon, placemarkName);
        }
    }
}

//Function View facilities by communes -  communes boundaries included

function viewAllFac_by_comm(nameDep) {
    removeColorDep();
    runColorizeHTICommDep();
    //pan to the departement
    //var nameDep=$('#datap-dep-list').val();				
    zoomDep(nameDep);
    //exception for grand'anse name
    if (nameDep == 'Grand-Anse') {
        nameDep = 'Grand Anse';
    }
    $.get("lib/inc/marker.inc.php?allFSPA=" + nameDep, function (data) {
        getXmlData(data);//retrieving xml data from database				  
        addClusterOnMap();//clustering							
    });//end get
}

var comsPolygons = [];  // Global storage for polygons
//Execute the colorization of the communes
function loadCommunePolys() {
    $.get("lib/inc/polygons.inc.php?Communes=1", function (data) {
        var coms = $.parseJSON(data);

        var comInfoWindow = new google.maps.InfoWindow({content: ""});

        for (var com in coms) {
            var comName = coms[com].Name;
            var ComPoly = {
                ComName: comName,
                Polys: []
            };

            for (var poly in coms[com].Polys) {
                var HaitiR = new google.maps.Polygon({
                    paths: coms[com].Polys[poly].Coords,
                    strokeColor: '#ea5656',
                    strokeOpacity: 0.8,
                    strokeWeight: 1,
                    fillColor: '#ea5656',
                    fillOpacity: 0.4
                });

                ComPoly.Polys.push(HaitiR);

                //HaitiR.setMap(map);

                BindDepInfoWindow(HaitiR, comName, comInfoWindow);
            }

            comsPolygons.push(ComPoly);
        }
    });
}

function BindDepInfoWindow(poly, comName, comInfoWindow) {
    poly.addListener('click', function (event) {
        comInfoWindow.setPosition(event.latLng);
        comInfoWindow.setContent("<strong>" + comName + "</strong>");
        comInfoWindow.open(map);
    });
}

//function reading the kml file for coloration communes of a department
function useTheData_colorizeHTCommDep() {
    var depname = $('#datap-dep-list').val();
    //get all department communes
    var data_pop = new Array();//population data
    $.get("lib/inc/popdata.inc.php?commlist=1&deptname=" + depname, function (data) {
        var obj = jQuery.parseJSON(data);
        $.each(obj, function () {
            var valObj = new Array();
            valObj[0] = this['communes'];
            valObj[1] = this['population_generale'];
            data_pop.push(valObj);
        });
        colorizeHTComm(data_pop);
    });
}

//remove colorization of the departments commuunes
//function removeColorDep() {
//    if (removPoly) {
//        //alert(removPoly.length);			
//        for (var i = 0; i < removPoly.length; i++) {
//            removPoly[i].setMap(null);
//        }
//    }
//    removPoly = [];
//}
//Colorize the departements
function colorizeHT(poly, polyName) {
    poly.setOptions({fillColor: '#D6E9F9', strokeWeight: 1, strokeColor: '#175F9C', fillOpacity: 1});
}
//Colorize the departements commune
//@param array
// return none
function colorizeHTComm(datapop) {
    //get all communes list
    communelist = new Array();

    for (var j = 0; j < datapop.length; j++) {
        communelist.push(datapop[j][0]);
    }
    //console.log(communelist);
    //get colors for the communes
    var INTERVALL_COLOR = 5;
    var colorstring = getHexColorsBetween('red', 'green', INTERVALL_COLOR);
    var colors = colorstring.split(',');
    //create an array containing all the communes with their colors and population number 
    var com_list = new Array();
    //give the number of communes per group
    var nbCommGroupItem = (communelist.length / INTERVALL_COLOR);
    nbCommGroupItem = parseInt(nbCommGroupItem, 10);
    //console.log("nbCommGroupItem-->"+nbCommGroupItem);
    var nbCommLastGroupItem = communelist.length % INTERVALL_COLOR;
    //console.log("nbCommLastGroupItem-->"+nbCommLastGroupItem);
    var ind_datapop = 0;
    var sizeGrpItem = 0;
    /*
     if(nbCommLastGroupItem>0){
     INTERVALL_COLOR=INTERVALL_COLOR+1;
     }*/
    for (var j = 0; j < INTERVALL_COLOR; j++) {
        if (nbCommLastGroupItem == 0) {
            sizeGrpItem = nbCommGroupItem;
        } else {
            if (j == (INTERVALL_COLOR - 1)) {
                sizeGrpItem = nbCommGroupItem + nbCommLastGroupItem;
            } else {
                sizeGrpItem = nbCommGroupItem;
            }
        }

        for (var i = 0; i < sizeGrpItem; i++) {
            var arrTemp = new Array();
            arrTemp[0] = datapop[ind_datapop][0];//commune name
            arrTemp[1] = datapop[ind_datapop][1];//density
            arrTemp[2] = colors[j];
            com_list.push(arrTemp);
            ind_datapop++;
        }
    }
    //console.log(com_list);

    //colorize shape	
    for (var i = 0; i < comsPolygons.length; i++) {
        var fcolor = '#ccc';
        for (var j = 0; j < com_list.length; j++) {
            if (comsPolygons[i].ComName === com_list[j][0])
            {
                fcolor = com_list[j][2];
                break;
            }
        }
        if (fcolor != '#ccc')
        {
            for (var poly = 0; poly < comsPolygons[i].Polys.length; poly++)//comsPolygons[i].Polys)
            {

                comsPolygons[i].Polys[poly].fillColor = fcolor;
                comsPolygons[i].Polys[poly].strokeWeight = 1;
                comsPolygons[i].Polys[poly].strokeColor = '#EAEEF1';
                comsPolygons[i].Polys[poly].fillOpacity = 0.6;
                comsPolygons[i].Polys[poly].setMap(map);
            }
        }
//        else
//        {
//            for (var poly = 0; poly < comsPolygons[i].Polys.length; poly++)//
//            {
//                comsPolygons[i].Polys[poly].fillColor = fcolor;//'#ccc';
//                comsPolygons[i].Polys[poly].strokeWeight = 0.1;
//                comsPolygons[i].Polys[poly].strokeColor = '#175F9C';
//                comsPolygons[i].Polys[poly].fillOpacity = 0.2;
//                comsPolygons[i].Polys[poly].setMap(map);
//            }
//        }
    }
    //Generate legend content				

    var legend_color_inter = [];
    var ind = 0;
    var int_1 = 0;
    var int_2 = 0;
    var lg_color = '';
    var sizeGrpItem2
    for (var i = 0; i < INTERVALL_COLOR; i++) {

        if (nbCommLastGroupItem == 0) {
            sizeGrpItem2 = nbCommGroupItem;
        } else {
            if (j == (INTERVALL_COLOR - 1)) {
                sizeGrpItem2 = nbCommLastGroupItem
            } else {
                sizeGrpItem2 = nbCommGroupItem;
            }
        }

        for (var j = 0; j < sizeGrpItem2; j++) {
            if (j == 0) {
                int_1 = com_list[ind + j][1];
            }

            if (j == (sizeGrpItem2 - 1)) {

                int_2 = com_list[ind + j][1];
                lg_color = com_list[ind + j][2];
                legend_color_inter[i] = int_1 + ',' + int_2 + ',' + lg_color;
            }
        }
        ind = ind + sizeGrpItem2;

    }
    //add legend content					
    datapop_legend(legend_color_inter);
}

//add and replace legend content
function datapop_legend(datalegend) {
    var contentLegend = '';
    for (var i = 0; i < datalegend.length; i++) {
        var itemlegend = datalegend[i].split(',');
        var int1 = itemlegend[0];
        var int2 = itemlegend[1];
        var lcolor = itemlegend[2];
        contentLegend += '<tr><td><div class="lg_dpop_color" style="background:' + lcolor + '"></div></td><td>' + int1 + ' - ' + int2 + '</td></tr>'
    }
    $('.legend_dpop').html('<tr><th colspan="2" class="legend_title">&raquo; Donn&eacute;es populationnelles</th></tr>' + contentLegend);
}

//Execute the colorization of the departements
var filename = 'js/gis/htiadm3.kml'
function runColorizeHTI() {
    geoXml = new geoXML3.parser({
        map: map,
        //infoWindow: infowindow,
        singleInfoWindow: true,
        zoom: false,
        markerOptions: {optimized: false},
        suppressInfoWindows: true,
        afterParse: useTheData_colorizeHT
    });
    geoXml.parse(filename);
}
//execute the colorization of the communes of a departement
//function runColorizeHTICommDep() {
//    geoXml = new geoXML3.parser({
//        map: map,
//        //infoWindow: infowindow,
//        singleInfoWindow: true,
//        zoom: false,
//        markerOptions: {optimized: false},
//        suppressInfoWindows: false,
//        afterParse: useTheData_colorizeHTCommDep
//    });
//    geoXml.parse(filename);
//}
//Generate color for kml file
function kmlColor(kmlIn) {
    var kmlColor = {};
    if (kmlIn) {
        aa = kmlIn.substr(0, 2);
        bb = kmlIn.substr(2, 2);
        gg = kmlIn.substr(4, 2);
        rr = kmlIn.substr(6, 2);
        kmlColor.color = "#" + rr + gg + bb;
        kmlColor.opacity = parseInt(aa, 16) / 256;
    } else {
        // defaults
        kmlColor.color = randomColor();
        kmlColor.opacity = 0.45;
    }
    return kmlColor;
}
// randomize color
function randomColor() {
    var color = "#";
    var colorNum = Math.random() * 8388607.0;  // 8388607 = Math.pow(2,23)-1
    var colorStr = colorNum.toString(16);
    color += colorStr.substring(0, colorStr.indexOf('.'));
    return color;
}
//////////////// end SHAPE COLOR FUNCTION /////////////////////



/******************************* FUNCTION TO BE SHARED *****************************************/


/*
 * Retrieve xml data from database for viewing markers
 * @param data
 * @return void
 */
function getXmlData(data) {
    var xml = xmlParse(data);
    var markers = xml.documentElement.getElementsByTagName("marker");
    removeClusterOnMap();//remove markers form the map
    for (var i = 0; i < markers.length; i++) {
        var id = markers[i].getAttribute("id_code");
        var lat = parseFloat(markers[i].getAttribute("lat"));
        var lng = parseFloat(markers[i].getAttribute("lng"));
        var facType = markers[i].getAttribute("facility_type");
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
 * @param lng lat
 * @return none
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



/*
 * Creates marker and add info on markers
 * @param lng lat
 * @return none
 */
function addMarkerOnMap(id, lat, lng, facType, tit, manag_authority, vComm_name, deptname, nb_bed_overnight, nb_gen_medPrac, nb_spePrac, typ_service_avail, ChildVacc, GrowthMon, Sickchild, FP, ANC, PMTCT, delivery, malaria, sti, tb, hivct, minorsurgery, csections) {
    // get all facility services and their names
    var fac_services = '';
    var services = facilityServices(ChildVacc, GrowthMon, Sickchild, FP, ANC, PMTCT, delivery, malaria, sti, tb, hivct, minorsurgery, csections);
    for (var i = 0; i < services.length; i++) {
        var fac_aliasName = services[i];
        var fac_name = facilityServicesName(fac_aliasName);
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
    //map.setZoom(10);
    //map.panTo(latlng);
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
    marker.html = "<div class='infoWin'> <h2>" + tit + "&nbsp;&nbsp;<span class='badge badge-important'>" + deptname + ", " + vComm_name + "</span></h2> <table class='table table-striped table-condensed table-hover'><tr><td><strong>Type:</strong></td><td>" + facType + "</td></tr> <tr><td><strong>Statut:</strong></td><td>" + manag_authority + "</td></tr> <tr><td><strong>Nombre de lits pour hospitalisation:</strong></td><td>" + nb_bed_overnight + "</td></tr> <tr><td><strong>Nombre de medcins generalistes</strong></td><td>" + nb_gen_medPrac + "</td></tr> <tr><td><strong>Nombre de specialites generalistes</strong></td><td>" + nb_spePrac + "</td></tr> <tr><td><strong>Service disponible 24h/24</strong></td><td>" + typ_service_avail + "</td></tr> <tr><td colspan='2'><strong>Service(s) offert(s):</strong></td></tr><tr><td colspan='2'>" + fac_services + "</td></tr> </table> <a href='inst.php?c=" + id + "' class='btn btn-danger pull-right'>En savoir plus &raquo;</a></div>";

    infoWindow = new google.maps.InfoWindow();
    google.maps.event.addListener(marker, 'click', function () {
        infoWindow.setContent(this.html);
        infoWindow.open(map, this);
    });



}




//Add markers by group using clusters
function addClusterOnMap() {
    markerclusterer.addMarkers(markersM);
}

//Remove clusters
function removeClusterOnMap() {
    markerclusterer.clearMarkers();
    markersM = [];
}

//XML parser - shared
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

// fonction find colors between two colors
function getHexColorsBetween(color1, color2, nbColorInt) {
    var numberOfItems = nbColorInt;
    var rainbow = new Rainbow();
    rainbow.setNumberRange(1, numberOfItems);
    rainbow.setSpectrum(color1, color2);
    var s = '';
    for (var i = 1; i <= numberOfItems; i++) {
        var hexColour = rainbow.colourAt(i);
        s += '#' + hexColour + ', ';
    }
    return s;
}

function zoomDep(nameDep) {
    //Departement coordinates
    var latlng_artibonite = new google.maps.LatLng(19.3258059, -72.6595648);
    var latlng_centre = new google.maps.LatLng(19.1038864, -71.9594753);
    var latlng_grand_anse = new google.maps.LatLng(18.5168341, -74.0877972);
    var latlng_nippes = new google.maps.LatLng(18.4025279, -73.3802305);
    var latlng_nord = new google.maps.LatLng(19.5651345, -72.319948);
    var latlng_nord_est = new google.maps.LatLng(19.4939052, -71.896462);
    var latlng_nord_ouest = new google.maps.LatLng(19.8565999, -73.008612);
    var latlng_ouest = new google.maps.LatLng(18.6078519, -72.4961854);
    var latlng_sud = new google.maps.LatLng(18.2225856, -73.717487);
    var latlng_sud_est = new google.maps.LatLng(18.20753, -72.3686544);
    var latlng_haiti = new google.maps.LatLng(19.02577027586866, -72.70854949951172);
    //Checks what department to zoom in
    var zoomdep = 10;
    var zoomht = 9;
    switch (nameDep) {

        case 'Haiti':
            map.panTo(latlng_haiti);
            map.setZoom(zoomht);
            break;
        case 'Artibonite':
            map.panTo(latlng_artibonite);
            map.setZoom(10);
            break;
        case 'Centre':
            map.panTo(latlng_centre);
            map.setZoom(zoomdep);
            break;
        case 'Grand-Anse':
            map.panTo(latlng_grand_anse);
            map.setZoom(11);
            break;
        case 'Nippes':
            map.panTo(latlng_nippes);
            map.setZoom(11);
            break;
        case 'Nord':
            map.panTo(latlng_nord);
            map.setZoom(zoomdep);
            break;
        case 'Nord-Est':
            map.panTo(latlng_nord_est);
            map.setZoom(zoomdep);
            break;
        case 'Nord-Ouest':
            map.panTo(latlng_nord_ouest);
            map.setZoom(zoomdep);
            break;
        case 'Ouest':
            map.panTo(latlng_ouest);
            map.setZoom(zoomdep);
            break;
        case 'Sud':
            map.panTo(latlng_sud);
            map.setZoom(zoomdep);
            break;
        case 'Sud-Est':
            map.panTo(latlng_sud_est);
            map.setZoom(zoomdep);
            break;
        default:
            map.panTo(latlng_haiti);
            map.setZoom(zoomht);

    }

}

// uses the commune polygon to set the zoom and center of the map
function ZoomCom(compoly) {
    var poloyCenter = compoly.getBounds().getCenter();
    map.panTo(poloyCenter);

    var zoomLevel = map.getBoundsZoomLevel(compoly.getBounds());
    map.setZoom(zoomLevel);
}

/*
 * Create a chart image as an icon image for map marker
 * @param size_long_larg int, series_val_color Array
 * @return string
 */
function iconimagechart(size_long_larg, series_val_color) {
    var series_val = '';
    var series_color = '';
    //retreive series and color associated
    for (var i = 0; i < series_val_color.length; i++) {
        if (i == series_val_color.length - 1) {
            series_val += series_val_color[i][0];
            series_color += series_val_color[i][1];
        } else {
            series_val += series_val_color[i][0] + ',';
            series_color += series_val_color[i][1] + '|';
        }

    }
    var imagechart = 'http://chart.apis.google.com/chart?chf=a,s,000000|bg,s,67676700&chs=' + size_long_larg + 'x' + size_long_larg + '&cht=p&chco=' + series_color + '&chd=t:' + series_val;
    return imagechart;
}

//Show chart on map
function chartmarkerOnMap(datafac, viewAreaType) {
    var commlistDep = new Array();
    var facilityType_dep = new Array();//facility type for a dept
    var commfacilityType = new Array();

    var depname = $('#datap-dep-list').val();//contains the dept name chosen
    var communelist = new Array();
    $.get("lib/inc/orgunit.inc.php?facSPAtypeDep=" + depname, function (data) {
        var obj = jQuery.parseJSON(data);
        $.each(obj, function () {
            var tempAr = [];
            tempAr[0] = this['facilitytype'];
            tempAr[1] = this['count'];
            facilityType_dep.push(tempAr);
        });

        //dept commune list
        $.get("lib/inc/orgunit.inc.php?getcommName=1&deptname=" + depname, function (data2) {
            var commlistDep = jQuery.parseJSON(data2);
            var obj = jQuery.parseJSON(datafac);

            //if chart most be viewed for each commune
            if (viewAreaType == 'commune') {

                for (var i = 0; i < commlistDep.length; i++) {
                    var commDepName = commlistDep[i][0];//name of a dep comm

                    for (var j = 0; j < obj.length; j++) {
                        if (commDepName == obj[j]['commune_name']) {
                            var tempArr = Array();
                            tempArr[0] = obj[j]['id'];
                            tempArr[1] = obj[j]['facilitytype'];
                            tempArr[2] = obj[j]['commune_name'];
                            commfacilityType.push(tempArr);
                            //console.log('comm fac type:'+commDepName);
                            //console.log(commfacilityType);
                        }
                    }

                    //get the facility types name for the commune;
                    var commfacilityType_name = Array();
                    for (var ii = 0; ii < commfacilityType.length; ii++) {
                        for (var jj = 0; jj < facilityType_dep.length; jj++) {
                            if (facilityType_dep[jj][0] == commfacilityType[ii][1]) {
                                if (jQuery.inArray(commfacilityType[ii][1], commfacilityType_name) == -1) {
                                    commfacilityType_name.push(commfacilityType[ii][1]);
                                }
                            }
                        }
                    }
                    //get the facility types number for the commne
                    var nb_commfacilityType_name = new Array();
                    var cp = 0;
                    for (var iii = 0; iii < commfacilityType_name.length; iii++) {
                        for (var jjj = 0; jjj < commfacilityType.length; jjj++) {

                            if (commfacilityType_name[iii] == commfacilityType[jjj][1]) {
                                cp++;
                            }
                        }
                        var tempArr = [];
                        tempArr[0] = commfacilityType_name[iii];
                        tempArr[1] = cp;

                        nb_commfacilityType_name.push(tempArr);

                    }
                    //Show chart for each commune									
                    createMarkerChart(nb_commfacilityType_name, commDepName);

                    //Array to clear
                    commfacilityType = [];
                }


            }
            //add legend	
            legendChartMarker();
        });

    });


}
//Add legend  for chart marker
function legendChartMarker() {
    var contentLegend = '';
    //http://chart.apis.google.com/chart?chf=a,s,000000|bg,s,67676700&chs=164x164&cht=p&chco=c699fd|bae1fd|fb8b07&chd=t:16,46,13

    contentLegend += '<tr><td colspan="2"><img src="http://chart.apis.google.com/chart?chf=a,s,000000|bg,s,67676700&chs=68x68&cht=p&chco=03345b|175F9C|007fff|158ff2|6fbcfc|a2d2f9|d7e4ef&chd=t:10,10,10,10,10,10"/></td></tr>';

    contentLegend += '<tr><td><div class="lg_dpop_color" style="background:#03345b"></div></td>';
    contentLegend += '<td>Hopital communautaire de r&eacute;f&eacute;rence</td></tr>';

    contentLegend += '<tr><td><div class="lg_dpop_color" style="background:#175F9C"></div></td>';
    contentLegend += '<td>Centre de sant&eacute; &agrave; lit</td></tr>';

    contentLegend += '<tr><td><div class="lg_dpop_color" style="background:#007fff"></div></td>';
    contentLegend += '<td>Hopital d&eacute;partemental</td></tr>';

    contentLegend += '<tr><td><div class="lg_dpop_color" style="background:#158ff2"></div></td>';
    contentLegend += '<td>Centre de sant&eacute; sans lit</td></tr>';

    contentLegend += '<tr><td><div class="lg_dpop_color" style="background:#6fbcfc"></div></td>';
    contentLegend += '<td>Dispensaire</td></tr>';

    contentLegend += '<tr><td><div class="lg_dpop_color" style="background:#a2d2f9"></div></td>';
    contentLegend += '<td>Hopital</td></tr>';


    contentLegend += '<tr><td><div class="lg_dpop_color" style="background:#d7e4ef"></div></td>';
    contentLegend += '<td>Hopital universitaire</td></tr>';

    $('.legend_dpop').prepend('<tr><th colspan="2" class="legend_title">&raquo; Institutions sanitaires</th></tr>' + contentLegend);

}

// create marker chart
function createMarkerChart(nb_factype, commName) {
    //default color for facility type
    series_val_color = new Array();
    var color_chart_infoWin = Array();
    var color_chartfactype = [
        ['Centre de sante a lit', '175F9C'],
        ['Centre de sante sans lit', '158ff2'],
        ['Dispensaire', '6fbcfc'],
        ['Hopital', 'a2d2f9'],
        ['Hopital communautaire de reference', '03345b'],
        ['Hopital departemental', '007fff'],
        ['Hopital universitaire', 'd7e4ef']
    ];
    //console.log(color_chartfactype);
    //colorize chart
    for (var i = 0; i < nb_factype.length; i++) {
        for (var j = 0; j < color_chartfactype.length; j++) {
            if (nb_factype[i][0] == color_chartfactype[j][0]) {
                series_val_color.push([nb_factype[i][1], color_chartfactype[j][1]]);//color and value for chart on map
                color_chart_infoWin.push('#' + color_chartfactype[j][1]);//color for chart in infowindow 
            }
        }

    }

    iconImage = iconimagechart(64, series_val_color);
    //'http://chart.apis.google.com/chart?chf=a,s,000000|bg,s,67676700&chs=64x64&cht=p&chco=175F9C|33a2f7|8fc0e8&chd=t:16,46,13'
    var pos_comm = markerPosition_comm(commName);
    var marker = new google.maps.Marker({
        position: pos_comm, //new google.maps.LatLng(19.308551284387825,-72.47448921203613),
        icon: iconImage,
        map: map,
        title: commName
    });
    //Marker event
    google.maps.event.addListener(marker, 'click', function () {
        drawChart(this, nb_factype, commName, color_chart_infoWin);
    });
}

//Get the marker position by commune
function markerPosition_comm(communeName) {
    // Artibonite Department
    switch (communeName) {
        case 'Anse-Rouge':
            return new google.maps.LatLng(19.6352883, -73.0531163);
            break;

        case 'Terre-Neuve':
            return new google.maps.LatLng(19.5992232, -72.7795153);
            break;

        case 'Gonaives':
            return new google.maps.LatLng(19.4571089, -72.6795458);
            break;

        case 'Gros-Morne':
            return new google.maps.LatLng(19.6680369, -72.6772163);
            break;

        case 'Ennery':
            return new google.maps.LatLng(19.4839914, -72.4828763);
            break;

        case 'Marmelade':
            return new google.maps.LatLng(19.5165957, -72.3614932);
            break;

        case 'Saint-Michel-de-l-Attalaye':
            return new google.maps.LatLng(19.37208, -72.3313994);
            break;

        case 'L-Estere':
            return new google.maps.LatLng(19.3051184, -72.6077413);
            break;

        case 'Desdunes':
            return new google.maps.LatLng(19.2923829, -72.6438863);
            break;

        case 'Grande-Saline':
            return new google.maps.LatLng(19.2537787, -72.764637);
            break;

        case 'Dessalines':
            return new google.maps.LatLng(19.2628169, -72.5197049);
            break;

        case 'Saint-Marc':
            return new google.maps.LatLng(19.1068976, -72.7009542);
            break;

        case 'Petite-Riviere':
            return new google.maps.LatLng(19.1239237, -72.4767454);
            break;

        case 'Verrettes':
            return new google.maps.LatLng(19.0479201, -72.4678714);
            break;

        case 'La Chapelle':
            return new google.maps.LatLng(18.9057991, -72.3058104);
            break;

        default:
            return new google.maps.LatLng(0, 0);
    }
}

//Marker chart visualisation
function drawChart(marker, infomarker, commune_name, color_chart_infowin) {

    // Create the data table.
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Topping');
    data.addColumn('number', 'Slices');

    data.addRows(infomarker);
    //console.log(infomarker);
    /*data.addRows([
     ['Mushrooms', 3],
     ['Onions', 1],
     ['Olives', 1],
     ['Zucchini', 1],
     ['Pepperoni', 2]
     ]);
     */


    // Set chart options
    //+marker.getPosition().toString()
    var options = {'title': commune_name,
        'width': 400,
        'height': 200,
        'chartArea': {left: 5},
        //'pieHole':0.2,
        'colors': color_chart_infowin//['#e0440e', '#e6693e', '#ec8f6e', '#f3b49f', '#f6c7b6'],
    };



    var node = document.createElement('div');
    if (infoWindow) {
        infoWindow.close();
    }

    infoWindow = new google.maps.InfoWindow();
    chart = new google.visualization.PieChart(node);

    chart.draw(data, options);
    infoWindow.setContent(node);

    infoWindow.open(marker.getMap(), marker);
}
