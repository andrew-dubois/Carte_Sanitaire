
$(document).ready(function() {
	
	$('div.accordionButton').click(function() {
		$('div.accordionContent').stop( true, true ).slideUp('normal');	
		$(this).next().stop( true, true ).slideDown('normal');
	});
	
	$("div.accordionContent").stop( true, true ).hide();
	//click the aggregation accordion automatically
	$('.accord_open').trigger('click');

});
