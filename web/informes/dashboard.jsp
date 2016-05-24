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

        <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc;margin-right: 30px;">
            <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>&nbsp;
            <span></span> <b class="caret"></b>
        </div>

        <!-- page footer container -->
        <div class="dev-page-footer-container">

            <!-- loader and close button -->
            <div class="dev-page-footer-container-layer">
                <a href="#" class="dev-page-footer-container-layer-button"></a>
            </div>
            <!-- ./loader and close button -->                    

            <!-- informers -->
            <div class="dev-page-footer-container-content" id="footer_content_1">                        
                <div class="dev-list-informers">                            
                    <div class="dev-list-informers-item">
                        <div class="chart">
                            <input class="knob" data-width="100" data-max="100" data-fgColor="#df6255" value="33" data-angleArc="250" data-angleOffset="-125" data-thickness=".1"/>
                        </div>
                        <div class="info">
                            <h5>Peticiones</h5>
                            <p>Total - <strong>2048</strong></p>
                            <p>Respondidas - <strong>1291</strong></p>
                            <p>Por responder - <strong>757</strong></p>
                        </div>
                    </div>

                    <div class="dev-list-informers-item">
                        <div class="chart">
                            <input class="knob" data-width="100" data-max="100" data-fgColor="#df6255" value="25" data-thickness=".1"/>
                        </div>
                        <div class="info">
                            <h5>Quejas</h5>
                            <p>Total - <strong>2048</strong></p>
                            <p>Respondidas - <strong>1291</strong></p>
                            <p>Por responder - <strong>757</strong></p>
                        </div>
                    </div>

                    <div class="dev-list-informers-item">
                        <div class="chart">
                            <input class="knob" data-width="100" data-max="100" data-fgColor="#df6255" value="62" data-thickness=".1"/>
                        </div>
                        <div class="info">
                            <h5>Reclamos</h5>
                            <p>Total - <strong>2048</strong></p>
                            <p>Respondidas - <strong>1291</strong></p>
                            <p>Por responder - <strong>757</strong></p>
                        </div>
                    </div>
                    <div class="dev-list-informers-item">
                        <div class="chart">
                            <input class="knob" data-width="100" data-max="100" data-fgColor="#df6255" value="20" data-thickness=".1"/>
                        </div>
                        <div class="info">
                            <h5>Sugerencias</h5>
                            <p>Total - <strong>2048</strong></p>
                            <p>Respondidas - <strong>1291</strong></p>
                            <p>Por responder - <strong>757</strong></p>
                        </div>
                    </div> 
                </div>                        
            </div>
            <!-- ./informers -->
        </div>
        <!-- ./page footer container -->


        <div id="container1" class="wrapper wrapper-white">
            <div class="row">
                <div class="col-md-12">
                    <div class="page-subtitle">
                    </div>
                    <div id="jajax">
                        <div id="container20" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
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
                    </div>


                </div>
            </div>
        </div> 
        <div id="container2" class="wrapper wrapper-white">
            <div class="row">
                <div class="col-md-6">
                    <div class="page-subtitle">
                    </div>
                    <div id="container30" style="min-width: 410px; max-width: 900px; height: 400px; margin: 0 auto"></div>
                </div>
                <div class="col-md-6">
                    <div class="page-subtitle">
                    </div>                                    
                    <div id="container22" style="min-width: 410px; max-width: 900px; height: 400px; margin: 0 auto"></div>                                     
                </div>
            </div>
        </div>     
        <div id="container3" class="wrapper wrapper-white">
            <div class="row">
                <div class="col-md-6">
                    <div class="page-subtitle">
                    </div>
                    <div id="container33" style="min-width: 410px; max-width: 900px; height: 400px; margin: 0 auto"></div>
                </div>
                <div class="col-md-6">
                    <div class="page-subtitle">
                    </div>                                    

                </div>
            </div>
        </div>     
    </body>
</html>
<script type="text/javascript">
    $(function() {
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
    });
</script>

<script>
    var charts = {
        init: function() {
            // Sparkline                    
            if ($(".sparkline").length > 0)
                $(".sparkline").sparkline('html', {enableTagOptions: true, disableHiddenCheck: true});
            // End sparkline
        }
    };
    var knob = {
        init: function() {
            if ($(".knob").length > 0)
                $(".knob").knob();
        }
    };

    $(function() {
        charts.init();
        knob.init();
    });
