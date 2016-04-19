<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="css/pickmeup.css" type="text/css" />
<link rel="stylesheet" media="screen" type="text/css" href="css/demo.css" />
<div class="container">

    <!-- Horizontal Form -->
    <div class="wrapper">
        <div class="page-subtitle">
            <h3>Configurar calendario</h3>
        </div>

        <form id="fpqrs" role="form" method="post"> 
            <div class="row">
                <div class="col-md-4">
                    <div class="multiple"></div>
                </div>

                <div class="col-md-6" style="font-size: 16px;">
                    <br/>
                    <br/>
                    <br/>
                    <button type="button" class="btn btn-rounded btn-danger">&nbsp;</button> Días no hábiles
                    <br/>
                    <br/>
                    <br/>
                    <button type="button" id="actualizarCalendario" class="btn btn-default">Actualizar dias no habiles</button>
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


<script type="text/javascript" src="js/jquery.pickmeup.min.js"></script>
<script type="text/javascript">
    $(function () {
        var Rpickme = $('.multiple').pickmeup({
        flat: true,
                mode: 'multiple',
                first_day: 0,
                select_month: false,
                min: '01-11-2015',
                date:[
    <c:forEach items = "${diasNoHabiles}" var = "row" varStatus = "loop" >
                '<fmt:formatDate value="${row.dias}" pattern="dd-MM-yyyy"/>'
        <c:if test="${!loop.last}">,</c:if>
    </c:forEach>
                ]
    });
    $("#actualizarCalendario").click(function () {

        $.ajax({
            url: 'Controller?accion=editarDiasHabiles2',
            data: 'fechas=' + $('.multiple').pickmeup('get_date', 'Y-m-d'),
            type: 'post',
            success: function () {
                sweetAlert("Bien hecho.", "Dias No Habiles Editados correctamente!", "success");
            }
        });
    });
    });
</script>
