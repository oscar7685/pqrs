<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="css/jquery.fileupload.css">
<!-- page content container -->
<div class="container">

    <!-- Horizontal Form -->
    <div class="wrapper">
        <div class="row">
            <c:choose>
                <c:when test="${pqrs.estado == 'activa'}">
                    <div class="col-md-9">
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

                    <div class="col-md-3">
                        <div id="panel1">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        Nivel de satisfaccion PQRS</h3>
                                </div>
                                <div class="panel-body">
                                    <h4>Por favor seleccione su nivel de satisfaccion con la respuesta obtenida</h4>
                                    <div class="well form-group">
                                        <div class="">
                                            <label>
                                                <input type="radio" value="5" name="satisfaccion">
                                                Muy satisfecho
                                            </label>
                                        </div>   
                                        <div class="">
                                            <label>
                                                <input type="radio" value="4" name="satisfaccion">
                                                Satisfecho
                                            </label>
                                        </div>    
                                        <div class="">
                                            <label>
                                                <input type="radio" value="3" name="satisfaccion">
                                                Medianamente Satisfecho
                                            </label>
                                        </div>
                                        <div class="">
                                            <label>
                                                <input type="radio" value="2" name="satisfaccion">
                                                Insatisfecho
                                            </label>
                                        </div>
                                        <div class="">
                                            <label>
                                                <input type="radio" value="1" name="satisfaccion">
                                                Muy Insatisfecho
                                            </label>
                                        </div>                                    
                                    </div>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div class="row">
                                    <div class="col-md-6">
                                        <button type="button" class="btn btn-primary btn-sm btn-block">
                                            <span class="fa fa-send"></span> Enviar</button>
                                    </div>
                                </div>
                            </div>
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


<script src="js/vendor/jquery.ui.widget.js"></script>
<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
<script src="js/jquery.iframe-transport.js"></script>
<!-- The basic File Upload plugin -->
<script src="js/jquery.fileupload.js"></script>

<script type="text/javascript">
    "use strict";

    $(function() {

        $("#dependencia").change(function() {
            $("#funcionario").empty();
            $.getJSON('Controller?accion=buscarFuncionarios&dependencia=' + $("#dependencia").val(), function(data) {
                $.each(data, function(k, v) {
                    $("#funcionario").append("<option value=\"" + v.id + "\">" + v.valor + "</option>");
                });
            });
        });
        if ($("#feditar").length > 0) {
            $("#feditar").validate({
                errorClass: "has-error",
                validClass: "has-success",
                errorElement: "span",
                ignore: [],
                errorPlacement: function(error, element) {
                    $(element).after(error);
                    $(element).parents(".form-group").addClass("has-error");
                },
                highlight: function(element, errorClass) {
                    $(element).parents(".form-group").removeClass("has-success").addClass(errorClass);
                    // dev_layout_alpha_content.init(dev_layout_alpha_settings);
                },
                unhighlight: function(element, errorClass, validClass) {
                    $(element).parents(".form-group").removeClass(errorClass).addClass(validClass);
                    //dev_layout_alpha_content.init(dev_layout_alpha_settings);
                },
                rules: {
                    tipo_solicitud: {required: true},
                    dependencia: {required: true},
                    descripcion: {required: true},
                    funcionario: {required: true},
                    proceso: {required: true},
                    subproceso: {required: true},
                    respuesta: {required: true}

                },
                submitHandler: function() {
                    $("#btnResponder").button('loading');
                    $.ajax({
                        url: 'Controller?accion=responderPQRS2',
                        data: $("#feditar").serialize(),
                        type: 'post',
                        success: function(msg) {
                            document.location = "#listarTodasPQRS"

                        }});
                }
            });
        }


        var url = 'SubirAdjunto';
        $('#fileupload').fileupload({
            url: url,
            autoUpload: false,
            dataType: 'json',
            acceptFileTypes: /(\.|\/)(xlsm)$/i,
            done: function(e, data) {
                $('#files').empty();
                $.each(data.result.files, function(index, file) {
                    $('<p/>').text(file.name).appendTo('#files');
                });
            },
            progressall: function(e, data) {
                var progress = parseInt(data.loaded / data.total * 100, 10);
                $('#progress .progress-bar').css('width', progress + '%');
            },
            add: function(e, data) {
                $(".fileinput-button").addClass('disabled');
                $.each(data.files, function(index, file) {
                    $('<p/>').text(file.name).appendTo('#files');
                });
                datosAsubir = data;
            }
        }).prop('disabled', !$.support.fileInput).parent().addClass($.support.fileInput ? undefined : 'disabled');

        $("#proceso").change(function() {
            var proceso = $("#proceso").val();
            if (proceso !== "") {
                $.ajax({
                    type: 'POST',
                    url: "Controller?accion=verSubprocesos&proceso=" + proceso,
                    success: function(data) {
                        $("#subproceso").empty();
                        $("#subproceso").html(data);
                    }
                });
            }
        });

    });
</script>





