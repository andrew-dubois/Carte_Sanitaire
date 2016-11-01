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

    function NbLines($w, $txt) {
        //Computes the number of lines a MultiCell of width w will take
        $cw = &$this->CurrentFont['cw'];
        if ($w == 0)
            $w = $this->w - $this->rMargin - $this->x;
        $wmax = ($w - 2 * $this->cMargin) * 1000 / $this->FontSize;
        $s = str_replace("\r", '', $txt);
        $nb = strlen($s);
        if ($nb > 0 and $s[$nb - 1] == "\n")
            $nb--;
        $sep = -1;
        $i = 0;
        $j = 0;
        $l = 0;
        $nl = 1;
        while ($i < $nb) {
            $c = $s[$i];
            if ($c == "\n") {
                $i++;
                $sep = -1;
                $j = $i;
                $l = 0;
                $nl++;
                continue;
            }
            if ($c == ' ')
                $sep = $i;
            $l+=$cw[$c];
            if ($l > $wmax) {
                if ($sep == -1) {
                    if ($i == $j)
                        $i++;
                } else
                    $i = $sep + 1;
                $sep = -1;
                $j = $i;
                $l = 0;
                $nl++;
            } else
                $i++;
        }
        return $nl;
    }

}

if (!$_POST)
    exit;

$deparment = filter_input(INPUT_POST, 'dep-list-dropdmenu', FILTER_DEFAULT);
$services = filter_input(INPUT_POST, 'servFilter', FILTER_DEFAULT, FILTER_REQUIRE_ARRAY);
$facTypes = filter_input(INPUT_POST, 'facType', FILTER_DEFAULT, FILTER_REQUIRE_ARRAY);
$repType = filter_input(INPUT_POST, 'type', FILTER_DEFAULT);

// Sélectionnez Infrastructures Start

$cmbDisponibles = filter_input(INPUT_POST, 'cmbDisponibles', FILTER_DEFAULT);
$nmbDisponibles = filter_input(INPUT_POST, 'nmbDisponibles', FILTER_DEFAULT);

$cmbMaternite = filter_input(INPUT_POST, 'cmbMaternite', FILTER_DEFAULT);
$nmbMaternite = filter_input(INPUT_POST, 'nmbMaternite', FILTER_DEFAULT);

$cmbAccouchment = filter_input(INPUT_POST, 'cmbAccouchment', FILTER_DEFAULT);
$nmbAccouchment = filter_input(INPUT_POST, 'nmbAccouchment', FILTER_DEFAULT);

$cmbGeneraliste = filter_input(INPUT_POST, 'cmbGeneraliste', FILTER_DEFAULT);
$nmbGeneraliste = filter_input(INPUT_POST, 'nmbGeneraliste', FILTER_DEFAULT);

$cmbSpecialiste = filter_input(INPUT_POST, 'cmbSpecialiste', FILTER_DEFAULT);
$nmbSpecialiste = filter_input(INPUT_POST, 'nmbSpecialiste', FILTER_DEFAULT);

$cmbParamedical = filter_input(INPUT_POST, 'cmbParamedical', FILTER_DEFAULT);
$nmbParamedical = filter_input(INPUT_POST, 'nmbParamedical', FILTER_DEFAULT);

$cmbAnesthesiste = filter_input(INPUT_POST, 'cmbAnesthesiste', FILTER_DEFAULT);
$nmbAnesthesiste = filter_input(INPUT_POST, 'nmbAnesthesiste', FILTER_DEFAULT);

$cmbInfirmiere = filter_input(INPUT_POST, 'cmbInfirmiere', FILTER_DEFAULT);
$nmbInfirmiere = filter_input(INPUT_POST, 'nmbInfirmiere', FILTER_DEFAULT);

$cmbAuxilaire = filter_input(INPUT_POST, 'cmbAuxilaire', FILTER_DEFAULT);
$nmbAuxilaire = filter_input(INPUT_POST, 'nmbAuxilaire', FILTER_DEFAULT);

