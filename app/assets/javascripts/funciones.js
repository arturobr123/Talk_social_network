var ready = function()  {

$("#popPost").click(function(){
    $(this).data('clicked', true);
    console.log("boton");
});
window.loading = false


$("body").click   // quitar dialog de post
(
  function(e)
  {
    console.log("CLICK!");
    $("#searches").removeClass("active"); //cerrar Buscador
      

    if(e.target.className === "ajax-text-and-image white-popup-block") //cerrar Dialog del post
    {
      console.log("click fuera de div");
      dialog = document.getElementById("popPost");
      dialog.close();

    }
  }

  

);




$(function() { //subir foto pequeña en el form de post
  $('.updatePhoto').change(function(e) {
      console.log("subir foto");
      addImage(e); 
     });

     function addImage(e){
      var file = e.target.files[0],
      imageType = /image.*/;
    
      if (!file.type.match(imageType))
       return;
  
      var reader = new FileReader();
      reader.onload = fileOnload;
      reader.readAsDataURL(file);
     }
  
     function fileOnload(e) {
      var result=e.target.result;
       $('#imgSalida').show();
      $('#imgSalida').attr("src",result);
     }
    });




}


$(document).on('turbolinks:load page:change', ready);









console.log("hola desde funciones");

