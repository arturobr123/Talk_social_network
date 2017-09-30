$("#likes_<%=@postt.id%>").show()
$("#cuantosMegusta_<%=@postt.id%>").show()
$("#likes_<%=@postt.id%>").html("<%= @postt.likes.count %>")
$("#botonLike_<%=@postt.id%>").html("favorite")

$("#botonLike_<%=@postt.id%>").removeClass("md-29n")
$("#botonLike_<%=@postt.id%>").addClass("md-29")



