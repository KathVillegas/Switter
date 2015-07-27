# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	$(".form-control").keyup -> 
		character = 140 - $(this).val().length
		$(this).parent().parent().find('#counter').text(character + ' characters remaining')

	max = 140
	$('.form-control').keypress (e) ->
		if e.which < 0x20
			return
		if @value.length == max
			e.preventDefault()
		else if @value.length > max
			@value = @value.substring(0,max)
			return
