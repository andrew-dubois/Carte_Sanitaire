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

if (isset($_GET['qfacname5'])) {
    $orgunit = new OrgUnitDHIS();
    $qfacname = $_GET['qfacname5'];
    $qfac = $orgunit->getDHISfacs_byNameLimit5($qfacname);
    echo json_encode($qfac);
    exit;
}

if (isset($_GET['qfacname'])) {
    $orgunit = new OrgUnitDHIS();
    $qfacname = $_GET['qfacname'];
    $qfac = $orgunit->getDHISfacs_byName($qfacname);
    echo json_encode($qfac);
    exit;
}