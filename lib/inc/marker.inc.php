<?php

include('../core/getPoint.php');
include('../core/OrgUnitSPA.php');
include('../core/OrgUnitDHIS.php');

if (isset($_GET['idIns'])) {
    $dom = new DomDocument('1.0', 'utf-8');
    $node = $dom->createElement("markers");
    $parnode = $dom->appendChild($node);
    $point = new GetPoint;
    $pos = $point->createXmlMarkerByIns($_GET['idIns']);
    for ($i = 0; $i < count($pos); $i++) {
        $node = $dom->createElement("marker");
        $newnode = $parnode->appendChild($node);
        $newnode->setAttribute("titre", $pos[$i]['nom']);
        $newnode->setAttribute("lat", $pos[$i]['x_lat']);
        $newnode->setAttribute("lng", $pos[$i]['y_long']);
        $newnode->setAttribute("nombre_phys", $pos[$i]['nombre_phys']);
        $newnode->setAttribute("nombre_infirm", $pos[$i]['nombre_infirm']);
        $newnode->setAttribute("description", utf8_encode($pos[$i]['institution_description']));
    }
    $xmlfile = $dom->saveXML();
    echo $xmlfile;
    exit;
}

//View the facilities of the selected departement
if (isset($_GET['idDep'])) {
    $dom = new DomDocument('1.0', 'utf-8');
    $node = $dom->createElement("markers");
    $parnode = $dom->appendChild($node);
    $fac = new OrgUnitSPA;
    $dataFac = $fac->getUnitsByDep($_GET['idDep']);

    for ($i = 0; $i < count($dataFac); $i++) {
        $nomCommIns = $fac->getDataCommuneIns($dataFac[$i]['commune_code']);
        $node = $dom->createElement("marker");
        $newnode = $parnode->appendChild($node);
        $newnode->setAttribute("titre", $dataFac[$i]['nom']);
        $newnode->setAttribute("lat", $dataFac[$i]['x_lat']);
        $newnode->setAttribute("lng", $dataFac[$i]['y_long']);
        $newnode->setAttribute("nombre_phys", $dataFac[$i]['nombre_phys']);
        $newnode->setAttribute("nombre_infirm", $dataFac[$i]['nombre_infirm']);
        $newnode->setAttribute("nom_comm", $nomCommIns[0]["commune_nom"]);
        $newnode->setAttribute("description", utf8_encode($dataFac[$i]['institution_description']));
    }
    $xmlfile = $dom->saveXML();
    echo $xmlfile;
    exit;
}

//View all facilities of all departements
if (isset($_GET['allF']) && $_GET['allF'] == 'all') {
    $dom = new DomDocument('1.0', 'utf-8');
    $node = $dom->createElement("markers");
    $parnode = $dom->appendChild($node);
    $facs = new OrgUnitSPA;

    $dataFac = $facs->getAllIns();
    for ($i = 0; $i < count($dataFac); $i++) {
        $node = $dom->createElement("marker");
        $newnode = $parnode->appendChild($node);
        $newnode->setAttribute("ins_code", $dataFac[$i]['institution_code']);
        $newnode->setAttribute("titre", $dataFac[$i]['nom']);
        $newnode->setAttribute("lat", $dataFac[$i]['x_lat']);
        $newnode->setAttribute("lng", $dataFac[$i]['y_long']);
        $newnode->setAttribute("nombre_phys", $dataFac[$i]['nombre_phys']);
        $newnode->setAttribute("nombre_infirm", $dataFac[$i]['nombre_infirm']);
        $newnode->setAttribute("commune_code", $dataFac[$i]["commune_code"]);
        $newnode->setAttribute("departement_code", $dataFac[$i]["departement_code"]);
        $newnode->setAttribute("description", utf8_encode($dataFac[$i]['institution_description']));
    }
    $xmlfile = $dom->saveXML();
    echo $xmlfile;
    exit;
}

