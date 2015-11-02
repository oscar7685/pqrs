<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>             
<!-- page content container -->
<div class="container">

    <!-- Horizontal Form -->
    <div class="wrapper wrapper-white">
        <div class="page-subtitle">
            <h3>Crear dependencia</h3>
        </div>

        <form id="fdependencia" role="form" method="post"> 
            <div class="form-group">
                <label class="col-md-2 control-label">Id dependencia</label>
                <div class="col-md-8">
                    <input type="text" class="form-control" placeholder="Id dependencia" name="id">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label">Dependencia</label>
                <div class="col-md-8">
                    <input type="text" class="form-control" placeholder="Dependencia" name="dependencia">
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-offset-2 col-md-8">
                    <button type="submit" class="btn btn-default">Crear Dependencia</button>
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
        if ($("#fdependencia").length > 0) {
            $("#fdependencia").validate({
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
                    dependencia: {required: true},
                    id: {required: true}

                },
                submitHandler: function() {
                    $.ajax({
                        url: 'Controller?accion=crearDependencia2',
                        data: $("#fdependencia").serialize(),
                        type: 'post',
                        success: function(data) {
                            $("div.dev-page-content").html(data);
                            document.location = "#dependencias";
                        }
                    });
                }
            });
        }
    });
</script>





