$("#comentarios_<%=@postt.id%>").show()
$("#comentarios_<%=@postt.id%>").append("<%= j render @comment %>")
$("#sample1").val("")