/* * ******************** DHIS **************************** */
//View all DHIS facilities of all departements
if (isset($_GET['allFDHIS'])) {
    $dom = new DomDocument('1.0', 'utf-8');
    $node = $dom->createElement("markers");
    $parnode = $dom->appendChild($node);
    $depname = $_GET['allFDHIS'];
    $facs = new OrgUnitDHIS;
    $facSPA = new OrgUnitSPA;
    $dataFac = $facs->getAllInsDHIS($depname);

    //$servFilters = filter_input(INPUT_GET, 'servFilter', FILTER_DEFAULT, FILTER_REQUIRE_ARRAY);
    // FOR FUTURE USE (Instead of resetting filters when a department is changed we incldue the filters to department)
    // If we are not filtering by services
    // Display all facilities from DHIS 2 (Whether or not they have a link to service information in SPA)
    //if (!isset($servFilters)) {
    $dataFacSPA = $facSPA->getAllInsSPACustom($depname);
    foreach ($dataFac as $row) {
        $node = $dom->createElement("marker");
        $newnode = $parnode->appendChild($node);
        $newnode->setAttribute("id_code", $row['id']);
        $newnode->setAttribute("ins_code_MOH", $row['code']);
        $newnode->setAttribute("titre", $row['name']);
        $newnode->setAttribute("facility_type", $row['facilitytype']);
        $newnode->setAttribute("departement_name", $row['deptname']);
        $newnode->setAttribute("commune_name", $row['communename']);
        $CoordVals = json_decode($row['coordinates']);
        $newnode->setAttribute("lat", $CoordVals[1]);
        $newnode->setAttribute("lng", $CoordVals[0]);
        if (array_key_exists('managauthority', $row))
            $newnode->setAttribute("manag_authority", $row['managauthority']);
        $newnode->setAttribute("vComm_name", $row['communename']);

        // Now we need to match up the moh_code from DHIS to the moh_code in DHIS for the service information
        if (array_key_exists($row['code'], $dataFacSPA)) {
            $SPAFac = $dataFacSPA[$row['code']];

            $newnode->setAttribute("nb_bed_overnight", ($SPAFac['nombredelithospi1nuit'] === null) ? "Inconnu" : $SPAFac['nombredelithospi1nuit']);
            $newnode->setAttribute("nb_gen_medPrac", ($SPAFac['nombremedgeneralist'] === null) ? "Inconnu" : $SPAFac['nombremedgeneralist']);
            $newnode->setAttribute("nb_spePrac", ($SPAFac['nombremedspecialist'] === null) ? "Inconnu" : $SPAFac['nombremedspecialist']);
            $newnode->setAttribute("typ_service_avail", $SPAFac['servicedisp024h']);
            $newnode->setAttribute("is_Lab", ($SPAFac['laboratory'] === null) ? 0 : (int) $SPAFac['laboratory']);  // assume no if null
            $newnode->setAttribute("is_HIVService", ($SPAFac['hivct'] || $SPAFac['hivcss'] || $SPAFac['pmtct']) ? 1 : 0);
            //Services
            $newnode->setAttribute("FP", $SPAFac['fp']);
            $newnode->setAttribute("ANC", $SPAFac['anc']);
            $newnode->setAttribute("PMTCT", $SPAFac['pmtct']);
            $newnode->setAttribute("delivery", $SPAFac['delivery']);
            $newnode->setAttribute("malaria", $SPAFac['malaria']);
            $newnode->setAttribute("tb", $SPAFac['tb']);
            $newnode->setAttribute("hivct", $SPAFac['hivct']);
            $newnode->setAttribute("noncomdiseases", $SPAFac['noncomdiseases']);
            $newnode->setAttribute("minorsurgery", $SPAFac['minorsurgery']);
            $newnode->setAttribute("csections", $SPAFac['csections']);
            $newnode->setAttribute("sti", $SPAFac['sti']);
            $newnode->setAttribute("bloodtransf", $SPAFac['bloodtransf']);
            $newnode->setAttribute("generalmeds", $SPAFac['generalmeds']);
            $newnode->setAttribute("hopitalisatioselmen", $SPAFac['hopitalisatioselmen']);
            $newnode->setAttribute("GrowthMon", $SPAFac['growthmon']);
            $newnode->setAttribute("Sickchild", $SPAFac['sickchild']);
        } else {    // In order to have "Inconnu" on the info window instead of "null"
            $newnode->setAttribute("nb_bed_overnight", "Inconnu");
            $newnode->setAttribute("nb_gen_medPrac", "Inconnu");
            $newnode->setAttribute("nb_spePrac", "Inconnu");
            $newnode->setAttribute("is_Lab", 0);  // assume no if unknown
            $newnode->setAttribute("is_HIVService", 0); // assume no if unknown
        }
    }

    $xmlfile = $dom->saveXML();
    echo $xmlfile;
    exit;
}

