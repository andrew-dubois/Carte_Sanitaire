<?php
include_once('connect.php');
class DashData{
	
	//Selection des donnees des indicateurs DHIS2
	public function alldhis2_data_ind(){
		$conn=new DBConnection();
		$con=$conn->other_dbconnect('DHIS');
		if($con){			
			$query="select distinct organisationunit.name as institution,(select startdate from period where (aggregateddatavalue.periodid=period.periodid)) as periode,(dataelement.shortname)||(_categoryoptioncomboname.categoryoptioncomboname) as Variable,aggregateddatavalue.value
       
           from organisationunit
               inner join aggregateddatavalue
                 on(organisationunit.organisationunitid=aggregateddatavalue.organisationunitid)
         inner join period
      on(aggregateddatavalue.periodid=period.periodid)
                     inner join dataelement
                        on(aggregateddatavalue.dataelementid=dataelement.dataelementid)
                            inner join _categoryoptioncomboname
                              on(aggregateddatavalue.categoryoptioncomboid=_categoryoptioncomboname.categoryoptioncomboid)
                                                   where dataelement.dataelementid 
               in(select dataelementid from dataelement where (dataelement.name like 'Visites' or dataelement.name like 'Repartition_Visites_Femmes_Enceintes' or 
               dataelement.name like 'Accouchement_Institutionel' or dataelement.name like 'Accouchement_Non_Institutionel'
               or dataelement.name like 'Naissanes_Vivantes_Institutionels' or dataelement.name like 'Naissanes_Vivantes_NonInstitutionels')
and
(_categoryoptioncomboname.categoryoptioncomboid 
  in 
  (select categoryoptioncomboid from _categoryoptioncomboname 
  where categoryoptioncomboname = '(Moins_15ans, Normal)'or categoryoptioncomboname = '(15_19_ans, Normal)' or categoryoptioncomboname ='(20_34_ans, Normal)'or categoryoptioncomboname ='(default)' or categoryoptioncomboname ='(35ans_et_Plus, Normal)'or categoryoptioncomboname ='(Moins_15ans, Matrone)'or categoryoptioncomboname ='(Moins_15ans, Autres)' or categoryoptioncomboname ='(Moins_2.5kg, Normal)'or categoryoptioncomboname =' (Moins_15ans, Césarienne)'or categoryoptioncomboname ='(Moins_2.5kg, Autres)'or categoryoptioncomboname ='(Moins_2.5kg, Matrone)'or categoryoptioncomboname ='Moins_2.5kg, Autres' or categoryoptioncomboname ='(Institutionnelles, Nouvelles)'or
  categoryoptioncomboname ='(Institutionnelles, Subsequentes)') 
  )
  )  
and
(aggregateddatavalue.level=3)
and
(aggregateddatavalue.periodtypeid=3)

order by institution,periode,Variable;";
			
			$result=$conn->queryTable($query);
			pg_close($con);
			return $result;
			}else{				
			  return false;
			  }		
		}
	
	//Selection des donnees des indicateurs DHIS2 par groupe
	public function alldhis2_data_grpind($grpnameind){
		$conn=new DBConnection();
		$con=$conn->other_dbconnect('DHIS');
		$query="";
		
		if($con){	
		if($grpnameind=='accouchement'){		
			$query="select distinct organisationunit.name as Institution,period.enddate as Periode,dataelement.shortname as Indicateur,sum(aggregateddatavalue.value) as Valeur
       
           from organisationunit
               inner join aggregateddatavalue
                 on(organisationunit.organisationunitid=aggregateddatavalue.organisationunitid)
         inner join period
      on(aggregateddatavalue.periodid=period.periodid)
                     inner join dataelement
                        on(aggregateddatavalue.dataelementid=dataelement.dataelementid)
                            inner join _categoryoptioncomboname
                              on(aggregateddatavalue.categoryoptioncomboid=_categoryoptioncomboname.categoryoptioncomboid)
                                                   where dataelement.dataelementid 
               in(select dataelementid from dataelement where ( dataelement.name like 'Repartition_Visites_Femmes_Enceintes' or 
               dataelement.name like 'Accouchement_Institutionel' or dataelement.name like 'Accouchement_Non_Institutionel'
               or dataelement.name like 'Naissanes_Vivantes_Institutionels' or dataelement.name like 'Naissanes_Vivantes_NonInstitutionels')
and
(_categoryoptioncomboname.categoryoptioncomboid 
  in 
  (select categoryoptioncomboid from _categoryoptioncomboname 
  where  categoryoptioncomboname = '(Moins_15ans, Normal)'or categoryoptioncomboname = '(15_19_ans, Normal)' or categoryoptioncomboname ='(20_34_ans, Normal)'or categoryoptioncomboname ='(default)' or categoryoptioncomboname ='(35ans_et_Plus, Normal)'or categoryoptioncomboname ='(Moins_15ans, Matrone)'or categoryoptioncomboname ='(Moins_15ans, Autres)' or categoryoptioncomboname ='(Moins_2.5kg, Normal)'or categoryoptioncomboname =' (Moins_15ans, Césarienne)'or categoryoptioncomboname ='(Moins_2.5kg, Autres)'or categoryoptioncomboname ='(Moins_2.5kg, Matrone)'or categoryoptioncomboname ='Moins_2.5kg, Autres' or categoryoptioncomboname ='(Institutionnelles, Nouvelles)'or
  categoryoptioncomboname ='(Institutionnelles, Subsequentes)') 
  )
  )
  
and
(aggregateddatavalue.level=3)
and
(aggregateddatavalue.periodtypeid=3)

group by Indicateur,Periode,Institution

order by Institution,Periode,Valeur;";
		}
			
			$result=$conn->queryTable($query);
			pg_close($con);
			return $result;
			}else{				
			  return false;
			  }		
		}
	
			
	}
?>