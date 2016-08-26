<?php
include(dirname(dirname(__FILE__)) . '/core/orgunitSPA.php');
session_start();
/*
 * Views orgunits by commune
 * @param int $idComm
 * Returns Array
 */

function orgUnitsByCommune($idComm) {
    $orgunit = new OrgUnitSPA;
    $orglist = $orgunit->getUnitsByCommune($idComm);
    for ($i = 0; $i < count($orglist); $i++) {
        ?>
        <li>
            <span>
                <a href="#" class="inst" id="<?php echo $orglist[$i]['institution_code'] ?>">
        <?php echo $orglist[$i]['nom'] ?>
                </a>
            </span>
        </li>
        <?php
    }
}

/*
 * Views facility type number by department
 * @param string $depname
 * Returns Array
 */
if (isset($_GET['facSPAtypeDep'])) {
    $depname = $_GET['facSPAtypeDep'];
    $orgunit = new OrgUnitSPA;
    $orglist = $orgunit->getSPAfacbyDep($depname);
    echo json_encode($orglist);
    exit;
}
/*
 * Views facility number with lab by department
 * @param string $depname
 * Returns Array
 */
if (isset($_GET['facSPALabDep'])) {
    $depname = $_GET['facSPALabDep'];
    $orgunit = new OrgUnitSPA;
    $orglist = $orgunit->getSPAfacLab($depname);
    echo json_encode($orglist);
    exit;
}

/*
 * Views facility number with HIV program by department
 * @param string $depname
 * Returns Array
 */
if (isset($_GET['facSPAHIVDep'])) {
    $depname = $_GET['facSPAHIVDep'];
    $orgunit = new OrgUnitSPA;
    $orglist = $orgunit->getSPAfacVIH($depname);
    echo json_encode($orglist);
    exit;
}

/*
 * Search facility by name
 * @param string $facname
 * Returns Array
 */

if (isset($_GET['qfacname'])) {
    $orgunit = new OrgUnitSPA;
    $facname = $_GET['qfacname'];
    $qfac = $orgunit->searchFacbyName($facname);
    echo json_encode($qfac);
    exit;
}

/*
 * Search facility by keyword
 * @param string $keyword
 * Returns Array
 */

if (isset($_GET['keyword'])) {
    $orgunit = new OrgUnitSPA;
    $facname = $_GET['keyword'];
    $qfac = $orgunit->searchFacbyKeyWord($facname);
    echo json_encode($qfac);
    exit;
}

/*
 * Search facility by commune
 * @param string $commune_name
 * Returns Array
 */
if (isset($_GET['comm_name'])) {
    $orgunit = new OrgUnitSPA;
    $commune_name = $_GET['comm_name'];
    $qfac = $orgunit->getSPAfac_byComm($commune_name);
    echo json_encode($qfac);
    exit;
}

/*
 * get commune name by deptname
 * @param string deptname, getcommName
 * Returns Array
 */
if ((isset($_GET['getcommName'])) && (isset($_GET['deptname']))) {
    $orgunit = new OrgUnitSPA;
    $deptname = $_GET['deptname'];
    $qfac = $orgunit->getCommunename_byDep($deptname);
    echo json_encode($qfac);
    exit;
}

/*
 * filter facility per indicator by commune or dept
 * Returns Array
 */

if (isset($_GET['ind_name']) && isset($_GET['ind_val']) && isset($_GET['deptname'])) {
    $orgunit = new OrgUnitSPA;
    $indicator_val = $_GET['ind_val'];
    $indicator_name = $_GET['ind_name'];
    $deptname = $_GET['deptname'];
    $qfac = $orgunit->getFacby_Indicator($indicator_name, $indicator_val, $deptname);
    echo json_encode($qfac);
    exit;
}

/*
 * Views facility by departement, commune(if so) and services
 * @param string $depname, commune, servicelist
 * Returns Array
 */
if (isset($_GET['facSPAtypeDep'])) {
    $depname = $_GET['facSPAtypeDep'];
    $orgunit = new OrgUnitSPA;
    $orglist = $orgunit->getSPAfacbyDep($depname);
    echo json_encode($orglist);
    exit;
}

/*
 * Store id fac in session
 * @param string facid
 * Returns none
 */

if (isset($_GET['store_FACID'])) {
    $_SESSION['facid'] = $_GET['store_FACID'];
    exit;
}

/*
 * get factype and coord using ids
 * @param string getfactype_coord
 * Returns none
 */

if (isset($_GET['getfactype_coord'])) {
    $ids = $_GET['getfactype_coord'];
    $orgunit = new OrgUnitSPA;
    $orglist = $orgunit->getSPAfactype_coord($ids);
    echo json_encode($orglist);
    exit;
}
?>