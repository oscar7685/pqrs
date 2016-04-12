<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>             
<link rel="stylesheet" href="css/jquery.fileupload.css">
<!-- page content container -->
<div class="container">
    <form id="fpqrs" role="form" method="post"> 
        <!-- basic form elements -->
        <div class="wrapper">
            <div class="page-subtitle">
                <h3>PETICIONARIO</h3>
            </div>
            <div id="existentes">
                <div class="col-md-6">
                    <div class="form-group">
                        <select name="peticionario" class="form-control">
                            <option></option>
                            <c:forEach items="${peticionarios}" var="row" varStatus="iter">
                                <option selected value="${row.idreclamante}">${row.nombre} ${row.apellido}</option>    
                            </c:forEach>
                        </select>
                    </div>
                </div> 
                <div class="col-md-4">
                    <div class="form-group">
                        <button type="button" id="crearNuevoPeticionario" class="btn btn-default">Crear Nuevo Peticionario</button>
                    </div>
                </div>
            </div>

            <div id="nuevo" >
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Identificación</label>
                            <input type="text" class="form-control" value="" name="identificacion" placeholder="Identificación"/>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Nombre</label>
                            <input type="text" class="form-control" value="" name="nombre" placeholder="Nombre"/>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Apellido</label>
                            <input type="text" class="form-control" value="" name="apellido" placeholder="Apellido"/>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Tipo</label>
                            <select name="tipo_peticionario" class="form-control">
                                <option selected value=""></option>
                                <option value="ESTUDIANTE">Estudiante</option>
                                <option value="EGRESADO">Egresado</option>
                                <option value="PROFESOR">Docente</option>
                                <option value="PARTICULAR">Particular</option>
                                <option value="ASPIRANTE">Aspirante</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Celular</label>
                            <input type="text" class="form-control" value="" name="celular" placeholder="Celular"/>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Correo Electronico</label>
                            <input type="text" class="form-control" value="" name="correo" placeholder="Correo Electronico"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Clave</label>
                            <input type="password" class="form-control" value="" placeholder="Clave" name="password" id="password2"/>
                        </div>
                    </div>                    
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Repetir Clave</label>
                            <input type="password" class="form-control" value="" placeholder="Repetir Clave"  name="re_password"/>
                        </div>
                    </div>   
                </div> 
            </div>

        </div>                        
        <!-- ./basic form elements -->


        <!-- Horizontal Form -->
        <div class="wrapper">
            <div class="page-subtitle">
                <h3>Crear PQRS</h3>
            </div>
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
                <label class="col-md-2 control-label">Medio de ingreso</label>
                <div class="col-md-8">
                    <select name="medio" class="form-control">
                        <option></option>
                        <option value="Web">Web</option>
                        <option value="Correo">Correo Electrónico</option>
                        <option value="Telefono">Atención Telefónica </option>
                        <optgroup label="Atención Personalizada "> 
                            <option value="Manual">Escrito</option>
                            <option value="Verbal">Verbal</option>
                            <option value="Fax">Fax</option>
                        </optgroup>

                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label">Fecha de Ingreso</label>
                <div class="col-md-8">
                    <input type="text" class="form-control datepicker" placeholder="DD/MM/YYYY" name="fechaCreacion">
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
                    <button type="submit" class="btn btn-primary" id="btnCrearPqrs" data-loading-text="Creando PQRS..." autocomplete="off">Crear PQRS</button>
                </div>
            </div>



        </div>
        <!-- ./Horizontal Form -->
    </form>
    <!-- Copyright -->
    <div class="copyright">
        <div class="pull-left">
            &copy; 2015 <strong>Universidad de Cartagena</strong>. Todos los derechos reservados.
        </div>
    </div>
    <!-- ./Copyright -->

</div>
<script type="text/javascript" src="js/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<!-- ./page content container -->
<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
<script src="js/vendor/jquery.ui.widget.js"></script>
<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
<script src="js/jquery.iframe-transport.js"></script>
<!-- The basic File Upload plugin -->
<script src="js/jquery.fileupload.js"></script>

<script type="text/javascript">
    "use strict";
    var datosAsubir;
    $(function() {
        $("#nuevo").hide();
        $("#crearNuevoPeticionario").click(function() {
            $("#existentes").hide();
            $("#nuevo").show();
        });
        if ($(".datepicker").length > 0)
            $(".datepicker").datetimepicker({format: "DD/MM/YYYY"});
        if ($("#fpqrs").length > 0) {
            $("#fpqrs").validate({
                errorClass: "has-error",
                validClass: "has-success",
                errorElement: "span",
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
                    medio: {required: true},
                    descripcion: {required: true},
                    fechaCreacion: {required: true},
                    peticionario: {required: true},
                    nombre: {required: true, minlength: 2},
                    apellido: {required: true, minlength: 2},
                    identificacion: {required: true, minlength: 2, maxlength: 12},
                    celular: {required: true, minlength: 7, maxlength: 20},
                    tipo_peticionario: {required: true},
                    correo: {required: true, email: true},
                    password: {required: true, minlength: 5, maxlength: 20},
                    re_password: {required: true, minlength: 5, maxlength: 20, equalTo: "#password2"}
                },
                submitHandler: function() {
                    $("#btnCrearPqrs").button('loading');
                    $.ajax({
                        url: 'Controller?accion=crearPQRSAdmin2',
                        data: $("#fpqrs").serialize(),
                        type: 'post',
                        success: function(msg) {
                            //$("div.dev-page-content").html(data);
                            if (!datosAsubir) {
                                document.location = "#listarTodasPQRS";
                            } else {
                                datosAsubir.submit().always(function() {
                                    setTimeout(function() {
                                        document.location = "#listarTodasPQRS";
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