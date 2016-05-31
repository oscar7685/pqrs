
<link rel="stylesheet" type="text/css" href="css/sweetalert.css">
<!-- javascript -->
<script type="text/javascript" src="js/plugins/jquery/jquery.min.js"></script>       
<script type="text/javascript" src="js/plugins/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="js/plugins/jquery-validate/jquery.validate.min.js"></script>     
<script type="text/javascript" src="js/dev-layout-default.js"></script>
<script type="text/javascript" src="js/sweetalert.min.js"></script>
<script type="text/javascript">
    
    "use strict";
    var demo_form_validation1 = {
        init: function() {

            if ($("#formularioContrasena").length > 0) {
                $("#formularioContrasena").validate({
                    errorClass: "has-error",
                    validClass: "has-success",
                    errorElement: "span",
                    ignore: [],
                    errorPlacement: function(error, element) {
                        $(element).after(error);
                        $(element).parents(".form-group").addClass("has-error");
                    },
                    highlight: function(element, errorClass) {
                        $(element).parents(".form-group").removeClass("has-success").addClass(errorClass);
                        dev_layout_alpha_content.init(dev_layout_alpha_settings);
                    },
                    unhighlight: function(element, errorClass, validClass) {
                        $(element).parents(".form-group").removeClass(errorClass).addClass(validClass);
                        dev_layout_alpha_content.init(dev_layout_alpha_settings);
                    },
                    rules: {
                        actual: {required: true},
                        nueva1: {required: true, minlength: 5, maxlength: 20},
                        nueva2: {required: true, minlength: 5, maxlength: 20, equalTo: "#nueva1"}
                        
                    },
                    submitHandler: function() {
                        $.ajax({
                            type: 'POST',
                            url: "/pqrs/Controller?accion=cambiarClave",
                            data: $("#formularioContrasena").serialize(),
                            success: function(data) {
                                if (data == "0") {
                                    swal("Bien hecho", "Cambio de contraseña exitoso!", "info");
                                } else {
                                    if (data == "1") {
                                        swal("Ops!", "Ha ocurrido un error al intentar cambiar la contraseña", "error");
                                    }
                                }

                            } //fin success
                        }); //fin $.ajax  
                    }

                });
            }
        }
    };
    $(function() {
        demo_form_validation1.init();
    });
</script>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>             
<!-- page content container -->
<div class="container">

    <!-- Horizontal Form -->
    <div class="wrapper">
        <div class="page-subtitle">
            <h3>Cambiar Contrase&nacute;a</h3>
        </div>

        <form id="formularioContrasena" role="form" method="post"> 
            <div class="form-group">
                <label class="col-md-2 control-label">Contrase&nacute;a actual</label>
                <div class="col-md-8">
                    <input type="password" placeholder="Contraseña actual" name="actual" id="actual" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label">Nueva Contrase&nacute;a</label>
                <div class="col-md-8">
                    <input type="password" placeholder="Nueva contraseña" name="nueva1" id="nueva1" class="form-control" >
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label">Nueva Contrase&nacute;a</label>
                <div class="col-md-8">
                    <input type="password" placeholder="Nueva contraseña" name="nueva2" id="nueva2" class="form-control" >
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-offset-2 col-md-8">
                    <button type="submit" id="btnCambiarC" data-loading-text="Cambiando contraseña..." class="btn btn-primary" autocomplete="off">
                        Cambiar contrase&nacute;a
                    </button>
                </div>
            </div>

        </form>

    </div>
    <!-- ./Horizontal Form -->

    <!-- Copyright -->
    <div class="copyright">
        <div class="pull-left">
            &copy; 2015 <strong>Universidad de Cartagena</strong>. Todos los derechos reservados.
        </div>
    </div>
    <!-- ./Copyright -->

</div>
<!-- ./page content container -->
<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->