$cmbFemme = filter_input(INPUT_POST, 'cmbFemme', FILTER_DEFAULT);
$nmbFemme = filter_input(INPUT_POST, 'nmbFemme', FILTER_DEFAULT);

$cmbDiplome = filter_input(INPUT_POST, 'cmbDiplome', FILTER_DEFAULT);
$nmbDiplome = filter_input(INPUT_POST, 'nmbDiplome', FILTER_DEFAULT);

$cmbPharmacien = filter_input(INPUT_POST, 'cmbPharmacien', FILTER_DEFAULT);
$nmbPharmacien = filter_input(INPUT_POST, 'nmbPharmacien', FILTER_DEFAULT);

$cmbTPharmacie = filter_input(INPUT_POST, 'cmbTPharmacie', FILTER_DEFAULT);
$nmbTPharmacie = filter_input(INPUT_POST, 'nmbTPharmacie', FILTER_DEFAULT);

$cmbAPharmacie = filter_input(INPUT_POST, 'cmbAPharmacie', FILTER_DEFAULT);
$nmbAPharmacie = filter_input(INPUT_POST, 'nmbAPharmacie', FILTER_DEFAULT);

$cmbLaborantin = filter_input(INPUT_POST, 'cmbLaborantin', FILTER_DEFAULT);
$nmbLaborantin = filter_input(INPUT_POST, 'nmbLaborantin', FILTER_DEFAULT);

$cmbTechnologisteL = filter_input(INPUT_POST, 'cmbTechnologisteL', FILTER_DEFAULT);
$nmbTechnologisteL = filter_input(INPUT_POST, 'nmbTechnologisteL', FILTER_DEFAULT);

$cmbTechnicienL = filter_input(INPUT_POST, 'cmbTechnicienL', FILTER_DEFAULT);
$nmbTechnicienL = filter_input(INPUT_POST, 'nmbTechnicienL', FILTER_DEFAULT);

// Columns

$columnString = filter_input(INPUT_POST, 'hdnColumns', FILTER_DEFAULT);

$columns = explode(";", $columnString);

// Get from DHIS All institutions
$orgUnitDHIS = new OrgUnitDHIS();
$facs = $orgUnitDHIS->getAllInsDHIS($deparment);

