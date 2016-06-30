/* 
        Methods used to show ANC facilities and their care,
        what facilities provide care for pregnant woman and 
        support before and after birth of baby (Jonhnson)
 */


/////////////////     SONU Methods    ///////////////////////////

//View all sonu facilities by default

/*function allSONUFac(){
 var arraySonu=[
 
 ['sonub',[19.802885893331794, -73.04672241210938],'sonu 1'],
 ['sonuc',[19.339653419491874, -72.51113891601562],'sonu 2'],
 ['sonub',[19.629653250428277, -72.2938585281372],'sonu 3'],
 ['sonub',[19.028366797457245, -72.2334337234497],'sonu 4'],
 ['sonub',[19.108838815166006, -72.5849962234497],'sonu 5'],
 ['sonub',[19.417382820241254, -71.83517932891846],'sonu 6'],
 ['sonub',[18.445741249840804, -73.25790882110596],'sonu 7'],
 ['sonuc',[18.32454411799719, -73.04493069648743],'sonu 8'],
 ['sonub',[18.33106225839585, -72.62619495391846],'sonu 9']
 //Lat:18.33106225839585 Longi:-72.62619495391846
 
 ];
 arraySonu.forEach(function(el,index){
 var marker = new google.maps.Marker({
 position:new google.maps.LatLng(arraySonu[index][1][0],arraySonu[index][1][1]),
 map: map,
 title:arraySonu[index][2],
 draggable:true,
 icon:'images/mapicons/'+arraySonu[index][0]+'.png'	
 });
 
 })
 }*/

//Show link between sonu facilities

