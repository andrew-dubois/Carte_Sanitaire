// JavaScript Document
var map; // to contain the map object

var infoWindow = null;
var markersClus = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
for (i = 0; i < markersClus.length; i++) {
    markersClus[i] = new Array();
}
var mc;
var MOUSE_LOCATION = new Array();
var markersM = [];
var COMMUNE_NAME_GLOBAL = '';
var printing_markers = new Array();
var FACILITY_ID = new Array();

var placemarkName;
var placemark;

var facTypeIcon;

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
            {visibility: "on"}
        ]
    }, {
        featureType: "road",
        elementType: "labels",
        stylers: [
            {visibility: "on"}
        ]
    }, {
        featureType: "administrative",
        elementType: "labels.text",
        stylers: [
            {visibility: "on"}
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

//MAIN FUNCTION
$(document).ready(function () {
    $('#overlayDiv').css('visibility', 'visible');
    var libraryLoaded = checkGoogleMapObj();//checks if google map object is loaded	   

    // if the google resources aren't loaded there's no point of continuing
    // alert to user handled in method above
    if (!libraryLoaded)
        return;

    // Create a new StyledMapType object, passing it the array of styles,
    // as well as the name to be displayed on the map type control.
    var styledMap = new google.maps.StyledMapType(styles, {name: "Principale"});

    var mapDiv = document.getElementById('cs_map');
    var latlng = new google.maps.LatLng(19.02577027586866, -72.70854949951172); // map centered over Haiti

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
    };
    map = new google.maps.Map(mapDiv, opts);

    //Associate the styled map with the MapTypeId and set it to display.
    map.mapTypes.set('cs_map_style_id', styledMap);
    map.setMapTypeId('cs_map_style_id');

    /***** General initialisation *****/
    // Setup The cluster variable
    var mcOptions = {gridSize: 80, maxZoom: 10};
    markerclusterer = new MarkerClusterer(map, [], mcOptions);

    /* 
     *      Setup google map events
     */

    //Store the location of the mouse
    google.maps.event.addListener(map, 'mousemove', function (ev) {
        MOUSE_LOCATION[0] = ev.latLng.lat();
        MOUSE_LOCATION[1] = ev.latLng.lng();
//        if (distanceSearch)
//        {
//            var cityCircle = new google.maps.Circle({
//                strokeColor: '#FF0000',
//                strokeOpacity: 0.8,
//                strokeWeight: 2,
//                fillColor: '#FF0000',
//                fillOpacity: 0.35,
//                map: map,
//                center: ev.latLng,
//                radius: 5
//            });
//        }
    });

    /*When user select a map type*/
    google.maps.event.addListenerOnce(map, 'idle', function () {
        // Cover the Dominican Republic
        executeRemoveDom();
        executeColorizeDep();
        // Select the first option in the drop down
        $('#dep-list-dropdmenu option:eq(1)').prop('selected', true).change();
        // Remove the loading div
        $('#overlayDiv').css('visibility', 'hidden');
    });

    //Event hired when map zoom changed
    google.maps.event.addListener(map, 'zoom_changed', function () {
        var zoom = map.getZoom();
        // gestion de l'affichage des legendes
        // 1-8 cluster, 9 cluster & marker, 9 -x marker
        if (zoom >= 0 && zoom <= 9) {
            $('.markers').hide("slow");
            $('.cluster').show("slow");
        } else {
            if (zoom >= 9 && zoom <= 10) {
                $('.markers').show("slow");
                $('.cluster').show("slow");
            } else {
                $('.markers').show("slow");
                $('.cluster').hide("slow");
            }
        }
    });

    // Setup the interface
    SetupLegend();
    SetupLeftMenu();
});

/***** end General initialisation *****/

/****CHANGING THE MAP COLOR ****/

var depsPolygons = [];  // Global storage for polygons
//Execute the colorization of the departements
function executeColorizeDep() {
    $.get("lib/inc/polygons.inc.php?Haiti=1", function (data) {
        var deps = $.parseJSON(data);

        var depInfoWindow = new google.maps.InfoWindow({content: ""});

        for (var dep in deps) {
            var depName = deps[dep].Name == "L'Artibonite" ? "Artibonite" : deps[dep].Name; // The kml file stores Artibonite as L'Artibonite
            var DepPoly = {
                DepName: depName,
                Polys: []
            };

            for (var poly in deps[dep].Polys) {
                var HaitiR = new google.maps.Polygon({
                    paths: deps[dep].Polys[poly].Coords,
                    strokeColor: '#ea5656',
                    strokeOpacity: 0.8,
                    strokeWeight: 1,
                    fillColor: '#ea5656',
                    fillOpacity: 0.4
                });

                DepPoly.Polys.push(HaitiR);

                HaitiR.setMap(map);

                BindDepInfoWindow(HaitiR, depName, depInfoWindow);
            }

            depsPolygons.push(DepPoly);
        }
    });
}

var DistanceCircle;

function BindDepInfoWindow(poly, depName, depInfoWindow) {
    poly.addListener('click', function (event) {
        depInfoWindow.setPosition(event.latLng);
        depInfoWindow.setContent("<strong>" + depName + "</strong>");
        depInfoWindow.open(map);
    });

    poly.addListener('mousemove', function (ev) {
        MOUSE_LOCATION[0] = ev.latLng.lat();
        MOUSE_LOCATION[1] = ev.latLng.lng();
        if (distanceSearch)
        {
            if (typeof DistanceCircle !== "undefined")
            {
                // Move Poly
                //DistanceCircle.moveTo(new google.maps.LatLng(MOUSE_LOCATION[0], MOUSE_LOCATION[1]));
            } else
            {
                // Create poly
                DistanceCircle = new google.maps.Circle({
                    strokeColor: '#FFFFFF',
                    strokeOpacity: 0.8,
                    strokeWeight: 2,
                    fillColor: '#FFFFFF',
                    fillOpacity: 0.35,
                    map: map,
                    center: ev.latLng,
                    radius: 200,
                    draggable: true
                });
            }
        }
    });
}

// when a specific department is selected color all other polygons white
function WhiteSelectDepartment(DepName) {
    if (DepName == "Haiti") {
        for (var department in depsPolygons) {
            for (var poly in depsPolygons[department].Polys) {
                depsPolygons[department].Polys[poly].setOptions({fillColor: '#ea5656', fillOpacity: 0.4});
            }
        }
    } else
    {
        DepName = DepName == "Grand-Anse" ? "Grand'Anse" : DepName;
        for (var department in depsPolygons) {
            if (depsPolygons[department].DepName != DepName)
                for (var poly in depsPolygons[department].Polys)
                    depsPolygons[department].Polys[poly].setOptions({fillColor: "#FFF", fillOpacity: 0.8});
            else    // If it matches colour it the right colour
                for (var poly in depsPolygons[department].Polys)
                    depsPolygons[department].Polys[poly].setOptions({fillColor: '#ea5656', fillOpacity: 0.4});
        }
    }
}

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

/**** END CHANGING THE MAP COLOR ****/

//show communes by dept
function viewCommDept(nameDep) {
    $.get("lib/inc/orgunit.inc.php?getcommName=1&deptname=" + nameDep, function (data) {
        var obj = jQuery.parseJSON(data);
        var commlisthtml = '<h3>Choisir une commune</h3><select name="comm-list-dropdmenu" id="comm-list-dropdmenu" class="dcartserv_comm"><option value="">--</option>';
        $.each(obj, function () {
            var commune_name = this['commune_name'];
            commlisthtml += '<option value="' + commune_name + '">' + commune_name + '</option>';
        });
        commlisthtml += '</select>';
        $('#commune-list').html(commlisthtml);

        //event for generated html component
        $('#comm-list-dropdmenu').change(function () {
            $('.service_fac').prop('checked', false);
            var commName = $('#comm-list-dropdmenu').val();
            COMMUNE_NAME_GLOBAL = commName;
            var depname = $('#dep-list-dropdmenu').val();
            $.get("lib/inc/marker.inc.php?allFSPA=" + depname + "&commname=" + commName, function (data) {
                //alert(data);
                getXmlData(data);   // map_clustering.js
                addClusterOnMap();  //clustering
            });//end get

            //zoom to commune
            zoomComm(commName);
        });
    });//end get
}

/*
 * View the facility number with lab by department
 * @param none
 * @return void
 */
function getNumFacLabDep() {
    $('#NB_lab_infr').text(facTypeCount['lab']);
}

/*
 * View the facility number with hiv program by department
 * @param none
 * @return void
 */
function getNumFacHIVDep() {
    $('#NB_vih_fac').text(facTypeCount['hiv']);
}

//set the map
function setMapToViewIns(lat, lng, zoom, title, descrip) {
    var mapDiv = document.getElementById('cs_map');
    var latlng = new google.maps.LatLng(lat, lng);
    var opts = {
        zoom: zoom,
        center: latlng,
        background: '#b3d1ff',
        mapTypeControl: true,
        mapTypeControlOptions: {
            style: google.maps.MapTypeControlStyle.DROPDOWN_MENU,
            position: google.maps.ControlPosition.TOP_RIGHT,
            mapTypeIds: [
                google.maps.MapTypeId.ROADMAP,
                google.maps.MapTypeId.SATELLITE,
                google.maps.MapTypeId.TERRAIN
            ]
        },
        mapTypeId: google.maps.MapTypeId.TERRAIN
    };
    map = new google.maps.Map(mapDiv, opts);
    //creating markers

    var latlng = new google.maps.LatLng(lat, lng);
    var marker = new google.maps.Marker({
        position: latlng,
        map: map,
        title: title
    });
    var infobulle = new google.maps.InfoWindow({
        content: descrip
    });
    google.maps.event.addListener(marker, 'click', function () {
        infobulle.open(map, marker);
    });

    /*google.maps.event.addListener(map, 'center_changed', function() {
     document.getElementById('test').innerHTML=map.getCenter()+" zoom:"+map.getZoom();
     });*/
}

/*
 * Highlight a departement, places it to the center of the map and zoom in it
 * @param lat, lng
 * @return void
 */
function highlightDep(lat, lng) {
    var latlng = new google.maps.LatLng(parseFloat(lat), parseFloat(lng));
    map.setCenter(latlng);
    map.setZoom(9);
}

//checks if the google maps librairy is loaded
function checkGoogleMapObj() {
    if (typeof google == 'undefined') {
        alert("La carte n'est pas correctement chargée, merci de rafraichir la page");
        return false;
    }
    return true;
}

//Zoom map by departement
function zoomComm(nameComm) {
    //Commune coordinates
    //Artibonite
    var latlng_dessalines = new google.maps.LatLng(19.2578996, -72.517319);
    var latlng_petite_riviere = new google.maps.LatLng(19.1239237, -72.4767454);
    var latlng_grande_saline = new google.maps.LatLng(19.2537787, -72.764637);
    var latlng_gonaives = new google.maps.LatLng(19.4571089, -72.6795458);
    var latlng_ennery = new google.maps.LatLng(19.4839914, -72.4828763);
    var latlng_st_michel_de_lattalaye = new google.maps.LatLng(19.37208, -72.3313994);
    var latlng_terre_neuve = new google.maps.LatLng(19.5987608, -72.7822137);
    var latlng_la_chapelle = new google.maps.LatLng(18.9057991, -72.3058105);
    var latlng_saint_marc = new google.maps.LatLng(19.1068976, -72.7009542);
    var latlng_desdunes = new google.maps.LatLng(19.2923829, -72.6438863);
    var latlng_lestere = new google.maps.LatLng(19.3051183, -72.6077414);
    var latlng_verrettes = new google.maps.LatLng(19.0479201, -72.4678714);
    var latlng_gros_morne = new google.maps.LatLng(19.6680369, -72.6772163);
    var latlng_marmelade = new google.maps.LatLng(19.5162126, -72.3613681);
    var latlng_anse_rouge = new google.maps.LatLng(19.6352883, -73.0531163);
    //Checks what commune to zoom in
    var zoomComm = 11;
    var zoomht = 8;
    switch (nameComm) {

        case 'Haiti':
            map.panTo(latlng_haiti);
            map.setZoom(zoomht);
            break;
            //Artibonite communes
        case 'Dessalines':
            map.panTo(latlng_dessalines);
            map.setZoom(zoomComm);
            break;
        case 'Petite-Riviere':
            map.panTo(latlng_petite_riviere);
            map.setZoom(zoomComm);
            break;
        case 'Grande-Saline':
            map.panTo(latlng_grande_saline);
            map.setZoom(zoomComm);
            break;
        case 'Gonaives':
            map.panTo(latlng_gonaives);
            map.setZoom(zoomComm);
            break;
        case 'Ennery':
            map.panTo(latlng_ennery);
            map.setZoom(zoomComm);
            break;
        case 'Saint-Michel-de-l-Attalaye':
            map.panTo(latlng_st_michel_de_lattalaye);
            map.setZoom(zoomComm);
            break;
        case 'Terre-Neuve':
            map.panTo(latlng_terre_neuve);
            map.setZoom(zoomComm);
            break;
        case 'La Chapelle':
            map.panTo(latlng_la_chapelle);
            map.setZoom(zoomComm);
            break;
        case 'Saint-Marc':
            map.panTo(latlng_saint_marc);
            map.setZoom(zoomComm);
            break;
        case 'Desdunes':
            map.panTo(latlng_desdunes);
            map.setZoom(zoomComm);
            break;
        case 'L-Estere':
            map.panTo(latlng_lestere);
            map.setZoom(zoomComm);
            break;
        case 'Verrettes':
            map.panTo(latlng_verrettes);
            map.setZoom(zoomComm);
            break;
        case 'Gros-Morne':
            map.panTo(latlng_gros_morne);
            map.setZoom(zoomComm);
            break;
        case 'Marmelade':
            map.panTo(latlng_marmelade);
            map.setZoom(zoomComm);
            break;
        case 'Anse-Rouge':
            map.panTo(latlng_anse_rouge);
            map.setZoom(zoomComm);
            break;
        default:
            map.panTo(latlng_haiti);
            map.setZoom(zoomht);

    }
}

//Zoom map by departement
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
    var latlng_haiti = new google.maps.LatLng(19.0558462, -73.0513322);
    //Checks what department to zoom in
    var zoomdep = 10;
    var zoomht = 8;
    switch (nameDep) {

        case 'Haiti':
            map.panTo(latlng_haiti);
            map.setZoom(zoomht);
            break;
        case 'Artibonite':
            map.panTo(latlng_artibonite);
            map.setZoom(9);
            break;
        case 'Centre':
            map.panTo(latlng_centre);
            map.setZoom(zoomdep);
            break;
        case 'Grand Anse':
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

//Add a new button to the maptypecontrol option
function HomeControl(controlDiv, map) {
    // Set CSS styles for the DIV containing the control
    // Setting padding to 5 px will offset the control
    // from the edge of the map.
    controlDiv.style.padding = '3px';

    // Set CSS for the control border.
    var controlUI = document.createElement('div');
    controlUI.style.backgroundColor = 'white';
    controlUI.style.borderStyle = 'solid';
    controlUI.style.borderWidth = '1px';
    controlUI.style.cursor = 'pointer';
    controlUI.style.marginTop = '3px';
    controlUI.style.textAlign = 'center';
    controlUI.title = 'Plus d\'options';
    controlDiv.appendChild(controlUI);

    // Set CSS for the control interior.
    var controlText = document.createElement('div');
    controlText.className = 'custom-btn-maptypctrl';
    /*controlText.style.fontFamily = 'Arial,sans-serif';
     controlText.style.fontSize = '12px';
     controlText.style.paddingLeft = '4px';
     controlText.style.paddingRight = '4px';*/
    //controlText.innerHTML = '<i class="fa fa-cogs"></i> Imprimer';
    controlText.innerHTML = '<ul><li><a href="#" id=""><i class="fa fa-cogs"></i> Imprimer</a><ul><li><a href="#" id="prtfm8511">Format 8.5 x 11</a></li><li><a href="#" id="prtfm3827">Format 38 x 27</a></li><li><a href="#" id="prtfmcust">Format personnalisé</a></li></ul></li></ul>';
    controlUI.appendChild(controlText);

    $(document).on('click', 'a', function () {
        var optprint_id = $(this).attr('id');
        switch (optprint_id) {
            case 'prtfm8511':
                getMapinfoprint('prtfm8511');
                break;

            case 'prtfm3827':
                getMapinfoprint('prtfm3827');
                //alert('Format non disponible pour l\'instant');
                break;

            case 'prtfmcust':
                alert('Format non disponible pour l\'instant');
                break;

        }
        return false;
    });
    // Setup the click event listeners
    /* google.maps.event.addDomListener(controlUI, 'click', function() {			
     getMapinfoprint();
     });*/
}

// Show the custom button of the maptype control
function showBtnMaptypeContrl() {
    // Create the DIV to hold the control and call the HomeControl() constructor
    // passing in this DIV.
    var homeControlDiv = document.createElement('div');
    var homeControl = new HomeControl(homeControlDiv, map);
    homeControlDiv.index = 1;
    map.controls[google.maps.ControlPosition.TOP_RIGHT].clear();
    map.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv);
}

//convert the map to static map
function getStaticMap() {
    var maplocation = map.getCenter().lat() + ',' + map.getCenter().lng();
    var mapzoom = map.getZoom();
    var markers = '';
    //get markers on the map
    for (var i = 0; i < markersM.length; i++) {
        var markerColor = 'blue';
        var markerlabel = 'H';
        var markerPosition = markersM[i].getPosition().lat() + ',' + markersM[i].getPosition().lng();
        if ((markersM.length - 1) == i) {
            markers += 'markers=color:' + markerColor + '%7C' + 'label:' + markerlabel + '%7C' + markerPosition
        } else {
            markers += 'markers=color:' + markerColor + '%7C' + 'label:' + markerlabel + '%7C' + markerPosition + '&'
        }
    }
    //console.log(maplocation)
    //console.log(markersM[0].getPosition().lat());
    //console.log(markersM[0]);
    //return; 
    var static_map_url = 'https://maps.googleapis.com/maps/api/staticmap?zoom=' + mapzoom + '&size=640x640&maptype=roadmap&' + markers + '&key=AIzaSyBKTJn79hsRgdkWhnJr8QxodRTidYVFTKs'
    static_map_url = static_map_url.replace(/\&/g, '   ');
    location.href = "mapprinter.php?smu=" + static_map_url
}

//Get info from map to print
function getMapinfoprint(printformat) {
    //alert(printing_markers);
    var prtformat = printformat
    var maplocation = map.getCenter().lat() + ',' + map.getCenter().lng();
    var mapzoom = map.getZoom();
    var dept = $('#dep-list-dropdmenu').val();
    var serv_checked = '';
    $('.service_fac:checked').each(function (i) {
        serv_checked = ((i + 1) == $('.service_fac:checked').length) ? serv_checked + $(this).val() : serv_checked + $(this).val() + '-';
    });
    if (serv_checked == '') {
        serv_checked = 'none';
    }

    var static_map_url = 'zoom=' + mapzoom + '&center=' + maplocation + '&maptype=roadmap&dept=' + dept + '&services=' + serv_checked + '&printformat=' + prtformat;
    //location.href="mapprinter.php?"+static_map_url
    window.open("mapprinter.php?" + static_map_url, "_newtab");
}






	