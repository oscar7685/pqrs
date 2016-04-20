<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="css/jquery.fileupload.css">
<link rel="stylesheet" type="text/css" href="css/sweetalert.css">
<!-- page content container -->
<div class="container">

    <!-- Horizontal Form -->
    <div class="wrapper">
        <div class="row">
            <c:choose>
                <c:when test="${pqrs.encuesta == 1}">
                    <div class="col-md-9">
                        <div class="page-subtitle">
                            <h3>Ver respuesta PQRS</h3>
                        </div>
                        <!-- ./basic form elements -->
                        <div class="form-group">
                            <label class="col-md-2 control-label">Descripci&oacute;n</label>
                            <div class="col-md-8">
                                <textarea disabled="disabled" name="descripcion" class="form-control" rows="4">${pqrs.descripcion}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Archivo adjunto</label>
                            <div class="col-md-8">
                                <!-- The container for the uploaded files -->
                                <div id="files" class="files">
                                    <a href="adjuntos/${pqrs.adjunto}" target="_blank" title="${pqrs.adjunto}" download="${pqrs.adjunto}" >${pqrs.adjunto}</a>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Respuesta</label>
                            <div class="col-md-8">
                                <textarea name="respuesta" class="form-control" rows="4" disabled="disabled">${pqrs.respuestaList.get(pqrs.respuestaList.size()-1).respuesta}</textarea>
                            </div>
                        </div>      
                        <div class="form-group">
                            <label class="col-md-2 control-label">Fecha respuesta</label>
                            <div class="col-md-8">
                                <input type="text" value="<fmt:formatDate value="${pqrs.respuestaList.get(pqrs.respuestaList.size()-1).fechaRespuesta}" pattern="dd/MM/yyyy" />" class="form-control" disabled="disabled" placeholder="DD/MM/YYYY" >
                            </div>
                        </div>            


                    </div>

                    <div class="col-md-3">
                        <div id="panel1">
                            <form id="fencuesta" role="form" method="post"> 
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">
                                            Nivel de satisfaccion PQRS</h3>
                                    </div>
                                    <div class="panel-body">
                                        <h4>Por favor seleccione su nivel de satisfaccion del SERVICIO PQRS obtenido.</h4>

                                        <div class="well form-group">
                                            <div class="">
                                                <label>
                                                    <input type="radio" value="5" name="satisfaccion">
                                                    Muy satisfactorio
                                                </label>
                                            </div>   
                                            <div class="">
                                                <label>
                                                    <input type="radio" value="4" name="satisfaccion">
                                                    satisfactorio
                                                </label>
                                            </div>    
                                            <div class="">
                                                <label>
                                                    <input type="radio" value="3" name="satisfaccion">
                                                    Medianamente satisfactorio
                                                </label>
                                            </div>
                                            <div class="">
                                                <label>
                                                    <input type="radio" value="2" name="satisfaccion">
                                                    Insatisfactorio
                                                </label>
                                            </div>
                                            <div class="">
                                                <label>
                                                    <input type="radio" value="1" name="satisfaccion">
                                                    Muy Insatisfactorio
                                                </label>
                                            </div>                                    
                                        </div>
                                        <div class="alert alert-info alert-dismissible" role="alert">
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <strong>Atención!</strong> Si decide no responder esta encuesta se entenderá como "Muy Satisfactorio" la atención recibida.
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" name="respuesta" value="${pqrs.respuestaList.get(pqrs.respuestaList.size()-1).idrespuesta}">
                                <div class="panel-footer">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <button type="button" id="botonEncuesta" class="btn btn-primary btn-sm btn-block" data-loading-text="Respondiendo encuesta..." autocomplete="off">
                                                <span class="fa fa-send"></span> Enviar</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>
                </c:when>
                <c:otherwise>
                    <div class="col-md-12">
                        <div class="page-subtitle">
                            <h3>Ver respuesta PQRS</h3>
                        </div>
                        <!-- ./basic form elements -->
                        <form id="feditar" role="form" method="post"> 
                            <div class="form-group">
                                <label class="col-md-2 control-label">Descripci&oacute;n</label>
                                <div class="col-md-8">
                                    <textarea disabled="disabled" name="descripcion" class="form-control" rows="4">${pqrs.descripcion}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Archivo adjunto</label>
                                <div class="col-md-8">
                                    <!-- The container for the uploaded files -->
                                    <div id="files" class="files">
                                        <a href="adjuntos/${pqrs.adjunto}" target="_blank" title="${pqrs.adjunto}" download="${pqrs.adjunto}" >${pqrs.adjunto}</a>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Respuesta</label>
                                <div class="col-md-8">
                                    <textarea name="respuesta" class="form-control" rows="4" disabled="disabled">${pqrs.respuestaList.get(pqrs.respuestaList.size()-1).respuesta}</textarea>
                                </div>
                            </div>      
                            <div class="form-group">
                                <label class="col-md-2 control-label">Fecha respuesta</label>
                                <div class="col-md-8">
                                    <input type="text" value="<fmt:formatDate value="${pqrs.respuestaList.get(pqrs.respuestaList.size()-1).fechaRespuesta}" pattern="dd/MM/yyyy" />" class="form-control" disabled="disabled" placeholder="DD/MM/YYYY" >
                                </div>
                            </div>            


                        </form>
                    </div>
                </c:otherwise>
            </c:choose>


        </div>           

    </div>


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
<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->

<script type="text/javascript" src="js/sweetalert.min.js"></script>
<script type="text/javascript">
    "use strict";

    $(function() {

        $("#botonEncuesta").click(function() {
            $("#fencuesta").submit();

        });
        if ($("#fencuesta").length > 0) {
            $("#fencuesta").validate({
                errorElement: "span",
                ignore: [],
                rules: {
                    satisfaccion: {required: true}
                },
                submitHandler: function() {
                    $("#botonEncuesta").button('loading');
                    $.ajax({
                        url: 'Controller?accion=responderEncuesta',
                        data: $("#fencuesta").serialize(),
                        type: 'post',
                        success: function(msg) {
                            swal("Bien hecho!", "Muchas gracias por su tiempo!", "success");
                            $("#panel1").remove();
                            // document.location = "#listarTodasPQRS"

                        }});
                }
            });
        }

    });
</script>





