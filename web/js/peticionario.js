/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$(function() {

    location = "/pqrs/#inicio";
    location = "/pqrs/#listarPQRS";
    $(window).hashchange(function() {
        var hash = location.hash;
        if (hash === "#cerrarSesion") {
            $.post('Controller?accion=cerrarSesion', function() {
                location = "/pqrs";
            }); //fin post
        } else {

            var url3 = hash.replace('#', "Controller?accion=");
            $("div.dev-page-content").empty();
            $.ajax({
                type: "POST",
                url: url3,
                success: function(data)
                {
                    $("div.dev-page-content").html(data);
                    //actualizaEnlaces(hash);
                } //fin success
            }); //fin del $.ajax 



        }
    });
});