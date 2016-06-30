/* 
     Old unused code from the Map.js file
     Saved incase of future use
 */

var removPoly = Array();   

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
//Highlight polygon
var highlightOptions = {fillColor: "#FFFF00", strokeColor: "#000000", fillOpacity: 0.9, strokeWidth: 1};
var highlightLineOptions = {strokeColor: "#FFFF00", strokeWidth: 1};

function kmlHighlightPoly(pm, doc) {
    for (var j = 0; j < geoXmlDoc.length; j++) {
        for (var i = 0; i < geoXmlDoc[j].placemarks.length; i++) {
            var placemark = geoXmlDoc[j].placemarks[i];
            if ((i == pm) && (j == doc)) {
                if (placemark.polygon)
                    placemark.polygon.setOptions(highlightOptions);
                if (placemark.polyline)
                    placemark.polyline.setOptions(highlightLineOptions);
            } else {
                if (placemark.polygon)
                    placemark.polygon.setOptions(placemark.polygon.normalStyle);
                if (placemark.polyline)
                    placemark.polyline.setOptions(placemark.polyline.normalStyle);
            }
        }
    }
}

function colorizeDepsPoly(poly, polyName) {
    var depname = $('#dep-list-dropdmenu').val();
    switch (depname) {
        case"Artibonite":
            depname = 'L\'Artibonite';
            break;
        case"Grand Anse":
            depname = 'Grand\'Anse';
            break;
    }

    if (polyName == depname) {
        poly.setOptions({fillColor: "#ea5656", strokeColor: "#ea5656", fillOpacity: 0.4});
    } else {
        if (depname == 'Haiti') {

            poly.setOptions({fillColor: "#ea5656", strokeColor: "#ea5656", fillOpacity: .4});
        } else {
            poly.setOptions({fillColor: "#fff", strokeColor: "#fff", fillOpacity: 0.8});
        }
    }
}

//fill all departements area
function colorizeAllPoly(poly, polyName) {
    if (polyName == 'Centre') {
        poly.setOptions({fillColor: "#77405E", strokeColor: "#77405E", fillOpacity: 0.7});
    }

    if (polyName == 'Nord-Est')
        poly.setOptions({fillColor: "#d0c145", strokeColor: "#d0c145", fillOpacity: 0.7});

    if (polyName == 'Nord-Ouest')
        poly.setOptions({fillColor: "#3275ac", strokeColor: "#3275ac", fillOpacity: 0.7});

    if (polyName == 'Nord')
        poly.setOptions({fillColor: "#6577a5", strokeColor: "#6577a5", fillOpacity: 0.7});

    if (polyName == 'L\'Artibonite')
        poly.setOptions({fillColor: "#638247", strokeColor: "#638247", fillOpacity: 0.7});

    if (polyName == 'Ouest')
        poly.setOptions({fillColor: "#a87618", strokeColor: "#a87618", fillOpacity: 0.7});

    if (polyName == 'Sud')
        poly.setOptions({fillColor: "#1d607b", strokeColor: "#1d607b", fillOpacity: 0.7});

    if (polyName == 'Sud-Est')
        poly.setOptions({fillColor: "#4f5d4f", strokeColor: "#4f5d4f", fillOpacity: 0.7});

    if (polyName == 'Nippes')
        poly.setOptions({fillColor: "#731818", strokeColor: "#731818", fillOpacity: 0.7});

    if (polyName == 'Grand\'Anse')
        poly.setOptions({fillColor: "#375219", strokeColor: "#375219", fillOpacity: 0.7});

    if (polyName == 'Dominican Republic')
        poly.setOptions({fillColor: "#B7DCFC", strokeColor: "#B7DCFC", fillOpacity: 0.8});
}

function useTheData(doc) {
    geoXmlDoc = doc;
    //alert(geoXmlDoc.length);
    for (var j = 0; j < geoXmlDoc.length; j++) {
        for (var i = 0; i < geoXmlDoc[j].placemarks.length; i++) {
            var placemark = geoXmlDoc[j].placemarks[i];
            var placemarkName = placemark.name;
            //console.log(placemark.name);
            var kmlStrokeColor = kmlColor(placemark.style.color);
            var kmlFillColor = kmlColor(placemark.style.fillcolor);

            var normalStyle = {
                strokeColor: kmlStrokeColor.color,
                strokeWeight: placemark.style.width,
                strokeOpacity: kmlStrokeColor.opacity,
                fillColor: kmlFillColor.color,
                fillOpacity: kmlFillColor.opacity
            };
            placemark.polygon.normalStyle = normalStyle;
            colorizeAllPoly(placemark.polygon, placemarkName);
        }
    }
}

//Colorize department seperately - useThedata_colorizeDep
function useTheData_colorizeDep(doc) {
    geoXmlDoc = doc;

    for (var j = 0; j < geoXmlDoc.length; j++) {
        for (var i = 0; i < geoXmlDoc[j].placemarks.length; i++) {
            placemark = geoXmlDoc[j].placemarks[i];
            placemarkName = placemark.name;
            var normalStyle = {
                strokeColor: "#fff",
                strokeWeight: 1,
                strokeOpacity: 1,
                fillColor: '#ccc',
                fillOpacity: 0.2
            };
            placemark.polygon.normalStyle = normalStyle;
            removPoly.push(placemark.polygon);
            colorizeDepsPoly(placemark.polygon, placemarkName);
        }
    }
}

//remove colorization of the departments
function removeColorDep() {
    if (removPoly) {
        for (var i = 0; i < removPoly.length; i++) {
            removPoly[i].setMap(null);
        }
    }
    removPoly = [];
}

/*
 * creates chart for each facilities...
 * @param
 * @return
 */
function dataVisualization(marker, insName, nb_ph, nb_nurs, nomCom) {
    // Create the data table.
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'value');
    data.addColumn('number', 'Slices');
    data.addRows([
        ['Physicians', parseInt(nb_ph)],
        ['Nurses', parseInt(nb_nurs)]
    ]);

    // Set chart options
    var options = {'title': insName + ',' + nomCom,
        'width': 300,
        'height': 170,
        'pieHole': 0.4,
        'legend': {position: 'right', textStyle: {color: '#999', fontSize: 11}, alignment: 'center'},
        'chartArea': {left: 90, top: 30, width: "50%", height: "70%"}

    };

    var node = document.createElement('div');

    chart = new google.visualization.PieChart(node);

    chart.draw(data, options);

    if (infoWindow) {
        infoWindow.close()
    }
    infoWindow = new google.maps.InfoWindow();
    infoWindow.setContent(node);
    infoWindow.open(marker.getMap(), marker);
}

// function getPath
/*function getPathLink(){
 
 var path = polyline.getPath();
 var len = path.getLength();
 for (var i=0; i<len; i++) {
 alert(path.getAt(i).toUrlValue(6));
 
 }
 }*/