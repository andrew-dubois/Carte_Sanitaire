<?php

include_once('connect.php');

class OrgUnitSPA {

    //essai selection des institutions par departement
    public function getUnitsByCommune($idComm) {
        $conn = new DBConnection();
        $con = $conn->dbconnect();
        if ($con) {
            $query = "SELECT * FROM institution where commune_code=$idComm";
            $result = $conn->queryTable($query);
            pg_close($con);
            return $result;
        } else {
            return false;
        }
    }

    // Selection des institutions par departement
    public function getUnitsByDep($idDep) {
        $conn = new DBConnection();
        $con = $conn->dbconnect();
        if ($con) {
            $query = "Select * from Institution where Commune_code IN (Select Commune_code from Commune where Departement_code=(Select Departement_code from Departement where Departement_code=$idDep))";
            $result = $conn->queryTable($query);
            pg_close($con);
            return $result;
        } else {
            return false;
        }
    }

    // Selectionne les donnes d'une commune
    public function getDataCommuneIns($idComm) {
        $conn = new DBConnection();
        $con = $conn->dbconnect();
        if ($con) {
            $query = "SELECT * FROM commune WHERE commune_code=$idComm";
            $result = $conn->queryTable($query);
            pg_close($con);
            return $result;
        } else {
            return false;
        }
    }

    //selectionne tous les facilities
    public function getAllIns() {
        $conn = new DBConnection();
        $con = $conn->dbconnect();
        if ($con) {
            $query = "select institution.institution_code,institution.nom,institution.nombre_phys,institution.nombre_infirm,institution.x_lat,institution.y_long,
institution.institution_description,institution.commune_code,
commune.departement_code from institution,commune where institution.commune_code=commune.commune_code";
            $result = $conn->queryTable($query);
            pg_close($con);
            return $result;
        } else {
            return false;
        }
    }

    /*     * ***************SPA FUNCTIONS **************** */

    //selectionne tous les facilities SPA par departement
    public function getAllInsSPA($nameDep) {
        $conn = new DBConnection();
        $con = $conn->dbconnect();
        if ($con) {
            $query = "";
            if ($nameDep == 'Haiti') {
                $query = "select * FROM spa";
            } else {
                $query = "select * FROM spa WHERE deptname='" . $nameDep . "'";
            }
            $result = $conn->queryTable($query);
            pg_close($con);
            return $result;
        } else {
            return false;
        }
    }

    //selectionne tous les facilities SPA par departement (uses moh_code as the index)
    public function getAllInsSPACustom($nameDep) {
        $conn = new DBConnection();
        $con = $conn->dbconnect();
        if ($con) {
            $query = "";
            if ($nameDep == 'Haiti') {
                $query = "select * FROM spa";
            } else {
                $query = "select * FROM spa WHERE deptname='" . $nameDep . "'";
            }
            $result = $conn->queryTableSPA_indexiscode($query);
            pg_close($con);
            return $result;
        } else {
            return false;
        }
    }

    //selectionne tous les facilities SPA par commune (uses moh_code as the index)
    public function getAllInsSPAComCustom($nameCom) {
        $conn = new DBConnection();
        $con = $conn->dbconnect();
        if ($con) {
            $query = "select * FROM spa WHERE commune_name='" . $nameCom . "'";
            
            $result = $conn->queryTableSPA_indexiscode($query);
            pg_close($con);
            return $result;
        } else {
            return false;
        }
    }

    function facServ_selected_custom($depname, $serv_selected, $opt_filter) {
        $conn = new DBConnection();
        $con = $conn->dbconnect();
        $opt_f = $opt_filter; //contains OR or AND
        $serv_selected = explode(":", $serv_selected);

        $query_part = "(";

        for ($i = 0; $i < count($serv_selected); $i++) {
            $service = trim($serv_selected[$i]);

            if ($service != '') {
                if (($i + 1) == count($serv_selected)) {
                    $query_part.=$service . "=1 ) ";
                } else {
                    $query_part.=$service . "=1 " . $opt_f . " ";
                }
            }
        }

        if ($con) {
            $query = "";

            if ($depname == 'Haiti') {
                $query = "select * FROM spa WHERE " . $query_part . " ";
            } else {
                $query = "select * FROM spa WHERE " . $query_part;
            }
            //echo $query;			
            $result = $conn->queryTableSPA_indexiscode($query);
            pg_close($con);
            return $result;
        } else {
            return false;
        }
    }

