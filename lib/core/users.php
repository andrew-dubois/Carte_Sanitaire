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
		
	//check if user email exists - return true if so, false if not
	public function checkUserEmail($useremail){
		$conn=new DBConnection();
		$con=$conn->dbconnect();
		if($con){
			$query="SELECT usremail FROM users where usremail='".$useremail."'";
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
		
	//change user password by email
	public function changepassEmail($email,$newpass){
		$conn=new DBConnection();
		$con=$conn->dbconnect();
		if($con){
			$query="UPDATE users SET pass='".$newpass."'where usremail='".$email."'";
			$result=$conn->queryTable($query);
			pg_close($con);
			return true;			
			}else{				
				return false;
				}		
		}
		
	//GUID allows to get an unique ID
	public function getGUID(){    
        //mt_srand((double)microtime()*10000);//optional for php 4.2.0 and up.
        $charid = strtoupper(md5(uniqid(rand(), true)));
        $hyphen = chr(45);// "-"
        $uuid = substr($charid, 0, 8).$hyphen
            .substr($charid, 8, 4).$hyphen
            .substr($charid,12, 4).$hyphen
            .substr($charid,16, 4).$hyphen
            .substr($charid,20,12);
            
        return $uuid;
    
	}
	//insert user guid for password changing
	public function insertGUID($email,$guid){
		$conn=new DBConnection();
		$con=$conn->dbconnect();
		if($con){
			$query="INSERT INTO userchangepass (useremail,guid)VALUES ('".$email."','".$guid."')";
			$result=$conn->insertTable($query);
			//pg_close($con);
			return $result;			
			}else{				
				return false;
				}	
		
	}
	//check guid
	public function checkGUID($guid){
		$conn=new DBConnection();
		$con=$conn->dbconnect();
		if($con){
			$query="SELECT * FROM userchangepass where guid='".$guid."'";
			$result=$conn->queryTable($query);
			//pg_close($con);
			return $result;			
			}else{				
				return false;
				}	
		
	}
	// check guid of useremail
	public function checkGUIDuseremail($email){
		$conn=new DBConnection();
		$con=$conn->dbconnect();
		if($con){
			$query="SELECT * FROM userchangepass where useremail='".$email."'";
			$result=$conn->queryTable($query);
			//pg_close($con);
			return $result;			
			}else{				
				return false;
				}	
		
	}
	
	
	//delete guid
	public function deleteGUID($email){
		$conn=new DBConnection();
			$con=$conn->dbconnect();
			if($con){
				$query="DELETE FROM userchangepass WHERE useremail='".$email."'";
				$res=$conn->delTable($query);
				if($res){
					return true;
				}
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
		
	//update user info
	
	public function update_user($username, $fullname,$pass,$email){
		$conn=new DBConnection();
		$con=$conn->dbconnect();
		if($con){			
			$query="UPDATE users SET fullname='".$fullname."', pass='".$pass."', usremail='".$email."' WHERE username='".$username."'";
			$result=$conn->queryTable($query);
			pg_close($con);
			return true;			
			}else{				
				return false;
				}	
		}
		
	//list users
	public function userslist(){
		$conn=new DBConnection();
		$con=$conn->dbconnect();
		if($con){
			$query="SELECT * FROM users";
			$result=$conn->queryTable($query);
			pg_close($con);
			return $result;			
			}else{				
				return false;
				}		
		}
		
	public function addnewuser($fullname,$username,$pass,$email,$role){
		$conn=new DBConnection();
		$con=$conn->dbconnect();
		$id=time();
		$role=1;
		if($con){
			$query="INSERT INTO users (id,fullname,username,pass,image,userright_id,track_id,access_level,access_allowed,force_change_pass,creationdate,usremail)
VALUES ($id,'".$fullname."','".$username."','".$pass."','noimage.jpg',$id,'1',$role,'1','1',now(),'".$email."')";
			$result=$conn->insertTable($query);
			//pg_close($con);
			return $result;			
			}else{				
				return false;
				}		
		}
		
		public function delUser($id){
			$conn=new DBConnection();
			$con=$conn->dbconnect();
			if($con){
				$query="DELETE FROM users WHERE id=".$id."";
				$res=$conn->delTable($query);
				if($res){
					return true;
				}
			}
			
		}
		
		//list by username
		public function userinfobyusername($usrname){
			$conn=new DBConnection();
			$con=$conn->dbconnect();
			if($con){
				$query="SELECT * FROM users WHERE username='".$usrname."'";
				$result=$conn->queryTable($query);
				pg_close($con);
				return $result;			
				}else{				
					return false;
					}	
		}
		
		//list by username
		public function userinfobyId($id){
			$conn=new DBConnection();
			$con=$conn->dbconnect();
			if($con){
				$query="SELECT * FROM users WHERE id=".$id."";
				$result=$conn->queryTable($query);
				pg_close($con);
				return $result;			
				}else{				
					return false;
					}	
		}
		
	}
?>