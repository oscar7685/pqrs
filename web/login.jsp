<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>        
        <!-- meta section -->
        <title>PQRS - Universidad de Cartagena</title>

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" >

        <link rel="icon" href="favicon.ico" type="image/x-icon" >
        <!-- /meta section -->        

        <!-- css styles -->
        <link rel="stylesheet" type="text/css" href="css/dark.css" id="dev-css">
        <!-- ./css styles -->                                    

        <!--[if lte IE 9]>
        <link rel="stylesheet" type="text/css" href="css/dev-other/dev-ie-fix.css">
        <![endif]-->

        <!-- javascripts -->
        <script type="text/javascript" src="js/plugins/modernizr/modernizr.js"></script>
        <!-- ./javascripts -->

        <style>.dev-page{visibility: hidden;}</style>
    </head>
    <body>

        <!-- page wrapper -->
        <div class="dev-page dev-page-login dev-page-login-v2">
            <!-- page header -->    
            <div class="dev-page-header">

                <div class="dph-logo">
                    <a href="inicio.jsp">Pqrs</a>
                </div>
            </div>
            <!-- ./page header -->
            <div class="dev-page-login-block">
                <a class="dev-page-login-block__logo">PQRS</a>
                <div class="dev-page-login-block__form">
                    <div class="title"><strong>Bienvenido</strong>, por favor ingrese</div>
                    <form id="flogin" role="form" action="javascript:loguear();" method="post">                        
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                <input type="text" name="codigo" class="form-control" placeholder="Código">
                            </div>
                        </div>                        
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                <input type="password" name="pass" class="form-control" placeholder="Contraseña">
                            </div>
                        </div>
                        <div class="form-group no-border margin-top-20">
                            <button class="btn btn-success btn-block">Ingresar</button>
                            <!-- <a href="indexPeticionario.jsp" class="btn btn-success btn-block">Ingresar</a>-->
                            <a href="registro.jsp" class="btn btn-danger btn-block">Registrarse</a>
                        </div>
                        <p><a href="#">¿Olvidó su contraseña?</a></p>                        
                    </form>
                </div>
                <div class="dev-page-login-block__footer">
                    &copy; 2015 <strong>Universidad de Cartagena</strong>. Todos los derechos reservados.
                </div>
            </div>

        </div>
        <!-- ./page wrapper -->                

        <!-- javascript -->
        <script type="text/javascript" src="js/plugins/jquery/jquery.min.js"></script>       
        <script type="text/javascript" src="js/plugins/bootstrap/bootstrap.min.js"></script>  
        <script type="text/javascript" src="js/plugins/jquery-validate/jquery.validate.min.js"></script>     
        <script type="text/javascript" src="js/dev-layout-default.js"></script>
        <!-- ./javascript -->
        <script type="text/javascript">
            "use strict";

            var demo_form_validation = {
                init: function() {

                    if ($("#flogin").length > 0) {
                        $("#flogin").validate({
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
                                codigo: {required: true, minlength: 2, maxlength: 12},
                                pass: {required: true, minlength: 5, maxlength: 20}

                            }
                        });
                    }
                }
            };


            function loguear() {
                $.ajax({
                    url: 'Controller?accion=loguear',
                    data: $("#flogin").serialize(),
                    type: 'post',
                    success: function(msg) {

                        if (msg === '1')
                        {
                            document.location = 'indexPeticionario.jsp';
                        } else {
                            if (msg === '2') {
                                alert("ha ocurrido un error al intentar entrar");
                            }

                        }
                    }

                });
            }

            $(function() {
                demo_form_validation.init();
            });
        </script>


    </body>
</html>






