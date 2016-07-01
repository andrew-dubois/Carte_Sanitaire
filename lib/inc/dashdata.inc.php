<?php
include(dirname(dirname(__FILE__)) . '/core/dashdata.php');
include(dirname(dirname(__FILE__)) . '/core/popdata.php');
//GLOBAL VARIABLE
$ONE_INDICATION_SELECTED = false;


/*
 * get indicators by group
 * @param string none
 * Returns json content for datatable plugin
 */
if (isset($_GET['dhisdata']) && isset($_GET['groupindname']) && isset($_GET['querydate'])) {
    $dhis_data_filter = array();
    $pdata = new DashData;
    $dhis_data_groupind = $_GET['groupindname']; //get the indicator group name
    //get the query date
    $filter = explode(":", $_GET['querydate']);
    $month_ind = $filter[0];
    $year_ind = $filter[1];
    $queryDateUi = $year_ind . "-" . $month_ind;

    $faclist = $pdata->alldhis2_data_grpind($dhis_data_groupind);

    //filter by date
    $arrtempbydat = array();
    for ($i = 0; $i < count($faclist); $i++) {
        $dat_dhis = $faclist[$i]['periode'];
        $dat_dhis = explode("-", $dat_dhis);
        $dat_dhis = $dat_dhis[0] . "-" . $dat_dhis[1];

        if ($dat_dhis == $queryDateUi) {
            $arrtempbydat[] = $faclist[$i];
        }
    }
    $faclist = $arrtempbydat;
    //get all regions this query contains
    $region = array();
    //indicator in the selected group

    for ($i = 0; $i < count($faclist); $i++) {
        $region[] = $faclist[$i]['institution'];
    }
    $region = array_unique($region);
    //array of data for each indicator in the group
    $arr_ind_grp = array(
        "Accouchement_Institutionel" => array(),
        "Accouchement_Non_Institutionel" => array()
    );
    foreach ($arr_ind_grp as $key => $value) {
        for ($i = 0; $i < count($faclist); $i++) {
            if ($faclist[$i]['indicateur'] == $key) {
                $tempArray = array();
                $tempArray['indicateur'] = $faclist[$i]['indicateur'];
                $tempArray['periode'] = $faclist[$i]['periode'];
                $tempArray['institution'] = $faclist[$i]['institution'];
                $tempArray['valeur'] = $faclist[$i]['valeur'];
                $arr_ind_grp[$key][] = $tempArray;
            }
        }
    }


    foreach ($region as $value) {
        $arrTemp = array();
        $acc_inst = $arr_ind_grp['Accouchement_Institutionel'];
        for ($i = 0; $i < count($acc_inst); $i++) {
            if ($acc_inst[$i]['institution'] == $value) {
                $arrTemp['normal'] = $acc_inst[$i]['valeur'];
            }
        }
        $acc_n_inst = $arr_ind_grp['Accouchement_Non_Institutionel'];
        for ($i = 0; $i < count($acc_n_inst); $i++) {
            if ($acc_n_inst[$i]['institution'] == $value) {
                $arrTemp['matronne'] = $acc_n_inst[$i]['valeur'];
            }
        }

        $arrTemp['cesarienne'] = 0;
        $arrTemp['estimation_femmes_enceintes'] = 0;
        $arrTemp['region'] = $value;
        $dhis_data_filter[] = $arrTemp;
    }

    echo"{\"data\": [";
    $popData = new PopData;
    for ($i = 0; $i < count($dhis_data_filter); $i++) {

        $nbPopCommArr = '';
        $nbPopCommArr = $popData->getNbPopByComm($dhis_data_filter[$i]['region'], 'f_enceintes');

        if ($nbPopCommArr) {
            $nbPopComm = $nbPopCommArr[0][0];
        } else {
            $nbPopComm = 0;
        }

        if ($i == (count($dhis_data_filter) - 1)) {
            echo"[";

            echo"\"" . $nbPopComm . "\",";
            echo"\"" . $dhis_data_filter[$i]['cesarienne'] . "\",";
            echo"\"" . $dhis_data_filter[$i]['normal'] . "\",";
            echo"\"" . $dhis_data_filter[$i]['matronne'] . "\",";
            echo"\"" . $dhis_data_filter[$i]['region'] . "\"";

            echo"]";
        } else {
            echo"[";

            echo"\"" . $nbPopComm . "\",";
            echo"\"" . $dhis_data_filter[$i]['cesarienne'] . "\",";
            echo"\"" . $dhis_data_filter[$i]['normal'] . "\",";
            echo"\"" . $dhis_data_filter[$i]['matronne'] . "\",";
            echo"\"" . $dhis_data_filter[$i]['region'] . "\"";

            echo"],";
        }
    }

    echo"]}";

    exit;
}