/*function linkSONUFac(){	
 //link sonu 1 to sonu 2		
 var linkMarkers1=[ 
 new google.maps.LatLng(19.802885893331794, -73.04672241210938),
 new google.maps.LatLng(19.339653419491874, -72.51113891601562)
 ];
 var iconsetngs = {
 fillOpacity:1, 
 path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW
 };
 var polylineoptns = {
 path: linkMarkers1,
 strokeOpacity: 0.8,
 strokeWeight: 3,
 strokeColor:"orange",
 map: map,
 draggable:true,			
 icons: [{
 icon: iconsetngs,
 offset: '95%'}]
 };
 polyline = new google.maps.Polyline(polylineoptns);
 
 //Click event on the link 1 2
 google.maps.event.addListener(polyline,'click',function(e){
 
 if(infoWindow){
 infoWindow.close()
 }
 
 infoWindow  = new google.maps.InfoWindow({
 content:"Amelioration possible"					
 });				
 
 //set the infowindow position according to the mouse one's 
 infoWindow.setPosition(new google.maps.LatLng(MOUSE_LOCATION[0], MOUSE_LOCATION[1]));
 infoWindow.open(map);
 });	
 
 //link sonu 3 to sonu 2		
 var linkMarkers1=[ 
 new google.maps.LatLng(19.629653250428277, -72.2938585281372),
 new google.maps.LatLng(19.339653419491874, -72.51113891601562)
 ];
 var iconsetngs = {
 fillOpacity:1, 
 path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW
 };
 var polylineoptns = {
 path: linkMarkers1,
 strokeOpacity: 0.8,
 strokeWeight: 3,
 strokeColor:"orange",
 map: map,
 draggable:true,
 
 icons: [{
 icon: iconsetngs,
 offset: '95%'}]
 };
 polyline = new google.maps.Polyline(polylineoptns);
 
 //Click event on the link 3 to 2
 google.maps.event.addListener(polyline,'click',function(e){
 
 if(infoWindow){
 infoWindow.close()
 }
 
 infoWindow  = new google.maps.InfoWindow({
 content:"Amelioration possible"					
 });				
 
 //set the infowindow position according to the mouse one's 
 infoWindow.setPosition(new google.maps.LatLng(MOUSE_LOCATION[0], MOUSE_LOCATION[1]));
 infoWindow.open(map);
 });	
 
 
 //link sonu 4 to sonu 2		
 var linkMarkers1=[ 
 new google.maps.LatLng(19.028366797457245, -72.2334337234497),
 new google.maps.LatLng(19.339653419491874, -72.51113891601562)
 ];
 var iconsetngs = {
 fillOpacity:1, 
 path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW
 };
 var polylineoptns = {
 path: linkMarkers1,
 strokeOpacity: 0.8,
 strokeWeight: 3,
 strokeColor:"orange",
 map: map,
 draggable:true,
 
 icons: [{
 icon: iconsetngs,
 offset: '95%'}]
 };
 polyline = new google.maps.Polyline(polylineoptns);
 
 //Click event on the link 3 to 2
 google.maps.event.addListener(polyline,'click',function(e){
 
 if(infoWindow){
 infoWindow.close()
 }				
 infoWindow  = new google.maps.InfoWindow({
 content:"Amelioration difficile"					
 });					
 //set the infowindow position according to the mouse one's 
 infoWindow.setPosition(new google.maps.LatLng(MOUSE_LOCATION[0], MOUSE_LOCATION[1]));
 infoWindow.open(map);
 });	
 
 
 //link sonu 5 to sonu 2		
 var linkMarkers1=[ 
 new google.maps.LatLng(19.108838815166006, -72.5849962234497),
 new google.maps.LatLng(19.339653419491874, -72.51113891601562)
 ];
 var iconsetngs = {
 fillOpacity:1,
 strokeWeight:2,
 path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW
 };
 var polylineoptns = {
 path: linkMarkers1,
 strokeOpacity: 0.8,
 strokeWeight: 3,
 strokeColor:"green",
 map: map,
 draggable:true,
 
 icons: [{
 icon: iconsetngs,
 offset: '95%'}]
 };
 polyline = new google.maps.Polyline(polylineoptns);
 
 //Click event on the link 5 to 2
 google.maps.event.addListener(polyline,'click',function(e){
 
 if(infoWindow){
 infoWindow.close()
 }				
 infoWindow  = new google.maps.InfoWindow({
 content:"Bonne <span style='color:green'>liaison</span>"					
 });					
 //set the infowindow position according to the mouse one's 
 infoWindow.setPosition(new google.maps.LatLng(MOUSE_LOCATION[0], MOUSE_LOCATION[1]));
 infoWindow.open(map);
 });	
 
 
 //link sonu 6 to sonu 2		
 var linkMarkers1=[ 
 new google.maps.LatLng(19.417382820241254, -71.83517932891846),
 new google.maps.LatLng(19.339653419491874, -72.51113891601562)
 ];
 var iconsetngs = {
 fillOpacity:1,
 path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW
 };
 var polylineoptns = {
 path: linkMarkers1,
 strokeOpacity: 0.8,
 strokeWeight: 3,
 strokeColor:"red",
 map: map,
 draggable:true,
 
 icons: [{
 icon: iconsetngs,
 offset: '95%'}]
 };
 polyline = new google.maps.Polyline(polylineoptns);
 
 //Click event on the link 6 to 2
 google.maps.event.addListener(polyline,'click',function(e){
 
 if(infoWindow){
 infoWindow.close()
 }
 
 infoWindow  = new google.maps.InfoWindow({
 content:"Amelioration <span style='color:red'>difficile</span>"					
 });				
 //set the infowindow position according to the mouse one's 
 infoWindow.setPosition(new google.maps.LatLng(MOUSE_LOCATION[0], MOUSE_LOCATION[1]));
 infoWindow.open(map);
 });	
 
 //link sonu 7 to sonu 8				
 var linkMarkers1=[ 
 new google.maps.LatLng(18.445741249840804, -73.25790882110596),
 new google.maps.LatLng(18.32454411799719, -73.04493069648743)
 ];
 var iconsetngs = {
 fillOpacity:1,
 path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW
 };
 var polylineoptns = {
 path: linkMarkers1,
 strokeOpacity: 0.8,
 strokeWeight: 3,
 strokeColor:"green",
 map: map,
 draggable:true,
 
 icons: [{
 icon: iconsetngs,
 offset: '95%'}]
 };
 polyline = new google.maps.Polyline(polylineoptns);
 
 
 //link sonu 9 to sonu 8				
 var linkMarkers1=[ 
 new google.maps.LatLng(18.33106225839585, -72.62619495391846),
 new google.maps.LatLng(18.32454411799719, -73.04493069648743)
 ];
 var iconsetngs = {
 fillOpacity:1,
 path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW
 };
 var polylineoptns = {
 path: linkMarkers1,
 strokeOpacity: 0.8,
 strokeWeight: 3,
 draggable:true,
 strokeColor:"orange",
 map: map,
 draggable:true,
 editable:true,
 icons: [{
 icon: iconsetngs,
 offset: '95%'}]
 };
 polyline = new google.maps.Polyline(polylineoptns);
 
 
 google.maps.event.addListener(polyline,'dragend',getPathLink);
 google.maps.event.addListener(polyline.getPath(),'insert_at',getPathLink);
 google.maps.event.addListener(polyline.getPath(),'remove_at',getPathLink);
 google.maps.event.addListener(polyline.getPath(),'set_at',getPathLink);
 
 
 }*/