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
                    <a href="inicio.jsp">Pqrs</a>
                </div>
            </div>
            <!-- ./page header -->
            <div class="dev-page-login-block">
                <a class="dev-page-login-block__logo">PQRS</a>
                <div class="dev-page-login-block__form">                    
                    <form action="inicio.jsp" method="post">                        
                        <div class="row">
                            <div class="col-md-6">                                    
                                <div class="form-group">                            
                                    <input type="text" class="form-control" placeholder="Nombres" name="nombres">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">                            
                                    <input type="text" class="form-control" placeholder="Apellidos" name="apellidos">
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
                                        <option>Seleccionar</option>
                                        <option value="BAS">Estudiante</option>
                                        <option value="EGR">Egresado</option>
                                        <option value="PRF">Docente</option>
                                        <option value="EXT">Particular</option>
                                        <option value="NTD">Aspirante</option>
                                    </select>
                                </div>    
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Correo" name="correo">
                                </div>
                                <div class="form-group">                            
                                    <input type="text" class="form-control" placeholder="Clave" name="password">
                                </div>
                                <div class="form-group">                            
                                    <input type="text" class="form-control" placeholder="Repetir Clave" name="re_password">
                                </div>
                            </div>
                        </div>

                        <div class="form-group no-border">
                            <button class="btn btn-danger btn-block">Registrarse</button>
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
        <!-- ./javascript -->
    </body>
</html>






