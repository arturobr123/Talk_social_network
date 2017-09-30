$("#botonVote_<%=@area.id%>").html("favorite")
$("#botonVote_<%=@area.id%>").removeClass("md-30AreaN")
$("#botonVote_<%=@area.id%>").addClass("md-30Area")

$("#CuantosVotes_<%=@area.id%>").show()
$("#CuantosVotes_<%=@area.id%>").html("<%= @area.votes.count %>")