</script>
<script type="text/javascript">
    $(function() {

        function cb(start, end) {
            $('#reportrange span').html(start.format('YYYY-MM-DD') + ' - ' + end.format('YYYY-MM-DD'));
        }
        cb(moment().startOf('year'), moment().endOf('year'));

        $('#reportrange').daterangepicker({
            "locale": {
                "format": "YYYY-MM-DD",
                "separator": " - ",
                "applyLabel": "Aplicar",
                "cancelLabel": "Cancelar",
                "fromLabel": "Desde",
                "toLabel": "Hasta",
                "customRangeLabel": "Intervalo personalizado",
                "daysOfWeek": [
                    "Do",
                    "Lu",
                    "Ma",
                    "Mi",
                    "Ju",
                    "Vi",
                    "Sa"
                ],
                "monthNames": [
                    "Enero",
                    "Febrero",
                    "Marzo",
                    "Abril",
                    "Mayo",
                    "Junio",
                    "Julio",
                    "Agosto",
                    "Septiembre",
                    "Octubre",
                    "Noviembre",
                    "Diciembre"
                ],
                "firstDay": 1
            },
            "startDate": moment().startOf('year'),
            "endDate": moment().endOf('year'),
            ranges: {
                'Primer semestre': [moment().startOf('year'), moment().endOf('year').subtract(6, 'month')],
                'Segundo semetre': [moment().startOf('year').add(6, 'month'), moment().endOf('year')],
                'Este Año': [moment().startOf('year'), moment().endOf('year')],
                'Año pasado': [moment().subtract(1, 'year').startOf('year'), moment().subtract(1, 'year').endOf('year')]
            }
        }, cb);

        $('#reportrange').on('apply.daterangepicker', function(ev, picker) {
            $.ajax({
                url: 'Controller?accion=comportamientoFragmento',
                data: 'inicio=' + picker.startDate.format('YYYY-MM-DD') + '&final=' + picker.endDate.format('YYYY-MM-DD'),
                type: 'post',
                success: function(data) {
                    $("#jajax").empty();
                    $("#jajax").html(data);
                }
            });

        });

    });
</script>

<script type="text/javascript">
    $(function() {
        var chart2 = new Highcharts.Chart({
            chart: {
                type: 'bar',
                renderTo: 'container22',
                backgroundColor: 'rgba(255, 255, 255, 0.1)'
            },
            title: {
                text: 'MEDIOS DE INGRESO DE LAS PQRS'
            },
            xAxis: {
                categories: ['Web', 'Correo electronico', 'Telefono', 'Verbal', 'Manual', 'Fax'],
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
                bar: {
                    dataLabels: {
                        enabled: true,
                        formatter: function() {
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
                    data: [${fn:length(Web)}, ${fn:length(Correo)}, ${fn:length(Telefono)}, ${fn:length(Verbal)}, ${fn:length(Manual)}, ${fn:length(Fax)}]
                }]
        });
    });
</script>

<script type="text/javascript">
    $(function() {
        var chart3 = new Highcharts.Chart({
            chart: {
                type: 'column',
                renderTo: 'container30',
                backgroundColor: 'rgba(255, 255, 255, 0.1)'
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
                        formatter: function() {
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

<script type="text/javascript">
    $(function() {
        var chart33 = new Highcharts.Chart({
            chart: {
                type: 'bar',
                renderTo: 'container33',
                backgroundColor: 'rgba(255, 255, 255, 0.1)'
            },
            title: {
                text: 'COMPORTAMIENTO GENERAL DE PQRS'
            },
            xAxis: {
                categories: ['Pqrs recibidas', 'Remisiones oportunas', 'Respuestas oportunas', 'Respuestas pertinentes'],
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
                bar: {
                    dataLabels: {
                        enabled: true,
                        formatter: function() {
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
                    data: [${fn:length(recibidas)}, ${fn:length(remitidas)}, ${fn:length(respondidas)},${fn:length(pertinentes)}]
                }]
        });
    });
</script>