if (isset($_GET['facilityid']) && isset($_GET['sfac'])) {
    $facid = $_GET['facilityid'];

    $dom = new DomDocument('1.0', 'utf-8');
    $node = $dom->createElement("markers");
    $parnode = $dom->appendChild($node);
    $facs = new OrgUnitDHIS;
    $facSPA = new OrgUnitSPA;
    $dataFac = $facs->getDHISfac_byID($facid);

    $dataFacSPA = $facSPA->getSPAfac_bymohcode($dataFac['code']);

    $node = $dom->createElement("marker");
    $newnode = $parnode->appendChild($node);
    $newnode->setAttribute("id_code", $dataFac['id']);
    $newnode->setAttribute("ins_code_MOH", $dataFac['code']);
    $newnode->setAttribute("titre", $dataFac['name']);
    $newnode->setAttribute("facility_type", $dataFac['facilitytype']);
    $newnode->setAttribute("departement_name", $dataFac['deptname']);
    $newnode->setAttribute("commune_name", $dataFac['communename']);
    $CoordVals = json_decode($dataFac['coordinates']);
    $newnode->setAttribute("lat", $CoordVals[1]);
    $newnode->setAttribute("lng", $CoordVals[0]);
    if (array_key_exists('managauthority', $dataFac))
        $newnode->setAttribute("manag_authority", $dataFac['managauthority']);
    $newnode->setAttribute("vComm_name", $dataFac['communename']);

    // Now we need to match up the moh_code from DHIS to the moh_code in DHIS for the service information
    if (count($dataFacSPA) > 0) {
        $SPAFac = $dataFacSPA[0];

        $newnode->setAttribute("nb_bed_overnight", ($SPAFac['nombredelithospi1nuit'] === null) ? "Inconnu" : $SPAFac['nombredelithospi1nuit']);
        $newnode->setAttribute("nb_gen_medPrac", ($SPAFac['nombremedgeneralist'] === null) ? "Inconnu" : $SPAFac['nombremedgeneralist']);
        $newnode->setAttribute("nb_spePrac", ($SPAFac['nombremedspecialist'] === null) ? "Inconnu" : $SPAFac['nombremedspecialist']);
        $newnode->setAttribute("typ_service_avail", $SPAFac['servicedisp024h']);
        $newnode->setAttribute("is_Lab", ($SPAFac['laboratory'] === null) ? 0 : (int) $SPAFac['laboratory']);  // assume no if null
        $newnode->setAttribute("is_HIVService", ($SPAFac['hivct'] || $SPAFac['hivcss'] || $SPAFac['pmtct']) ? 1 : 0);
        //Services
        $newnode->setAttribute("GrowthMon", $SPAFac['growthmon']);
        $newnode->setAttribute("Sickchild", $SPAFac['sickchild']);
        $newnode->setAttribute("FP", $SPAFac['fp']);
        $newnode->setAttribute("ANC", $SPAFac['anc']);
        $newnode->setAttribute("PMTCT", $SPAFac['pmtct']);
        $newnode->setAttribute("delivery", $SPAFac['delivery']);
        $newnode->setAttribute("malaria", $SPAFac['malaria']);
        $newnode->setAttribute("sti", $SPAFac['sti']);
        $newnode->setAttribute("tb", $SPAFac['tb']);
        $newnode->setAttribute("hivct", $SPAFac['hivct']);
        $newnode->setAttribute("minorsurgery", $SPAFac['minorsurgery']);
        $newnode->setAttribute("csections", $SPAFac['csections']);
        $newnode->setAttribute("hopitalisatioselmen", $SPAFac['hopitalisatioselmen']);
    } else {    // In order to have "Inconnu" on the info window instead of "null"
        $newnode->setAttribute("nb_bed_overnight", "Inconnu");
        $newnode->setAttribute("nb_gen_medPrac", "Inconnu");
        $newnode->setAttribute("nb_spePrac", "Inconnu");
        $newnode->setAttribute("is_Lab", 0);  // assume no if unknown
        $newnode->setAttribute("is_HIVService", 0); // assume no if unknown
    }

    $xmlfile = $dom->saveXML();
    echo $xmlfile;
    exit;
}
?>