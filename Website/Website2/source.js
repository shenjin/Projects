$(document).ready(function(){
	var fade = function(object,delay,fadeTime,Opacity){
		$(object).delay(delay).fadeTo(fadeTime,Opacity);
	};
	var moveX = function(object,delay,position,moveTime){
		$(object).delay(delay).animate({left:position},moveTime);
	};
	var moveY = function(object,delay,position,moveTime){
		$(object).delay(delay).animate({top:position},moveTime);
	};
	var clicked = false;
	var middle = $('#project').width() / 2 * -1;
	moveY('#first',0,'50%',1000);
	moveX('#last',0,'33%',1000);
	fade('#Resume',1000,500,1);
	fade('#GitHub',1250,500,1);
	fade('#LinkedIn',1500,500,1);
	fade('#Projects',1750,500,1);
	$(".option a").mouseover(function(){
		$(this).css("color", "#730e07");
	});
	$(".option a").mouseout(function(){
		$(this).css("color", "#332e28");
	});
	$("#Projects").click(function(){
		moveX('#Projects',0,'100%',1000);
		moveX('#LinkedIn',250,'100%',1000);
		moveX('#GitHub',500,'100%',1000);
		moveX('#Resume',750,'100%',1000);
		moveX('#last',250,'-15%',1000);
		moveY('#first',250,'-5%',1000);
		$('#project').css('margin-left', middle);
		moveY('#project',0,'33%',2000);
		moveY('.image',0,'66%',2000);
	});
	$(".image").mouseenter(function(){
		fade(this,0,0,1);
		$("p",this).fadeTo(0,1);
		});
	$(".image").mouseleave(function(){
		if(!clicked){
			fade(this,0,0,0.5);
			$("p",this).fadeTo(0,0);
		}
	});
	
	$("#img1").click(function(){
		clicked = true;
		$('#img1').css("opacity","1");
		$('#img1 p').fadeTo(0,1);
		moveY('#project',0,'-65%',1000);
		moveY('#img2',0,'-34%',1000);
		moveY('#img1',0,'25%',1000);
		moveX('#img1',0,'10%',1000);
		moveX('#imgHelpera',1000,'50%',1000);
	});
	
	$("#img2").click(function(){
		clicked = true;
		$('#img2').css("opacity","1");
		$('#img2 p').fadeTo(0,1);
		moveY('#project',0,'-65%',1000);
		moveY('#img1',0,'-34%',1000);
		moveY('#img2',0,'25%',1000);
		moveX('#img2',0,'10%',1000);
		var alpha = screen.width * 0.5 - 276 - 5;
		var beta = screen.width * 0.5;
		var gamma = screen.width * 0.5 + 276 + 5;
		$('#imgHelper6').delay(1000).animate({left: alpha + "px"}, 1000);
		$('#imgHelper5').delay(1000).animate({left: beta + "px"}, 1000);
		$('#imgHelper4').delay(1000).animate({left: gamma + "px"}, 1000);
		$('#imgHelper3').delay(1000).animate({left: alpha + "px"}, 1000);
		$('#imgHelper2').delay(1000).animate({left: beta + "px"}, 1000);
		$('#imgHelper1').delay(1000).animate({left: gamma + "px"}, 1000);
	});
	
});