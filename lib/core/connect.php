<?php 
include_once(dirname(dirname(__FILE__)).'/config/connect_settings.php');
?>
<?php
class DBConnection{
		/*Class variables*/
		private $db_host='';
		private $db_name='';
		private $db_user='';
		private $db_pass='';
		private $db_port='';	
		private $conn;
		
		/*Contructor*/
		public function __construct(){
			$this->db_host = DB_HOST;
			$this->db_name = DB_NAME;
			$this->db_user = DB_USER;
			$this->db_pass = DB_PASS;
			$this->db_port = SGBD_PORT;
			}
		
		/*getters*/
		public function getdb_host(){
			return $this->db_host;
			}
			
		public function getdb_name(){
			return $this->db_name;
			}
			
		public function getdb_user(){
			return $this->db_user;
			}
			
		public function getdb_pass(){
			return $this->db_pass;
			}
		
		public function getdb_port(){
			return $this->db_port;
			}
		
		/* setters */
		public function setdb_host($dbhost){
			$this->db_host=$dbhost;
			}
			
		public function setdb_name($dbname){
			$this->db_name=$dbname;
			}
		
		public function setdb_user($dbuser){
			$this->db_user=$dbuser;
			}
		
		public function setdb_pass($dbpass){
			$this->db_pass=$dbpass;
			}
		
		public function setdb_port($dbport){
			$this->db_port=$dbport;
			}

		/* 
		 * Enables connection to the postgresql database
		 * @return boolean	
		 */
		 public function dbconnect(){
			 $this->conn=pg_connect("host=".$this->db_host." port=".$this->db_port." dbname=".$this->db_name." user=".$this->db_user." password=".$this->db_pass);
			 if($this->conn){
				 return $this->conn;
				 }else{
					 return false;
					 }
			 }
		
		/* 
		 * Enables connection to another database on the same host
		 * @return boolean	
		 */
		
		public function other_dbconnect($db){
				$this->conn=pg_connect("host=".$this->db_host." port=".$this->db_port." dbname=".$db." user=".$this->db_user." password=".$this->db_pass);
			 if($this->conn){
				 return $this->conn;
				 }else{
					 return false;
					 }
			}
		
		
		/* 
		 * query a table from the database
		 * @param string $query
		 * @return array
		 */		 
		public function queryTable($query){
				$result=array();
				$q=pg_query($this->conn,$query);
				while($rows=pg_fetch_array($q)){
						$result[]=$rows;
					}
				pg_free_result($q);
				return $result;
			}
			
			/* 
		 * insert in a table of the database
		 * @param string $query
		 * @return array
		 */		 
		public function insertTable($query){				
				$q=pg_query($this->conn,$query);			
				return $q;
				// Closing connection
				pg_close($dbconn);
			}
			
		
		/* 
		 * insert in a table of the database
		 * @param string $query
		 * @return array
		 */		 
		public function delTable($query){				
				$q=pg_query($this->conn,$query);			
				return $q;
				// Closing connection
				pg_close($dbconn);
			}
		
	}
	
		
?>