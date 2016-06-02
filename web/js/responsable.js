/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
$(function() {

    var actualizaEnlaces = function(hash) {
        $(".dev-page-sidebar li").removeClass("active");
        $("a[href='" + hash + "']").parent().addClass("active");
    };
    location = "/pqrs/#inicio";
    location = "/pqrs/#listarTodasPQRS";

    $(document).ajaxStart(function() {
        var loading_layer = $("<div></div>").addClass("dev-page-loading");
        $(".dev-page-content").append(loading_layer).find(".dev-page-loading").animate({opacity: 1},200,"linear");
    });
    
    $(document).ajaxStop(function() {
        if($(".dev-page-loading").length > 0){            
            $(".dev-page-loading").animate({opacity: 0},300,"linear",function(){
                $(this).remove();
            });                        
        }  
    });

    $(window).hashchange(function() {
        var hash = location.hash;
        if (hash === "#cerrarSesion") {
            $.post('Controller?accion=cerrarSesion', function() {
                location = "/pqrs";
            });
            //fin post
        } else if (hash.indexOf("enviar") !== -1) {
            var url3 = hash.replace('#', "Controller?accion=");
            $.ajax({
                type: "POST",
                url: url3,
                success: function(data)
                {
                    if (data === '9') {
                        location = "/pqrs/#listarTodasPQRS";
                    }
                } //fin success
            }); //fin del $.ajax 
        } else {

            var url3 = hash.replace('#', "Controller?accion=");
            $("div.dev-page-content").empty();
            $.ajax({
                type: "POST",
                url: url3,
                success: function(data)
                {
                    $("div.dev-page-content").html(data);
                    actualizaEnlaces(hash);
                } //fin success
            }); //fin del $.ajax 



        }
    });
});