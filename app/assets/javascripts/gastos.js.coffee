# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
	jQuery.fn.activarCalcular = () ->
		$('input:text').focusout ->
			rta = jQuery.fn.calcular($(this).val())
			if rta == 'error'
				alert("revisar calculo")
				$(this).val('=').focus()
			else
				$(this).val(rta)
	jQuery.fn.calcular = (texto) ->
		if texto[0] == "="
			try
				fx = texto.substring(1,texto.length)
				rta = eval(fx)
			catch 
				rta = 'error'
		else 
			rta = texto
		rta

	jQuery.fn.activarCalcular()	
$(document).ready(ready)
$(document).on('page:load', ready)

