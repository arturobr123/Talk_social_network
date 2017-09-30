console.log("COMPARTIÒ")
$("#shares_<%=@postt.id%>").show()
$("#shares_<%=@postt.id%>").html("<%= @postt.shares.count %>")
$("#botonShare_<%=@postt.id%>").removeClass("md-29n")
$("#botonShare_<%=@postt.id%>").addClass("md-29")

snack({
	message: "Share Successfully",
	timeout: 5000
})

