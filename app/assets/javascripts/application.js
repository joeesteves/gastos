//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(function(){
	$(this).keyup(function(e) {
		e.preventDefault();
		e.stopPropagation();
		if(e.ctrlKey && e.shiftKey && e.keyCode==65){ //crtl+shift+a
			nuevo();
		}
		if(e.ctrlKey && e.shiftKey && e.keyCode==70){ // ctrl+shift+f
			filtro();
		}	
		if(e.keyCode==27){ // esc 
			esc();
		}
	});	
});	

function nuevo(){
	$('#nuevo').css('display','block');
	$('#overlay').addClass('overlay');
	$('#nuevo #fecha').focus();
};

function filtro(){
	$('.modal').css('display','block');
	$('#overlay').addClass('overlay');	
	$('.modal :input').first().focus();
};

function esc(){
	$('.modal_form, .modal').css('display','none');
	$('#overlay').removeClass('overlay');
};
