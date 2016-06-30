<?php 
include('../core/getPoint.php');
include('../core/orgunit.php');

if(isset($_GET['idIns'])){
		$dom = new DomDocument('1.0', 'utf-8');
		$node = $dom->createElement("markers");
		$parnode = $dom->appendChild($node);
		$point=new GetPoint;
		$pos=$point->createXmlMarkerByIns($_GET['idIns']);
		for($i=0;$i<count($pos);$i++){
			$node = $dom->createElement("marker");
			$newnode = $parnode->appendChild($node);
			$newnode->setAttribute("titre", $pos[$i]['nom']);
			$newnode->setAttribute("lat", $pos[$i]['x_lat']);
			$newnode->setAttribute("lng", $pos[$i]['y_long']);
			$newnode->setAttribute("nombre_phys", $pos[$i]['nombre_phys']);
			$newnode->setAttribute("nombre_infirm", $pos[$i]['nombre_infirm']);
			$newnode->setAttribute("description",utf8_encode($pos[$i]['institution_description']));
			}
		$xmlfile = $dom->saveXML();
		echo $xmlfile;
		exit;
	}

//View the facilities of the selected departement
if(isset($_GET['idDep'])){
	 	$dom = new DomDocument('1.0', 'utf-8');
		$node = $dom->createElement("markers");
		$parnode = $dom->appendChild($node);
		$fac=new OrgUnit;
		$dataFac=$fac->getUnitsByDep($_GET['idDep']);
		
		for($i=0;$i<count($dataFac);$i++){
			$nomCommIns= $fac->getDataCommuneIns($dataFac[$i]['commune_code']);
			$node = $dom->createElement("marker");
			$newnode = $parnode->appendChild($node);
			$newnode->setAttribute("titre", $dataFac[$i]['nom']);
			$newnode->setAttribute("lat", $dataFac[$i]['x_lat']);
			$newnode->setAttribute("lng", $dataFac[$i]['y_long']);
			$newnode->setAttribute("nombre_phys", $dataFac[$i]['nombre_phys']);
			$newnode->setAttribute("nombre_infirm", $dataFac[$i]['nombre_infirm']);
			$newnode->setAttribute("nom_comm",$nomCommIns[0]["commune_nom"]);
			$newnode->setAttribute("description",utf8_encode($dataFac[$i]['institution_description']));
			}
		$xmlfile = $dom->saveXML();
		echo $xmlfile;
		exit;
	}
	
	//View all facilities of all departements
	if(isset($_GET['allF']) && $_GET['allF']=='all'){
			$dom = new DomDocument('1.0', 'utf-8');
			$node = $dom->createElement("markers");
			$parnode = $dom->appendChild($node);
			$facs=new OrgUnit;
			
			$dataFac=$facs->getAllIns();
			for($i=0;$i<count($dataFac);$i++){
			$node = $dom->createElement("marker");
			$newnode = $parnode->appendChild($node);
			$newnode->setAttribute("ins_code", $dataFac[$i]['institution_code']);
			$newnode->setAttribute("titre", $dataFac[$i]['nom']);
			$newnode->setAttribute("lat", $dataFac[$i]['x_lat']);
			$newnode->setAttribute("lng", $dataFac[$i]['y_long']);
			$newnode->setAttribute("nombre_phys", $dataFac[$i]['nombre_phys']);
			$newnode->setAttribute("nombre_infirm", $dataFac[$i]['nombre_infirm']);
			$newnode->setAttribute("commune_code",$dataFac[$i]["commune_code"]);
			$newnode->setAttribute("departement_code",$dataFac[$i]["departement_code"]);
			$newnode->setAttribute("description",utf8_encode($dataFac[$i]['institution_description']));
			}
		$xmlfile = $dom->saveXML();
		echo $xmlfile;
		exit;
		}
	/********************** SPA *****************************/
	//View all SPA facilities of all departements
	if(isset($_GET['allFSPA']) ||(isset($_GET['allFSPA']) && isset($_GET['commname'])) || (isset($_GET['factypeDep']) && isset($_GET['factype'])) || (isset($_GET['depname']) && isset($_GET['serv_selected']) && isset($_GET['opt_filter'])) || (isset($_GET['depname']) && isset($_GET['labopt'])) || (isset($_GET['depname']) && isset($_GET['hivopt']))  || (isset($_GET['facilityid']) && isset($_GET['sfac'])) || (isset($_GET['ind_name']) && isset($_GET['ind_val']) && isset($_GET['deptname'])) ){
			$dom = new DomDocument('1.0', 'utf-8');
			$node = $dom->createElement("markers");
			$parnode = $dom->appendChild($node);
			$depname="";
			$dataFac="";
			$facs=new OrgUnit;
			
			if(isset($_GET['allFSPA'])){
				$depname=$_GET['allFSPA'];
				$dataFac=$facs->getAllInsSPA($depname);
				}
				
			if(isset($_GET['allFSPA']) && isset($_GET['commname'])){
				$depname=$_GET['allFSPA'];
				$commune_name=$_GET['commname'];
				$dataFac=$facs->getSPAfac_byComm($commune_name);
				}
				
			if(isset($_GET['factypeDep']) && isset($_GET['factype'])){				
				$depname=$_GET['factypeDep'];
				$factype=$_GET['factype'];
				$dataFac=$facs->getSPAfacbyDep_ByType($depname,$factype);
				}
				
			//facilities with selected services by user
			if(isset($_GET['depname']) && isset($_GET['serv_selected']) && isset($_GET['opt_filter'])){
						
				  $depname=$_GET['depname'];
				  $serv_selected=$_GET['serv_selected'];
				  $opt_filter=$_GET['opt_filter'];
				  $commName='';
				  if(isset($_GET['commName'])){
					  $commName=$_GET['commName'];
					  $dataFac=$facs->facServ_selected_ByCommDep($depname,$commName,$serv_selected,$opt_filter);
					  }else{
						  $dataFac=$facs->facServ_selected_ByDep($depname,$serv_selected,$opt_filter);
						  }
				  
				  
				}
			
			
			//facilities with lab services by dep
			if(isset($_GET['depname']) && isset($_GET['labopt'])){
				  $depname=$_GET['depname'];
				  $labOpt=$_GET['labopt'];
				  $dataFac=$facs->facLaborByDep($depname,$labOpt);
				}
			
			//facilities with hiv services by dep
			if(isset($_GET['depname']) && isset($_GET['hivopt'])){
				  $depname=$_GET['depname'];
				  $hivOpt=$_GET['hivopt'];
				  $dataFac=$facs->facVIHByDep($depname,$hivOpt);
				}
			
			//Search facility by id
			
			if(isset($_GET['facilityid']) && isset($_GET['sfac'])){
				 $facid=$_GET['facilityid'];
				 $dataFac=$facs->getSPAfac_byID($facid);				 
				}
			
						
			for($i=0;$i<count($dataFac);$i++){
			$node = $dom->createElement("marker");
			$newnode = $parnode->appendChild($node);
			$newnode->setAttribute("id_code", $dataFac[$i]['id']);
			$newnode->setAttribute("ins_code_MOH", $dataFac[$i]['moh_facility_code']);
			$newnode->setAttribute("titre", $dataFac[$i]['nameoffacility']);
			$newnode->setAttribute("facility_type", $dataFac[$i]['facilitytype']);
			$newnode->setAttribute("departement_name", $dataFac[$i]['deptname']);
			$newnode->setAttribute("commune_name", $dataFac[$i]['commune_name']);				
			$newnode->setAttribute("lat", $dataFac[$i]['latitude']);
			$newnode->setAttribute("lng", $dataFac[$i]['longitude']);
			$newnode->setAttribute("manag_authority", $dataFac[$i]['managauthority']);
			$newnode->setAttribute("vComm_name", $dataFac[$i]['commune_name']);	
			$newnode->setAttribute("nb_bed_overnight", $dataFac[$i]['nombredelithospi1nuit']);
			$newnode->setAttribute("nb_gen_medPrac", $dataFac[$i]['nombremedgeneralist']);
			$newnode->setAttribute("nb_spePrac", $dataFac[$i]['nombremedspecialist']);
			$newnode->setAttribute("typ_service_avail", $dataFac[$i]['servicedisp024h']);	
			//services newnode variables		
			$newnode->setAttribute("ChildVacc", $dataFac[$i]['childvacc']);
			$newnode->setAttribute("GrowthMon", $dataFac[$i]['growthmon']);
			$newnode->setAttribute("Sickchild", $dataFac[$i]['sickchild']);
			$newnode->setAttribute("FP", $dataFac[$i]['fp']);
			$newnode->setAttribute("ANC", $dataFac[$i]['anc']);	
			$newnode->setAttribute("PMTCT", $dataFac[$i]['pmtct']);
			$newnode->setAttribute("delivery", $dataFac[$i]['delivery']);
			$newnode->setAttribute("malaria", $dataFac[$i]['malaria']);
			$newnode->setAttribute("sti", $dataFac[$i]['sti']);
			$newnode->setAttribute("tb", $dataFac[$i]['tb']);
			$newnode->setAttribute("hivct", $dataFac[$i]['hivct']);
			$newnode->setAttribute("minorsurgery", $dataFac[$i]['minorsurgery']);
			$newnode->setAttribute("csections", $dataFac[$i]['csections']);		
			
			}
		$xmlfile = $dom->saveXML();
		echo $xmlfile;
		exit;
		}
		
		
?>