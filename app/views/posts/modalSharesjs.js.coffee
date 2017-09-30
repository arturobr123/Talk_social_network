$("#dialogo-Megusta").html("<%= escape_javascript(render 'posts/modalShares') %>")
dialog = document.getElementById("popLikes")
dialog.showModal()
console.log("modal")