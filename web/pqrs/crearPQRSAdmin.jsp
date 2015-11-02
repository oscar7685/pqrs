<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>             
<!-- page content container -->
<div class="container">

    <!-- Horizontal Form -->
    <div class="wrapper wrapper-white">
        <div class="page-subtitle">
            <h3>Crear PQRS</h3>
        </div>

        <form id="fpqrs2" role="form" method="post"> 
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
                        <option value="Correo">Correo</option>
                        <option value="Manual">Manual</option>


                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label">Dependencia</label>
                <div class="col-md-8">
                    <select name="dependencia" class="form-control">
                        <option></option>
                        <c:forEach items="${areas}" var="row" varStatus="iter">
                            <option  value="${row.idarea}">${row.nombre}</option>
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
                    <input type="file" name="file_1" class="file" id="file" title="Examinar"/>   
                </div>
            </div>

            <div class="page-subtitle">
                <h3>Datos Peticionario</h3>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label">Nombre</label>
                <div class="col-md-8">
                    <input type="text" class="form-control" placeholder="Nombre" name="nombre">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label">Apellido</label>
                <div class="col-md-8">
                    <input type="text" class="form-control" placeholder="Apellido" name="apellido">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label">Celular</label>
                <div class="col-md-8">
                    <input type="text" class="form-control" placeholder="Celular" name="celular">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label">Email</label>
                <div class="col-md-8">
                    <input type="text" class="form-control" placeholder="Email" name="email">
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
<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
<!--<script src="js/jquery.iframe-transport.js"></script>
<script src="js/jquery.fileupload.js"></script>
<script src="js/jquery.fileupload-process.js"></script>
<script src="js/jquery.fileupload-validate.js"></script>-->
<script type="text/javascript">
    "use strict";
    $(function() {
        if ($("#fpqrs2").length > 0) {
            $("#fpqrs2").validate({
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
                    medio: {required: true},
                    email: {email: true},
                    descripcion: {required: true}

                },
                submitHandler: function() {
                    $.ajax({
                        url: 'Controller?accion=crearPQRSAdmin2',
                        data: $("#fpqrs2").serialize(),
                        type: 'post',
                        success: function(data) {
                            $("div.dev-page-content").html(data);
                            document.location = "#listarTodasPQRS";
                        }
                    });
                }
            });
        }
    });
</script>





