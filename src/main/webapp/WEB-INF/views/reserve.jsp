<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib
        uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500&display=swap" rel="stylesheet">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">

<!-- cdnjs.com / libraries / fontawesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" charset="utf-8"></script>

<!-- css ekternal -->
<link rel="stylesheet" href="resources/css/style.css">
<title>Administrator Area</title>
<style>
    .card{
        transition: all 0.3s ease-in;
    }
    .card:hover{
        transform: translateY(-8px);
    }
</style>


<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
        var data = google.visualization.arrayToDataTable([
            ${html}
        ]);

        var options = {
            title: ' ',
            pieHole: 0.4,
        };


        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));

        chart.draw(data, options);
    }
</script>


</head>

<body>
<!-- start wrapper -->
<div class="wrapper">
    <nav id="sidebar">
        <div class="sidebar-header">
            <h3>Hello! ${userName} </h3>
        </div>
        <ul class="lisst-unstyled components">
            <li class="active">
                <a href="#foodSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Info</a>
                <ul class="collapse lisst-unstyled" id="foodSubmenu">
                    <li><a href="#">Name: ${name}</a></li>
                    <li><a href="#">Surname: ${surname}</a></li>
                </ul>
            </li>
            <li>
                <div class="container">
                    <div class="row">
                        <form:form   action="logout" >
                            <button type="submit" class="btn btn-warning" value="signout" id="submit">Sign out</button>
                        </form:form>
                    </div>
                </div>
            </li>
        </ul>
    </nav>

    <div id="content">

        <div class="container">
            <div class="row mt-5">
                <nav class="navbar navbar-expand-lg">
                    <div class="container-fluid">
                        <button type="button" id="sidebarCollapse" class="btn btn-dark">
                            <i class="fas fa-bars"></i><span> </span>
                        </button>
                    </div>
                </nav>
                <div class="col-md">
                    <p class="h1">Statistica algoritmi:</p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-3 align-content-md-center">
                    <div id="donutchart" style="width: 800px; height: 400px;"></div>
                </div>
                <div class="col-md-3"></div>
            </div>
            <div class="row align-content-md-center mt-2">
                <div class="col-md mt-3">

                    <div class="card text-center shadow-lg">

                        <div class="card-body">
                            <h5 class="card-title">Sinonimi da approvare</h5>
                            <p class="card-text ">Numero di sinonimi da approvare
                            <h1 class="card-text" style="color:orange; font-weight: bold;">${countToApprove}</h1></p>
                            <form:form id="visSynA" modelAttribute="synonymusapprove" action="fetchApprove" method="post">
                                <p><input type="submit" value="GO!" class="btn btn-primary"></p>
                            </form:form>
                        </div>
                    </div>
                </div>
                <div class="col-md mt-3">
                    <div class="card text-center shadow-lg" >

                        <div class="card-body">
                            <h5 class="card-title">Sinonimi senza soluzione</h5>
                            <p class="card-text">Numero di sinonimi senza soluzione
                            <h1 class="card-text" style="color: red; font-weight: bold;">${countToAssociate}</h1></p>
                            <form:form id="visSynNF" modelAttribute="synonymousnotfound" action="fetchNoFound" method="post">
                                <p><input type="submit" value="GO!" class="btn btn-primary"></p>
                            </form:form>
                        </div>
                    </div>
                </div>
                <div class="col-md mt-3">
                    <div class="card text-center shadow-lg" >

                        <div class="card-body">
                            <h5 class="card-title">Sinonimi</h5>
                            <p class="card-text">Numero totale di sinonimi
                            <h1 class="card-text" style="color:green; font-weight: bold;">${countAll}</h1></p>
                            <form:form id="visSynF" modelAttribute="synonymous" action="fetch" method="post">
                                <p><input type="submit" value="GO!" class="btn btn-primary"></p>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row align-content-md-center mt-4">
                <div class="col-md mt-3">
                    <div class="card text-center shadow-lg" >

                        <div class="card-body">
                            <h5 class="card-title">Nazioni</h5>
                            <p class="card-text">Numero totale di nazioni
                            <h1 class="card-text" style="color:green; font-weight: bold;">${countCountry}</h1></p>
                            <form:form id="visSynF" modelAttribute="synonymous" action="fetchCountry" method="post">
                                <p><input type="submit" value="GO!" class="btn btn-primary"></p>
                            </form:form>
                        </div>
                    </div>
                </div>

            </div>


        </div>


    </div>

</div>
<!-- wrapper and -->


<!-- Option 2: jQuery, Popper.js, and Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
<script>
    $(document).ready(function() {
        $("#sidebarCollapse").on('click',function() {
            $("#sidebar").toggleClass('active');
        });
    });
</script>
</body>
</html>