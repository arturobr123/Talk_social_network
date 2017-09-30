$("#comentarios_<%=@postt.id%>").append("<%= escape_javascript(render @comentarios) %>")
$("#PaginateComentarios_<%=@postt.id%>").html("<%= j will_paginate @comentarios,:remote =>true,:class => "PaginateClasscomentarios_#{@postt.id}",:page => params[:comments_page], :params => { :controller => "comments", :action => "moreComments",cualPost: @postt.id} %>")
$("#<%=@postt.id%>.moreComments").html("see more comments")
<% unless @comentarios.next_page %>
$("#<%=@postt.id%>.moreComments").remove()
<% end %>