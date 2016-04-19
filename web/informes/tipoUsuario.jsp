<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <br/>
        <br/>
        <div id="container20" style="min-width: 310px; max-width: 800px; height: 400px; margin: 0 auto"></div>
    </body>
</html>
<script type="text/javascript">
    $(function () {
        var chart = new Highcharts.Chart({
            chart: {
                type: 'column',
                renderTo: 'container20'
            },
            title: {
                text: 'TIPOS DE USUARIOS'
            },
            xAxis: {
                categories: ['Aspirante', 'Docente', 'Egresado', 'Estudiante', 'Particular'],
                title: {
                    text: null
                }
            },
            yAxis: {
                min: 0,
                title: {
                    text: '% PQRS',
                    align: 'high'
                },
                labels: {
                    overflow: 'justify'
                }
            },
            tooltip: {
                valueSuffix: ' PQRS'
            },
            plotOptions: {
                column: {
                    dataLabels: {
                        enabled: true,
                        formatter: function () {
                            var pcnt = (this.y / ${fn:length(total)}) * 100;
                            return Highcharts.numberFormat(pcnt) + '%';
                        }
                    }
                }
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'top',
                x: -40,
                y: 80,
                floating: true,
                borderWidth: 1,
                // backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
                shadow: true
            },
            credits: {
                enabled: false
            },
            series: [{
                    name: '2016',
                    data: [${fn:length(Aspirante)}, ${fn:length(Docente)}, ${fn:length(Egresado)}, ${fn:length(Estudiante)}, ${fn:length(Particular)}]
                }]
        });
    });
</script>