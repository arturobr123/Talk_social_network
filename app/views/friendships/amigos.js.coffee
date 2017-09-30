$("#dialogo-Amigos").html("<%= escape_javascript(render 'friendships/friendsModal') %>")
dialog = document.getElementById("popFriends")
dialog.showModal()
console.log("modal")