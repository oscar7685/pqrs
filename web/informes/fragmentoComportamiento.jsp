<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- page footer container -->
<div class="dev-page-footer-container">
    <!-- informers -->
    <div class="dev-page-footer-container-content" id="footer_content_1">                        
        <div class="dev-list-informers">                            
            <div class="dev-list-informers-item">
                <div class="chart">
                    <input class="knob" data-width="100" data-max="100" data-fgColor="#df6255" 
                           value='<fmt:formatNumber type="number" maxFractionDigits="0" value="${CantP*100/totalPQRS}"/>' 
                           data-thickness=".1"/>
                </div>
                <div class="info">
                    <h5>Peticiones</h5>
                    <p>Total: <strong>${CantP}</strong></p>
                    <p>Respondidas: <strong>${CantPr}</strong></p>
                    <p>Por responder: <strong>${CantP - CantPr}</strong></p>
                </div>
            </div>

            <div class="dev-list-informers-item">
                <div class="chart">
                    <input class="knob" data-width="100" data-max="100" data-fgColor="#df6255" 
                           value='<fmt:formatNumber type="number" maxFractionDigits="0" value="${CantQ*100/totalPQRS}"/>' 
                           data-thickness=".1"/>
                </div>
                <div class="info">
                    <h5>Quejas</h5>
                    <p>Total:  <strong>${CantQ}</strong></p>
                    <p>Respondidas: <strong>${CantQr}</strong></p>
                    <p>Por responder: <strong>${CantQ - CantQr}</strong></p>
                </div>
            </div>

            <div class="dev-list-informers-item">
                <div class="chart">
                    <input class="knob" data-width="100" data-max="100" data-fgColor="#df6255" 
                           value='<fmt:formatNumber type="number" maxFractionDigits="0" value="${CantR*100/totalPQRS}"/>'
                           data-thickness=".1"/>
                </div>
                <div class="info">
                    <h5>Reclamos</h5>
                    <p>Total: <strong>${CantR}</strong></p>
                    <p>Respondidas: <strong>${CantRr}</strong></p>
                    <p>Por responder: <strong>${CantR - CantRr}</strong></p>
                </div>
            </div>
            <div class="dev-list-informers-item">
                <div class="chart">
                    <input class="knob" data-width="100" data-max="100" data-fgColor="#df6255" 
                           data-thickness=".1"
                           value='<fmt:formatNumber type="number" maxFractionDigits="0" value="${CantS*100/totalPQRS}"/>'/>
                </div>
                <div class="info">
                    <h5>Sugerencias</h5>
                    <p>Total: <strong>${CantS}</strong></p>
                    <p>Respondidas: <strong>${CantSr}</strong></p>
                    <p>Por responder: <strong>${CantS - CantSr}</strong></p>
                </div>
            </div> 
        </div>                        
    </div>
    <!-- ./informers -->
</div>



<div class="row">
    <div class="col-md-12">
        <div class="wrapper padding-bottom-0">
            <div class="dev-table">    
                <c:if test="${fn:length(procesos)>0}">
                    <div class="dev-col">                                    

                        <div class="dev-widget dev-widget-transparent">
                            <h2>${procesos.get(0)}</h2>
                            <p>Porcentaje</p>                                        
                            <div class="dev-stat"><span class="counter">
                                    <fmt:formatNumber type="number" maxFractionDigits="0" value="${cantidadXProceso.get(0)*100/total}"/></span>%
                            </div>                                                                                
                            <div class="progress progress-bar-xs">
                                <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: ${cantidadXProceso.get(0)*100/total}%;"></div>
                            </div>                                        
                            <p><strong>Proceso más afectado</strong></p>
                        </div>

                    </div>
                </c:if>
                <c:if test="${fn:length(procesos)>1}">
                    <div class="dev-col">                                    
                        <div class="dev-widget dev-widget-transparent dev-widget-success">
                            <h2>${procesos.get(1)}</h2>
                            <p>Porcentaje</p>                                        
                            <div class="dev-stat"><span class="counter">
                                    <fmt:formatNumber type="number" maxFractionDigits="0" value="${cantidadXProceso.get(1)*100/total}"/></span>%    
                            </div>                                                                                
                            <div class="progress progress-bar-xs">
                                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: ${cantidadXProceso.get(1)*100/total}%;"></div>
                            </div>                                        
                            <p><strong>Segundo Proceso más afectado</strong></p>
                        </div>

                    </div>
                </c:if>
                <c:if test="${fn:length(procesos)>2}">
                    <div class="dev-col">                                    

                        <div class="dev-widget dev-widget-transparent dev-widget-danger">
                            <h2>${procesos.get(2)}</h2>
                            <p>Porcentaje</p>     
                            <div class="dev-stat"><span class="counter">
                                    <fmt:formatNumber type="number" maxFractionDigits="0" value="${cantidadXProceso.get(2)*100/total}"/></span>%    
                            </div>                                                                                
                            <div class="progress progress-bar-xs">
                                <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: ${cantidadXProceso.get(2)*100/total}%;"></div>
                            </div>                                        
                            <p><strong>Tercer Proceso más afectado</strong></p>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>                


<!-- ./page footer container -->

<div id="container1" class="wrapper">
    <div class="row">
        <div class="col-md-12">
            <div class="page-subtitle">
            </div>
            <div>

                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#grafica1" aria-controls="home" role="tab" data-toggle="tab">Grafica</a></li>
                    <li role="presentation"><a href="#datos1" aria-controls="profile" role="tab" data-toggle="tab">Datos</a></li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="grafica1">
                        <div id="container20" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="datos1">
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
            },
            legend: {
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
                            var pcnt = (this.y / ${total}) * 100;
                            return Highcharts.numberFormat(pcnt) + '%';
                        }
                    }
                }
            },
            legend: {
                enabled: false
            },
            credits: {
                enabled: false
            },
            series: [{
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
                            var pcnt = (this.y / ${total}) * 100;
                            return Highcharts.numberFormat(pcnt) + '%';
                        }
                    }
                }
            },
            legend: {
                enabled: false
            },
            credits: {
                enabled: false
            },
            series: [{
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
                            var pcnt = (this.y / ${total}) * 100;
                            return Highcharts.numberFormat(pcnt) + '%';
                        }
                    }
                }
            },
            legend: {
                enabled: false
            },
            credits: {
                enabled: false
            },
            series: [{
                    data: [${recibidas}, ${remitidas}, ${respondidas},${pertinentes}]
                }]
        });
    });
</script>
<script type="text/javascript" src="js/plugins/waypoint/waypoints.min.js"></script>
<script type="text/javascript" src="js/plugins/counter/jquery.counterup.min.js"></script>
<script>
    jQuery(document).ready(function($) {
        if ($(".counter").length > 0)
            $(".counter").counterUp({delay: 10, time: 1000});
    });
</script>



