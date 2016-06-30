<?php	
include(dirname(dirname(__FILE__)).'/core/indicators.php');
		
	if(isset($_POST['ind'])){
		
		print_r($_POST['ind']);
		$ind= new Indicators;
		$ind->addPrivateInd($_POST['ind']);
		return $ind;
	}
	
	function privIndList(){
		$ind= new Indicators;
		$list= $ind->privateindlist();
		return $list;
	}
		
?>