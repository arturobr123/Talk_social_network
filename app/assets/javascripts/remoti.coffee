$(document).on "click", ".file-activate", (ev)->
	selector = $(this).attr("for")
	$(selector).click()

$(document).on "change", ".remotipart", (ev)->
	$(this).parent().parent().submit()


$(document).on "click", ".like", (ev)->
	selector = $(this).attr("for")
	id = $(this).attr("id")
	$(selector+id).parent().submit()


$(document).on "click", ".dislike", (ev)->
	selector = $(this).attr("for")
	id = $(this).attr("id")
	$(selector+id).parent().submit()

$(document).on "click", ".upload-something", (ev)->
	selector = $(this).attr("for")
	$(selector).click()

$(document).on "click", ".sharePost", (ev)->
	selector = $(this).attr("for")
	id = $(this).attr("id")
	$(selector+id).click()
	otro = "#onclickNumber-share_"
	$(otro+id).parent().submit()


$(document).on "click", "#cerrar", (ev)->
	dialog = document.getElementById("popLikes")
	dialog.close()

$(document).on "click", "#cerrarPopPhoto", (ev)->
    dialog = document.getElementById("popPost")
    dialog.close()

$(document).on "click", ".linkNotificacion", (ev)->
	selector = $(this).attr("for")
	$(selector).click()

$(document).on "click", "#cerrarFriends", (ev)->
	dialog = document.getElementById("popFriends")
	dialog.close()


$(document).on "click", ".moreComments", (ev)->
	#alert("entro")
	id = $(this).attr("id")
	url = $(".PaginateClasscomentarios_#{id} .next_page").attr("href")
	console.log(url)
	#alert(url)
	$.getScript url if url



$(document).on "click", ".area", (ev)->
	selector = $(this).attr("for")
	id = $(this).attr("id")
	$(selector+id).parent().submit()




	




	

	



   
   







