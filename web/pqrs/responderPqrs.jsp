<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>             
<link rel="stylesheet" href="css/jquery.fileupload.css">
<!-- page content container -->
<div class="container">

    <!-- Horizontal Form -->
    <div class="wrapper wrapper-white">
        <div class="page-subtitle">
            <h3>Responder PQRS</h3>
        </div>

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
                    <textarea name="respuesta" class="form-control" rows="4"></textarea>
                </div>
            </div>            

            <div class="form-group">
                <div class="col-md-offset-2 col-md-8">
                    <button type="submit" class="btn btn-primary">Responder PQRS</button>
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
                    funcionario: {required: true}

                },
                submitHandler: function() {
                    $.ajax({
                        url: 'Controller?accion=editarPQRS2',
                        data: $("#feditar").serialize(),
                        type: 'post',
                        success: function(msg) {
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


    });

</script>





