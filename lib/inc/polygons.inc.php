<?php

use phpFastCache\CacheManager;

require __DIR__ . '/../../phpfastcache-final/src/autoload.php';

$InstanceCache = CacheManager::getInstance('files');

if (isset($_GET['DomRep'])) {
    $key = "DomRep";
    $CachedString = $InstanceCache->getItem($key);
    if (is_null($CachedString->get())) {

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

        $CachedString->set($googleCoordArray)->expiresAfter(0);
        $InstanceCache->save($CachedString);

        echo json_encode($googleCoordArray);
        //echo "FIRST LOAD // WROTE OBJECT TO CACHE // RELOAD THE PAGE AND SEE // ";
        //echo $CachedString->get();
    } else {
        //echo "READ FROM CACHE // ";
        //echo $CachedString->get();
        echo json_encode($CachedString->get());
    }
}

//echo json_encode($googleCoordArray);


if (isset($_GET['Haiti'])) {
    $key = "HaitiDep";
    $CachedString = $InstanceCache->getItem($key);
    if (is_null($CachedString->get())) {
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
        $CachedString->set($departments)->expiresAfter(0);
        $InstanceCache->save($CachedString);
        
        echo json_encode($departments);
    } else {
        //echo "READ FROM CACHE // ";
        //echo $CachedString->get();
        echo json_encode($CachedString->get());
    }
}

if (isset($_GET['Communes'])) {
    // Parse the xml
    $xml = simplexml_load_file("../../js/gis/htiadm3.kml") or die("Error: Cannot create object");
    // Get the coords of the departments
    $placemarks = $xml->Document->Placemark;
    $Communes = array();
    foreach ($placemarks as $placemark) {
        $polys = array();
        $ComName = (string) $placemark->name;
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
        array_push($Communes, (object) array("Name" => $ComName, "Polys" => $polys));
    }
    echo json_encode($Communes);
}