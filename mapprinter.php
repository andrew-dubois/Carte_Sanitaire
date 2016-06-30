<?php
session_start();
$zoom='';
	$location='';
	$maptype='';
	$markers='';
	$services='';
	$mapsize='';
    if(isset($_GET['zoom']) || isset($_GET['center']) || isset($_GET['maptype']) || isset($_GET['markers']) || isset($_GET['services']) || isset($_GET['printformat'])){
        $zoom=$_GET['zoom'];
		$location=$_GET['center'];
		$maptype=$_GET['maptype'];
		$markers=$_GET['markers'];
		$services=$_GET['services'];
		$mapsize=$_GET['printformat'];
      }
	 $listserv=($services=='')?'--':getservice_true_name($services);
	 //Get all service name
	 function getservice_true_name($serv){
			 $listserv='';
			 $services=explode('-',$serv);
			 $arr_serv=array(
			 'anc'=>'Clinique prénatale(CPN)',
			 'delivery'=>'Accouchement',
			 'sickchild'=>'Pédiatrie',
			 'childvacc'=>'Vaccination',
			 'hivcss'=>'VIH',
			 'sti'=>'Syphilis',
			 'pmtct'=>'PTME',
			 'art'=>'ARV',
			 'fp'=>'Planine Familiale(PF)'
			 );
			 for($i=0; $i<count($services); $i++){
				 $listserv=(($i+1)==count($services))? $listserv.$arr_serv[$services[$i]]: $listserv.$arr_serv[$services[$i]].', ';
				 }
			 return $listserv;
		 }
?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>
<?php
if(isset($_GET['dept']) && $listserv!=''){
	echo "Carte des institutions sanitaires | ".$_GET['dept']." | ".$listserv;
	}else{
		echo"Carte des institutions sanitaires";
		}
?>
</title>
<link rel="stylesheet" type="text/css" href="js/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/print.css">
<link rel="stylesheet" type="text/css" href="css/print.css" media="print">
<script type="text/javascript" src="js/jquery191.js"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<style media="print" type="text/css">
@media print {
	
	#mapcontent {
	height: 600px;
	width: 816px;
	margin-right: auto;
	margin-left: auto;
	border: 2px double #000;
	margin-top: 10px;
	position: relative;
	}
	
	#mapcontainer {
		position: relative;
		height: 700px;
		width: 820px;
		margin-right: auto;
		margin-left: auto;
	}
	
	/*#mapfooter {
		position: absolute;
		height: 24px;
		width: 818px;
		left: 1px;
		top: 579px;
		background-color: red;
		background-image:url(images/mspp_contentlogo.png);
		z-index: 1000;
		-webkit-print-color-adjust:exact;
	}*/
	h1{
		font-weight:bold;
		}
}
</style>
</head>

<body>
    <!--MAP HEADER-->
    <div id="mapheader">
        <p><img src="images/sitelogo.png" width="81" height="68"><p>
        <h1>REPUBLIQUE D'HAITI</h1>
        <h2>Ministère de la Sante Publique et de la Population (MSPP)</h2>
        <h3>Liste des institutions sanitaires</h3>
        <span> <strong>Services</strong>: <?php echo $listserv?> / <strong>Département</strong> : <?php echo isset($_GET['dept'])?$_GET['dept']:'--'?> </span>
    </div>
    <!--MAP CONTENT-->
	<?php
     
     ?>
    <div id="mapcontainer" <?php echo($mapsize=='prtfm3827')?'style="width:100%"':'';?> >
    	 
    	 <div id="mapcontent" <?php echo($mapsize=='prtfm3827')?'style="width:100%;border:none;height:2000px"':'';?>></div>
         <div id="mapfooter" <?php echo($mapsize=='prtfm3827')?'style="width:100%;border:none;text-align:center"':'';?> >
         	<span><img src="images/small_icon_1.png"> Centre de sant&eacute; &agrave; lit - </span>
            <span><img src="images/small_icon.png"> Centre de sant&eacute; sans lit - </span>
            <span><img src="images/small_icon_2.png"> Dispensaire - </span>
            <span><img src="images/small_icon_3.png"> Hopital - </span>
            <span><img src="images/small_icon_6.png"> Hopital Universitaire - </span>
            <span><img src="images/small_icon_5.png"> Hopital d&eacute;partemental - </span>
            <span><img src="images/small_icon_4.png"> Hopital communautaire de r&eacute;f&eacute;rence</span>
         </div>
    </div>
   
    
