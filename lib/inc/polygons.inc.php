<?php

if (isset($_GET['DomRep'])) {
    // Parse the xml
    $xml = simplexml_load_file("../../js/gis/DomRep.kml") or die("Error: Cannot create object");
    // Get the coords part that we need
    $parsedCoords = $xml->Document->Placemark->MultiGeometry->Polygon[count($xml->Document->Placemark->MultiGeometry->Polygon) - 1]->outerBoundaryIs->LinearRing->coordinates;
    // get the string into an array of coords
    $combinedCoords = explode(" ", $parsedCoords);
    // an array to store our coords in an array google understands
    $googleCoordArray = array();
    $coordCount = 0;
    // setup the array with the info given above
    foreach ($combinedCoords as $i => $value) {
        $longLat = explode(",", trim($value));

        // Ignore empty string in last pos
        if (count($longLat) > 1) {
            $googleCoordArray[$coordCount] = (object) array("lat" => (0 + $longLat[1]), "lng" => (0 + $longLat[0]));
            $coordCount += 1;
        }
    }
    echo json_encode($googleCoordArray);
}

if (isset($_GET['Haiti'])) {
    // Parse the xml
    $xml = simplexml_load_file("../../js/gis/HTI_level1.kml") or die("Error: Cannot create object");
    // Get the coords of the departments
    $placemarks = $xml->Document->Placemark;
    $departments = array();
    foreach ($placemarks as $placemark) {
        $polys = array();
        $DepName = (string) $placemark->name;
        // some of the placemarks have multiple polygons
        $xmlPolys = $placemark->MultiGeometry->Polygon;
        foreach ($xmlPolys as $value) {
            $parsedCoords = $value->outerBoundaryIs->LinearRing->coordinates;

            // get the string into an array of coords
            $combinedCoords = explode(" ", $parsedCoords);
            // an array to store our coords in an array google understands
            $googleCoordArray = array();
            $coordCount = 0;
            // setup the array with the info given above
            foreach ($combinedCoords as $i => $value) {
                $longLat = explode(",", trim($value));
                // Ignore empty string in last pos
                if (count($longLat) > 1) {
                    $googleCoordArray[$coordCount] = (object) array("lat" => (0 + $longLat[1]), "lng" => (0 + $longLat[0]));
                    $coordCount += 1;
                }
            }

            array_push($polys, (object) array("Coords" => $googleCoordArray));
        }
        array_push($departments, (object) array("Name" => $DepName, "Polys" => $polys));
    }
    echo json_encode($departments);
}

