$(document).ready(function(){
	$('#first').animate({top: '50%'},1000);
	$('#last').animate({left:'33%'},1000);
	$('#LinkedIn').delay(1500).fadeTo(500,1);
	$('#GitHub').delay(1250).fadeTo(500,1);
	$('#Resume').delay(1000).fadeTo(500,1);
	$('.option a').mouseover(function(){
		$(this).css("color" , "#730e07");
	});
	$('.option a').mouseout(function(){
		$(this).css("color" , "#332e28");
	});
	
});