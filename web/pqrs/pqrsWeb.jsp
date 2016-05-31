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
    <div class="wrapper">
        <div class="page-subtitle">
            <h3>Mis PQRS Web</h3>
        </div>
        <div id="DataTables_Table_0_filter" class="dataTables_filter"><label>Buscar:
                <input type="search" class="form-control" placeholder=""></label></div>
        <div class="table-responsive">
            <table class="table table-bordered table-striped table-sortable" id="tablaXX">
                <thead>
                    <tr>
                        <c:choose>
                            <c:when test="${responsableArea.areaIdarea.idarea == 1000}">
                                <th>Código</th>
                                <th>Fecha de Ingreso</th>
                                <th>Estado</th>
                                <th>Dias habiles transcurridos</th>
                                <th>Recordatorio / Requerimientos</th>
                                <th>Asignado a</th>
                                <th>Fecha Asignación</th>
                                <th>Estado Asignación</th>
                                </c:when>
                                <c:otherwise>
                                <th>Código</th>
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
                            <c:forEach items="${pqrsTotales}" var="row" varStatus="iter">
                                <tr>
                                    <td><a href="#editarPQRS&id=${row.idpqrs}">${row.codigo}</a></td>
                                    <td> <fmt:formatDate value="${row.fechaCreacion}" pattern="yyyy/MM/dd" /></td>
                                    <td>${row.estadoSolicitud}</td>
                                    <c:choose>
                                        <c:when test="${row.estadoSolicitud == 'Respuesta enviada al usuario' }">
                                            <td><i class="fa fa-thumbs-up" style="font-size: 1.5em;color:#1b926c;"></i> Respondida</td> 
                                        </c:when>
                                        <c:otherwise>
                                            <c:choose>
                                                <c:when test="${diasHabilesRestantes[iter.index] > 8 }">
                                                    <td><i class="warning fa fa-info-circle" style="font-size: 1.5em; color:#f0ad4e;"></i> ${diasHabilesRestantes[iter.index]} dias</td> 
                                                </c:when>
                                                <c:when test="${diasHabilesRestantes[iter.index] > 15 }">
                                                    <td class="danger"><i class="fa fa-warning" style="font-size: 1.5em; color:#f00;"></i> ${diasHabilesRestantes[iter.index]} dias</td> 
                                                </c:when>
                                                <c:otherwise>
                                                    <td><i class="fa fa-clock-o" style="font-size: 1.5em;"></i> ${diasHabilesRestantes[iter.index]} dias</td> 
                                                </c:otherwise>
                                            </c:choose>
                                        </c:otherwise>    
                                    </c:choose>


                                    <td>

                                        <c:if test="${row.estadoSolicitud != 'Respuesta enviada al usuario' }">
                                            <div class="dropdown">
                                                <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true"><span class="caret"></span></button>
                                                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">

                                                    <li role="presentation"
                                                        <c:choose>
                                                            <c:when test="${diasHabilesRestantes[iter.index]< 8 
                                                                            || row.asignacionList.size() == 0
                                                                            || (row.asignacionList.size() != 0 && row.asignacionList.get(row.asignacionList.size()-1).requerimiento != 0)
                                                                    }">
                                                                class="disabled"><a role="menuitem" tabindex="-1"><i class="fa fa-clock-o"></i> Recordatorio</a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                ><a role="menuitem" tabindex="-1" href="#enviarRecordatorio&id=${row.asignacionList.get(row.asignacionList.size()-1).asignacionId}"><i class="fa fa-clock-o"></i> Recordatorio</a>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </li>
                                                    <li role="presentation"
                                                        <c:choose>
                                                            <c:when test="${diasHabilesRestantes[iter.index]< 16 
                                                                            || row.asignacionList.size() == 0
                                                                            || (row.asignacionList.size() != 0 && row.asignacionList.get(row.asignacionList.size()-1).requerimiento != 1)
                                                                    }">
                                                                class="disabled" ><a role="menuitem" tabindex="-1"><i class="fa fa-bell-o"></i> 1er requerimiento</a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                ><a role="menuitem" tabindex="-1" href="#enviar1erRequerimiento&id=${row.asignacionList.get(row.asignacionList.size()-1).asignacionId}"><i class="fa fa-bell-o"></i> 1er requerimiento</a>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </li>
                                                    <li role="presentation"
                                                        <c:choose>
                                                            <c:when test="${diasHabilesRestantes[iter.index]< 19 
                                                                            || row.asignacionList.size() == 0 
                                                                            || (row.asignacionList.size() != 0 && row.asignacionList.get(row.asignacionList.size()-1).requerimiento != 2)
                                                                    }">
                                                                class="disabled" ><a role="menuitem" tabindex="-1"><i class="fa fa-bell"></i> 2do requerimiento</a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                ><a role="menuitem" tabindex="-1" href="#enviar2doRequerimiento&id=${row.asignacionList.get(row.asignacionList.size()-1).asignacionId}"><i class="fa fa-bell"></i> 2do requerimiento</a>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </li>
                                                </ul>
                                            </div>   
                                        </c:if>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${row.asignacionList.size() != 0}" >
                                                ${row.asignacionList.get(row.asignacionList.size()-1).asignadoA.nombre} ${row.asignacionList.get(row.asignacionList.size()-1).asignadoA.apellido}</td>
                                            </c:when>
                                        </c:choose>


                                    <td>
                                        <c:choose>
                                            <c:when test="${row.asignacionList.size() != 0}" >
                                                <fmt:formatDate value="${row.asignacionList.get(row.asignacionList.size()-1).fechaAsignacion}" pattern="yyyy/MM/dd" />
                                            </c:when>
                                        </c:choose>

                                    </td>
                                    <td>
                                        <c:if test="${row.asignacionList.size() != 0}">
                                            <c:choose>
                                                <c:when test="${row.asignacionList.get(row.asignacionList.size()-1).estado == 'Rechazada'}" >
                                                    <p data-toggle="tooltip" title="${row.asignacionList.get(row.asignacionList.size()-1).motivo}">${row.asignacionList.get(row.asignacionList.size()-1).estado}<p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${row.asignacionList.get(row.asignacionList.size()-1).estado}
                                                    </c:otherwise>    
                                                </c:choose>
                                            </c:if>


                                    </td>

                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${asignaciones}" var="row" varStatus="iter">
                                <tr>
                                    <td><a href="#responderPqrs&id=${row.pqrsIdpqrs.idpqrs}">${row.pqrsIdpqrs.codigo}</a></td>
                                    <td><fmt:formatDate value="${row.fechaAsignacion}" pattern="yyyy/MM/dd" /></td>
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

            <div class="dataTables_paginate paging_simple_numbers">
                <c:if test="${pageNumber gt 1}">
                    <a href="#paginacionW&numP=${pageNumber - 1}" class="paginate_button previous">Anterior</a>
                </c:if>
                <span> 
                    <c:choose>
                        <c:when test="${1!=pageNumber}">
                            <a href="#paginacionW&numP=1" class="paginate_button current" >1</a>
                        </c:when>
                        <c:otherwise>
                            <a href="#paginacionW&numP=1" class="paginate_button">1</a>
                        </c:otherwise>        
                    </c:choose>   
                    <c:choose>
                        <c:when test="${numberOfPages gt 15}">
                            <c:if test="${pageNumber lt 5}">
                                <c:forEach begin="2" end="${5}" var="i">
                                    <c:choose>
                                        <c:when test="${i!=pageNumber}">
                                            <a href="#paginacionW&numP=${i}" class="paginate_button current" >${i}</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="#paginacionW&numP=${i}" class="paginate_button">${i}</a>
                                        </c:otherwise>        
                                    </c:choose>       
                                </c:forEach>  
                            </c:if>
                            <c:if test="${pageNumber gt 4 && pageNumber lt (numberOfPages-4)}">
                                <c:forEach begin="${pageNumber-1}" end="${pageNumber+1}" var="i">
                                    <c:choose>
                                        <c:when test="${i!=pageNumber}">
                                            <a href="#paginacionW&numP=${i}" class="paginate_button current" >${i}</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="#paginacionW&numP=${i}" class="paginate_button">${i}</a>
                                        </c:otherwise>        
                                    </c:choose>       
                                </c:forEach> 
                            </c:if>    
                            <c:if test="${pageNumber gt 4 && pageNumber gt (numberOfPages-5)}">
                                <c:forEach begin="${numberOfPages-5}" end="${numberOfPages-1}" var="i">
                                    <c:choose>
                                        <c:when test="${i!=pageNumber}">
                                            <a href="#paginacionW&numP=${i}" class="paginate_button current" >${i}</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="#paginacionW&numP=${i}" class="paginate_button">${i}</a>
                                        </c:otherwise>        
                                    </c:choose>       
                                </c:forEach>  
                            </c:if>
                            <c:choose>
                                <c:when test="${pageNumber==numberOfPages}">
                                    <a href="#paginacionW&numP=${numberOfPages}" class="paginate_button current" >${numberOfPages}</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="#paginacionW&numP=${numberOfPages}" class="paginate_button">${numberOfPages}</a>
                                </c:otherwise>        
                            </c:choose>                 
                        </c:when>
                        <c:otherwise>
                            <c:forEach begin="1" end="${numberOfPages}" var="i">
                                <c:choose>
                                    <c:when test="${i!=pageNumber}">
                                        <a href="#paginacionW&numP=${i}" class="paginate_button current" >${i}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="#paginacionW&numP=${i}" class="paginate_button">${i}</a>
                                    </c:otherwise>        
                                </c:choose>       
                            </c:forEach>  
                        </c:otherwise>
                    </c:choose>


                </span>            
                <c:if test="${pageNumber lt numberOfPages}">
                    <a href="#paginacionW&numP=${pageNumber + 1}" class="paginate_button next">Siguiente</a>
                </c:if>
            </div>
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
<script>
    $(document).ready(function() {
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>               