    //selectionne le nombre des types de facility SPA par departement
    public function getSPAfacbyDep($nameDep) {
        $conn = new DBConnection();
        $con = $conn->dbconnect();
        if ($con) {
            $query = "";
            if ($nameDep == 'Haiti') {
                $query = "SELECT facilitytype, count(*) AS count
				FROM spa GROUP BY facilitytype ORDER BY facilitytype";
            } else {
                $query = "SELECT facilitytype, count(*) AS count FROM spa WHERE deptname='" . $nameDep . "'  GROUP BY facilitytype ORDER BY facilitytype";
            }
            $result = $conn->queryTable($query);
            pg_close($con);
            return $result;
        } else {
            return false;
        }
    }

    //selectionne les facility SPA par departement commune et services - IMCOMPLETE
    public function getSPAfacbyDepCommServ($nameDep, $commDep, $servicelist) {
        $conn = new DBConnection();
        $con = $conn->dbconnect();
        if ($con) {
            $query = "";
            if ($nameDep == 'Haiti') {
                $query = "SELECT * FROM spa WHERE deptname='" . $nameDep . "' AND commune_name='" . $commDep . "' AND";
            } else {
                $query = "SELECT facilitytype, count(*) AS count FROM spa WHERE deptname='" . $nameDep . "'  GROUP BY facilitytype ORDER BY facilitytype";
            }
            $result = $conn->queryTable($query);
            pg_close($con);
            return $result;
        } else {
            return false;
        }
    }

    //Selectionne le nombre de facility avec laboratoires
    public function getSPAfacLab($nameDep) {
        $conn = new DBConnection();
        $con = $conn->dbconnect();
        if ($con) {
            $query = "";
            if ($nameDep == 'Haiti') {
                $query = "SELECT count(laboratory) AS countlab
				FROM spa WHERE laboratory=1";
            } else {
                $query = "SELECT count(laboratory) AS countlab
				FROM spa WHERE laboratory=1 AND deptname='" . $nameDep . "'";
            }
            $result = $conn->queryTable($query);
            pg_close($con);
            return $result;
        } else {
            return false;
        }
    }

    //Selectionne le nombre de facility avec laboratoires
    public function getSPAfacVIH($nameDep) {
        $conn = new DBConnection();
        $con = $conn->dbconnect();
        if ($con) {
            $query = "";
            if ($nameDep == 'Haiti') {
                $query = "SELECT count(*) AS countvih
				FROM spa WHERE hivct=1 OR hivcss = 1 OR pmtct = 1";
            } else {
                $query = "SELECT count(*) AS countvih
				FROM spa WHERE deptname='" . $nameDep . "' AND (hivct=1 OR hivcss = 1 OR pmtct = 1)";
            }
            $result = $conn->queryTable($query);
            pg_close($con);
            return $result;
        } else {
            return false;
        }
    }

    //Selectionne  facility par id
    public function getSPAfac_byID($facid) {
        $conn = new DBConnection();
        $con = $conn->dbconnect();
        if ($con) {
            $facid = (int) $facid;

            $query = "SELECT * FROM spa WHERE id=" . $facid . "";

            $result = $conn->queryTable($query);
            pg_close($con);
            return $result;
        } else {
            return false;
        }
    }

    //Selectionne  facility par id
    public function getSPAfac_bymohcode($facCode) {
        $conn = new DBConnection();
        $con = $conn->dbconnect();
        if ($con) {
            $facCode = (int) $facCode;
            $query = "SELECT * FROM spa WHERE moh_facility_code=" . $facCode . "";

            $result = $conn->queryTable($query);
            pg_close($con);
            return $result;
        } else {
            return false;
        }
    }

    //Retourne tous les coord des facility d'une commune
    public function getSPAfac_byComm($commName) {
        $conn = new DBConnection();
        $con = $conn->dbconnect();
        if ($con) {

            $query = "SELECT * FROM spa WHERE commune_name='" . $commName . "'";
            $result = $conn->queryTable($query);
            pg_close($con);
            return $result;
        } else {
            return false;
        }
    }

