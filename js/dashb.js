/* GLOBAL Variables initialisation */



$(document).ready(function(e) {
   
	
});

//function get all ind values from dhis

/*function alldhisIndValues(){
	$.get("lib/inc/dashdata.inc.php?dhisdata=1",function(data){
			var obj=jQuery.parseJSON(data);
			var result='';
			//if no result
				if(jQuery.isEmptyObject(obj)){
					alert("Pas de donnees");
					return false;
					}
			$.each(obj, function(){
					region=this['institution'];
					nbpop=52400;
					qte=1222;	
					period=this['periode'];			
					result+='<tr class="gradeA"><td>'+region+'</td><td>'+nbpop+'</td><td>'+qte+'</td><td class="center">'+period+'</td></tr>';
					});
					
				$('#dataTables-example tbody').html('');
				$('#dataTables-example tbody').append(result);
				
		});
	} */
	