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
<!DOCTYPE html">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Tableau de bord - Carte Sanitaire</title>
    <script type="text/javascript" src="js/jquery191.js"></script>	    
        
    <!--Charts area-->
	<script type="text/javascript" src="js/fusioncharts/fusioncharts.js"></script>
    <script type="text/javascript" src="js/fusioncharts/themes/fusioncharts.theme.fint.js"></script>
     
    
    <?php 
	$dhis_data_filter=array();
	if(isset($_GET['dhisdata'])&& isset($_GET['filter'])){
		
		$pdata= new DashData;
		$faclist=$pdata->alldhis2_data_ind();
		//filter data
		$filter=explode(":",$_GET['filter']);
		$ind_name=$filter[0];
		$month_ind=$filter[1];
		$year_ind=$filter[2];
		
		for($i=0; $i < count($faclist); $i++){
			$dat_dhis=explode("-",$faclist[$i]['periode']);
			$month_dhis=$dat_dhis[1];
			$year_dhis=$dat_dhis[0];
			
			$dhis_year_month_dat=$year_dhis.$month_dhis;
			$queryDate=$year_ind.$month_ind;
			
			//if all indicators is selected
			if($ind_name=='all'){
				
				?>
				<script>alert('Vous devez selectionner un seul indicateur');</script>
                
				<?php
				exit;
				}else{
					
					//if one indicator is selected
					if($faclist[$i]['variable']==$ind_name && $dhis_year_month_dat==$queryDate){
							$arrTemp=array();
							$arrTemp['institution']=$faclist[$i]['institution'];
							$arrTemp['value']=$faclist[$i]['value'];
							$arrTemp['variable']=$faclist[$i]['variable'];
							$arrTemp['periode']=$faclist[$i]['periode'];				
							$dhis_data_filter[]=$arrTemp;		
						}					
					}			
			}
			
			?>
			
            <script type="text/javascript">
              FusionCharts.ready(function(){
                var revenueChart = new FusionCharts({
                    "type": "column2D",
                    "renderAt": "chartContainer",
                    "width": "100%",
                    "height": "500",                    
                    "dataFormat": "json",
                    "dataSource":  {
                      "chart": {
                        "caption": "<?php echo $ind_name?>",
                        "subCaption": "<?php echo $month_ind." ".$year_ind ?>",
                        "xAxisName": "Region",
                        "yAxisName": "Quantité",                        
                        "theme": "fint"
                     },
                     "data": [
                        
                        <?php 
						for($i=0;$i<count($dhis_data_filter);$i++){
							
							if($i==(count($dhis_data_filter)-1)){
									?>
									{
									   "label": "<?php echo $dhis_data_filter[$i]['institution'] ?>",
									   "value": "<?php echo $dhis_data_filter[$i]['value'] ?>"
									}
									<?php
								}else{
										?>
										{
										   "label": "<?php echo $dhis_data_filter[$i]['institution'] ?>",
										   "value": "<?php echo $dhis_data_filter[$i]['value'] ?>"
										},
										<?php									
									}
							}
						?>
                      ]
                  }
            
              });
            revenueChart.configure("ChartNoDataText", "Aucune donnée à afficher");
            revenueChart.configure("LoadingText", "Chargement en cours...");
            revenueChart.render();
            })
            </script>
            
			<?php
			
			
	}
	
	?>   
    
</head>

<body>
	<div id="chartContainer">
    <span style="font-size:28px; color:#999">
        Pour afficher la charte graphique:</br>
        - Choisir une <strong>p&eacute;riode</strong><br/>
        - S&eacute;l&eacute;ctionnez un <strong>indicateur</strong>,</br> 
        - puis cliquez le bouton <strong>Mise &agrave; jour</strong>
    </span>
    </div>
</body>
</html>