<script>
		
		(function(){
		<?php
		//get lat and lng
		$location=explode(",",$location);
		?>
		var facids='<?php echo $_SESSION['facid']?>';
		
    	var mapDiv = document.getElementById('mapcontent');
		var latlng = new google.maps.LatLng(<?php echo $location[0]?>, <?php echo $location[1]?>);
		var opts={		
			zoom: <?php echo $zoom ?>,
			center: latlng,	
			background:'#b3d1ff',
			disableDefaultUI: true,
			mapTypeControl: false,
			mapTypeControlOptions: {
				style: google.maps.MapTypeControlStyle.HORIZONTAL_MENU,
				position:google.maps.ControlPosition.TOP_RIGHT,
				mapTypeIds: [
				google.maps.MapTypeId.ROADMAP,
				google.maps.MapTypeId.SATELLITE,
				google.maps.MapTypeId.TERRAIN
				]
			}			
		};
		map=new google.maps.Map(mapDiv,opts);
		getFactype_coord();	
		//addMarkersMapprinter();
		
		
		/*******JS FUNCTIONS*******/
		
		//Add markers on map
		function addMarkersMapprinter(){
			
			}
		
		/*
			* Icon Marker for each facility
			* @param facility type
			* @return icon path
			*/
			function typeFacIconMarker(facType){
			  var path='images/';
			  switch(facType){
				  case 'Centre de sante sans lit':
					  path=path+'small_icon.png';
				  break;
				  
				  case 'Centre de sante a lit':
					  path=path+'small_icon_1.png';
				  break;
				  
				  case 'Dispensaire':
					  path=path+'small_icon_2.png';
				  break;
				  
				  case 'Hopital':
					  path=path+'small_icon_3.png';
				  break;
				  
				  case 'Hopital communautaire de reference':
					  path=path+'small_icon_4.png';
				  break;
				  
				  case 'Hopital departemental':
					  path=path+'small_icon_5.png';
				  break;
				  
				  case 'Hopital universitaire':
					  path=path+'small_icon_6.png';
				  break;					
				  }					
				  return path;
			  }
			  
			 //get factype and coord by id
			function getFactype_coord(){
								
				$.get('lib/inc/orgunit.inc.php?getfactype_coord='+facids,function(data){
					var obj=jQuery.parseJSON(data);
					//console.log(obj[1][0][0]);
					for(var i=0; i< obj.length; i++){
						//console.log(obj[i][0]["latitude"]);
						var lati=obj[i][0]["latitude"];
						var lngi=obj[i][0]["longitude"];
						var factype=obj[i][0]['facilitytype'];
						var latlng = new google.maps.LatLng(lati,lngi);
						var path=typeFacIconMarker(factype);
							var marker = new google.maps.Marker({
							position: latlng,						
							map: map,
							icon:path,
							title: factype
							});																
							google.maps.event.addListener(marker, 'click', function(){
							
							});	
						}					
					
					});				
				
				}
		
		})();
    </script>
    <?php
/*$browser = new COM("InternetExplorer.Application");
$handle = $browser->HWND;
$browser->Visible = true;
$browser->Fullscreen=true;
$im = imagegrabwindow($handle);
$browser->Quit();
imagepng($im, "iesnap.png");
imagedestroy($im);*/

/*var_dump(gd_info());*/
?>
</body>
</html>