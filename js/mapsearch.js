/* GLOBAL Variables initialisation */
var MOUSE_ON_SEARCHRESULT=0
var markersM=[];
var facTypeIcon='';

$(document).ready(function(e) {
    //Initialisation de la carte
	initialize();
	
	/**** Search field users events ****/
	$("#search-field").focusin(function(){
		if($("#search-field").val()!==''){
		 $('#placeholder').hide();
		}
		$('#search-result').show(); 
	 
	}).focusout(function(){
		if($("#search-field").val()==''){
			 $('#placeholder').show();
			}
		if(MOUSE_ON_SEARCHRESULT==0){
			$('#search-result').hide();
			}			 
			
	});
	
	//event related to keyboard
	$('#search-field').keydown(function(e) {
        vhplaceHolder();
		
    }).keypress(function(e) {
        vhplaceHolder();
		
    }).keyup(function(e) {
        vhplaceHolder();
		
		if($("#search-field").val()!==''){
		//view results
		if(e.keyCode == 13) { 	
			//if user hit enter
			resultSearch_occ();   
			e.preventDefault(); 
		   }else{
			   viewSearchResult();
			   }
		
		}else{
		$('#search-result').html('');
		$('#search-result-occ').slideUp();
			}
    });
	
	//when user put pointer on search result
	$('#search-result').mouseover(function(e) {
        MOUSE_ON_SEARCHRESULT=1
    }).mouseleave(function(e) {
        MOUSE_ON_SEARCHRESULT=0
    });
	
	//Validation by enter key
	 $('#search-field').on('keypress keydown keyup', function(e){		 
       if(e.keyCode == 13) { 	   
	   e.preventDefault(); 
	   }
    });
	//Validation by submit button
	$( "#formsearch" ).submit(function( event ) {
		if($("#search-field").val()!==''){
			 resultSearch_occ();
			}
	  
	  event.preventDefault();
	});
	
	
});



