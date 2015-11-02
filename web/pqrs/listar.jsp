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
                <h4>${reclamante.nombre} ${reclamante.apellido}</h4>
                <span><i class="fa fa-user"></i> ${reclamante.tipo}</span>
            </div>                            
        </div>
    </div>
    <div class="wrapper wrapper-white">
        <div class="page-subtitle">
            <h3>Mis PQRS activas</h3>
        </div>
        <c:choose>
            <c:when test="${fn:length(pqrsAct)!= 0}">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped table-sortable">
                        <thead>
                            <tr>
                                <th>Tipo</th>
                                <th>Fecha de Ingreso</th>
                                <th>Medio de Ingreso</th>
                                <th>Correo</th>
                                <th>Celular</th>
                                <th>Estado</th>
                            </tr>
                        </thead>                               
                        <tbody>
                            <c:forEach items="${pqrsAct}" var="row" varStatus="iter">
                                <tr>
                                    <td>${row.tipo}</td>
                                    <td> <fmt:formatDate value="${row.fechaCreacion}" pattern="yyyy/MM/dd" /></td>
                                    <td>${row.medioIngreso}</td>
                                    <td>${row.reclamanteIdreclamante.email}</td>
                                    <td>${row.reclamanteIdreclamante.celular}</td>
                                    <td>${row.estado}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:when>
            <c:otherwise>
                NO hay PQRS activas
            </c:otherwise>
        </c:choose>
    </div>

    <!-- Copyright -->
    <div class="copyright">
        <div class="pull-left">
            &copy; 2015 <strong>Universidad de Cartagena</strong>. Todos los derechos reservados.
        </div>
    </div>
    <!-- ./Copyright -->

</div>