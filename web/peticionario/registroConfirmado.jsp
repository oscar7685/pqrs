<%-- 
    Document   : registroConfirmado
    Created on : 9/04/2016, 12:46:04 PM
    Author     : Ususario
--%>

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
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/dark.css" id="dev-css">
        <!-- ./css styles -->                                     

        <!--[if lte IE 9]>
        <link rel="stylesheet" type="text/css" href="css/dev-other/dev-ie-fix.css">
        <![endif]-->

        <!-- javascripts -->
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/plugins/modernizr/modernizr.js"></script>
        <!-- ./javascripts -->

    </head>
    <body>
        <div class="dev-page">

            <!-- page header -->    
            <div class="dev-page-header">

                <div class="dph-logo">
                    <a href="<%=request.getContextPath()%>/index.jsp">Pqrs</a>
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
                            <br/>
                            <h1>Su cuenta ha sido confirmada satisfactoriamete</h1>
                        </div>   
                        <div class="wrapper">

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
            <!-- javascript -->
            <script type="text/javascript" src="<%=request.getContextPath()%>/js/plugins/jquery/jquery.min.js"></script>       
            <script type="text/javascript" src="<%=request.getContextPath()%>/js/plugins/bootstrap/bootstrap.min.js"></script>


            <!--<script type="text/javascript" src="js/dev-loaders.js"></script>-->
            <script type="text/javascript" src="<%=request.getContextPath()%>/js/dev-layout-default.js"></script>
            <script type="text/javascript" src="<%=request.getContextPath()%>/js/demo.js"></script>
            <script type="text/javascript" src="<%=request.getContextPath()%>/js/dev-app.js"></script>


        </div>
    </body>
</html>