foreach ($facs as $facIndex => $fac) {
    if (!in_array($fac["facilitytype"], $facTypes)) {
        unset($facs[$facIndex]);
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

        // filter by services
        if (count($services) > 0) {
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

        // filter by "Infrastructures"
        if ($cmbDisponibles != "")
            If (!checkInfrastructure($cmbDisponibles, $nmbDisponibles, $assocSPAData['nombredelithospi1nuit'])) {
                unset($facs[$facIndex]);
            }
        if ($cmbMaternite != "")
            If (!checkInfrastructure($cmbMaternite, $nmbMaternite, $assocSPAData['nobrlitmaternite'])) {
                unset($facs[$facIndex]);
            }
        if ($cmbAccouchment != "")
            If (!checkInfrastructure($cmbAccouchment, $nmbAccouchment, $assocSPAData['nombrelitaccouchment'])) {
                unset($facs[$facIndex]);
            }
        if ($cmbGeneraliste != "")
            If (!checkInfrastructure($cmbGeneraliste, $nmbGeneraliste, $assocSPAData['nombremedgeneralist'])) {
                unset($facs[$facIndex]);
            }
        if ($cmbSpecialiste != "")
            If (!checkInfrastructure($cmbSpecialiste, $nmbSpecialiste, $assocSPAData['nombremedspecialist'])) {
                unset($facs[$facIndex]);
            }
        if ($cmbParamedical != "")
            If (!checkInfrastructure($cmbParamedical, $nmbParamedical, $assocSPAData['nombrparamedical'])) {
                unset($facs[$facIndex]);
            }
        if ($cmbAnesthesiste != "")
            If (!checkInfrastructure($cmbAnesthesiste, $nmbAnesthesiste, $assocSPAData['nombranesthesit'])) {
                unset($facs[$facIndex]);
            }
        if ($cmbInfirmiere != "")
            If (!checkInfrastructure($cmbInfirmiere, $nmbInfirmiere, $assocSPAData['nombrinfirmierprofess'])) {
                unset($facs[$facIndex]);
            }
        if ($cmbAuxilaire != "")
            If (!checkInfrastructure($cmbAuxilaire, $nmbAuxilaire, $assocSPAData['nombrauxilair'])) {
                unset($facs[$facIndex]);
            }
        if ($cmbFemme != "")
            If (!checkInfrastructure($cmbFemme, $nmbFemme, $assocSPAData['nombrsagefemeprof'])) {
                unset($facs[$facIndex]);
            }
        if ($cmbDiplome != "")
            If (!checkInfrastructure($cmbDiplome, $nmbDiplome, $assocSPAData['nombresagefemmediplome'])) {
                unset($facs[$facIndex]);
            }
        if ($cmbPharmacien != "")
            If (!checkInfrastructure($cmbPharmacien, $nmbPharmacien, $assocSPAData['nimbrpharmacien'])) {
                unset($facs[$facIndex]);
            }
        if ($cmbTPharmacie != "")
            If (!checkInfrastructure($cmbTPharmacie, $nmbTPharmacie, $assocSPAData['nombrpharmtechnologist'])) {
                unset($facs[$facIndex]);
            }
        if ($cmbAPharmacie != "")
            If (!checkInfrastructure($cmbAPharmacie, $nmbAPharmacie, $assocSPAData['nombrassistanpharmacie'])) {
                unset($facs[$facIndex]);
            }
        if ($cmbLaborantin != "")
            If (!checkInfrastructure($cmbLaborantin, $nmbLaborantin, $assocSPAData['nombrlabscientist'])) {
                unset($facs[$facIndex]);
            }
        if ($cmbTechnologisteL != "")
            If (!checkInfrastructure($cmbTechnologisteL, $nmbTechnologisteL, $assocSPAData['nombrlabtechnologis'])) {
                unset($facs[$facIndex]);
            }
        if ($cmbTechnicienL != "")
            If (!checkInfrastructure($cmbTechnicienL, $nmbTechnicienL, $assocSPAData['nombrlabtechnicien'])) {
                unset($facs[$facIndex]);
            }

        if (array_key_exists($facIndex, $facs))
            $facs[$facIndex] = array_merge($fac, $assocSPAData);
    } else {
        // If the user selected to filter by services then we need a link to SPA, if no link then remove
        if (count($services) > 0) {
            unset($facs[$facIndex]);
        }
        // If the user selected to filter by infrastructure then we need a link to SPA, if no link then remove
        if ($cmbDisponibles != "" || $cmbMaternite != "" || $cmbAccouchment != "" || $cmbGeneraliste != "" || $cmbSpecialiste != "" || $cmbParamedical != "" || $cmbAnesthesiste != "" || $cmbInfirmiere != "" || $cmbAuxilaire != "" || $cmbFemme != "" || $cmbDiplome != "" || $cmbPharmacien != "" || $cmbTPharmacie != "" || $cmbAPharmacie != "" || $cmbLaborantin != "" || $cmbTechnologisteL != "" || $cmbTechnicienL != "") {
            unset($facs[$facIndex]);
        }
    }
}

$timeNow = time();

if ($repType == 'PDF') {

    $pdf = new PDF("L");
    $pdf->AliasNbPages();
    $pdf->AddPage();

    $pdf->SetFont('Arial', 'B', 10);
    // Print Institution Types
    $pdf->Cell(40, 6, 'Type Filters:');
    $pdf->Ln();
    $pdf->SetFont('Arial', '', 8);
    $pdf->MultiCell(0, 3, implode(", ", $facTypes));
    $pdf->Ln();
    // Print Service Types if there are any
    if (count($services) > 0) {
        $pdf->SetFont('Arial', 'B', 10);
        $pdf->Cell(0, 6, 'Service Filters:');
        $pdf->Ln();
        $pdf->SetFont('Arial', '', 8);
        $pdf->MultiCell(0, 5, implode(", ", PrettifyColumns($services)));
        $pdf->Ln();
    }
    $pdf->Ln();
    $w = getArrayLengths($columns);
    $prettyColumns = PrettifyColumns($columns);
    $pdf->SetFont('Arial', 'B', 8);
    $nb = 0;
    for ($i = 0; $i < count($columns); $i++) {

        $nb = max($nb, $pdf->NbLines($w[$i], $prettyColumns[$i]));
    }
    $h = 5 * $nb;

    $leftx = $pdf->GetX();  // for the start of a new line
    for ($i = 0; $i < count($columns); $i++) {
        $x = $pdf->GetX();
        $y = $pdf->GetY();
        $pdf->Rect($x, $y, $w[$i], $h);
        $pdf->MultiCell($w[$i], 5, $prettyColumns[$i], 0, 0, 'C', false);
    }

    // breakline
    $y = $pdf->GetY();
    $pdf->SetXY($leftx, $y + $h);

    $pdf->SetFont('Arial', '', 7);
    foreach ($facs as $fac) {
        $nb = 0;
        for ($i = 0; $i < count($columns); $i++) {
            if (array_key_exists($columns[$i], $fac)) {
                $nb = max($nb, $pdf->NbLines($w[$i], $fac[$columns[$i]]));
            }
        }
        $h = 5 * $nb;

        for ($i = 0; $i < count($columns); $i++) {
            $x = $pdf->GetX();
            $y = $pdf->GetY();
            $pdf->Rect($x, $y, $w[$i], $h);
            if (array_key_exists($columns[$i], $fac)) {
                if (is_numeric($fac[$columns[$i]]))
                    $pdf->MultiCell($w[$i], 5, $fac[$columns[$i]], 0, 0, "C", false);
                else
                    $pdf->MultiCell($w[$i], 5, $fac[$columns[$i]], 0, 0, "LR", false);
            }
            else {
                $pdf->MultiCell($w[$i], 5, "", 0, 0, "LR", false);
            }
        }

        // breakline
        $y = $pdf->GetY();
        if ($y > 175) {
            $pdf->AddPage();
        } else {
            $pdf->SetXY($leftx, $y + $h);
        }
    }
    // Closing line
    //$pdf->Cell(array_sum($w), 0, '', 'T');

    $pdf->Output("D", date("Y-M-d") . "_" . $timeNow . ".pdf");
} else {
    
}

function checkInfrastructure($operator, $number, $dbValue) {
    if ($dbValue == null || $dbValue == "")
        return false;

    switch ($operator) {
        case ">":
            return $dbValue > $number;
            break;
        case ">=":
            return $dbValue >= $number;
            break;
        case "<":
            return $dbValue < $number;
            break;
        case "<=":
            return $dbValue <= $number;
            break;
        case "=":
            return $dbValue == $number;
            break;
    }

    return false;
}

function PrettifyColumns($columns) {
    $prettyHeader = [];

    foreach ($columns as $column) {
        switch ($column) {
            case "code":
                array_push($prettyHeader, "MOH Code");
                break;
            case "name":
                array_push($prettyHeader, "Facility Name");
                break;
            case "facilitytype":
                array_push($prettyHeader, "Facility Type");
                break;
            case "deptname":
                array_push($prettyHeader, "Department");
                break;
            case "managauthority":
                array_push($prettyHeader, "Managing Authority");
                break;
            case "uasname":
                array_push($prettyHeader, "UAS");
                break;
            case "communename":
                array_push($prettyHeader, "Commune");
                break;
            case "seccomname":
                array_push($prettyHeader, "Section Commune");
                break;
            case "coordinates":
                array_push($prettyHeader, "Coordinates");
                break;
            case "childvacc":
                array_push($prettyHeader, "Vaccination des enfants");
                break;
            case "growthmon":
                array_push($prettyHeader, iconv('UTF-8', 'windows-1252', "Pésée des enfants"));
                break;
            case "sickchild":
                array_push($prettyHeader, iconv('UTF-8', 'windows-1252', "Prise en charge spécialisé pédiatrique"));
                break;
            case "sti":
                array_push($prettyHeader, "Maladie Sexuellement Transmissible(STI)");
                break;
            case "bloodtype":
                array_push($prettyHeader, "Groupe sanguin");
                break;
            case "hopitalisatioselmen":
                array_push($prettyHeader, "Hopitalisation");
                break;
            case "ambulancedispo":
                array_push($prettyHeader, "Ambulance disponible");
                break;
            case "delivery":
                array_push($prettyHeader, "Accouchement");
                break;
            case "fp":
                array_push($prettyHeader, "Planification familiale");
                break;
            case "pmtct":
                array_push($prettyHeader, "Soin des PTME");
                break;
            case "malaria":
                array_push($prettyHeader, "Prise en charge malaria");
                break;
            case "hivct":
                array_push($prettyHeader, "Soin traitement VIH");
                break;
            case "minorsurgery":
                array_push($prettyHeader, "Chirurgie mineure");
                break;
            case "laboratory":
                array_push($prettyHeader, "Laboratoire");
                break;
            case "generalmeds":
                array_push($prettyHeader, iconv('UTF-8', 'windows-1252', "Médecine générale"));
                break;
            case "servicedisp024h":
                array_push($prettyHeader, "Service disponible 24/24");
                break;
            case "anc":
                array_push($prettyHeader, iconv('UTF-8', 'windows-1252', "Soins prénataux"));
                break;
            case "tb":
                array_push($prettyHeader, "Prise en charge TB");
                break;
            case "noncomdiseases":
                array_push($prettyHeader, "Noncomdiseases");
                break;
            case "csections":
                array_push($prettyHeader, iconv('UTF-8', 'windows-1252', "Césariennes"));
                break;
            case "bloodtransf":
                array_push($prettyHeader, "Transfusion sanguine");
                break;
            case "nombredelithospi1nuit":
                array_push($prettyHeader, "Nombre de lits disponibles");
                break;
            case "nombrelitaccouchment":
                array_push($prettyHeader, iconv('UTF-8', 'windows-1252', "Nombre de lit d'accouchment"));
                break;
            case "nombremedspecialist":
                array_push($prettyHeader, iconv('UTF-8', 'windows-1252', "Nombre de médecin spécialiste"));
                break;
            case "nombranesthesit":
                array_push($prettyHeader, iconv('UTF-8', 'windows-1252', "Nombre de médecin anesthésiste"));
                break;
            case "nombrauxilair":
                array_push($prettyHeader, iconv('UTF-8', 'windows-1252', "Nombre d'auxilaire"));
                break;
            case "nombresagefemmediplome":
                array_push($prettyHeader, iconv('UTF-8', 'windows-1252', "Nombre de sage femme diplômé"));
                break;
            case "nombrpharmtechnologist":
                array_push($prettyHeader, "Nombre de technicien en pharmacie");
                break;
            case "nombrlabscientist":
                array_push($prettyHeader, "Nombre de laborantin(e)");
                break;
            case "nombrlabtechnicien":
                array_push($prettyHeader, "Nombre de technicien de laboratoire");
                break;
            case "nobrlitmaternite":
                array_push($prettyHeader, iconv('UTF-8', 'windows-1252', "Nombre de lit maternité"));
                break;
            case "nombremedgeneralist":
                array_push($prettyHeader, iconv('UTF-8', 'windows-1252', "Nombre de médecin généraliste"));
                break;
            case "nombrparamedical":
                array_push($prettyHeader, iconv('UTF-8', 'windows-1252', "Nombre paramédical"));
                break;
            case "nombrinfirmierprofess":
                array_push($prettyHeader, iconv('UTF-8', 'windows-1252', "Nombre d'infirmière"));
                break;
            case "nombrsagefemeprof":
                array_push($prettyHeader, "Nombre de sage femme");
                break;
            case "nimbrpharmacien":
                array_push($prettyHeader, "Nombre de pharmacien");
                break;
            case "nombrassistanpharmacie":
                array_push($prettyHeader, iconv('UTF-8', 'windows-1252', "Nombre d'assistant pharmacien"));
                break;
            case "nombrlabtechnologis":
                array_push($prettyHeader, iconv('UTF-8', 'windows-1252', "Nombre de technologiste de laboratoire"));
                break;
            default:
                array_push($prettyHeader, $column);
                break;
        }
    }
    return $prettyHeader;
}

function getArrayLengths($columns) {
    $w = array();

    foreach ($columns as $column) {
        switch ($column) {
            case "code":
                array_push($w, 18);
                break;
            case "name":
                array_push($w, 47);
                break;
            case "facilitytype":
                array_push($w, 28);
                break;
            case "deptname":
                array_push($w, 18);
                break;
            case "managauthority":
                array_push($w, 37);
                break;
            case "uasname":
                array_push($w, 28);
                break;
            case "communename":
                array_push($w, 28);
                break;
            case "seccomname":
                array_push($w, 40);
                break;
            case "coordinates":
                array_push($w, 40);
                break;
            case "childvacc":
                array_push($w, 20);
                break;
            case "growthmon":
                array_push($w, 20);
                break;
            case "sickchild":
                array_push($w, 20);
                break;
            case "sti":
                array_push($w, 12);
                break;
            case "bloodtype":
                array_push($w, 20);
                break;
            case "hopitalisatioselmen":
                array_push($w, 25);
                break;
            case "ambulancedispo":
                array_push($w, 25);
                break;
            case "delivery":
                array_push($w, 25);
                break;
            case "fp":
                array_push($w, 25);
                break;
            case "pmtct":
                array_push($w, 25);
                break;
            case "malaria":
                array_push($w, 25);
                break;
            case "hivct":
                array_push($w, 25);
                break;
            case "minorsurgery":
                array_push($w, 25);
                break;
            case "laboratory":
                array_push($w, 25);
                break;
            case "generalmeds":
                array_push($w, 25);
                break;
            case "servicedisp024h":
                array_push($w, 25);
                break;
            case "anc":
                array_push($w, 25);
                break;
            case "tb":
                array_push($w, 25);
                break;
            case "noncomdiseases":
                array_push($w, 25);
                break;
            case "csections":
                array_push($w, 25);
                break;
            case "bloodtransf":
                array_push($w, 25);
                break;
            case "nombredelithospi1nuit":
                array_push($w, 25);
                break;
            case "nombrelitaccouchment":
                array_push($w, 25);
                break;
            case "nombremedspecialist":
                array_push($w, 25);
                break;
            case "nombranesthesit":
                array_push($w, 25);
                break;
            case "nombrauxilair":
                array_push($w, 25);
                break;
            case "nombresagefemmediplome":
                array_push($w, 25);
                break;
            case "nombrpharmtechnologist":
                array_push($w, 25);
                break;
            case "nombrlabscientist":
                array_push($w, 25);
                break;
            case "nombrlabtechnicien":
                array_push($w, 25);
                break;
            case "nobrlitmaternite":
                array_push($w, 25);
                break;
            case "nombremedgeneralist":
                array_push($w, 25);
                break;
            case "nombrparamedical":
                array_push($w, 25);
                break;
            case "nombrinfirmierprofess":
                array_push($w, 25);
                break;
            case "nombrsagefemeprof":
                array_push($w, 25);
                break;
            case "nimbrpharmacien":
                array_push($w, 25);
                break;
            case "nombrassistanpharmacie":
                array_push($w, 25);
                break;
            case "nombrlabtechnologis":
                array_push($w, 25);
                break;
            default:
                array_push($w, 5);
                break;
        }
    }

    return $w;
}
