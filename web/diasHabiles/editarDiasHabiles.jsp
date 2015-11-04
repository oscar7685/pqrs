<link rel="stylesheet" href="css/pickmeup.css" type="text/css" />
<link rel="stylesheet" media="screen" type="text/css" href="css/demo.css" />
<div class="container">

    <!-- Horizontal Form -->
    <div class="wrapper wrapper-white">
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
            default_date: false,
            select_month: false,
            min: '01-11-2015',
            date: '01-11-2015'

        });

        $("#actualizarCalendario").click(function () {
            console.log($('.multiple').pickmeup('get_date', false));
        });
    });
</script>
