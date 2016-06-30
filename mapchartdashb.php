<?php include_once('lib/init.php');?>
<?php 
include(dirname(__FILE__).'\lib\core\dashdata.php');
include(dirname(__FILE__).'\lib\core\popdata.php');
//check file access
if(!isset($_GET['access'])){
	header('Location: http://localhost:8081/cs');//code line must be edited after an online deployment
	exit;	
	}else{
		if($_GET['access']!==hash("ripemd160","1")){
			header('Location: http://localhost:8081/cs');//code line must be edited after an online deployment
			exit;
		}
	}
?>

<html>
  <head>
  <script type="text/javascript" src="https://www.google.com/jsapi"></script>
  <script type="text/javascript" src="js/fusioncharts/fusioncharts.js"></script>
  <script type="text/javascript" src="js/fusioncharts/fusioncharts.maps.js"></script>
  <script type="text/javascript" src="js/fusioncharts/maps/fusioncharts.haiti.js"></script>
  <!--<script>
    google.load('visualization', '1', { 'packages': ['map'] });
    google.setOnLoadCallback(drawMap);

    function drawMap() {
      var data = google.visualization.arrayToDataTable([
        ['Lat', 'Long', 'Name'],
          [37.4232, -122.0853, 'Work'],
          [37.4289, -122.1697, 'University'],
          [37.6153, -122.3900, 'Airport'],
          [37.4422, -122.1731, 'Shopping']
      ]);

    var options = { showTip: true, mapType:'terrain' };

    var map = new google.visualization.Map(document.getElementById('chart_div'));

    map.draw(data, options);
  };
  </script>-->
  
  <script>
FusionCharts.ready(function () {
    var populationMap = new FusionCharts({
        type: 'maps/haiti',
        renderAt: 'chart-container',
        width: '100%',
        height: '100%',
        dataFormat: 'json',
        dataSource: {
                "map": {
             	  "caption": "REPRESENTATION GEOGRAPHIQUE DES INDICATEURS",
				  "subcaption": "----",
				  "theme": "fint",
				  "markerBgColor": "#3399FF",
				  "entityFillColor": "#2065A0",
				  "entityFillHoverColor": "#E5E5E9",
				  "showMarkerLabels": "1",
				  "showvalue": "0"
            },            
            "data": [
                {
                    "id": "NO",
                    "value": "515"
                },
                {
                    "id": "ND",
                    "value": "373"
                },
                {
                    "id": "AR",
                    "value": "3875"
                },
                {
                    "id": "NE",
                    "value": "727"
                },
                {
                    "id": "CE",
                    "value": "885"
                },
                {
                    "id": "OU",
                    "value": "32"
                }
            ]
        },
		"markers": {
		  "definition": [
            {
                "id": "NO",
                "x": "35.34",
                "y": "50.56",
                "label": "Seattle"
            },
            {
                "id": "ND",
                "x": "525.85",
                "y": "172.94",
                "label": "Columbus"
            },
            {
                "id": "AR",
                "x": "444.94",
                "y": "119.34",
                "label": "Madison"
            },
            {
                "id": "NE",
                "x": "81.86",
                "y": "257.89",
                "label": "Los Angeles"
            },
            {
                "id": "CE",
                "x": "163.79",
                "y": "156.76",
                "label": "Salt Lake City"
            },
            {
                "id": "OU",
                "x": "383.25",
                "y": "183.05",
                "label": "Kansas City"
            },
            {
                "id": "SE",
                "x": "508.66",
                "y": "267",
                "label": "Atlanta"
            },
            {
                "id": "NI",
                "x": "467.19",
                "y": "139.56",
                "label": "Chicago"
            },
            {
                "id": "SD",
                "x": "344.82",
                "y": "236.65",
                "label": "Oklahoma City"
            },
            {
                "id": "GA",
                "x": "432.81",
                "y": "314.53",
                "label": "New Orleans"
            }
        ]
   }
		
		
    }).render();
});
</script>
</head>
  
  </head>
  <!--<body>
    <div id="chart_div" style="width:1000px; height: inherit"></div>
  </body>-->
  <body>
<div id="chart-container">A world map will load here!</div>
</body>

</html>
<?php
/***********************************FUNCTIONS**************************************/

//Get all accouchement indicators
//@param: 
//@return Array

function accIndicators(){
	
	if(isset($_GET['dhisdata']) && isset($_GET['groupindname']) && isset($_GET['querydate'])){	
		$dhis_data_filter=array();	
		$pdata= new DashData;
		$dhis_data_groupind=$_GET['groupindname'];	//get the indicator group name
		//get the query date
		$filter=explode(":",$_GET['querydate']);
		$month_ind=$filter[0];
		$year_ind=$filter[1];
		$queryDateUi=$year_ind."-".$month_ind;
			
		$faclist=$pdata->alldhis2_data_grpind($dhis_data_groupind);	
		
		//filter by date
		$arrtempbydat=array();
		for($i=0;$i<count($faclist);$i++){
			$dat_dhis=$faclist[$i]['periode'];
			$dat_dhis=explode("-",$dat_dhis);
			$dat_dhis=$dat_dhis[0]."-".$dat_dhis[1];
			
			if($dat_dhis==$queryDateUi){
				$arrtempbydat[]=$faclist[$i];
				}
			}
		$faclist=$arrtempbydat;	
		//get all regions this query contains
		$region=array();
		//indicator in the selected group
		
		for($i=0;$i<count($faclist);$i++){
			$region[]=$faclist[$i]['institution'];
			}
		$region=array_unique($region);
		//array of data for each indicator in the group
		$arr_ind_grp=array(
		"Accouchement_Institutionel"=>array(),
		"Accouchement_Non_Institutionel"=>array()
		);
		foreach($arr_ind_grp as $key=>$value){
			for($i=0; $i < count($faclist); $i++){
				if($faclist[$i]['indicateur']==$key){
					$tempArray=array();
					$tempArray['indicateur']=$faclist[$i]['indicateur'];
					$tempArray['periode']=$faclist[$i]['periode'];
					$tempArray['institution']=$faclist[$i]['institution'];
					$tempArray['valeur']=$faclist[$i]['valeur'];
					$arr_ind_grp[$key][]=$tempArray;
					}
				}
			}		
			
		foreach($region as $value){			
			$arrTemp=array();		
			$acc_inst=$arr_ind_grp['Accouchement_Institutionel'];
			for($i=0; $i<count($acc_inst);$i++){
				  if($acc_inst[$i]['institution']==$value){
					  $arrTemp['normal']=$acc_inst[$i]['valeur'];
					  }
				}
			$acc_n_inst=$arr_ind_grp['Accouchement_Non_Institutionel'];
			for($i=0; $i<count($acc_n_inst);$i++){
				  if($acc_n_inst[$i]['institution']==$value){
					  $arrTemp['matronne']=$acc_n_inst[$i]['valeur'];
					  }
				}
			
			$arrTemp['cesarienne']=0;
			$arrTemp['estimation_femmes_enceintes']=0;
			$arrTemp['region']=$value;
			$dhis_data_filter[]=$arrTemp;			
				
			}
					
		return $dhis_data_filter;
		}else{
			return 0;
			}
	
	}
	
	//render data to view on the map
	//@param: Array
	//@return none
	function renderDataToMap($arr_datatomap){
		if($arr_datatomap==0){
			?>
			<script>
            	document.getElementById('chart_div').innerHTML="Pas de données à afficher"
            </script>
			<?php
			}else{
				
				}
		}
?>