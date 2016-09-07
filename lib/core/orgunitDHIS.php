<?php

include_once('dhisAPI.php');

class OrgUnitDHIS {
    /*     * ***************DHIS FUNCTIONS **************** */

    //selectionne tous les facilities DHIS par departement
    public function getAllInsDHIS($nameDep) {
        // Get all instutions
        // *Note: the sqlView api does allow for a criteria query string where we could use this to filter dep name
        // HOWEVER, this does not work for characters on testing i.e. it will not work for Nord-Est and returns the full
        // list... Solution on writing this is to just get the full list and filter in php
        $institutions = API_Institutions();

        // we need to group rows into their respective institutions (duplicate institutions due to type and managing authority)

        $institutionArray = [];
        //$depname = ($depname == 'Grand\'Anse') ? 'Grand-Anse' : $depname;
        foreach ($institutions['rows'] as $row) {
            if ($nameDep != 'Haiti')
                if ($nameDep != $row[7])
                    continue;

            if (!array_key_exists($row[0], $institutionArray)) {
                $institutionArray[$row[0]]['id'] = $row[0];
                $institutionArray[$row[0]]['code'] = $row[1];
                $institutionArray[$row[0]]['name'] = $row[2];
                $institutionArray[$row[0]]['coordinates'] = $row[3];
                if ($row[9] == 'Categorie / Type') {
                    $institutionArray[$row[0]]['facilitytype'] = $row[8];
                } else {
                    $institutionArray[$row[0]]['managauthority'] = $row[8];
                }
                $institutionArray[$row[0]]['deptname'] = $row[7];
                $institutionArray[$row[0]]['uasname'] = $row[6];
                $institutionArray[$row[0]]['communename'] = $row[5];
                $institutionArray[$row[0]]['seccomname'] = $row[4];
            } else {
                if ($row[9] == 'Categorie / Type') {
                    $institutionArray[$row[0]]['facilitytype'] = $row[8];
                } else {
                    $institutionArray[$row[0]]['managauthority'] = $row[8];
                }
            }
        }

        return $institutionArray;
    }

    public function getDHISfac_byID($instID) {
        $institution = API_Institution($instID);
        $groupsets = API_organisationUnitGroupSets();

        $institution['facilitytype'] = '';
        $institution['managauthority'] = '';

        foreach ($institution['organisationUnitGroups'] as $group) {
            foreach ($groupsets['organisationUnitGroupSets'] as $groupset) {
                foreach ($groupset['organisationUnitGroups'] as $orgUnitGroup) {
                    if ($group['id'] == $orgUnitGroup['id']) {
                        if ($groupset['name'] == 'Categorie / Type') {
                            $institution['facilitytype'] = $orgUnitGroup['name'];
                        } else {
                            $institution['managauthority'] = $orgUnitGroup['name'];
                        }
                    }
                }
            }
        }

        $institution['deptname'] = $institution['parent']['parent']['parent']['parent']['name'];
        $institution['deptid'] = $institution['parent']['parent']['parent']['parent']['id'];
        $institution['uasname'] = $institution['parent']['parent']['parent']['name'];
        $institution['uasid'] = $institution['parent']['parent']['parent']['id'];
        $institution['communename'] = $institution['parent']['parent']['name'];
        $institution['communeid'] = $institution['parent']['parent']['id'];
        $institution['seccomname'] = $institution['parent']['name'];
        $institution['seccomid'] = $institution['parent']['id'];

        return $institution;
    }

    // Gets all the facilities from DHIS by commune id
    public function getDHISfac_byComm($commID) {
        $institutions = API_InstitutionbyCommune($commID)['organisationUnits'];

        for ($x = 0; $x <= count($institutions) - 1; $x++) {
            $institutions[$x]['latitude'] = json_decode($institutions[$x]['coordinates'])[1];
            $institutions[$x]['longitude'] = json_decode($institutions[$x]['coordinates'])[0];
        }

        return $institutions;
    }

    public function getDHISfacs_byNameLimit5($FacName) {
        $institutions = API_InstitutionbyNameLimit5($FacName)['organisationUnits'];

        for ($x = 0; $x <= count($institutions) - 1; $x++) {
            $institutions[$x]['latitude'] = json_decode($institutions[$x]['coordinates'])[1];
            $institutions[$x]['longitude'] = json_decode($institutions[$x]['coordinates'])[0];
            $institutions[$x]['sec_commune'] = $institutions[$x]['parent']['name'];
            $institutions[$x]['commune'] = $institutions[$x]['parent']['parent']['name'];
            $institutions[$x]['UAS'] = $institutions[$x]['parent']['parent']['parent']['name'];
            $institutions[$x]['department'] = $institutions[$x]['parent']['parent']['parent']['parent']['name'];
        }

        return $institutions;
    }

    public function getDHISfacs_byName($FacName) {
        $institutions = API_InstitutionbyName($FacName)['organisationUnits'];
        $groupsets = API_organisationUnitGroupSets();

        for ($x = 0; $x <= count($institutions) - 1; $x++) {
            $institutions[$x]['facilitytype'] = '';
            $institutions[$x]['managauthority'] = '';

            foreach ($institutions[$x]['organisationUnitGroups'] as $group) {
                foreach ($groupsets['organisationUnitGroupSets'] as $groupset) {
                    foreach ($groupset['organisationUnitGroups'] as $orgUnitGroup) {
                        if ($group['id'] == $orgUnitGroup['id']) {
                            if ($groupset['name'] == 'Categorie / Type') {
                                $institutions[$x]['facilitytype'] = $orgUnitGroup['name'];
                            } else {
                                $institution[$x]['managauthority'] = $orgUnitGroup['name'];
                            }
                        }
                    }
                }
            }

            $institutions[$x]['latitude'] = json_decode($institutions[$x]['coordinates'])[1];
            $institutions[$x]['longitude'] = json_decode($institutions[$x]['coordinates'])[0];
            $institutions[$x]['sec_commune'] = $institutions[$x]['parent']['name'];
            $institutions[$x]['commune'] = $institutions[$x]['parent']['parent']['name'];
            $institutions[$x]['UAS'] = $institutions[$x]['parent']['parent']['parent']['name'];
            $institutions[$x]['department'] = $institutions[$x]['parent']['parent']['parent']['parent']['name'];
        }

        return $institutions;
    }

}

?>