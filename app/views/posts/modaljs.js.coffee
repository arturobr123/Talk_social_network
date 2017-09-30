$("#dialogo-Megusta").html("<%= escape_javascript(render 'posts/modal') %>")
dialog = document.getElementById("popLikes")
dialog.showModal()
console.log("modal")