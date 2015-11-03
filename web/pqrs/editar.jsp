<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>             
<link rel="stylesheet" href="css/jquery.fileupload.css">
<!-- page content container -->
<div class="container">

    <!-- Horizontal Form -->
    <div class="wrapper wrapper-white">
        <div class="page-subtitle">
            <h3>Ver PQRS</h3>
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
                <label class="col-md-2 control-label">Dependencia</label>
                <div class="col-md-8">
                    <select name="dependencia" class="form-control">
                        <option></option>
                        <c:forEach items="${areas}" var="row" varStatus="iter">
                            <c:choose>
                                <c:when test="${row.idarea != pqrs.areaIdarea.idarea}">
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
                <label class="col-md-2 control-label">Asignada a:</label>
                <div class="col-md-8">
                    <select name="funcionario" class="form-control">
                        <option></option>
                        <c:choose>
                            <c:when test="${fn:length(funcionarios)!= 0}">
                                ${funcionarios.size()}
                                <c:forEach items="${funcionarios}" var="row" varStatus="iter">
                                    <c:choose>
                                        <c:when test=" ${fn:length(pqrs.asignacionList)!= 0 && row.idresponsableArea == pqrs.asignacionList.get(0).asignadoA.idresponsableArea}">
                                            <option selected="selected" value="${row.idresponsableArea}">${row.nombre} ${row.apellido}</option>             
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${row.idresponsableArea}">${row.nombre} ${row.apellido}</option>             
                                        </c:otherwise>
                                    </c:choose> 

                                </c:forEach>

                            </c:when>
                        </c:choose>

                    </select>

                </div>
            </div>            


            <div class="form-group">
                <div class="col-md-offset-2 col-md-8">
                    <button type="submit" class="btn btn-primary">Editar PQRS</button>
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

    $(function () {
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
                    funcionario: {required: true}

                },
                submitHandler: function () {
                    $.ajax({
                        url: 'Controller?accion=editarPQRS2',
                        data: $("#feditar").serialize(),
                        type: 'post',
                        success: function (msg) {
                            document.location = "#listarTodasPQRS"

                        }
                    });
                }
            });
        }

    });

</script>





