<?php

include (__DIR__ . "/../core/orgunitDHIS.php");

if (!$_POST)
    exit;

$deparment = filter_input(INPUT_POST, 'department', FILTER_DEFAULT);
$facTypes = filter_input(INPUT_POST, 'facTypes', FILTER_DEFAULT);
$services = filter_input(INPUT_POST, 'services', FILTER_DEFAULT);

if ($facTypes == null || $deparment == null) {
    exit;
}

// Get from DHIS All institutions
$orgUnitDHIS = new OrgUnitDHIS();
$facs = $orgUnitDHIS->getAllInsDHIS($deparment);

// Split the factypes from the map filters that are sent through
$facTypeArr = split(":", $facTypes);

// if the institutions is not of the types selected then remove it from the array
foreach ($facs as $facIndex => $fac) {
    if (!in_array($fac["facilitytype"], $facTypeArr)) {
        unset($facs[$facIndex]);
    }
}

// Create the report file and open it with write privelage
$timeNow = time();
$file = fopen(__DIR__ . "/../../reports/cartographie/" . date("Y-M-d") . "_" . $timeNow . ".csv", "w");

// TODO : 
// Add Headers
// Select appropriate fields to show
// Get Service Info from SPA DB
// Group by department and type if Haiti Selected else just by type
fputcsv($file, ["moh_facility_code", "facility_name", "facility_type", "managing_authority", "department", "uas", "commune", "section_commune"]);
foreach ($facs as $fac) {
    // some institutions don't have managing authority
    if (array_key_exists("managauthority", $fac)) {
        fputcsv($file, [$fac["code"], $fac["name"], $fac["facilitytype"], $fac["managauthority"], $fac["deptname"], $fac["uasname"], $fac["communename"], $fac["seccomname"]]);
    } else {
        fputcsv($file, [$fac["code"], $fac["name"], $fac["facilitytype"], "", $fac["deptname"], $fac["uasname"], $fac["communename"], $fac["seccomname"]]);
    }
}

echo "reports/cartographie/" . date("Y-M-d") . "_" . $timeNow . ".csv";

