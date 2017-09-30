$("#dislikes_<%=@postt.id%>").show()
$("#dislikes_<%=@postt.id%>").html("<%= @postt.dislikes.count %>")

$("#botonDisLike_<%=@postt.id%>").removeClass("iconNomegusta")
$("#botonDisLike_<%=@postt.id%>").addClass("iconYANomegusta")



