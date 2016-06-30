<?php include_once('connect.php');?>
<?php 
class GetPoint{
	public function createXmlMarkerByIns($idIns){
			$conn=new DBConnection();
			$con=$conn->dbconnect();
			if($con){
				$query="SELECT * FROM institution where institution_code=$idIns";
				$result=$conn->queryTable($query);
				pg_close($con);
				return $result;
				}else{				
					return false;
					}		
			}
		
	}
?>