


$(document).ready(function() {
    $("#form-contact").on("submit", function(e) {
        e.preventDefault();
        OpenPreloader();
        var name = $("#name").val();
        var email = $("#email").val();
        var message = $("#mensaje").val();
        var number = $("#phone").val();

        if (name.trim().length == 0 || email.trim().length == 0 || message.trim().length == 0 || number.trim().length == 0) {
            ClosePreloader();
            swal.fire("Error", "Todos los campos son obligatorios", "error");
            return;
        }

        var data = $("#form-contact").serialize();

        $.ajax({
            type: "POST",
            url: "Back/view/mail/contact.php",
            data: data,
            success: function(datos) {
                if (datos == "1") {
                    ClosePreloader();
                    swal.fire("Exito", "Mensaje enviado correctamente \n A la Brevedad alguien se contactará contigo.", "success");
                }else{
                    ClosePreloader();
                    swal.fire("Error", datos, "error");
                }
            },
            error: function(datos) {
                ClosePreloader();
                swal.fire("Error", "Error al enviar el mensaje", "error");
            }
            
        });
    })
});