/*** FUNCTIONS AREA **/
function initialize(){
	
	 // Create an array of styles for the map.
		  var styles = [
			{
			  stylers: [
				{ hue: "#D4E8F9" },
				{ saturation: -10 }
			  ]
			},{
			  featureType: "road",
			  elementType: "geometry",
			  stylers: [
				{ color: "#dd61a3" },
				{ visibility: "on" }
			  ]
			},{
			  featureType: "road",
			  elementType: "labels",
			  stylers: [
				{ visibility: "on" }				
			  ]
			},{
			  featureType: "administrative",
			  elementType: "labels.text",
			  stylers: [
				{ visibility: "on" }			
			  ]
			},{
			  featureType: "administrative.province",
			  elementType: "geometry.stroke",
			  stylers: [
			  	{ color: "#dd61a3" },
				{ weight: 1 },
				{ visibility: "on" }			
			  ]
			}
		  ];
		  
	var styledMap = new google.maps.StyledMapType(styles,	{name: "Principale"});
		
		var mapDiv = document.getElementById('mapSearch');
		var latlng = new google.maps.LatLng(19.02577027586866, -72.70854949951172);
		var opts={		
			zoom: 9,
			center: latlng,	
			background:'#b3d1ff',
			mapTypeControl: true,
			mapTypeControlOptions: {
				style: google.maps.MapTypeControlStyle.HORIZONTAL_MENU,
				position:google.maps.ControlPosition.TOP_RIGHT,
				mapTypeIds: [
				'cs_map_style_id',
				google.maps.MapTypeId.ROADMAP,
				google.maps.MapTypeId.SATELLITE,
				google.maps.MapTypeId.TERRAIN
				]
			}			
			//mapTypeId: google.maps.MapTypeId.ROADMAP
			};
		map=new google.maps.Map(mapDiv,opts);
		//Associate the styled map with the MapTypeId and set it to display.
		  map.mapTypes.set('cs_map_style_id', styledMap);
		  map.setMapTypeId('cs_map_style_id');
		
		//Initializing markerclusterer variable
		var mcOptions = {gridSize: 80, maxZoom: 10};
		markerclusterer = new MarkerClusterer(map, [], mcOptions);
	
	}
	//view hide placeholder
	function vhplaceHolder(){
		if($("#search-field").val()==''){
			$('#placeholder').show();
			}else{
				$('#placeholder').hide();
				}
		}
		
	//Search result
	function viewSearchResult(){
		$('#search-result').html('<div class"searching">Recherche en cours <span  class="loading-result"></span></div>');
		var valField=$("#search-field").val();
		
		$.get("lib/inc/orgunit.inc.php?qfacname="+valField,function(data){
				var obj=jQuery.parseJSON(data);
				var result='<table class="table table-condensed table-hover table-striped">';
				//if no result
				if(jQuery.isEmptyObject(obj)){
					$('#search-result').html('<p style="text-align:center;color:#999">Aucun resultat trouv&eacute; pour <strong>"'+valField+'"</strong></p>');
					return false;
					}
				$.each(obj, function(){
					namefac=this['nameoffacility'];
					id=this['id'];
					depfac=this['deptname'];	
					commfac=this['commune_name'];			
					result+='<tr><td><a href="#" class="faclink" data-id="'+id+'">'+namefac+'  &nbsp;&nbsp;<span class="infofacname pull-right">'+depfac+', '+commfac+'</span></a></td></tr>';
					});
					result+='</table>';
				$('#search-result').html('');
				$('#search-result').append(result);
				
				//*******Event related to the callback function*******
				
				//When user click on a result item link
				$('.faclink').click(function(e) {
					var facId=$(this).attr('data-id');
					var resultItem_name=$(this).contents(':not(span)').text();				
					$("#search-field").val($.trim(resultItem_name));
					$('#search-result').hide();
					//view facility on map
					searchFacility(facId);
					e.preventDefault();
				});
			
			});
		
		
		}
	//Search result with all occurrences
	function viewSearchResult_occ(){
		
		$('#search-result').html('<div class"searching">Recherche en cours <span  class="loading-result"></span></div>');
		var valField=$("#search-field").val();
		
		$.get("lib/inc/orgunit.inc.php?keyword="+valField,function(data){
				var obj=jQuery.parseJSON(data);
				var result='<table class="table table-condensed table-hover table-striped">';
				//if no result
				if(jQuery.isEmptyObject(obj)){
					$('#search-result').html('<p style="text-align:center;color:#999">Aucun resultat trouv&eacute; pour <strong>"'+valField+'"</strong></p>');
					return false;
					}
				$.each(obj, function(){
					namefac=this['nameoffacility'];
					id=this['id'];
					depfac=this['deptname'];	
					commfac=this['commune_name'];
					typeFacImg=typeFacIconMarker(this['facilitytype']);			
					result+='<tr><td><img src="'+typeFacImg+'"/></td><td><a href="#" class="faclink faclink-resultsearch" data-id="'+id+'">'+namefac+'<br/><span class="infofacname">'+depfac+', '+commfac+'</span></a></td></tr>';
					});
					result+='</table>';
				$('.result-occ').html('');
				$('.result-occ').append(result);
				$('.keywordtosearch').html($("#search-field").val());
				
				//*******Event related to the callback function*******
				
				//When user click on a result item link
				$('.faclink').click(function(e) {
					var facId=$(this).attr('data-id');
					var resultItem_name=$(this).contents(':not(span)').text();				
					$("#search-field").val($.trim(resultItem_name));
					$('#search-result').hide();
					//view facility on map
					searchFacility(facId);
					e.preventDefault();
				});
			
			});
		
		}
	//manage functions for result search
	function resultSearch_occ(){
			$('#search-field').blur();
			viewSearchResult_occ();
			$('#search-result-occ').slideDown();
		}
	// Search a facility on the map
	function searchFacility(facId){			
			$.get("lib/inc/marker.inc.php?facilityid="+facId+"&sfac=1",function(data){						
			  getXmlData(data);//retrieving xml data from database						
			  addClusterOnMap();//clustering						
			});//end get				
		}
	
	
	
