<?php

include (__DIR__ . "/../core/orgunitDHIS.php");
include (__DIR__ . "/../core/orgunitSPA.php");

if (!$_POST)
    exit;

$deparment = filter_input(INPUT_POST, 'department', FILTER_DEFAULT);
$facTypes = filter_input(INPUT_POST, 'facTypes', FILTER_DEFAULT);
$services = filter_input(INPUT_POST, 'services', FILTER_DEFAULT, FILTER_REQUIRE_ARRAY);
$operator = filter_input(INPUT_POST, 'operator', FILTER_DEFAULT);

if ($facTypes == null || $deparment == null) {
    exit;
}

// Get from DHIS All institutions
$orgUnitDHIS = new OrgUnitDHIS();
$facs = $orgUnitDHIS->getAllInsDHIS($deparment);

// Split the factypes from the map filters that are sent through
$facTypeArr = split(":", $facTypes);

// Only the institutions sanitaires types come through from DHIS...
// So if they choose Lab or VIH, we need to skip this part 
if ($facTypes != "lab" && $facTypes != "vih") {
// if the institutions is not of the types selected then remove it from the array
    foreach ($facs as $facIndex => $fac) {
        if (!in_array($fac["facilitytype"], $facTypeArr)) {
            unset($facs[$facIndex]);
        }
    }
}

// Connect with the SPA database for service information
$orgUnitSPA = new OrgUnitSPA();
$dataFacSPA = $orgUnitSPA->getAllInsSPACustom($deparment);

foreach ($facs as $facIndex => $fac) {
    // Now we need to see which match up to DHIS via the moh_facility code
    if (array_key_exists($fac['code'], $dataFacSPA)) {
        // It exists in SPA... so now we filter based on our filters
        $assocSPAData = $dataFacSPA[$fac['code']];
        if ($facTypes == "lab") {
            // If we are looking for labs and the SPA value is null or zero remove from the list and move to the next one
            if ($assocSPAData['laboratory'] == null || $assocSPAData['laboratory'] == 0 || $assocSPAData['laboratory'] == 2) {
                unset($facs[$facIndex]);
                continue;
            }
        }
        if ($facTypes == "vih") {
            // If we are looking for vih and the SPA value is null or zero remove from the list and move to the next one
            if (!($assocSPAData['hivct'] || $assocSPAData['hivcss'] || $assocSPAData['pmtct'])) {
                unset($facs[$facIndex]);
                continue;
            }
        }

        // filter by services
        if (count($services) > 0) {
            if ($operator == "OR") {
                // can contain any1 of the services to pass
                $serviceCheckOR = false;
                foreach ($services as $service) {
                    if ($assocSPAData[$service] == 1) {
                        $serviceCheckOR = true;
                        break;  // Already has one, short circuit, no need to check others for OR
                    }
                }
                if (!$serviceCheckOR) {
                    unset($facs[$facIndex]);
                    continue;
                }
            } else { // AND
                $serviceCheckAND = false;
                foreach ($services as $service) {
                    if ($assocSPAData[$service] == 1) {
                        $serviceCheckAND = true;
                    } else {
                        $serviceCheckAND = false;
                        break; // short circuit, if it doesn't have any 1 of the services it's excluded
                    }
                }
                if (!$serviceCheckAND) {
                    unset($facs[$facIndex]);
                    continue;
                }
            }
        }

        $facs[$facIndex]['laboratory'] = ($assocSPAData['laboratory'] == null || $assocSPAData['laboratory'] == 2) ? "inconnu" : ($assocSPAData['laboratory'] == 1 ? "oui" : "non");
        $facs[$facIndex]['vih'] = ($assocSPAData['hivct'] || $assocSPAData['hivcss'] || $assocSPAData['pmtct']) == null ? "inconnu" : (($assocSPAData['hivct'] || $assocSPAData['hivcss'] || $assocSPAData['pmtct']) == 1 ? "oui" : "non");
    } else {
        // No join to data so we assume no and remove        
        if ($facTypes == "lab" || $facTypes == "vih" || count($services) > 0) {
            unset($facs[$facIndex]);
            continue;
        }

        $facs[$facIndex]['laboratory'] = "inconnu";
        $facs[$facIndex]['vih'] = "inconnu";
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
fputcsv($file, ["moh_facility_code", "facility_name", "facility_type", "managing_authority", "department", "uas", "commune", "section_commune", "laboratory", "vih"]);
foreach ($facs as $fac) {
    // some institutions don't have managing authority
    if (array_key_exists("managauthority", $fac)) {
        fputcsv($file, [$fac["code"], $fac["name"], $fac["facilitytype"], $fac["managauthority"], $fac["deptname"], $fac["uasname"], $fac["communename"], $fac["seccomname"], $fac["laboratory"], $fac["vih"]]);
    } else {
        fputcsv($file, [$fac["code"], $fac["name"], $fac["facilitytype"], "", $fac["deptname"], $fac["uasname"], $fac["communename"], $fac["seccomname"], $fac["laboratory"], $fac["vih"]]);
    }
}

echo "reports/cartographie/" . date("Y-M-d") . "_" . $timeNow . ".csv";

