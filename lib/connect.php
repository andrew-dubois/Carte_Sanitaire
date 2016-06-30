<?php 
include_once('config/connect_settings.php');
echo DB_NAME." ";
echo DB_HOST." ";
echo DB_USER." ";
echo DB_PASS." ";
echo intval(SGBD_PORT)." ";
//$conn = pg_connect("host=DB_NAME port=SGBD_PORT dbname=DB_NAME user=DB_USER password=DB_PASS");
$conn = pg_connect("host=localhost port=5432 dbname=cs user=postgres password=admin");
if($conn){
	echo"Connexion reussie !!!!!!!!!!";
	}else{
		echo"Connexion au serveur impossible";
		}
?>