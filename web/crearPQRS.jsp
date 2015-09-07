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
                            <a href="indexPeticionario.jsp"><i class="fa fa-question-circle"></i> <span>PQRS activas</span></a>
                        </li>                        
                        <li>
                            <a href="indexPeticionario"><i class="fa fa-history"></i> <span>Historial PQRS</span></a>
                        </li>                        
                        <li class="active">
                            <a href="crearPQRS.jsp"><i class="fa fa-plus"></i> <span>Crear PQRS</span></a>
                        </li>
                        <li>
                            <a href="inicio.jsp"><i class="fa fa-power-off"></i> <span>Cerrar sesi&oacute;n</span></a>
                        </li>
                    </ul>

                </div>
                <!-- ./page sidebar -->

                <!-- page content -->
                <div class="dev-page-content">                    
                    <!-- page content container -->
                    <div class="container">

                        <!-- Horizontal Form -->
                        <div class="wrapper wrapper-white">
                            <div class="page-subtitle">
                                <h3>Crear PQRS</h3>
                            </div>

                            <form class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Tipo de solicitud</label>
                                    <div class="col-md-8">
                                        <select name="tipo_solicitud" class="form-control">
                                            <option>Seleccionar</option>
                                            <option value="P">Petición</option>
                                            <option value="Q">Queja</option>
                                            <option value="R">Reclamo</option>
                                            <option value="S">Sugerencia</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Dependencia</label>
                                    <div class="col-md-8">
                                        <select name="dependencia" class="form-control">
                                            <option  value="null">DESCONOZCO A QUIEN CORRESPONDE</option>
                                            <option  value="000098">ADMINISTRACION ACUICOLA Y PESQUERA</option>
                                            <option  value="000085">ADMINISTRACION AGROPECUARIA</option>
                                            <option  value="000034">ADMINISTRACION DE LOS SERVICIOS DE SALUD</option>
                                            <option  value="000033">ADMINISTRACION FINANCIERA</option>
                                            <option  value="000086">ADMINISTRACION TURISTICA Y HOTELERA</option>
                                            <option  value="000144">ALMACEN GENERAL</option>
                                            <option  value="000137">ALMACEN GENERAL</option>
                                            <option  value="000111">BIBLIOTECA - CENTRO SAN AGUSTIN</option>
                                            <option  value="000113">BIBLIOTECA - PIEDRA DE BOLIVAR</option>
                                            <option  value="000112">BIBLIOTECA - ZARAGOCILLA</option>
                                            <option  value="000007">CENTRO DE ADMISIONES, REGISTRO Y CONTROL ACADEMICO</option>
                                            <option  value="000128">CENTRO DE AUTOEVALUACION Y ACREDITACION INSTITUCIONAL</option>
                                            <option  value="000008">CENTRO DE CAPACITACION Y ASESORIA ACADEMICA</option>
                                            <option  value="000006">CENTRO DE INFORMACION Y DOCUMENTACION</option>
                                            <option  value="000010">CENTRO DE INFORMATICA</option>
                                            <option  value="000142">CENTRO DE INNOVACION DE ESTUDIOS VIRTUALES</option>
                                            <option  value="000004">CENTRO DE POSTGRADOS Y RELACIONES EXTERNAS</option>
                                            <option  value="000139">CENTRO DE PRACTICAS EMP. INSERCION LAB</option>
                                            <option  value="000136">CONCILIACION BANCARIA</option>
                                            <option  value="000132">COORDINACION ACADEMICA GENERAL</option>
                                            <option  value="000140">CTRO.DE RECURSOS EDUC.Y TELECOMUN.</option>
                                            <option  value="000107">DEPARTAMENTO DE FISICA</option>
                                            <option  value="000104">DEPARTAMENTO DE INVESTIGACION INGENIERIAS</option>
                                            <option  value="000110">DEPARTAMENTO DE INVESTIGACIONES CIENCIAS ECONOMICAS</option>
                                            <option  value="000143">DEPARTAMENTO DE PRACTICAS EMPRESARIALES</option>
                                            <option  value="000012">DEPARTAMENTOS BASICOS DE MEDICINA</option>
                                            <option  value="000040">DIVISION BIENESTAR UNIVERSITARIO</option>
                                            <option  value="000091">DIVISION COMUNICACIONES Y RELACIONES PUBLICAS</option>
                                            <option  value="000165">DIVISION DE ASUNTOS LABORALES</option>
                                            <option  value="000099">DIVISION DE CONTRATOS</option>
                                            <option  value="000041">DIVISION DE RECURSOS HUMANOS</option>
                                            <option  value="000145">DIVISION DE SISTEMAS</option>
                                            <option  value="000042">DIVISION DE SISTEMAS</option>
                                            <option  value="000146">DIVISION FINANCIERA</option>
                                            <option  value="000162">DIVISIÓN DE ALMACEN</option>
                                            <option  value="000114">DOCTORADO EN CIENCIAS DE LA EDUCACION</option>
                                            <option  value="000141">DOCTORADO EN MEDICINA TROPICAL</option>
                                            <option  value="000032">EDUCACION ABIERTA Y A DISTANCIA</option>
                                            <option  value="000169">ESCUELA PARA EL TRABAJO Y DESARROLLO HUMANO AREA DE LA SALUD</option>
                                            <option  value="000063">ESPECIALIZACION EN FINANZAS</option>
                                            <option  value="000070">ESPECIALIZACION EN GERENCIA DE PROYECTOS DE CONSTRUCCION</option>
                                            <option  value="000060">ESPECIALIZACION EN GESTION GERENCIAL</option>
                                            <option  value="000071">ESPECIALIZACION EN INGENIERIA SANITARIA Y AMBIENTAL</option>
                                            <option  value="000061">ESPECIALIZACION EN REVISORIA FISCAL</option>
                                            <option  value="000019">FACULTAD DE CIENCIAS ECONOMICAS</option>
                                            <option  value="000089">FACULTAD DE CIENCIAS EXACTAS Y NATURALES</option>
                                            <option  value="000014">FACULTAD DE CIENCIAS FARMACEUTICAS</option>
                                            <option  value="000028">FACULTAD DE CIENCIAS HUMANAS</option>
                                            <option  value="000023">FACULTAD DE CIENCIAS SOCIALES Y EDUCACION</option>
                                            <option  value="000018">FACULTAD DE DERECHO Y CIENCIAS POLITICAS</option>
                                            <option  value="000017">FACULTAD DE ENFERMERIA</option>
                                            <option  value="000024">FACULTAD DE INGENIERIAS</option>
                                            <option  value="000011">FACULTAD DE MEDICINA</option>
                                            <option  value="000013">FACULTAD DE ODONTOLOGIA</option>
                                            <option  value="000036">INGENIERIA DE SISTEMAS (DISTANCIA)</option>
                                            <option  value="000025">INSTITUTO DE HIDRAULICA Y SANEAMIENTO AMBIENTAL (IHSA)</option>
                                            <option  value="000009">INSTITUTO DE INVESTIGACIONES INMUNOLOGICAS</option>
                                            <option  value="000026">INSTITUTO DE POLITICAS PUBLICAS DE GOBIERNO Y ESCUELAS REGIONALES</option>
                                            <option  value="000075">INSTITUTO INTERNACIONAL ESTUDIOS DEL CARIBE</option>
                                            <option  value="000043">JUBILADOS</option>
                                            <option  value="000083">LICENCIATURA EN EDUCACION BASICA ENFASIS EN ARTISTICA</option>
                                            <option  value="000082">LICENCIATURA EN EDUCACION BASICA ENFASIS EN LENGUA CASTELLANA</option>
                                            <option  value="000084">LICENCIATURA EN INFORMATICA</option>
                                            <option  value="000081">LICENCIATURA EN PEDAGOGIA INFANTIL</option>
                                            <option  value="000049">MAGISTER EN MICROBILOGIA</option>
                                            <option  value="000134">MATRICULAS POSTGRADOS</option>
                                            <option  value="000135">MATRICULAS PREGRADO</option>
                                            <option  value="000138">OBSERVATORIO PARA EL DESPLAZAMIENTO FORZADO</option>
                                            <option  value="000095">OFICINA ASESORA DE CONTROL DISCIPLINARIO</option>
                                            <option  value="000094">OFICINA ASESORA DE CONTROL INTERNO</option>
                                            <option  value="000096">OFICINA ASESORA DE GESTION HUMANA  Y DESARROLLO ORGANIZACIONAL</option>
                                            <option  value="000092">OFICINA ASESORA DE PLANEACION</option>
                                            <option  value="000093">OFICINA ASESORA JURIDICA</option>
                                            <option  value="000054">POSTGRADO DE ENFERMERIA</option>
                                            <option  value="000051">POSTGRADO DE ESTOMATOLOGIA Y CIRUGIA ORAL</option>
                                            <option  value="000056">POSTGRADO SALUD OCUPACIONAL</option>
                                            <option  value="000069">POSTGRADOS DE CIENCIAS E INGENIERIA</option>
                                            <option  value="000059">POSTGRADOS DE CIENCIAS ECONOMICAS</option>
                                            <option  value="000108">POSTGRADOS DE CIENCIAS EXACTAS Y NATURALES</option>
                                            <option  value="000072">POSTGRADOS DE CIENCIAS HUMANAS</option>
                                            <option  value="000066">POSTGRADOS DE CIENCIAS SOCIALES Y EDUCACION</option>
                                            <option  value="000058">POSTGRADOS DE DERECHO Y CIENCIAS POLITICAS</option>
                                            <option  value="000052">POSTGRADOS EN CIENCIAS QUIMICAS Y FARMACIAS</option>
                                            <option  value="000129">POSTGRADOS EN EDUCACION ABIERTA Y A DISTANCIA</option>
                                            <option  value="000050">POSTGRADOS EN ODONTOLOGIA</option>
                                            <option  value="000046">POSTGRADOS FACULTAD DE MEDICINA</option>
                                            <option  value="000021">PROGRAMA DE ADMINISTRACION DE EMPRESAS</option>
                                            <option  value="000074">PROGRAMA DE ADMINISTRACION INDUSTRIAL</option>
                                            <option  value="000106">PROGRAMA DE BIOLOGIA</option>
                                            <option  value="000077">PROGRAMA DE COMUNICACION SOCIAL</option>
                                            <option  value="000022">PROGRAMA DE CONTADURIA PUBLICA</option>
                                            <option  value="000020">PROGRAMA DE ECONOMIA</option>
                                            <option  value="000109">PROGRAMA DE ENFERMERIA</option>
                                            <option  value="000030">PROGRAMA DE FILOSOFIA</option>
                                            <option  value="000031">PROGRAMA DE HISTORIA</option>
                                            <option  value="000027">PROGRAMA DE INGENIERIA CIVIL</option>
                                            <option  value="000078">PROGRAMA DE INGENIERIA DE ALIMENTOS</option>
                                            <option  value="000080">PROGRAMA DE INGENIERIA DE QUIMICA</option>
                                            <option  value="000079">PROGRAMA DE INGENIERIA DE SISTEMAS</option>
                                            <option  value="000029">PROGRAMA DE LINGUISTICA Y LITERATURA</option>
                                            <option  value="000105">PROGRAMA DE MATEMATICAS</option>
                                            <option  value="000015">PROGRAMA DE QUIMICA</option>
                                            <option  value="000016">PROGRAMA DE QUIMICA FARMACEUTICA</option>
                                            <option  value="000076">PROGRAMA DE TRABAJO SOCIAL</option>
                                            <option  value="000166">PROGRAMAS A DISTANCIA MUNICIPIOS</option>
                                            <option  value="000001">RECTORIA</option>
                                            <option  value="000087">SALUD OCUPACIONAL</option>
                                            <option  value="000005">SECCION ADQUISICION Y CONTROL DE BIENES</option>
                                            <option  value="000122">SECCION ASESORIA DE PSICOLOGIA</option>
                                            <option  value="000120">SECCION DE ACTIVIDADES CULTURALES</option>
                                            <option  value="000119">SECCION DE ARCHIVO Y CORRESPONDENCIA</option>
                                            <option  value="000133">SECCION DE CARTERA</option>
                                            <option  value="000103">SECCION DE CONTABILIDAD</option>
                                            <option  value="000121">SECCION DE DEPORTES</option>
                                            <option  value="000124">SECCION DE EGRESADOS</option>
                                            <option  value="000127">SECCION DE EMISORA</option>
                                            <option  value="000130">SECCION DE INVENTARIOS</option>
                                            <option  value="000115">SECCION DE PERSONAL</option>
                                            <option  value="000117">SECCION DE PRESTACIONES ECONOMICAS</option>
                                            <option  value="000102">SECCION DE PRESUPUESTO</option>
                                            <option  value="000097">SECCION DE PUBLICACIONES</option>
                                            <option  value="000118">SECCION DE SALUD OCUPACIONAL</option>
                                            <option  value="000131">SECCION DE SERVICIOS EN CONSULTORIAS, ASESORIAS Y DONACIONES</option>
                                            <option  value="000125">SECCION DE SERVICIOS GENERALES</option>
                                            <option  value="000126">SECCION DE TELEVISION</option>
                                            <option  value="000123">SECCION DE TRABAJO SOCIAL</option>
                                            <option  value="000116">SECCION SELECCION Y CAPACITACION</option>
                                            <option  value="000101">SECCION TESORERIA Y PAGADURIA</option>
                                            <option  value="000090">SECRETARIA GENERAL</option>
                                            <option  value="000035">TECNOLOGIA DE ALIMENTOS</option>
                                            <option  value="000088">TECNOLOGIA EN ELECTRONICA</option>
                                            <option  value="000002">VICERECTORIA ACADEMICA</option>
                                            <option  value="000038">VICERECTORIA ADMINISTRATIVA</option>
                                            <option  value="000003">VICERECTORIA DE INVESTIGACION</option>
                                            <option  value="000164">VICERRECTORIA DE ASUEGURAMIENTO DE LA CALIDAD</option>
                                            <option  value="000163">VICERRECTORIA DE BIENESTAR UNIVERSITARIA</option>
                                            <option  value="000167">VICERRECTORIA DE EXTENSION  Y PROYECCION SOCIAL</option>
                                            <option  value="000168">VICERRECTORIA DE RELACIONES Y COPERACION INTERNACIONAL</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-offset-2 col-md-8">
                                        <div class="checkbox">
                                            <input type="checkbox" id="check_1" checked=""/>
                                            <label for="check_1"> Recibir notificaciones via E-mail </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Descripci&oacute;n</label>
                                    <div class="col-md-8">
                                        <textarea class="form-control" rows="4"></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Ingrese archivo adjunto</label>
                                    <div class="col-md-8">
                                        <input type="file" name="file_1" class="file" title="Examinar"/>   
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-md-offset-2 col-md-8">
                                        <button type="submit" class="btn btn-default">Crear PQRS</button>
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