/******************************* FUNCTION TO BE SHARED *****************************************/
	
	
	/*
	  * Retrieve xml data from database for viewing markers
	  * @param data
	  * @return void
	  */
	  function getXmlData(data){
		  var xml=xmlParse(data);				  
		  var markers = xml.documentElement.getElementsByTagName("marker");
		  removeClusterOnMap();//remove markers form the map
		  for(var i = 0; i < markers.length; i++){
			  var id=markers[i].getAttribute("id_code");
			  var lat = parseFloat(markers[i].getAttribute("lat"));
			  var lng = parseFloat(markers[i].getAttribute("lng"));
			  var facType=markers[i].getAttribute("facility_type");
			  var title=markers[i].getAttribute("titre");
			  var manag_authority=markers[i].getAttribute("manag_authority");
			  var vComm_name=markers[i].getAttribute("vComm_name");
			  var deptname=markers[i].getAttribute("departement_name");								
			  var nb_bed_overnight=markers[i].getAttribute("nb_bed_overnight");
			  var nb_gen_medPrac=markers[i].getAttribute("nb_gen_medPrac");
			  var nb_spePrac=markers[i].getAttribute("nb_spePrac");
			  var typ_service_avail=markers[i].getAttribute("typ_service_avail");	
			  //services variables
			  var ChildVacc = markers[i].getAttribute("ChildVacc");
			  var GrowthMon = markers[i].getAttribute("GrowthMon");
			  var Sickchild = markers[i].getAttribute("Sickchild");
			  var FP = markers[i].getAttribute("FP");
			  var ANC = markers[i].getAttribute("ANC");
			  var PMTCT = markers[i].getAttribute("PMTCT");								
			  var delivery = markers[i].getAttribute("delivery");
			  var malaria = markers[i].getAttribute("malaria");
			  var sti = markers[i].getAttribute("sti");
			  var tb = markers[i].getAttribute("tb");
			  var hivct = markers[i].getAttribute("hivct");
			  var minorsurgery = markers[i].getAttribute("minorsurgery");
			  var csections = markers[i].getAttribute("csections");		
			  facTypeIcon=facType;						
			  addMarkerOnMap(id,lat,lng,facType,title,manag_authority,vComm_name,deptname,nb_bed_overnight,nb_gen_medPrac,nb_spePrac,typ_service_avail,ChildVacc,GrowthMon,Sickchild,FP,ANC,PMTCT,delivery,malaria,sti,tb,hivct,minorsurgery,csections);								
			  
			  }	
		  }


			/*
			* Icon Marker for each facility
			* @param facility type
			* @return icon path
			*/
			function typeFacIconMarker(facType){
				var path='images/mapicons/';
				switch(facType){
					case 'Centre de sante sans lit':
						path=path+'csl22.png';
					break;
					
					case 'Centre de sante a lit':
						path=path+'cal22.png';
					break;
					
					case 'Dispensaire':
						path=path+'disp22.png';
					break;
					
					case 'Hopital':
						path=path+'hcr2_22.png';
					break;
					
					case 'Hopital communautaire de reference':
						path=path+'hcr22.png';
					break;
					
					case 'Hopital departemental':
						path=path+'hdep22.png';
					break;
					
					case 'Hopital universitaire':
						path=path+'hu22.png';
					break;					
					}					
					return path;
				}
			
			
			/*
			* Return facility services names
			* @param lng lat
			* @return none
			*/
			function facilityServicesName(serviceNameAlias){
				
				var serviceName="";
				switch(serviceNameAlias){
					case 'ChildVacc':
					serviceName='Vaccination';
					break;
					
					case 'GrowthMon':
					serviceName='Pes&eacute;es de l\'enfant';
					break;
					
					case 'Sickchild':
					serviceName='Services p&eacute;diatriques';
					break;
					
					case 'FP':
					serviceName='Planification familiale';
					break;
					
					case 'ANC':
					serviceName='Clinique pr&eacutenatale';
					break;
					
					case 'PMTCT':
					serviceName='PTME';
					break;
					
					case 'delivery':
					serviceName='Accouchement';
					break;
					
					case 'malaria':
					serviceName='Prise en charge malaria';
					break;
					
					case 'sti':
					serviceName='Prise en charge MST';
					break;
					
					case 'tb':
					serviceName='Prise en charge en TB';
					break;
					
					case 'hivct':
					serviceName='Soin et traitement VIH';
					break;
					
					case 'minorsurgery':
					serviceName='Chirurgie mineure';
					break;
					
					case 'csections':
					serviceName='C&eacute;sarienne';
					break;
										
					default:
					serviceName='Inconnu';
					}
					
					return serviceName;
				}
			/*
			* Return facility services
			* @param lng lat
			* @return none
			*/
			function facilityServices(ChildVacc,GrowthMon,Sickchild,FP,ANC,PMTCT,delivery,malaria,sti,tb,hivct,minorsurgery,csections){
				var service_given=[];
				
				if(malaria==1){
					service_given.push("malaria");
					}
				
				if(sti==1){
					service_given.push("sti");
					}
					
				if(tb==1){
					service_given.push("tb");
					}
					
				if(hivct==1){
					service_given.push("hivct");
					}
				
				if(minorsurgery==1){
					service_given.push("minorsurgery");
					}
					
				if(csections==1){
					service_given.push("csections");
					}
				
				if(delivery==1){
					service_given.push("delivery");
					}
				
				if(ChildVacc==1){
					service_given.push("ChildVacc");
					}
					
				if(GrowthMon==1){
					service_given.push("GrowthMon");
					}
				
				if(Sickchild==1){
					service_given.push("Sickchild");
					}
				
				if(FP==1){
					service_given.push("FP");
					}
				
				if(ANC==1){
					service_given.push("ANC");
					}
				
				if(PMTCT==1){
					service_given.push("PMTCT");
					}	
				return service_given;
				}
			
			
			
			/*
			* Creates marker and add info on markers
			* @param lng lat
			* @return none
			*/			
			function addMarkerOnMap(id,lat,lng,facType,tit,manag_authority,vComm_name,deptname,nb_bed_overnight,nb_gen_medPrac,nb_spePrac,typ_service_avail,ChildVacc,GrowthMon,Sickchild,FP,ANC,PMTCT,delivery,malaria,sti,tb,hivct,minorsurgery,csections){
					// get all facility services and their names
					var fac_services='';
					var services=facilityServices(ChildVacc,GrowthMon,Sickchild,FP,ANC,PMTCT,delivery,malaria,sti,tb,hivct,minorsurgery,csections);
					for(var i=0; i<services.length; i++){
						var fac_aliasName=services[i];
						var fac_name=facilityServicesName(fac_aliasName);
						if((i+1)==services.length){
							fac_services+=fac_name;
							}else{
								fac_services+=fac_name+', ';
								}
						
						}
						
					//check service 24/24h available
					if(typ_service_avail=='1'){
						typ_service_avail='Oui';
						}else{
							if(typ_service_avail=='2'){
								typ_service_avail='Non'
								}else{
									typ_service_avail='Inconnu'
									}
							}
					var iconImage=typeFacIconMarker(facTypeIcon);
					var latlng = new google.maps.LatLng(lat, lng);
					map.setZoom(10);
					map.panTo(latlng);
					var marker = new google.maps.Marker({
						position: latlng,
						icon:iconImage,
						//map: map,
						title: tit
						});
					marker.setAnimation(google.maps.Animation.DROP);
					markersM.push(marker);
						
						/*if(infoWindow){
							infoWindow.close()
							}*/
						marker.html="<div class='infoWin'> <h2>"+tit+"&nbsp;&nbsp;<span class='badge badge-important'>"+deptname+", "+vComm_name+"</span></h2> <table class='table table-striped table-condensed table-hover'><tr><td><strong>Type:</strong></td><td>"+facType+"</td></tr> <tr><td><strong>Statut:</strong></td><td>"+manag_authority+"</td></tr> <tr><td><strong>Nombre de lits pour hospitalisation:</strong></td><td>"+nb_bed_overnight+"</td></tr> <tr><td><strong>Nombre de medcins generalistes</strong></td><td>"+nb_gen_medPrac+"</td></tr> <tr><td><strong>Nombre de specialites generalistes</strong></td><td>"+nb_spePrac+"</td></tr> <tr><td><strong>Service disponible 24h/24</strong></td><td>"+typ_service_avail+"</td></tr> <tr><td colspan='2'><strong>Service(s) offert(s):</strong></td></tr><tr><td colspan='2'>"+fac_services+"</td></tr> </table> <a href='inst.php?c="+id+"' class='btn btn-danger pull-right'>En savoir plus &raquo;</a></div>";
						infoWindow  = new google.maps.InfoWindow();		
						infoWindow.setContent(marker.html);
						infoWindow.open(map,marker);				
						google.maps.event.addListener(marker, 'click', function(){						
						//infoWindow.setContent(this.html);
						infoWindow.open(map,this);
						});
						
						

				}



		  
	//Add markers by group using clusters
	function addClusterOnMap(){
		markerclusterer.addMarkers(markersM);
		}
		
	//Remove clusters
	function removeClusterOnMap(){
		markerclusterer.clearMarkers();
		markersM = [];
		}
	
	//XML parser - shared
	function xmlParse(str) {
		if (typeof ActiveXObject != 'undefined' && typeof GetObject != 'undefined') {
		var doc = new ActiveXObject('Microsoft.XMLDOM');
		doc.loadXML(str);
		return doc;
		}
		if (typeof DOMParser != 'undefined') {
		return (new DOMParser()).parseFromString(str, 'text/xml');
		}
		return createElement('div', null);
	}
		