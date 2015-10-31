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
                            <a href="#"><i class="fa fa-globe"></i><span>Via Web</span> <span class="badge badge-dark" style="float:right;">2</span></a>
                            <ul>
                                <li>
                                    <a href="#">Todas</a>
                                </li>
                                <li>
                                    <a href="#">PQRS pendientes</a>
                                </li>
                                <li>
                                    <a href="#">Pendientes por enviar</a>
                                </li>


                            </ul>
                        </li>   
                        <li>
                            <a href="#"><i class="fa fa-envelope"></i> <span>Via Correo</span></a>
                            <ul>
                                <li>
                                    <a href="#">Todas</a>
                                </li>
                                <li>
                                    <a href="#">PQRS pendientes</a>
                                </li>
                                <li>
                                    <a href="#">Pendientes por enviar</a>
                                </li>


                            </ul>
                        </li>  
                        <li>
                            <a href="#"><i class="fa fa-file-text"></i> <span>Via Manual</span></a>
                            <ul>
                                <li>
                                    <a href="#">Todas</a>
                                </li>
                                <li>
                                    <a href="#">PQRS pendientes</a>
                                </li>
                                <li>
                                    <a href="#">Pendientes por enviar</a>
                                </li>


                            </ul>
                        </li>   
                    </ul>

                </div>
                <!-- ./page sidebar -->

                <!-- page content -->
                <div class="dev-page-content">                    
                    <!-- page content container -->
                    <div class="container">

                        <div class="page-profile" style="background-image: url(assets/images/user_images/udc.png);">

                            <div class="profile profile-transparent">
                                <div class="profile-image">
                                    <img src="assets/images/users/user.jpg">
                                    <div class="profile-status online"></div>
                                </div>
                                <div class="profile-info">
                                    <h4>Nelson torres</h4>
                                    <span><i class="fa fa-user"></i> Estudiante</span>
                                </div>                            
                            </div>
                        </div>
                        <div class="wrapper wrapper-white">
                            <div class="page-subtitle">
                                <h3>Mis PQRS activas</h3>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-sortable">
                                    <thead>
                                        <tr>
                                            <th>Codigo</th>
                                            <th>Fecha de Ingreso</th>
                                            <th>Medio de Ingreso</th>
                                            <th>Correo</th>
                                            <th>Celular</th>
                                            <th>Estado</th>
                                        </tr>
                                    </thead>                               
                                    <tbody>
                                        <tr>
                                            <td>201500001</td>
                                            <td>2015/09/01</td>
                                            <td>Web</td>
                                            <td>juan@gmail.com</td>
                                            <td>30000000</td>
                                            <td>En Proceso</td>
                                        </tr>
                                        <tr>
                                            <td>201500002</td>
                                            <td>2015/09/02</td>
                                            <td>Web</td>
                                            <td>pedro@gmail.com</td>
                                            <td>30000001</td>
                                            <td>En Proceso</td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Copyright -->
                        <div class="copyright">
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

        <!-- gallery -->
        <div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls">
            <div class="slides"></div>
            <h3 class="title"></h3>
            <a class="prev">‹</a>
            <a class="next">›</a>
            <a class="close">×</a>
            <a class="play-pause"></a>
            <ol class="indicator"></ol>
        </div>
        <!-- ./gallery -->

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
        <!-- ./javascript -->                
    </body>
</html>