/*
 * get all indicators names
 * @param string none
 * Returns json content for datatable plugin
 */
if (isset($_GET['dhisdata']) && isset($_GET['filter'])) {
    $pdata = new DashData;
    $faclist = $pdata->alldhis2_data_ind();
    $dhis_data_filter = array();
    //filter data
    $filter = explode(":", $_GET['filter']);
    $ind_name = $filter[0];
    $month_ind = $filter[1];
    $year_ind = $filter[2];

    for ($i = 0; $i < count($faclist); $i++) {
        $dat_dhis = explode("-", $faclist[$i]['periode']);
        $month_dhis = $dat_dhis[1];
        $year_dhis = $dat_dhis[0];

        $dhis_year_month_dat = $year_dhis . $month_dhis;
        $queryDate = $year_ind . $month_ind;

        //if all indicators is selected
        if ($ind_name == 'all') {
            if ($dhis_year_month_dat == $queryDate) {

                $arrTemp = array();
                $arrTemp['institution'] = $faclist[$i]['institution'];
                $arrTemp['value'] = $faclist[$i]['value'];
                $arrTemp['variable'] = $faclist[$i]['variable'];
                $arrTemp['periode'] = $faclist[$i]['periode'];
                $dhis_data_filter[] = $arrTemp;
            }
        } else {

            //if one indicator is selected
            $ONE_INDICATION_SELECTED = true;
            if ($faclist[$i]['variable'] == $ind_name && $dhis_year_month_dat == $queryDate) {
                $arrTemp = array();
                $arrTemp['institution'] = $faclist[$i]['institution'];
                $arrTemp['value'] = $faclist[$i]['value'];
                $arrTemp['variable'] = $faclist[$i]['variable'];
                $arrTemp['periode'] = $faclist[$i]['periode'];
                $dhis_data_filter[] = $arrTemp;
            }
        }
    }


    echo"{\"data\": [";
    $popData = new PopData;
    for ($i = 0; $i < count($dhis_data_filter); $i++) {

        //view commune population number 
        $nbPopComm = 0;
        $nbPopCommArr = '';
        if ($ONE_INDICATION_SELECTED) {
            $nbPopCommArr = $popData->getNbPopByIndTypComm($dhis_data_filter[$i]['variable'], $dhis_data_filter[$i]['institution']);
        } else {
            $nbPopCommArr = $popData->getNbPopByComm($dhis_data_filter[$i]['institution']);
        }

        if ($nbPopCommArr) {
            $nbPopComm = $nbPopCommArr[0][0];
        } else {
            $nbPopComm = 0;
        }

        if ($i == (count($dhis_data_filter) - 1)) {
            echo"[";

            echo"\"" . $dhis_data_filter[$i]['institution'] . "\",";
            echo"\"" . $nbPopComm . "\",";
            echo"\"" . $dhis_data_filter[$i]['value'] . "\",";
            echo"\"" . getDateInFr($dhis_data_filter[$i]['periode']) . "\"";

            echo"]";
        } else {
            echo"[";
            echo"\"" . $dhis_data_filter[$i]['institution'] . "\",";
            echo"\"" . $nbPopComm . "\",";
            echo"\"" . $dhis_data_filter[$i]['value'] . "\",";
            //date format in FR																	  
            echo"\"" . getDateInFr($dhis_data_filter[$i]['periode']) . "\"";

            echo"],";
        }
    }

    echo"]}";

    exit;
}


/*
 * get all indicators values
 * @param string none
 * Returns Array
 */
if (isset($_GET['dhisdata']) && $_GET['dhisdata'] == 'all') {
    $pdata = new DashData;
    $faclist = $pdata->alldhis2_data_ind();
    $popData = new PopData;
    //create Json format for datatable pluging
    $varUrl_dhisdata = $_GET['dhisdata'];
    if ($varUrl_dhisdata == 'all') {
        echo"{\"data\": [";

        for ($i = 0; $i < count($faclist); $i++) {
            //view commune population number 
            $nbPopComm = 0;
            $nbPopCommArr = $popData->getNbPopByComm($faclist[$i]['institution']);
            if ($nbPopCommArr) {
                $nbPopComm = $nbPopCommArr[0][0];
            } else {
                $nbPopComm = 0;
            }

            if ($i == (count($faclist) - 1)) {
                echo"[";

                echo"\"" . $faclist[$i]['institution'] . "\",";
                echo"\"" . $nbPopComm . "\",";
                echo"\"" . $faclist[$i]['value'] . "\",";
                //date format in FR						  
                echo"\"" . getDateInFr($faclist[$i]['periode']) . "\"";
                echo"]";
            } else {
                echo"[";
                echo"\"" . $faclist[$i]['institution'] . "\",";
                echo"\"" . $nbPopComm . "\",";
                echo"\"" . $faclist[$i]['value'] . "\",";
                //date format in FR							  
                echo"\"" . getDateInFr($faclist[$i]['periode']) . "\"";
                echo"],";
            }
        }

        echo"]}";
    }
    exit;
}

