<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="container20" style="min-width: 310px; max-width: 800px; height: 400px; margin: 0 auto"></div>
<table id="datatable" class="table table-bordered">
    <thead>
        <tr>
            <th>Mes/Tipo PQRS</th>
            <th>Peticiones</th>
            <th>Quejas</th>
            <th>Reclamos</th>
            <th>Sugerencias</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${Peticion}" var="row" varStatus="iter">
            <tr>
                <td>${meses[iter.index]}</td>
                <td>${Peticion[iter.index]}</td>
                <td>${Queja[iter.index]}</td>
                <td>${Reclamo[iter.index]}</td>
                <td>${Sugerencia[iter.index]}</td>
            </tr>
        </c:forEach>

    </tbody>
</table>
<script type="text/javascript">
    $('#container20').highcharts({
        chart: {
            type: 'line',
            backgroundColor: 'rgba(255, 255, 255, 0.1)'
        },
        title: {
            text: 'Comportamiento de las PQRS tramitadas este año'
        },
        yAxis: {
            allowDecimals: false,
            title: {
                text: 'Units'
            }
        },
        data: {
            table: 'datatable'
        },
        tooltip: {
            formatter: function() {
                return '<b>' + this.series.name + '</b><br/>' +
                        this.point.y + ' ' + this.point.name.toLowerCase();
            }
        }, credits: {
            enabled: false
        }
    });
</script>



