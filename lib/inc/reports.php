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

$orgUnitDHIS = new OrgUnitDHIS();
$facs = $orgUnitDHIS->getAllInsDHIS($deparment);

$facTypeArr = split(":", $facTypes);

foreach ($facs as $facIndex => $fac) {
    if (!in_array($fac["facilitytype"], $facTypeArr)) {
        unset($facs[$facIndex]);
    }
}

$file = fopen(__DIR__ . "/../../reports/cartographie/" . date("Y - M - d") . "_" . time() . ".csv", "w");

// TODO : 
// Add Headers
// Select appropriate fields to show
// Get Service Info from SPA DB
// Group by department and type if Haiti Selected else just by type
foreach ($facs as $fac) {
    fputcsv($file, $fac);
}

echo json_encode(__DIR__ . "/../../reports/cartographie/" . date("Y - M - d") . " - " . time() . ".csv");

