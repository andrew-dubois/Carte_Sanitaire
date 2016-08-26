<?php

// This should never have administrative rights
// even though any authentication is handled server side
// it would be a huge security risk
// TODO : Ensure setup of dedicated read-only access Carte Sanitaire user
$username = 'admin';
$password = 'Password001';
$baseURL = 'http://localhost:8080/dhis/';

// This authenticates the user on the client side by providing a ticket through the cookies
function Auth_DHIS2() {
    global $username, $password, $baseURL;
    // url to authenticate
    $service_url = $baseURL . 'dhis-web-commons-security/login.action?authOnly=true';

    // initialise curl
    $curl = curl_init($service_url);
    // data to post
    $curl_post_data = array(
        'j_username' => $username,
        'j_password' => $password
    );

    // curl options
    curl_setopt($curl, CURLOPT_HEADER, 1);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($curl, CURLOPT_POST, true);
    curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1);
    curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($curl_post_data));

    // Execute and store the response
    $curl_response = curl_exec($curl);
    if (($curl_response)) {
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
}

// Pulls all indicators from DHIS2
function API_indicatorGroups() {
    global $username, $password, $baseURL;
    // Get the indicators from the API
    $service_url = $baseURL . 'api/indicatorGroups.json?links=false&paging=false&field';
    // initialise the curl call
    $curl = curl_init($service_url);

    // Set our curl options
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    // Authentication required even though we authenticate above, the cookie will only be used for XHR calls (clientside)
    curl_setopt($curl, CURLOPT_USERPWD, $username . ':' . $password);

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

// Pulls through all institutions
// There will be 1 or 2 rows based on the Categorie / Type and Statut / Appartenance (basically type and managing authority respectfully)
function API_Institutions() {
    global $username, $password, $baseURL;
    // TODO : Need to update the sql view via another api call to ensure most up to date data
    // Get the indicators from the API
    $service_url = $baseURL . 'api/sqlViews/ioJtWPHGxIk/data.json';

    // initialise the curl call
    $curl = curl_init($service_url);

    // Set our curl options
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    // Authentication required even though we authenticate above, the cookie will only be used for XHR calls (clientside)
    curl_setopt($curl, CURLOPT_USERPWD, $username . ':' . $password);

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

// Pulls through specific information for a given facility UID on the DHIS 2 API
function API_Institution($facUID) {
    global $username, $password, $baseURL;
    // TODO : Need to update the sql view via another api call to ensure most up to date data
    // Get the indicators from the API
    $service_url = $baseURL . 'api/organisationUnits/' . $facUID . '.json?fields=*,parent[name,id,parent[name,id,parent[name,id,parent[name,id]]]]';

    // initialise the curl call
    $curl = curl_init($service_url);

    // Set our curl options
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    // Authentication required even though we authenticate above, the cookie will only be used for XHR calls (clientside)
    curl_setopt($curl, CURLOPT_USERPWD, $username . ':' . $password);

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

// Pulls through specific information for a given facility UID on the DHIS 2 API
function API_InstitutionbyCommune($communeid) {
    global $username, $password, $baseURL;
    // TODO : Need to update the sql view via another api call to ensure most up to date data
    // Get the indicators from the API
    $service_url = $baseURL . 'api/organisationUnits/' . $communeid . '.json?includeDescendants=true&paging=false&fields=id,name,code,coordinates&filter=level:eq:6&filter=coordinates:like:[';

    // initialise the curl call
    $curl = curl_init($service_url);

    // Set our curl options
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    // Authentication required even though we authenticate above, the cookie will only be used for XHR calls (clientside)
    curl_setopt($curl, CURLOPT_USERPWD, $username . ':' . $password);

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

function API_organisationUnitGroupSets() {
    global $username, $password, $baseURL;
    // TODO : Need to update the sql view via another api call to ensure most up to date data
    // Get the indicators from the API
    $service_url = $baseURL . 'api/organisationUnitGroupSets?fields=name,organisationUnitGroups[id,name]&paging=false';

    // initialise the curl call
    $curl = curl_init($service_url);

    // Set our curl options
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    // Authentication required even though we authenticate above, the cookie will only be used for XHR calls (clientside)
    curl_setopt($curl, CURLOPT_USERPWD, $username . ':' . $password);

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

// Pulls through all report tables
function API_reportTables() {
    global $username, $password, $baseURL;
    // Get the reportTables from the API
    $service_url = $baseURL . 'api/reportTables.json?fields=id,name,access&paging=false';
    // initialise the curl call
    $curl = curl_init($service_url);

    // Set our curl options
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    // Authentication required even though we authenticate above, the cookie will only be used for XHR calls (clientside)
    curl_setopt($curl, CURLOPT_USERPWD, $username . ':' . $password);

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

// Pulls through all report charts
function API_reportCharts() {
    global $username, $password, $baseURL;
    // Get the reportTables from the API
    $service_url = $baseURL . 'api/charts.json?fields=id,name,access&paging=false';
    // initialise the curl call
    $curl = curl_init($service_url);

    // Set our curl options
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    // Authentication required even though we authenticate above, the cookie will only be used for XHR calls (clientside)
    curl_setopt($curl, CURLOPT_USERPWD, $username . ':' . $password);

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

// Pulls through all report maps
function API_reportMaps() {
    global $username, $password, $baseURL;
    // Get the reportTables from the API
    $service_url = $baseURL . 'api/maps.json?fields=id,name,access&paging=false';
    // initialise the curl call
    $curl = curl_init($service_url);

    // Set our curl options
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    // Authentication required even though we authenticate above, the cookie will only be used for XHR calls (clientside)
    curl_setopt($curl, CURLOPT_USERPWD, $username . ':' . $password);

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

// Pulls through specific information for a given facility UID on the DHIS 2 API Limited to 5
function API_InstitutionbyNameLimit5($InstName) {
    global $username, $password, $baseURL;
    // TODO : Need to update the sql view via another api call to ensure most up to date data
    // Get the indicators from the API
    $service_url = $baseURL . 'api/organisationUnits.json?paging=true&pageSize=5&query=' . urlencode($InstName) . '&fields=id,name,code,coordinates,parent[id,name,parent[id,name,parent[id,name,parent[id,name]]]]&filter=level:eq:6&filter=coordinates:like:[';

    // initialise the curl call
    $curl = curl_init($service_url);

    // Set our curl options
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    // Authentication required even though we authenticate above, the cookie will only be used for XHR calls (clientside)
    curl_setopt($curl, CURLOPT_USERPWD, $username . ':' . $password);

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

// Pulls through specific information for a given facility UID on the DHIS 2 API
function API_InstitutionbyName($InstName) {
    global $username, $password, $baseURL;
    // TODO : Need to update the sql view via another api call to ensure most up to date data
    // Get the indicators from the API
    $service_url = $baseURL . 'api/organisationUnits.json?query=' . urlencode($InstName) . '&fields=*,parent[id,name,parent[id,name,parent[id,name,parent[id,name]]]]&filter=level:eq:6&filter=coordinates:like:[';

    // initialise the curl call
    $curl = curl_init($service_url);

    // Set our curl options
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    // Authentication required even though we authenticate above, the cookie will only be used for XHR calls (clientside)
    curl_setopt($curl, CURLOPT_USERPWD, $username . ':' . $password);

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
