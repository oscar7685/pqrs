<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>     
<!-- page wrapper -->
<div class="container">
    <!-- Horizontal Form -->
    <div class="wrapper wrapper-white">
        <div class="page-subtitle">
            <h3>Crear Peticionario</h3>
        </div>            
        <form id="fpeticionario" role="form" method="post">
            <div class="form-group">
                <label class="col-md-2 control-label">Nombre</label>
                <div class="col-md-8">
                    <input type="text" class="form-control" placeholder="Nombres" name="nombre">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label">Apellidos</label>
                <div class="col-md-8">
                    <input type="text" class="form-control" placeholder="Apellidos" name="apellido">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label">Identificación</label>
                <div class="col-md-8">
                    <input type="text" class="form-control" placeholder="Identificación" name="identificacion">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label">Tipo Peticionario</label>
                <div class="col-md-8">
                    <select id="tipo_usuario" class="form-control" name="tipo_usuario">
                        <option selected value=""></option>
                        <option value="ESTUDIANTE">Estudiante</option>
                        <option value="EGRESADO">Egresado</option>
                        <option value="PROFESOR">Docente</option>
                        <option value="PARTICULAR">Particular</option>
                        <option value="ASPIRANTE">Aspirante</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-2 control-label">Telefono/Celular</label>
                <div class="col-md-8">
                    <input type="text" class="form-control" placeholder="Celular" name="celular">
                </div>
            </div>                    
            <div class="form-group">
                <label class="col-md-2 control-label">Correo</label>
                <div class="col-md-8">
                    <input type="text" class="form-control" placeholder="Correo" name="correo">
                </div>
            </div>                    
            <div class="form-group">
                <label class="col-md-2 control-label">Clave</label>
                <div class="col-md-8">
                    <input type="password" class="form-control" placeholder="Clave" name="password" id="password2">
                </div>
            </div>                    
            <div class="form-group">
                <label class="col-md-2 control-label">Repetir Clave</label>
                <div class="col-md-8">
                    <input type="password" class="form-control" placeholder="Repetir Clave" name="re_password">
                </div>
            </div>   

            <div class="form-group">
                <div class="col-md-offset-2 col-md-8">
                    <button type="submit" class="btn btn-primary">Crear Peticionario</button>
                </div>
            </div>
        </form>
    </div>

    <!-- Copyright -->
    <div class="copyright">
        <div class="pull-left">
            &copy; 2015 <strong>Universidad de Cartagena</strong>. Todos los derechos reservados.
        </div>
    </div>
    <!-- ./Copyright -->

</div>


<!-- ./page wrapper -->                

<!-- javascript -->
<script type="text/javascript" src="js/plugins/jquery/jquery.min.js"></script>       
<script type="text/javascript" src="js/plugins/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="js/plugins/jquery-validate/jquery.validate.min.js"></script>     
<script type="text/javascript" src="js/dev-layout-default.js"></script>
<script type="text/javascript">
    "use strict";
    var demo_form_validation1 = {
        init: function () {

            if ($("#fpeticionario").length > 0) {
                $("#fpeticionario").validate({
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
                        dev_layout_alpha_content.init(dev_layout_alpha_settings);
                    },
                    unhighlight: function (element, errorClass, validClass) {
                        $(element).parents(".form-group").removeClass(errorClass).addClass(validClass);
                        dev_layout_alpha_content.init(dev_layout_alpha_settings);
                    },
                    rules: {
                        nombre: {required: true, minlength: 2},
                        apellido: {required: true, minlength: 2},
                        identificacion: {required: true, minlength: 2, maxlength: 12},
                        celular: {required: true, minlength: 7, maxlength: 20},
                        tipo_usuario: {required: true},
                        password: {required: true, minlength: 5, maxlength: 20},
                        're_password': {required: true, minlength: 5, maxlength: 20, equalTo: "#password2"},
                        correo: {required: true, email: true}
                    },
                    submitHandler: function () {
                        $.ajax({
                            url: 'Controller?accion=registrarReclamante',
                            data: $("#fpeticionario").serialize(),
                            type: 'post',
                            success: function (msg) {

                                if (msg === '1')
                                {
                                    document.location = "#listarPeticionarios";
                                } else {
                                    if (msg === '2') {
                                        alert("ha ocurrido un error!!");
                                    }

                                }
                            }

                        });
                    }

                });
            }
        }
    };
    $(function () {
        demo_form_validation1.init();
    });
</script>
<!-- ./javascript -->






