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
                type: 'line',
                renderTo: 'container20'
            },
            title: {
                text: 'Comportamiento de las PQRS tramitadas por mes'
            },
            xAxis: {
                categories: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio'],
                title: {
                    text: null
                }
            },
            yAxis: {title: {
                    text: '# PQRS'
                },
                plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                    }]

            },
            tooltip: {
                valueSuffix: ' PQRS'
            },
            plotOptions: {
                bar: {
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
                verticalAlign: 'middle',
                borderWidth: 0
            },
            credits: {
                enabled: false
            },
            series: [{
                    name: 'Peticiones',
                    data: [${Peticion[0]}, ${Peticion[1]}, ${Peticion[2]}, ${Peticion[3]}, ${Peticion[4]}, ${Peticion[5]}]
                }, {
                    name: 'Quejas',
                    data: [${Queja[0]}, ${Queja[1]}, ${Queja[2]}, ${Queja[3]}, ${Queja[4]}, ${Queja[5]}]
                }, {
                    name: 'Reclamos',
                    data: [${Reclamo[0]}, ${Reclamo[1]}, ${Reclamo[2]}, ${Reclamo[3]}, ${Reclamo[4]}, ${Reclamo[5]}]
                }, {
                    name: 'Sugerencias',
                    data: [${Sugerencia[0]}, ${Sugerencia[1]}, ${Sugerencia[2]}, ${Sugerencia[3]}, ${Sugerencia[4]}, ${Sugerencia[5]}]
                }]




        });
    });
</script>