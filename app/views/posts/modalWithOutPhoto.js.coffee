$("#popPost").html("<%= escape_javascript(render 'posts/modalWithOutPhoto') %>")
dialog = document.getElementById("popPost")
dialog.showModal()
console.log("modal")
componentHandler.upgradeDom()