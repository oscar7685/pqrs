<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="css/jquery.fileupload.css">
<!-- page content container -->
<div class="container">

    <!-- Horizontal Form -->
    <div class="wrapper">
        <div class="page-subtitle">
            <h3>Responder PQRS</h3>
        </div>
        <!-- basic form elements -->
        <div class="wrapper">
            <div class="page-subtitle">
                <h3>PETICIONARIO</h3>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Identificación</label>
                        <input type="text" disabled="disabled" class="form-control" value="${pqrs.reclamanteIdreclamante.idreclamante}"/>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <label>Nombre</label>
                        <input type="text" disabled="disabled" class="form-control" value="${pqrs.reclamanteIdreclamante.nombre}"/>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Apellido</label>
                        <input type="text" disabled="disabled" class="form-control" value="${pqrs.reclamanteIdreclamante.apellido}"/>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Tipo</label>
                        <select name="tipo_solicitud" class="form-control">
                            <option>${pqrs.reclamanteIdreclamante.tipo}</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Celular</label>
                        <input type="text" disabled="disabled" class="form-control" value="${pqrs.reclamanteIdreclamante.celular}"/>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <label>Correo Electronico</label>
                        <input type="text" disabled="disabled" class="form-control" value="${pqrs.reclamanteIdreclamante.email}"/>
                    </div>
                </div>
            </div>
        </div>                        
        <!-- ./basic form elements -->
        <form id="feditar" role="form" method="post"> 
            <div class="form-group">
                <label class="col-md-2 control-label">Tipo de solicitud</label>
                <div class="col-md-8">
                    <select name="tipo_solicitud" class="form-control">
                        <option>${pqrs.tipo}</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label">Medio de ingreso</label>
                <div class="col-md-8">
                    <select name="medioIngreso" class="form-control">
                        <option>${pqrs.medioIngreso}</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label">Fecha de ingreso</label>
                <div class="col-md-8">
                    <input type="text" value="<fmt:formatDate value="${pqrs.fechaCreacion}" pattern="dd/MM/yyyy" />" class="form-control" disabled="disabled" placeholder="DD/MM/YYYY" name="fechaCreacion">
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-offset-2 col-md-8">
                    <div class="checkbox">
                        <c:choose>
                            <c:when test="${pqrs.notificarMail == 'on'}">
                                <input type="checkbox" name="notificar_mail" id="check_1" checked="checked" disabled="disabled"/>
                                <label for="check_1"> Recibir notificaciones via E-mail </label>
                            </c:when>
                            <c:otherwise>
                                <input type="checkbox" name="notificar_mail" id="check_1" checked="" disabled="disabled"/>
                                <label for="check_1"> Recibir notificaciones via E-mail </label>
                            </c:otherwise>    
                        </c:choose>

                    </div>
                </div>
            </div>
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
                    <c:choose>
                        <c:when test="${pqrs.estadoSolicitud != 'Respuesta enviada al usuario'}">
                            <textarea name="respuesta" class="form-control" rows="4"></textarea>
                        </c:when>
                        <c:otherwise>
                            <textarea name="respuesta" class="form-control" rows="4" disabled="disabled">${pqrs.respuestaList.get(pqrs.respuestaList.size()-1).respuesta}</textarea>
                        </c:otherwise>    
                    </c:choose>

                </div>
            </div>            
            <div class="form-group">
                <label class="col-md-2 control-label">Proceso</label>
                <div class="col-md-8">
                    <select class="form-control" name="proceso" id="proceso">
                        <c:choose>
                            <c:when test="${pqrs.estadoSolicitud != 'Respuesta enviada al usuario'}">
                                <option></option>
                                <c:forEach items="${procesos}" var="row" varStatus="iter">
                                    <option value="${row.idproceso}">${row.proceso}</option>    
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <option>${pqrs.respuestaList.get(pqrs.respuestaList.size()-1).subprocesoIdsubproceso.procesoIdproceso.proceso}</option>
                            </c:otherwise>    
                        </c:choose>

                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label">Subproceso</label>
                <div class="col-md-8">
                    <select class="form-control" name="subproceso" id="subproceso">
                        <c:choose>
                            <c:when test="${pqrs.estadoSolicitud != 'Respuesta enviada al usuario'}">
                                <option></option>
                            </c:when>
                            <c:otherwise>
                                <option>${pqrs.respuestaList.get(pqrs.respuestaList.size()-1).subprocesoIdsubproceso.subproceso}</option>
                            </c:otherwise>    
                        </c:choose>

                    </select>
                </div>
            </div>       

            <div class="form-group">
                <div class="col-md-offset-2 col-md-8">
                    <c:if test="${pqrs.estadoSolicitud != 'Respuesta enviada al usuario'}">
                        <button type="submit" data-loading-text="Respondiendo PQRS..." class="btn btn-primary" autocomplete="off" id="btnResponder">Responder PQRS</button>
                    </c:if>
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
<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->


<script src="js/vendor/jquery.ui.widget.js"></script>
<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
<script src="js/jquery.iframe-transport.js"></script>
<!-- The basic File Upload plugin -->
<script src="js/jquery.fileupload.js"></script>

<script type="text/javascript">
    "use strict";

    $(function () {

        $("#dependencia").change(function () {
            $("#funcionario").empty();
            $.getJSON('Controller?accion=buscarFuncionarios&dependencia=' + $("#dependencia").val(), function (data) {
                $.each(data, function (k, v) {
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
                errorPlacement: function (error, element) {
                    $(element).after(error);
                    $(element).parents(".form-group").addClass("has-error");
                },
                highlight: function (element, errorClass) {
                    $(element).parents(".form-group").removeClass("has-success").addClass(errorClass);
                    // dev_layout_alpha_content.init(dev_layout_alpha_settings);
                },
                unhighlight: function (element, errorClass, validClass) {
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
                submitHandler: function () {
                    $("#btnResponder").button('loading');
                    $.ajax({
                        url: 'Controller?accion=responderPQRS2',
                        data: $("#feditar").serialize(),
                        type: 'post',
                        success: function (msg) {
                            document.location = "#listarTodasPQRS"

                        }
                    });
                }
            });
        }


        var url = 'SubirAdjunto';
        $('#fileupload').fileupload({
            url: url,
            autoUpload: false,
            dataType: 'json',
            acceptFileTypes: /(\.|\/)(xlsm)$/i,
            done: function (e, data) {
                $('#files').empty();
                $.each(data.result.files, function (index, file) {
                    $('<p/>').text(file.name).appendTo('#files');
                });
            },
            progressall: function (e, data) {
                var progress = parseInt(data.loaded / data.total * 100, 10);
                $('#progress .progress-bar').css('width', progress + '%');
            },
            add: function (e, data) {
                $(".fileinput-button").addClass('disabled');
                $.each(data.files, function (index, file) {
                    $('<p/>').text(file.name).appendTo('#files');
                });
                datosAsubir = data;
            }
        }).prop('disabled', !$.support.fileInput).parent().addClass($.support.fileInput ? undefined : 'disabled');

        $("#proceso").change(function () {
            var proceso = $("#proceso").val();
            if (proceso !== "") {
                $.ajax({
                    type: 'POST',
                    url: "Controller?accion=verSubprocesos&proceso=" + proceso,
                    success: function (data) {
                        $("#subproceso").empty();
                        $("#subproceso").html(data);
                    }
                });
            }
        });

    });
</script>