//fonction -  get all indicators name
function getAllindicatorsName() {
    $pdata = new DashData;
    $faclist = $pdata->alldhis2_data_ind();

    //get all indicators name in an array
    $indicators_name = array();
    for ($i = 0; $i < count($faclist); $i++) {
        $indicators_name[] = $faclist[$i]['variable'];
    }
    $ind_name = array_unique($indicators_name);

    //regroup all accouchement indicators using an array
    $acc_ind = array(
        "Accouchement_Institutionel(15_19_ans, Normal)",
        "Accouchement_Institutionel(20_34_ans, Normal)",
        "Accouchement_Institutionel(35ans_et_Plus, Normal)",
        "Accouchement_Institutionel(Moins_15ans, Autres)",
        "Accouchement_Institutionel(Moins_15ans, Normal)",
        "Accouchement_Non_Institutionel(Moins_15ans, Autres)",
        "Accouchement_Non_Institutionel(Moins_15ans, Matrone)"
    );
    //create the combobox item
    foreach ($ind_name as $val) {
        // acc indicators are removed here 
        if (in_array($val, $acc_ind) === false) {
            ?><option value="<?php echo $val ?>"><?php echo indicatorsCustomName($val) ?></option><?php
        }
    }
    //create the accouchement combobox item with acc indicators as attribute
    $acc_ind_items = implode("&", $acc_ind);
    //mix attribute means this item is a mixin of values
    ?><option value="<?php echo $acc_ind_items ?>" mix="yes" parent='accouchement'>Accouchement</option><?php
}

//fonction - Convert date in fr

function getDateInFr($date) {
    error_reporting(0);
    //setlocale (LC_ALL, 'fr_FR.ISO-8859-1','fra'); 
    // TEMPS
    $temps = strtotime($date);

    $NumeroDuJour = date('d', $temps);

    // MOIS
    $mois = array('01' => 'Janvier', '02' => 'Février', '03' => 'Mars', '04' => 'Avril', '05' => 'Mai',
        '06' => 'Juin', '07' => 'Juillet', '08' => 'Août', '09' => 'Septembre', '10' => 'Octobre', '11' => 'Novembre', '12' => 'Décembre');
    $mois_numero = date("m", $temps);
    $mois_complet = $mois[$mois_numero];

    // ANNEE
    $annee = date("Y", $temps);
    return $mois_complet . " " . $annee;
}

//fonction to rename indicators name
function indicatorsCustomName($ind_name) {
    $cname = array(
        'Visites(Institutionnelles, Nouvelles)' => 'Nouvelles visites institutionnelles',
        'Visites(Institutionnelles, Subsequentes)' => 'Nouvelles visites non institutionnneles'
    );
    if (array_key_exists($ind_name, $cname)) {
        return $cname[$ind_name];
    } else {
        return $ind_name;
    }
}

function Auth_DHIS2() {
    // url to authenticate
    $service_url = 'http://200.113.242.50:8000/dhis/dhis-web-commons-security/login.action?authOnly=true';

    // initialise curl
    $curl = curl_init($service_url);
    // data to post
    $curl_post_data = array(
        'j_username' => 'admin',
        'j_password' => 'Password001'
    );

    // curl options
    curl_setopt($curl, CURLOPT_HEADER, 1);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($curl, CURLOPT_POST, true);
    curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1);
    curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($curl_post_data));

    // Execute and store the response
    $curl_response = curl_exec($curl);

    // extra info about the request, used for debuggin
    //$info = curl_getinfo($curl);
    // Get the cookies, this is what dhis returns on this authentication
    $cookies = array();
    preg_match_all('/Set-Cookie:(?<cookie>\s{0,}.*)$/im', $curl_response, $cookies);

    // Break down the string to something we can work with
    $COOKIEVAL = explode(';', $cookies['cookie'][0]);

    $JSESSIONID = explode('=', $COOKIEVAL[0]);
    $PATH = explode('=', $COOKIEVAL[1]);

    // Save the cookie so that future calls from JQUery will not need authentication
    setrawcookie('JSESSIONID', $JSESSIONID[1], time() + 3600, $PATH[1]);
}