    //selectionne tous les facilities SPA par departement et par type
    public function getSPAfacbyDep_ByType($nameDep, $typeF) {

        $conn = new DBConnection();
        $con = $conn->dbconnect();
        if ($con) {
            $query = "";

            $allTypeF = explode(":", $typeF);
            $queryLevel = "";
            if ($nameDep == 'Haiti') {
                $queryLevel = "select * FROM spa WHERE ";
            } else {
                $queryLevel = "select * FROM spa WHERE deptname = '" . $nameDep . "' AND (";
            }

            $query.=$queryLevel;
            for ($i = 0; $i < count($allTypeF); $i++) {
                if (count($allTypeF) == ($i + 1)) {
                    if ($nameDep == 'Haiti') {
                        $query.=" facilitytype='" . $allTypeF[$i] . "' ";
                    } else {
                        $query.=" facilitytype='" . $allTypeF[$i] . "' )";
                    }
                } else {
                    $query.=" facilitytype='" . $allTypeF[$i] . "' OR ";
                }
            }
            //echo $query;
            $result = $conn->queryTable($query);

            pg_close($con);
            return $result;
        } else {
            return false;
        }
    }

    // Facility with user-selected services by department.
    function facServ_selected_ByDep($depname, $serv_selected, $opt_filter) {
        $conn = new DBConnection();
        $con = $conn->dbconnect();
        $opt_f = $opt_filter; //contains OR or AND
        $serv_selected = explode(":", $serv_selected);

        $query_part = "(";

        for ($i = 0; $i < count($serv_selected); $i++) {
            $service = trim($serv_selected[$i]);

            if ($service != '') {
                if (($i + 1) == count($serv_selected)) {
                    $query_part.=$service . "=1 ) ";
                } else {
                    $query_part.=$service . "=1 " . $opt_f . " ";
                }
            }
        }

        if ($con) {
            $query = "";

            if ($depname == 'Haiti') {
                $query = "select * FROM spa WHERE " . $query_part . " ";
            } else {
                $query = "select * FROM spa WHERE " . $query_part . " AND deptname = '" . $depname . "'";
            }
            $result = $conn->queryTable($query);
            pg_close($con);
            return $result;
        } else {
            return false;
        }
    }

    // Facility with user-selected services by commune of department.
    function facServ_selected_ByCommDep($depname, $commName, $serv_selected, $opt_filter) {
        $conn = new DBConnection();
        $con = $conn->dbconnect();
        $opt_f = $opt_filter; //contains OR or AND
        $serv_selected = explode(":", $serv_selected);

        $query_part = "(";

        for ($i = 0; $i < count($serv_selected); $i++) {
            $service = trim($serv_selected[$i]);

            if ($service != '') {
                if (($i + 1) == count($serv_selected)) {
                    $query_part.=$service . "=1 ) ";
                } else {
                    $query_part.=$service . "=1 " . $opt_f . " ";
                }
            }
        }

        if ($con) {
            $query = "";

            if ($depname == 'Haiti') {
                $query = "select * FROM spa WHERE " . $query_part . " ";
            } else {
                $query = "select * FROM spa WHERE " . $query_part . "  AND commune_name='" . $commName . "'";
            }
            //echo $query;			
            $result = $conn->queryTable($query);
            pg_close($con);
            return $result;
        } else {
            return false;
        }
    }

    // Facility with labaratory infrastructure by department.
    function facLaborByDep($depname, $labOpt) {
        $conn = new DBConnection();
        $con = $conn->dbconnect();
        if ($con) {
            $query = "";

            if ($depname == 'Haiti') {
                $query = "select * FROM spa WHERE laboratory = " . $labOpt . " ";
            } else {
                $query = "select * FROM spa WHERE laboratory = " . $labOpt . " AND deptname = '" . $depname . "'";
            }

            $result = $conn->queryTable($query);
            pg_close($con);
            return $result;
        } else {
            return false;
        }
    }

// View  Facility with hiv services by department.
    function facVIHByDep($depname, $hivopt) {
        $conn = new DBConnection();
        $con = $conn->dbconnect();
        if ($con) {
            $query = "";
            if ($depname == 'Haiti') {
                $query = "select * FROM spa WHERE hivct=" . $hivopt . " OR hivcss = " . $hivopt . " OR pmtct = " . $hivopt . " ";
            } else {
                $query = "select * FROM spa WHERE deptname='" . $depname . "' AND (hivct=" . $hivopt . " OR hivcss = " . $hivopt . " OR pmtct = " . $hivopt . ")";
            }

            $result = $conn->queryTable($query);
            pg_close($con);
            return $result;
        } else {
            return false;
        }
    }

