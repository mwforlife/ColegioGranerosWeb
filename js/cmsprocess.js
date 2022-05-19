$("#foto").change(function(){
   vistaprevia(this); 
});

function vistaprevia(imagen){
    if(imagen.files && imagen.files[0]){
        var reader = new FileReader(); 
        reader.onload = function (e) {
          $('#previa').attr('src', e.target.result); // Renderizamos la imagen
      }
      reader.readAsDataURL(imagen.files[0]);

    }
}