function API_indicatorGroups() {
    // Get the indicators from the API
    $service_url = 'http://localhost:8000/dhis/api/indicatorGroups.json?links=false&paging=false&field';
    // initialise the curl call
    $curl = curl_init($service_url);

    // Set our curl options
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    // Authentication required even though we authenticate above, the cookie will only be used for XHR calls (clientside)
    curl_setopt($curl, CURLOPT_USERPWD, 'admin:Password001');

    // get the curl response
    $curl_response = curl_exec($curl);
    if ($curl_response === false || $curl_response === '') {
        $info = curl_getinfo($curl);
        curl_close($curl);
        die('error occured during curl exec. Additioanl info: ' . var_export($info));
    }
    // decode the json response into something we can work with
    $decoded = json_decode($curl_response, true);
    // close the connection
    curl_close($curl);

    // If there's an error, handle it
    if (isset($decoded->response->status) && $decoded->response->status == 'ERROR') {
        die('error occured: ' . $decoded->response->errormessage);
    }

    return $decoded;
}

function API_OrganisationUnits() {
    // Get the indicators from the API
    $service_url = 'http://localhost:8080/dhis/api/organisationUnits.json?userOnly=true&fields=id,name,children[id,name]&paging=false&_dc=1450856945175';
    // initialise the curl call
    $curl = curl_init($service_url);

    // Set our curl options
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    // Authentication required even though we authenticate above, the cookie will only be used for XHR calls (clientside)
    curl_setopt($curl, CURLOPT_USERPWD, 'admin:Password001');

    // get the curl response
    $curl_response = curl_exec($curl);
    if ($curl_response === false || $curl_response === '') {
        $info = curl_getinfo($curl);
        curl_close($curl);
        die('error occured during curl exec. Additioanl info: ' . var_export($info));
    }
    // decode the json response into something we can work with
    $decoded = json_decode($curl_response, true);
    // close the connection
    curl_close($curl);

    // If there's an error, handle it
    if (isset($decoded->response->status) && $decoded->response->status == 'ERROR') {
        die('error occured: ' . $decoded->response->errormessage);
    }

    return $decoded;
}

function API_reportTables() {
    // Get the reportTables from the API
    $service_url = 'http://localhost:8080/dhis/api/reportTables.json?fields=id,name,access&paging=false';
    // initialise the curl call
    $curl = curl_init($service_url);

    // Set our curl options
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    // Authentication required even though we authenticate above, the cookie will only be used for XHR calls (clientside)
    curl_setopt($curl, CURLOPT_USERPWD, 'admin:Password001');

    // get the curl response
    $curl_response = curl_exec($curl);
    if ($curl_response === false || $curl_response === '') {
        $info = curl_getinfo($curl);
        curl_close($curl);
        die('error occured during curl exec. Additioanl info: ' . var_export($info));
    }
    // decode the json response into something we can work with
    $decoded = json_decode($curl_response, true);
    // close the connection
    curl_close($curl);

    // If there's an error, handle it
    if (isset($decoded->response->status) && $decoded->response->status == 'ERROR') {
        die('error occured: ' . $decoded->response->errormessage);
    }

    return $decoded;
}

function API_reportCharts() {
    // Get the reportTables from the API
    $service_url = 'http://localhost:8080/dhis/api/charts.json?fields=id,name,access&paging=false';
    // initialise the curl call
    $curl = curl_init($service_url);

    // Set our curl options
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    // Authentication required even though we authenticate above, the cookie will only be used for XHR calls (clientside)
    curl_setopt($curl, CURLOPT_USERPWD, 'admin:Password001');

    // get the curl response
    $curl_response = curl_exec($curl);
    if ($curl_response === false || $curl_response === '') {
        $info = curl_getinfo($curl);
        curl_close($curl);
        die('error occured during curl exec. Additioanl info: ' . var_export($info));
    }
    // decode the json response into something we can work with
    $decoded = json_decode($curl_response, true);
    // close the connection
    curl_close($curl);

    // If there's an error, handle it
    if (isset($decoded->response->status) && $decoded->response->status == 'ERROR') {
        die('error occured: ' . $decoded->response->errormessage);
    }

    return $decoded;
}

function API_reportMaps() {
    // Get the reportTables from the API
    $service_url = 'http://localhost:8080/dhis/api/maps.json?fields=id,name,access&paging=false';
    // initialise the curl call
    $curl = curl_init($service_url);

    // Set our curl options
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    // Authentication required even though we authenticate above, the cookie will only be used for XHR calls (clientside)
    curl_setopt($curl, CURLOPT_USERPWD, 'admin:Password001');

    // get the curl response
    $curl_response = curl_exec($curl);
    if ($curl_response === false || $curl_response === '') {
        $info = curl_getinfo($curl);
        curl_close($curl);
        die('error occured during curl exec. Additioanl info: ' . var_export($info));
    }
    // decode the json response into something we can work with
    $decoded = json_decode($curl_response, true);
    // close the connection
    curl_close($curl);

    // If there's an error, handle it
    if (isset($decoded->response->status) && $decoded->response->status == 'ERROR') {
        die('error occured: ' . $decoded->response->errormessage);
    }

    return $decoded;
}
?>