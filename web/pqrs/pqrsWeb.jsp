<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="container">

    <div class="page-profile" style="background-image: url(assets/images/user_images/udc.png);">

        <div class="profile profile-transparent">
            <div class="profile-image">
                <img src="assets/images/users/user.jpg">
                <div class="profile-status online"></div>
            </div>
            <div class="profile-info">
                <h4>${responsableArea.nombre} ${responsableArea.apellido}</h4>
                <span><i class="fa fa-user"></i> 
                    <c:choose>
                        <c:when test="${responsableArea.areaIdarea.idarea == 1000}">
                            Administrador
                        </c:when>
                        <c:otherwise>
                            ${responsableArea.areaIdarea.nombre}
                        </c:otherwise>
                    </c:choose>   

                </span>
            </div>                            
        </div>
    </div>
    <div class="wrapper wrapper-white">
        <div class="page-subtitle">
            <h3>Mis PQRS via Web</h3>
        </div>
        <div class="table-responsive">
            <table class="table table-bordered table-striped table-sortable">
                <thead>
                    <tr>
                        <c:choose>
                            <c:when test="${responsableArea.areaIdarea.idarea == 1000}">
                                <th>Tipo</th><th>Fecha de Ingreso</th><th>Medio de Ingreso</th><th>Correo</th><th>Celular</th><th>Estado</th>
                                </c:when>
                                <c:otherwise>
                                <th>Tipo</th>
                                <th>Fecha de Asignacion</th>
                                <th>Asignado por</th>
                                <th>Correo</th>
                                <th>Celular</th>
                                <th>Estado</th>
                                </c:otherwise>
                            </c:choose>
                    </tr>
                </thead>                               
                <tbody>
                    <c:choose>
                        <c:when test="${responsableArea.areaIdarea.idarea == 1000}">
                            <c:forEach items="${pqrsW}" var="row" varStatus="iter">
                                <tr>
                                    <td>${row.tipo}</td>
                                    <td> <fmt:formatDate value="${row.fechaCreacion}" pattern="yyyy/MM/dd" /></td>
                                    <td>${row.medioIngreso}</td>
                                    <td>${row.reclamanteIdreclamante.email}</td>
                                    <td>${row.reclamanteIdreclamante.celular}</td>
                                    <td>${row.estado}</td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${asignaciones}" var="row" varStatus="iter">
                                <tr>
                                    <td>${row.pqrsIdpqrs.tipo}</td>
                                    <td> <fmt:formatDate value="${row.fechaAsignacion}" pattern="yyyy/MM/dd" /></td>
                                    <td>${row.asignadoPor.nombre} ${row.asignadoPor.apellido}</td>
                                    <td>${row.pqrsIdpqrs.reclamanteIdreclamante.email}</td>
                                    <td>${row.pqrsIdpqrs.reclamanteIdreclamante.celular}</td>
                                    <td>${row.pqrsIdpqrs.estado}</td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>        
                    </c:choose>

                </tbody>
            </table>
        </div>
    </div>

    <!-- Copyright -->
    <div class="copyright">
        <div class="pull-left">
            &copy; 2015 <strong>Universidad de Cartagena</strong>. Todos los derechos reservados.
        </div>
    </div>
    <!-- ./Copyright -->

</div>