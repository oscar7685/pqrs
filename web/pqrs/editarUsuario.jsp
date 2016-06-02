<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>             
<link rel="stylesheet" href="css/jquery.fileupload.css">
<!-- page content container -->
<div class="container">

    <!-- Horizontal Form -->
    <div class="wrapper">
        <div class="page-subtitle">
            <h3>Editar PQRS</h3>
        </div>

        <form id="fpqrs" role="form" method="post"> 
            <div class="form-group">
                <label class="col-md-2 control-label">Tipo de solicitud</label>
                <div class="col-md-8">
                    <select name="tipo_solicitud" class="form-control">
                        <option>${pqrs.tipo}</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label">Dependencia</label>
                <div class="col-md-8">
                    <select name="dependencia" class="form-control">
                        <option value="${pqrs.areaIdarea.idarea}">${pqrs.areaIdarea.nombre}</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-offset-2 col-md-8">
                    <div class="checkbox">
                        <c:choose>
                            <c:when test="${pqrs.notificarMail == 'on'}">
                                <input type="checkbox" name="notificar_mail" id="check_1" checked="" disabled=""/>
                            </c:when>
                            <c:otherwise>
                                <input type="checkbox" name="notificar_mail" id="check_1" disabled=""/>
                            </c:otherwise>
                        </c:choose>

                        <label for="check_1"> Recibir notificaciones via E-mail </label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label">Descripci&oacute;n</label>
                <div class="col-md-8">
                    <textarea name="descripcion" class="form-control" rows="4">${pqrs.descripcion}</textarea>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label">Ingrese archivo adjunto</label>
                <div class="col-md-8">
                    <span class="btn btn-success fileinput-button">
                        <i class="glyphicon glyphicon-plus"></i>
                        <span>Seleccionar archivo...</span>
                        <!-- The file input field used as target for the file upload widget -->
                        <input id="fileupload" type="file" name="file">
                    </span>

                    <!-- The container for the uploaded files -->
                    <div id="files" class="files"></div>
                    <br>
                    <!-- The global progress bar -->
                    <div id="progress" class="progress">
                        <div class="progress-bar progress-bar-success"></div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-offset-2 col-md-8">
                    <button type="submit" id="btnEditarPqrs" data-loading-text="Editando PQRS..." class="btn btn-primary" autocomplete="off">
                        Editar PQRS
                    </button>
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



<script type="text/javascript">
    "use strict";
    var datosAsubir;
    $(function() {
        if ($("#fpqrs").length > 0) {
            $("#fpqrs").validate({
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
                    file_1: {required: false},
                    descripcion: {required: true}

                },
                submitHandler: function() {
                    $("#btnEditarPqrs").button('loading');
                    $.ajax({
                        url: 'Controller?accion=editarPQRSUsuario2',
                        data: $("#fpqrs").serialize(),
                        type: 'post',
                        success: function(msg) {
                            //$("div.dev-page-content").html(data);
                            if (!datosAsubir) {
                                document.location = "#listarPQRS";
                            } else {
                                datosAsubir.submit().always(function() {
                                    setTimeout(function() {
                                        document.location = "#listarPQRS";
                                    }, 1000);

                                });

                            }

                        }
                    });
                }
            });
        }

        var url = 'SubirAdjunto'; //POST
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

        // Cargar Archivos Existentes: (GET)
        $('#fileupload').addClass('fileupload-processing');
        $.ajax({
            // Uncomment the following to send cross-domain cookies:
            //xhrFields: {withCredentials: true},
            url: $('#fileupload').fileupload('option', 'url'),
            dataType: 'json',
            context: $('#fileupload')[0]
        }).always(function() {
            $(this).removeClass('fileupload-processing');
        }).done(function(result) {
            $(this).fileupload('option', 'done')
            $.each(result.files, function(index, file) {
                $("<p><a href = '" + file.url + "' target = '_blank' title = '" + file.name + "' download = '" + file.name + "'>" + file.name + "</a></p>").appendTo('#files');

            });


        });


    });

</script>





