<?php	
include(dirname(dirname(__FILE__)).'/core/popdata.php');
		
	/* 
	 * Search commune by department
	 * @param string $depname
	 * Returns Array
	*/			
	if(isset($_GET['deptname']) && isset($_GET['commlist'])){
		  $pdata= new PopData;
		  $deptname=$_GET['deptname'];
		  $commlist=$pdata->getCommuneByDep($deptname);		
		  echo json_encode($commlist);
		  exit;
		}
		
		//getFacby_Indicator($indicator_name,$indicator_val,$depname)
	
	/* 
	 * Search commune by department
	 * @param string $depname
	 * Returns Array
	*/			
	if(isset($_GET['ind_name']) && isset($_GET['ind_val']) && isset($_GET['deptname'])){
		  $pdata= new PopData;
		  $indicator_val=$_GET['ind_val'];
		  $indicator_name=$_GET['ind_name'];
		  $deptname=$_GET['deptname'];
		  
		  $faclist=$pdata->getFacby_Indicator($indicator_name,$indicator_val,$deptname);
		  //$faclist=$pdata->getCommuneByDep($faclist);		
		  echo json_encode($faclist);
		  exit;
		}
		
?>