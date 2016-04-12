<%
    HttpSession session1 = request.getSession();
    String aux = (String) session1.getAttribute("TipoUsuario");
    if (aux == null || aux.isEmpty()) {
        session1.invalidate();
    } else if (aux.equals("responsableArea")) {
        RequestDispatcher rd = request.getRequestDispatcher("/Controller?accion=indexRA");
        rd.forward(request, response);
    } else if (aux.equals("reclamante")) {
        RequestDispatcher rd = request.getRequestDispatcher("/Controller?accion=indexRe");
        rd.forward(request, response);
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>        
        <!-- meta section -->
        <title>PQRS - Universidad de Cartagena</title>

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" >

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

        <style>
            .dev-page{visibility: hidden;}            
        </style>
    </head>
    <body>
        <!-- page wrapper -->
        <div class="dev-page">

            <!-- page header -->    
            <div class="dev-page-header">

                <div class="dph-logo">
                    <a href="index.jsp">Pqrs</a>
                </div>
            </div>
            <!-- ./page header -->

            <!-- page container -->
            <div class="dev-page-container">

                <!-- page content -->
                <div class="dev-page-content">                    
                    <!-- page content container -->
                    <div class="container">
                        <div class="page-title">
                            <h1>Tenga en cuenta</h1>
                            <p>Apreciado usuario por medio del sistema de PQRS de la
                                Universidad de Cartagena, usted podrá presentar peticiones, quejas, reclamos y sugerencias por motivos de interes general o particular, para ello
                                debe registrarse en el sistema para poder registrar su solicitud, tenga en cuenta que el tiempo de respuesta para sus PQRS es de 15 dias habiiles</p><br/>
                        </div>   
                        <div class="wrapper">

                            <div class="row">
                                <div class="col-md-6">

                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">Petici&oacute;n</h3>
                                        </div>
                                        <div class="panel-body">
                                            <p>Petición es una solicitud presentada en forma verbal o escrita a funcionarios, en ejercicio del derecho de toda persona a elevar solicitudes respetuosas y obtener pronta solución a éstas.</p>
                                        </div>
                                    </div>                                    
                                    <!-- ./header & footer -->

                                </div>
                                <div class="col-md-6">

                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">Queja</h3>
                                        </div>
                                        <div class="panel-body">
                                            <p>Manifestación de inconformidad o insatisfacción con la actuación de determinado funcionario o con la forma y condiciones en que se preste o no un servicio.</p>
                                        </div>
                                    </div>
                                    <!-- ./buttons in panel -->

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">

                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">Reclamo</h3>
                                        </div>
                                        <div class="panel-body">
                                            <p>Es una solicitud del usuario con el motivo que se revise una actuación administrativa, motivo de su inconformidad y se tome una decisión final justa y equilibrada, es decir, es una declaración formal por el incumplimiento de un derecho que ha sido perjudicado o amenazado, ocasionado por la deficiente prestación o suspensión injustificada del servicio.</p>
                                        </div>
                                    </div>                                    
                                    <!-- ./header & footer -->

                                </div>
                                <div class="col-md-6">

                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">Sugerencia</h3>
                                        </div>
                                        <div class="panel-body">
                                            <p>Es una insinuación o formulación de ideas tendientes al mejoramiento de un servicio o de la misma entidad. Hace referencia a las preguntas, inquietudes, propuestas, 
                                                ofrecimientos o consejos que se reciban por parte de los usuarios. &nbsp;&nbsp;&nbsp
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </p>
                                        </div>
                                    </div>
                                    <!-- ./buttons in panel -->

                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <a class="btn btn-primary" href="login.jsp">Registrar PQRS</a>                        
                                </div>
                            </div>
                        </div>      
                        <!-- Copyright -->
                        <div class="copyright">
                            <div class="row">
                                <div style="margin-left: 0px" class="col-md-6">
                                    <a target="_blank" href="http://www.unicartagena.edu.co/" title="Universidad de Cartagena"><img style="margin-top: 12px; margin-left: 0px;" src="img/logooficial2.png"></a>
                                </div>
                                <div style="margin-left: 0px" class="col-md-6">
                                    <a href="#" title="PQRS"><img style="margin-top: 12px; margin-left: 0px;" src="img/boton-pqrs.png"></a>
                                </div>
                            </div>    
                            <div class="pull-left">
                                &copy; 2015 <strong>Universidad de Cartagena</strong>. Todos los derechos reservados.
                            </div>
                        </div>
                        <!-- ./Copyright -->
                    </div>
                    <!-- ./page content container -->

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

        <script type="text/javascript" src="js/plugins/bootstrap-select/bootstrap-select.js"></script>

        <script type="text/javascript" src="js/plugins/nvd3/d3.min.js"></script>
        <script type="text/javascript" src="js/plugins/nvd3/nv.d3.min.js"></script>
        <script type="text/javascript" src="js/plugins/nvd3/lib/stream_layers.js"></script>

        <script type="text/javascript" src="js/plugins/waypoint/waypoints.min.js"></script>
        <script type="text/javascript" src="js/plugins/counter/jquery.counterup.min.js"></script>        

        <!--<script type="text/javascript" src="js/dev-loaders.js"></script>-->
        <script type="text/javascript" src="js/dev-layout-default.js"></script>
        <script type="text/javascript" src="js/demo.js"></script>
        <script type="text/javascript" src="js/dev-app.js"></script>
        <script type="text/javascript" src="js/demo-dashboard.js"></script>
        <!-- ./javascript -->
    </body>
</html>






