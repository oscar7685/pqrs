<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>             
<link rel="stylesheet" href="css/jquery.fileupload.css">
<!-- page content container -->
<div class="container">

    <!-- Horizontal Form -->
    <div class="wrapper wrapper-white">
        <div class="page-subtitle">
            <h3>Crear PQRS</h3>
        </div>

        <form id="fpqrs" role="form" method="post"> 
            <div class="form-group">
                <label class="col-md-2 control-label">Tipo de solicitud</label>
                <div class="col-md-8">
                    <select name="tipo_solicitud" class="form-control">
                        <option></option>
                        <option value="Peticion">Petición</option>
                        <option value="Queja">Queja</option>
                        <option value="Reclamo">Reclamo</option>
                        <option value="Sugerencia">Sugerencia</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label">Dependencia</label>
                <div class="col-md-8">
                    <select name="dependencia" class="form-control">
                        <option></option>
                        <c:forEach items="${areas}" var="row" varStatus="iter">
                            <c:choose>
                                <c:when test="${row.idarea !=1000}">
                                    <option value="${row.idarea}">${row.nombre}</option>
                                </c:when>   
                                <c:otherwise>
                                    <option selected value="${row.idarea}">${row.nombre}</option>    
                                </c:otherwise>

                            </c:choose>


                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-offset-2 col-md-8">
                    <div class="checkbox">
                        <input type="checkbox" name="notificar_mail" id="check_1" checked=""/>
                        <label for="check_1"> Recibir notificaciones via E-mail </label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label">Descripci&oacute;n</label>
                <div class="col-md-8">
                    <textarea name="descripcion" class="form-control" rows="4"></textarea>
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
                    <button type="submit" id="btnCrearPqrs" data-loading-text="Creando PQRS..." class="btn btn-primary" autocomplete="off">
                        Crear PQRS
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
    $(function () {
        if ($("#fpqrs").length > 0) {
            $("#fpqrs").validate({
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
                    file_1: {required: false},
                    descripcion: {required: true}

                },
                submitHandler: function () {
                    $("#btnCrearPqrs").button('loading');
                    $.ajax({
                        url: 'Controller?accion=crearPQRS2',
                        data: $("#fpqrs").serialize(),
                        type: 'post',
                        success: function (msg) {
                            //$("div.dev-page-content").html(data);
                            if (!datosAsubir) {
                                document.location = "#listarPQRS";
                            } else {
                                datosAsubir.submit().always(function () {
                                    setTimeout(function () {
                                        document.location = "#listarPQRS";
                                    }, 1000);

                                });

                            }

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

    });

</script>





