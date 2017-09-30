# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.snack = (options)->
	document.querySelector("#global-snackbar").MaterialSnackbar.showSnackbar(options)

window.loading = false
tamañoPantaña = 1
					#fetch
$(document).on "turbolinks:load page:fetch", ()->
	console.log("hola2");
	componentHandler.upgradeDom()

	$(".best_in_place").best_in_place()	

	$('textarea').autosize()  
	

	$("#notification").on "click", (ev)-> 
		
		ev.preventDefault() if $("#notifications").hasClass("active")
		
		$("#notifications").toggleClass("active")
		
		return $("#notifications").hasClass("active")


	$(".mdl-layout__content").scroll -> 
		console.log("scroll scroll scroll")
		if  !window.loading && $(".mdl-layout__content").scrollTop() > ($(document).height() * tamañoPantaña)
			console.log("Cargando publicaciones")
			componentHandler.upgradeDom()
			window.loading = true
			url = $(".pagination .next_page").attr("href")
			$.getScript url if url




