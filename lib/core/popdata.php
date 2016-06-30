<?php
include_once('connect.php');
class PopData{
	
	//selection des institutions par departement
	public function getCommuneByDep($depname){
		$conn=new DBConnection();
		$con=$conn->dbconnect();
		if($con){			
			$query="SELECT * FROM datapopulation where dept_name='".$depname."' AND communes<>'Toutes' ORDER BY population_generale DESC";
			//if $depname has HAITI value
			if($depname=='Haiti'){
				$query="SELECT * FROM datapopulation where communes<>'Toutes' ORDER BY population_generale DESC";
				}
			$result=$conn->queryTable($query);
			pg_close($con);
			return $result;
			}else{				
			  return false;
			  }		
		}
	
	//Selection du nombre de population par commune et type
	//@param default: population_generale
	public function getNbPopByComm($commName,$type='population_generale'){
		$commName=trim($commName);
		$commName=pg_escape_string($commName);
		$conn=new DBConnection();
		$con=$conn->dbconnect();
		if($con){			
			$query="SELECT ".$type." FROM datapopulation where communes='".$commName."'";			
			$result=$conn->queryTable($query);
			pg_close($con);
			return $result;
			}else{				
			  return false;
			  }		
		}
		
		
	//Selection du nombre de population par commune et par type d'indicateurs	
	public function getNbPopByIndTypComm($indName,$commName){
		$commName=trim($commName);
		$commName=pg_escape_string($commName);
		$poptyp=$this->getPopTypbyInd($indName);		
		$conn=new DBConnection();
		$con=$conn->dbconnect();
		if($con){			
			$query="SELECT ".$poptyp." FROM datapopulation where communes='".$commName."'";			
			$result=$conn->queryTable($query);
			pg_close($con);			
			return $result;
			}else{				
			  return false;
			  }		
		}
		
	//Selection du type de population selon l'indicateur
	public function getPopTypbyInd($ind_name){
		//Tableau des indicateur par type de population
		$arr_ind_poptyp=array(
			'Visites(Institutionnelles, Nouvelles)'=>'population_generale',
			'Visites(Institutionnelles, Subsequentes)'=>'population_generale',
			'Accouchement_Institutionel(15_19_ans, Normal)'=>'f_15_49_ans',
			'Accouchement_Institutionel(20_34_ans, Normal)'=>'f_15_49_ans',
			'Accouchement_Institutionel(35ans_et_Plus, Normal)'=>'f_15_49_ans',
			'Accouchement_Institutionel(Moins_15ans, Autres)'=>'enf_5_a_14_ans',
			'Accouchement_Institutionel(Moins_15ans, Normal)'=>'enf_5_a_14_ans',
			'Accouchement_Non_Institutionel(Moins_15ans, Autres)'=>'enf_5_a_14_ans',
			'Accouchement_Non_Institutionel(Moins_15ans, Matrone)'=>'enf_5_a_14_ans',
			'Naissanes_Vivantes_Institutionels(Moins_2.5kg, Autres)'=>'enf_nouveaux_nes',
			'Naissanes_Vivantes_Institutionels(Moins_2.5kg, Normal)'=>'enf_nouveaux_nes',
			'Naissanes_Vivantes_NonInstitutionels(Moins_2.5kg, Autres)'=>'enf_nouveaux_nes',
			'Naissanes_Vivantes_NonInstitutionels(Moins_2.5kg, Matrone)'=>'enf_nouveaux_nes'
			);
			if(array_key_exists($ind_name,$arr_ind_poptyp)){
				return $arr_ind_poptyp[$ind_name];
				}else{
					return 'population_generale';
					}
		}
			
	}
?>