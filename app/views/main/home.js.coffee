$("#posts .data").append("<%= escape_javascript(render @postss) %>")
$("#pagination").html("<%= j will_paginate @posts %>")
<% unless @posts.next_page %>
$("#pagination").remove()
<% end %>


window.loading = false