<?php

require (__DIR__ . "/../core/orgunitDHIS.php");
require (__DIR__ . "/../core/orgunitSPA.php");
require (__DIR__ . "/../../fpdf181/fpdf.php");

// Extension for FPDF to overried the header and footer methods which are currently empty
class PDF extends FPDF {

// Page header
    function Header() {
        // Left Logo
        $this->Image(__DIR__ . '/../../images/sitelogo.png', 10, 6, 17, 15);
        // Right Logo
        $this->Image(__DIR__ . '/../../images/cardlogo.png', 180, 6, 17, 15);
        // Arial bold 15
        $this->SetFont('Arial', 'B', 15);
        // Move to the right
        $this->Cell(80);
        // Title
        $this->Cell(30, 10, 'CARTOGRAPHIE SANITAIRE D\'HAITI', 0, 0, 'C');
        // Line break
        $this->Ln(20);
    }

// Page footer
    function Footer() {
        // Position at 1.5 cm from bottom
        $this->SetY(-15);
        // Arial italic 8
        $this->SetFont('Arial', 'I', 8);
        // Page number
        $this->Cell(0, 10, 'Page ' . $this->PageNo() . '/{nb}', 0, 0, 'C');
    }

    function ImprovedTable($header, $data) {
        // Column widths
        $w = array(40, 35, 40, 45);
        // Header
        for ($i = 0; $i < count($header); $i++)
            $this->Cell($w[$i], 7, $header[$i], 1, 0, 'C');
        $this->Ln();
        // Data
        foreach ($data as $row) {
            $this->Cell($w[0], 6, $row[0], 'LR');
            $this->Cell($w[1], 6, $row[1], 'LR');
            $this->Cell($w[2], 6, number_format($row[2]), 'LR', 0, 'R');
            $this->Cell($w[3], 6, number_format($row[3]), 'LR', 0, 'R');
            $this->Ln();
        }
        // Closing line
        $this->Cell(array_sum($w), 0, '', 'T');
    }

}

if (!$_POST)
    exit;

$deparment = filter_input(INPUT_POST, 'department', FILTER_DEFAULT);
$facTypes = filter_input(INPUT_POST, 'facTypes', FILTER_DEFAULT);
$services = filter_input(INPUT_POST, 'services', FILTER_DEFAULT, FILTER_REQUIRE_ARRAY);
$operator = filter_input(INPUT_POST, 'operator', FILTER_DEFAULT);
$reportFormat = filter_input(INPUT_POST, 'reportFormat', FILTER_DEFAULT);

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

