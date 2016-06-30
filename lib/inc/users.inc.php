<?php	
include(dirname(dirname(__FILE__)).'/core/users.php');
		
	/* 
	 * check user login
	 * @param string $username and $pass
	 * Returns boolean
	*/	
	session_start();		
	if(isset($_GET['username']) && isset($_GET['pass'])){
		  $usr= new Users;
		  $username=$_GET['username'];
		  $pass=$_GET['pass'];
		  $usrlogin=$usr->checkUserlogin($username,$pass);
		  if($usrlogin){
			  $_SESSION['usr'] = $username;
			  $_SESSION['pass'] = $pass;
			  $_SESSION['time'] = time();
			  }		
		  echo json_encode($usrlogin);
		  exit;
		}
		
	/* 
	 * logout user
	 * @param string logout=1
	 * Returns string
	*/			
	if(isset($_GET['logout'])){
		  if(isset($_SESSION['usr'])&& isset($_SESSION['pass']) && isset($_SESSION['time'])){			  
			  unset($_SESSION['usr']);
			  unset($_SESSION['pass']);
			  unset($_SESSION['time']);
			  echo"logout";
			  }
		  exit;
		}
		
	
	/* 
	 * change password user
	 * @param NONE
	 * Returns TRUE OR FALSE
	*/			
	if(isset($_POST['oldpasstext'])){
		$usr= new Users;
		$username=trim($_POST['username_s']);
		$oldpass=trim($_POST['pass_s']);
		$userentry_pass=trim($_POST['oldpasstext']);
		$newpass=trim($_POST['newpasstext']);
		$conf_newpass=trim($_POST['confnewpasstext']);
		//if old pass = entry old pass
		if(strcmp($oldpass,$userentry_pass)==0){
			if(strcmp($newpass,$conf_newpass)==0){
				$res=$usr->changepass($username,$newpass);
				if($res){
					echo"1";
					$res=$usr->change_fchange_pass($username,'f');//change fchange_pass option
					}else{
						echo"0";
						}
				}else{
					echo"NEW_PASS_DIFF_CONF_PASS";
					}
			}else{
				echo"OLD_PASS_NOT_CORRECT";
				}
		exit;
				
		}
		
?>