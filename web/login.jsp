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
                    <form action="inicio.jsp" method="post">                        
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                <input type="text" class="form-control" placeholder="Codigo">
                            </div>
                        </div>                        
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                <input type="password" class="form-control" placeholder="Clave">
                            </div>
                        </div>
                        <div class="form-group no-border margin-top-20">
                            <a href="indexPeticionario.jsp" class="btn btn-success btn-block">Ingresar</a>
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
        <!-- ./javascript -->
    </body>
</html>






