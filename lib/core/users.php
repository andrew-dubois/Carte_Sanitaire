<?php
include_once('connect.php');
class Users{
	
	//check if user exists - return true if so, false if not
	public function checkUserlogin($username,$pass){
		$conn=new DBConnection();
		$con=$conn->dbconnect();
		if($con){
			$query="SELECT * FROM users where username='".$username."' and pass='".$pass."'";
			$result=$conn->queryTable($query);
			pg_close($con);
			return $result;			
			}else{				
				return false;
				}		
		}
		
	
	//change user password
	public function changepass($username,$newpass){
		$conn=new DBConnection();
		$con=$conn->dbconnect();
		if($con){
			$query="UPDATE users SET pass='".$newpass."'where username='".$username."'";
			$result=$conn->queryTable($query);
			pg_close($con);
			return true;			
			}else{				
				return false;
				}		
		}
	
	// change force_change_pass status
	public function change_fchange_pass($username,$status){
		$conn=new DBConnection();
		$con=$conn->dbconnect();
		if($con){			
			$query="UPDATE users SET force_change_pass='".$status."' where username='".$username."'";
			$result=$conn->queryTable($query);
			pg_close($con);
			return true;			
			}else{				
				return false;
				}	
		}
		
	}
?>