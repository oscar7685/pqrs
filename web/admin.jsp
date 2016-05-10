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
        <link rel="stylesheet" type="text/css" href="css/sweetalert.css">
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
                            <a href="#"><i class="fa fa-question-circle"></i> <span>PQRS</span></a>
                            <ul>
                                <li>
                                    <a href="#listarTodasPQRS"><i class="fa fa-question-circle"></i> <span>Todas PQRS</span></a>
                                </li> 
                                <li>
                                    <a href="#pqrsWeb"><i class="fa fa-globe"></i> <span>Via Web</span></a>
                                </li> 
                                <li>
                                    <a href="#pqrsCorreo"><i class="fa fa-envelope"></i> <span>Via Correo</span></a>
                                </li> 
                                <li>
                                    <a href="#pqrsManual"><i class="fa fa-hand-o-up"></i> <span>Via Manual</span></a>
                                </li>  
                            </ul>
                        </li>   
                        <c:choose>
                            <c:when test="${responsableArea.areaIdarea.idarea == 1000}">
                                <li>
                                    <a href="#nuevaPQRS"><i class="fa fa-plus-circle"></i> <span>Agregar PQRS</span></a>
                                </li>
                                <li>
                                    <a href="#listarPeticionarios"><i class="fa fa-user"></i> <span>Listar Peticionarios</span></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-line-chart"></i> <span>Informes</span></a>
                                    <ul>
                                        <li>
                                            <a href="#medioIngreso"><i class="fa fa-truck"></i> <span>PQRS-Medio de Ingreso </span></a>
                                        </li> 
                                        <li>
                                            <a href="#tipoUsuario"><i class="fa fa-users"></i> <span>PQRS-Tipo de Usuario</span></a>
                                        </li> 
                                        <li>
                                            <a href="#comportamiento"><i class="fa fa-envelope"></i> <span>PQRS-Comportamiento</span></a>
                                        </li> 
                                    </ul>
                                </li>

                                <li>
                                    <a href="#procesos"><i class="fa fa-stack-overflow"></i> <span>Procesos</span></a>
                                </li>
                                <li>
                                    <a href="#subprocesos"><i class="fa fa-stack-overflow"></i> <span>Subprocesos</span></a>
                                </li>
                                <li>
                                    <a href="#dependencias"><i class="fa fa-building-o"></i> <span>Dependencias</span></a>
                                </li>
                                <li>
                                    <a href="#responsablesD"><i class="fa fa-users"></i> <span>Responsables dependencias</span></a>
                                </li> 
                                <li>
                                    <a href="#editarDiasHabiles"><i class="fa fa-calendar"></i> <span>Configurar calendario</span></a>
                                </li> 
                            </c:when>
                        </c:choose>
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
        <!--<script type="text/javascript" src="js/plugins/jquery/jquery.min.js"></script>-->     
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script src="https://code.highcharts.com/highcharts.js"></script>
        <script src="https://code.highcharts.com/modules/exporting.js"></script>
        <script type="text/javascript" src="js/sweetalert.min.js"></script>
        <!--<script type="text/javascript" src="js/plugins/jquery/jquery.min.js"></script>-->
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
        <script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <!-- Include Date Range Picker -->
        <script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />

        <!-- ./javascript -->                
    </body>
</html>