$timeNow = time();
$header = ["MOH Code", "Facility Name", "Facility Type", "Managing Authority", "Dept.", "UAS", "Commune", "Section Commune", "Lab", "VIH"];
if ($reportFormat == "GenRepCSV") {
// Create the report file and open it with write privelage   
    $file = fopen(__DIR__ . "/../../reports/cartographie/" . date("Y-M-d") . "_" . $timeNow . ".csv", "w");

// TODO : 
// Add Headers
// Select appropriate fields to show
// Get Service Info from SPA DB
// Group by department and type if Haiti Selected else just by type
    array_splice($facTypeArr, 0, 0, "Type Filters:");
    fputcsv($file, $facTypeArr);
    if (count($services) > 0) {
        array_splice($services, 0, 0, "Service Filters:" . ($operator == "OR" ? "(équipements mentionnés offrent au moins un)" : "(équipements mentionnés offrent tout)"));
        fputcsv($file, PrettifyServices($services));
    }
    fputcsv($file, $header);
    foreach ($facs as $fac) {
// some institutions don't have managing authority
        if (array_key_exists("managauthority", $fac)) {
            fputcsv($file, [$fac["code"], $fac["name"], $fac["facilitytype"], $fac["managauthority"], $fac["deptname"], $fac["uasname"], $fac["communename"], $fac["seccomname"], $fac["laboratory"], $fac["vih"]]);
        } else {
            fputcsv($file, [$fac["code"], $fac["name"], $fac["facilitytype"], "", $fac["deptname"], $fac["uasname"], $fac["communename"], $fac["seccomname"], $fac["laboratory"], $fac["vih"]]);
        }
    }

    echo "reports/cartographie/" . date("Y-M-d") . "_" . $timeNow . ".csv";
} else { // PDF
    $pdf = new PDF("L");
    $pdf->AliasNbPages();
    $pdf->AddPage();
    // Export details
    $pdf->SetFont('Arial', 'B', 10);
    // Print Institution Types
    $pdf->Cell(40, 6, 'Type Filters:');
    $pdf->Ln();
    $pdf->SetFont('Arial', '', 8);
    $pdf->MultiCell(0, 3, implode(", ", $facTypeArr));
    $pdf->Ln();
    // Print Service Types if there are any
    if (count($services) > 0) {
        $pdf->SetFont('Arial', 'B', 10);
        $pdf->Cell(0, 6, 'Service Filters:' . ($operator == "OR" ? iconv('UTF-8', 'windows-1252', "(équipements mentionnés offrent au moins un)") : iconv('UTF-8', 'windows-1252', "(équipements mentionnés offrent tout)")));
        $pdf->Ln();
        $pdf->SetFont('Arial', '', 8);
        $pdf->MultiCell(0, 5, implode(", ", PrettifyServices($services)));
        $pdf->Ln();
    }
    // Print out the information in a table
    $w = array(18, 47, 28, 37, 18, 28, 28, 40, 12, 12);
    $pdf->SetFont('Arial', 'B', 8);
    for ($i = 0; $i < count($header); $i++)
        $pdf->Cell($w[$i], 7, $header[$i], 1, 0, 'C');
    $pdf->Ln();
    $pdf->SetFont('Arial', '', 7);
    foreach ($facs as $fac) {
        $pdf->Cell($w[0], 5, $fac["code"], 'LR', 0, "C");
        $pdf->Cell($w[1], 5, $fac["name"], 'LR');
        $pdf->Cell($w[2], 5, $fac["facilitytype"], 'LR');
        if (array_key_exists("managauthority", $fac))
            $pdf->Cell($w[3], 5, $fac["managauthority"], 'LR');
        else
            $pdf->Cell($w[3], 5, "", 'LR');
        $pdf->Cell($w[4], 5, $fac["deptname"], 'LR');
        $pdf->Cell($w[5], 5, str_replace("UAS-", "", $fac["uasname"]), 'LR');
        $pdf->Cell($w[6], 5, $fac["communename"], 'LR');
        $pdf->Cell($w[7], 5, $fac["seccomname"], 'LR');
        $pdf->Cell($w[8], 5, $fac["laboratory"], 'LR');
        $pdf->Cell($w[9], 5, $fac["vih"], 'LR');
        $pdf->Ln();
    }
    // Closing line
    $pdf->Cell(array_sum($w), 0, '', 'T');
    $pdf->Output('F', __DIR__ . "/../../reports/cartographie/" . date("Y-M-d") . "_" . $timeNow . ".pdf");
    echo "reports/cartographie/" . date("Y-M-d") . "_" . $timeNow . ".pdf";
}

function PrettifyServices($services) {
    $prettyServices = [];

    foreach ($services as $service)
        switch ($service) {
            case "fp":
                array_push($prettyServices, "Planification familiale");
                break;
            case "anc":
                array_push($prettyServices, iconv('UTF-8', 'windows-1252', "Soins prénataux"));
                break;
            case "pmtct":
                array_push($prettyServices, "Soin des PTME");
                break;
            case "delivery":
                array_push($prettyServices, "Accouchement");
                break;
            case "malaria":
                array_push($prettyServices, "Prise en charge malaria");
                break;
            case "tb":
                array_push($prettyServices, "Prise en charge TB");
                break;
            case "hivct":
                array_push($prettyServices, "Soin traitement VIH");
                break;
            case "noncomdiseases":
                array_push($prettyServices, "Noncomdiseases");
                break;
            case "minorsurgery":
                array_push($prettyServices, "Chirurgie mineure");
                break;
            case "csections":
                array_push($prettyServices, iconv('UTF-8', 'windows-1252', "Césariennes"));
                break;
            case "sti":
                array_push($prettyServices, "Maladie Sexuellement Transmissible(STI)");
                break;
            case "bloodtransf":
                array_push($prettyServices, "Transfusion sanguine");
                break;
            case "generalmeds":
                array_push($prettyServices, iconv('UTF-8', 'windows-1252', "Médecine générale"));
                break;
            case "hopitalisatioselmen":
                array_push($prettyServices, "Hopitalisation");
                break;
        }
    return $prettyServices;
}
