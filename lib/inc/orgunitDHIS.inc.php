<?php

include(dirname(dirname(__FILE__)) . '/core/orgunitDHIS.php');
session_start();

if (isset($_GET['comm_id'])) {
    $orgunit = new OrgUnitDHIS();
    $commune_id = $_GET['comm_id'];
    $qfac = $orgunit->getDHISfac_byComm($commune_id);
    echo json_encode($qfac);
    exit;
}


