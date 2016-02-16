<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="container">
    <div class="wrapper wrapper-white">
        <div class="page-subtitle">
            <h3>Peticionarios</h3>
        </div>
        <div class="table-responsive">
            <table class="table table-bordered table-striped table-sortable">
                <thead>
                    <tr>
                        <th>Identificacion</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Email</th>
                        <th>Telefono/Celular</th>
                        <th>Tipo</th>
                    </tr>
                </thead>                               
                <tbody>
                    <c:forEach items="${peticionarios}" var="row" varStatus="iter">
                        <tr>
                            <td><a href="#editarPeticionario&id=${row.idreclamante}">${row.idreclamante}</a></td>
                            <td>${row.nombre}</td>
                            <td>${row.apellido}</td>
                            <td>${row.email}</td>
                            <td>${row.celular}</td>
                            <td>${row.tipo}</td> 
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <div class="col-md-12" style="padding-top: 20px;">
        <a class="btn btn-primary" href="#nuevoPeticionario" type="button">Crear Peticionario</a>
    </div>

    <!-- Copyright -->
    <div class="copyright">
        <div class="pull-left">
            &copy; 2015 <strong>Universidad de Cartagena</strong>. Todos los derechos reservados.
        </div>
    </div>
    <!-- ./Copyright -->

</div>
<script type="text/javascript" src="js/plugins/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript">
    $(function () {
        if ($(".table-sortable").length > 0) {
            /* init default sortable table */
            $(".table-sortable").DataTable({
                "fnInitComplete": function () {
                    $(".dataTables_wrapper").find("select,input").addClass("form-control");
                }
            });
            /* ./init default sortable table */

            /* udate page content on page change */
            $(".table-sortable").on('page.dt', function () {
                setTimeout(function () {
                    dev_layout_alpha_content.init(dev_layout_alpha_settings);
                }, 100);
            });
            /* ./udate page content on page change */

            /* update page content on search */
            $(".table-sortable").on('search.dt', function () {
                setTimeout(function () {
                    dev_layout_alpha_content.init(dev_layout_alpha_settings);
                }, 200);
            });
            /* ./update page content on search */

            /* uppdate page content on change length */
            $('.table-sortable').on('length.dt', function () {
                setTimeout(function () {
                    dev_layout_alpha_content.init(dev_layout_alpha_settings);
                }, 100);
            });
            /* ./uppdate page content on change length */
        }
    });

</script>