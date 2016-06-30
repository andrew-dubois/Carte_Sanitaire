<?php
include_once('connect.php');
class Indicators{
	
		//list private indicators
		
		public function privateindlist(){
		$conn=new DBConnection();
		$con=$conn->dbconnect();
		if($con){
			$query="SELECT * FROM privateindicators";
			$result=$conn->queryTable($query);
			pg_close($con);
			return $result;			
			}else{				
				return false;
				}		
		}
		
		
		//add private indicators
		public function addPrivateInd($arrayInd)
		{
			$conn=new DBConnection();
		    $con=$conn->dbconnect();
			if($con){
				$result="";
				//delete all data first
				$query="DELETE FROM privateindicators";
				$res=$conn->delTable($query);
				//insert data
				if(!empty($arrayInd)){
					foreach($arrayInd as $val){
						$query="INSERT INTO privateindicators(idind)VALUES ('".$val."')";
						$result=$conn->insertTable($query);
						//return $result;	
					}
				}				
					
			}else{				
				return false;
				}
			
		}
		
	}
?>