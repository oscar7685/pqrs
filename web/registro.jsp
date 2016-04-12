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
        <div class="dev-page dev-page-login dev-page-login-v2 dev-page-registration">
            <!-- page header -->    
            <div class="dev-page-header">

                <div class="dph-logo">
                    <a href="index.jsp">Pqrs</a>
                </div>
            </div>
            <!-- ./page header -->
            <div class="dev-page-login-block">
                <a class="dev-page-login-block__logo">PQRS</a>
                <div class="dev-page-login-block__form">                    
                    <form id="fregistro" role="form" method="post">
                        <div class="row">
                            <div class="col-md-6">                                    
                                <div class="form-group">                            
                                    <input type="text" class="form-control" placeholder="Nombres" name="nombre">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">                            
                                    <input type="text" class="form-control" placeholder="Apellidos" name="apellido">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">                                    
                                <div class="form-group">                            
                                    <input type="text" class="form-control" placeholder="Identificación" name="identificacion">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">                                    
                                <div class="form-group">                            
                                    <input type="text" class="form-control" placeholder="Celular" name="celular">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">     
                                    <select id="tipo_usuario" class="form-control" name="tipo_usuario">
                                        <option selected value=""></option>
                                        <option value="ESTUDIANTE">Estudiante</option>
                                        <option value="EGRESADO">Egresado</option>
                                        <option value="PROFESOR">Docente</option>
                                        <option value="PARTICULAR">Particular</option>
                                        <option value="ASPIRANTE">Aspirante</option>
                                    </select>
                                </div>    
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <select id="modalidad" class="form-control hide" name="modalidad" >
                                        <option selected value=""></option>
                                        <option value="Presencial">Presencial</option>
                                        <option value="Distancia">Distancia</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Correo" name="correo">
                                </div>
                                <div class="form-group">                            
                                    <input type="password" class="form-control" placeholder="Clave" name="password" id="password2">
                                </div>
                                <div class="form-group">                            
                                    <input type="password" class="form-control" placeholder="Repetir Clave" name="re_password">
                                </div>
                            </div>
                        </div>

                        <div class="form-group no-border">
                            <button id="botonRegisto" class="btn btn-primary btn-block" data-loading-text="Registrando usuario..." autocomplete="off">Registrarse</button>
                        </div>
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
        <script type="text/javascript">
            "use strict";
            var demo_form_validation1 = {
                init: function() {

                    if ($("#fregistro").length > 0) {
                        $("#fregistro").validate({
                            errorClass: "has-error",
                            validClass: "has-success",
                            errorElement: "span",
                            ignore: '',
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
                                nombre: {required: true, minlength: 2},
                                apellido: {required: true, minlength: 2},
                                identificacion: {required: true, minlength: 2, maxlength: 12},
                                celular: {required: true, minlength: 7, maxlength: 20},
                                tipo_usuario: {required: true},
                                password: {required: true, minlength: 5, maxlength: 20},
                                're_password': {required: true, minlength: 5, maxlength: 20, equalTo: "#password2"},
                                correo: {required: true, email: true}
                            },
                            submitHandler: function() {
                                $("#botonRegisto").button('loading');
                                $.ajax({
                                    url: 'Controller?accion=registrarReclamante',
                                    data: $("#fregistro").serialize(),
                                    type: 'post',
                                    success: function(msg) {

                                        if (msg === '1')
                                        {
                                            alert("Antes de comenzar a usar PQRS debe confirmar el registro, por favor revise su correo electronico para activar su usuario");
                                        } else {
                                            if (msg === '2') {
                                                alert("ha ocurrido un error al crear el reclamante");
                                            }

                                        }
                                    }

                                });

                            }

                        });
                    }
                }
            };
            $(function() {

                $("#tipo_usuario").change(function() {
                    if ("ESTUDIANTE" === $('#tipo_usuario :selected').val()) {
                        $("#modalidad").removeClass("hide");
                    } else {
                        $("#modalidad").addClass("hide");
                    }

                });

                demo_form_validation1.init();
            });
        </script>
        <!-- ./javascript -->
    </body>
</html>






