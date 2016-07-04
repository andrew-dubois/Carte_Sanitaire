<?php

include('../core/orgunit.php');
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$depname = filter_input(INPUT_POST, 'dep-list-dropdmenu');
$repFilters = filter_input(INPUT_POST, 'repFilter', FILTER_DEFAULT, FILTER_REQUIRE_ARRAY);

// If No Filters then just output every facility
if (empty($repFilters)) {
    $facs = new OrgUnit;
    $dataFac = $facs->getAllInsSPA($depname);

    if ($depname == 'Haiti') {
        // Report each facility grouped by region

        echo $dataFac;
    }
}
// If they filter then filter the list of facilities based on the filters selected
else {
    echo "Filters!";
}

