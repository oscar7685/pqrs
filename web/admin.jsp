<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <!-- ./meta section -->

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
        <div class="dev-page">

            <!-- page header -->    
            <div class="dev-page-header">

                <div class="dph-logo">
                    <a href="inicio.jsp">PQRS</a>
                    <a class="dev-page-sidebar-collapse">
                        <div class="dev-page-sidebar-collapse-icon">
                            <span class="line-one"></span>
                            <span class="line-two"></span>
                            <span class="line-three"></span>
                        </div>
                    </a>
                </div>

            </div>
            <!-- ./page header -->

            <!-- page container -->
            <div class="dev-page-container">

                <!-- page sidebar -->
                <div class="dev-page-sidebar">

                    <ul class="dev-page-navigation">
                        <li class="title">Mis PQRS</li>
                        <li>
                            <a href="#pqrsWeb"><i class="fa fa-globe"></i> <span>Via Web</span></a>
                        </li>  
                        <li>
                            <a href="#pqrsCorreo"><i class="fa fa-envelope"></i> <span>Via Correo</span></a>
                        </li>  
                        <li>
                            <a href="#pqrsManual"><i class="fa fa-hand-o-up"></i> <span>Via Manual</span></a>
                        </li>  
                        <li>
                            <a href="#nuevaPQRS"><i class="fa fa-plus-circle"></i> <span>Agregar PQRS</span></a>
                        </li>  
                        <li>
                            <a href="#dependencias"><i class="fa fa-plus-circle"></i> <span>Dependencias</span></a>
                        </li> 
                        <li>
                            <a href="#responsablesD"><i class="fa fa-plus-circle"></i> <span>Responsables dependencias</span></a>
                        </li> 

                        <li>
                            <a href="#cerrarSesion"><i class="fa fa-power-off"></i> <span>Cerrar sesi&oacute;n</span></a>
                        </li>
                    </ul>

                </div>
                <!-- ./page sidebar -->

                <!-- page content -->
                <div class="dev-page-content">                    


                </div>
                <!-- ./page content -->                                               
            </div>  
            <!-- ./page container -->
        </div>
        <!-- ./page wrapper -->

        <!-- javascript -->
        <script type="text/javascript" src="js/plugins/jquery/jquery.min.js"></script>       
        <script type="text/javascript" src="js/plugins/bootstrap/bootstrap.min.js"></script>

        <script type="text/javascript" src="js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>        
        <script type="text/javascript" src="js/plugins/moment/moment.js"></script>

        <script type="text/javascript" src="js/plugins/knob/jquery.knob.min.js"></script>
        <script type="text/javascript" src="js/plugins/sparkline/jquery.sparkline.min.js"></script>        

        <script type="text/javascript" src="js/plugins/datatables/jquery.dataTables.min.js"></script>

        <script type="text/javascript" src="js/plugins/sortable/sortable.min.js"></script>

        <script type="text/javascript" src="js/dev-layout-default.js"></script>
        <script type="text/javascript" src="js/dev-app.js"></script>
        <script type="text/javascript" src="js/jquery.ba-hashchange.min.js"></script>
        <script type="text/javascript" src="js/plugins/jquery-validate/jquery.validate.min.js"></script>  
        <script type="text/javascript" src="js/responsable.js"></script>
        <!-- ./javascript -->                
    </body>
</html>