/* GLOBAL Variables initialisation */
var USER_NAME='';
var PASSWORD='';

$(document).ready(function(e) {
	//Validation by enter key
	 /* $('#passwtext').on('keypress keydown keyup', function(e){		 
       if(e.keyCode == 13) { 	   
	   e.preventDefault(); 
	   }
    }); */
	//Validation by submit login button
	$( "#form_login" ).submit(function( event ) {  
		var usr=$('#usernametext').val()
		var pass=$('#passwtext').val()
		$('#btn_connect').text('Patientez...');		
		$('#btn_connect').attr('disabled',"disabled");		
		
		login(usr,pass);
	  	event.preventDefault();
		$('#btn_connect').text('Se Connecter');
		$('#btn_connect').removeAttr('disabled');
	});
	
	//logout event
	/* $('#signout_link').click(function(e) {
        logout();
		e.preventDefault();
    }); */
	
	//change password
	
	/* $("#form_passw").submit(function( e) {  
		changePassword();
		e.preventDefault();
	}); */
	
});



/*** FUNCTIONS AREA **/
function login(usr,pass){
	$.get("lib/inc/users.inc.php?username="+usr+"&pass="+pass,function(data){
		var obj=jQuery.parseJSON(data);
		if(jQuery.isEmptyObject(obj)){
			alert('Nom d\'utilisateur ou mot de passe est incorrect');
			return false;
			}else{
				location.href="/cs/admin"
				/* var username='';
				var pass="";
				var fchange_pass="";
				$.each(obj, function(){
					username=this['username'];
					fchange_pass=this['force_change_pass'];
					pass=this['pass'];
					}); */
				//Store user account
				/* USER_NAME=username;
				PASSWORD=pass; */
				
				
				//$('#username_s').val(username);
				//$('#pass_s').val(pass);
				
				/* $(':input').val('');				
				$('#hdlink a.usrlink').text(username);
				$('#hdlink ul li').attr('class','user_signed');
				$('#hdlink a.usrlink').attr('href','#');
				$('#hdlink a.usrlink').removeAttr('data-toggle');
				$('#hdlink a.usrlink').attr('title','Vous êtes connectés en tant que '+username);
				if(fchange_pass=='t'){
					$("#myModalLabel").hide();
					$('#changingpassw').fadeIn();
					$('#form_login').hide();
					$('#changingpassw_body').fadeIn();
					}else{
						$('#myModal').modal('hide');
						} */
				
				}
		});
	}