    //Search facility by name
    function searchFacbyName($facName) {
        $conn = new DBConnection();
        $con = $conn->dbconnect();
        if ($con) {
            $queryString = trim($facName);
            $queryString = explode(' ', $facName);
            $nbStr = count($queryString);
            $query = "select id, moh_facility_code, nameoffacility, deptname, commune_name from spa where";
            for ($i = 0; $i < $nbStr; $i++) {
                if ($nbStr == ($i + 1)) {
                    $query.=" LOWER(nameoffacility) LIKE LOWER('%" . $queryString[$i] . "%')";
                } else {
                    $query.=" LOWER(nameoffacility) LIKE LOWER('%" . $queryString[$i] . "%') OR ";
                }
            }
            $query.=" LIMIT 5";
            $result = $conn->queryTable($query);
            pg_close($con);
            return $result;
        } else {
            return false;
        }
    }

    //Search facility by key word
    function searchFacbyKeyWord($kword) {
        $conn = new DBConnection();
        $con = $conn->dbconnect();
        if ($con) {
            $queryString = trim($kword);
            $queryString = explode(' ', $kword);
            $nbStr = count($queryString);
            $query = "select * from spa where";
            for ($i = 0; $i < $nbStr; $i++) {
                if ($nbStr == ($i + 1)) {
                    $query.=" LOWER(nameoffacility) LIKE LOWER('%" . $queryString[$i] . "%')";
                } else {
                    $query.=" LOWER(nameoffacility) LIKE LOWER('%" . $queryString[$i] . "%') OR ";
                }
            }
            $query.=" LIMIT 50";
            $result = $conn->queryTable($query);
            pg_close($con);
            return $result;
        } else {
            return false;
        }
    }

    //Selection des institutions par indicateur, departement(***INCOMPLETE***)
    public function getFacby_Indicator($indicator_name, $indicator_val, $depname) {
        $conn = new DBConnection();
        $con = $conn->dbconnect();
        if ($con) {
            /*             * ** Query for infrastructure Indicator *** */
            $query = '';
            $query_part = "deptname='" . $depname . "' AND ";
            if ($depname == 'Haiti')
                $query_part = '';
            switch ($indicator_name) {
                case "laboratory":
                    $query = "SELECT * FROM spa where " . $query_part . " " . $indicator_name . "=" . $indicator_val;
                    break;

                case "noncomdiseases":
                    $query = "SELECT * FROM spa where " . $query_part . " " . $indicator_name . "=" . $indicator_val;
                    break;

                case "hopitalisatioselmen":
                    $query = "SELECT * FROM spa where " . $query_part . " " . $indicator_name . "=" . $indicator_val;
                    //$query="SELECT * FROM spa where deptname='".$depname."' AND ".$indicator_name."=2 ";
                    break;

                case "nombredelithospi1nuit":
                    $query = "SELECT * FROM spa where " . $query_part . " " . $indicator_name . ">0 ";

                    break;
            }

            $result = $conn->queryTable($query);
            pg_close($con);
            return $result;
        } else {
            return false;
        }
    }

    //function Get all commune of a department
    function getCommunename_byDep($deptname) {
        $conn = new DBConnection();
        $con = $conn->dbconnect();
        if ($con) {
            if ($deptname == 'Haiti') {
                $query = "SELECT distinct commune_name FROM spa";
            } else {
                $query = "SELECT distinct commune_name FROM spa WHERE deptname='" . $deptname . "'";
            }
            $result = $conn->queryTable($query);
            pg_close($con);
            return $result;
        } else {
            return false;
        }
    }

    //function Get all commune of a department
    function getSPAfactype_coord($ids) {
        $conn = new DBConnection();
        $con = $conn->dbconnect();
        if ($con) {
            $arr_id = array();
            $allid = explode(',', $ids);
            for ($i = 0; $i < count($allid); $i++) {
                $query = "SELECT facilitytype,latitude,longitude FROM spa WHERE id=" . $allid[$i] . "";
                $result = $conn->queryTable($query);
                $arr_id[] = $result;
            }
            //$result=$conn->queryTable($query);				
            pg_close($con);
            return $arr_id;
        } else {
            return false;
        }
    }

}

?>