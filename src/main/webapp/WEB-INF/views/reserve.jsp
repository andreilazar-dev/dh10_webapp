<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%> <%@taglib
        uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
          var leve = parseInt(${levenstein});
          var contains = parseInt(${contains});
          var jaro =  parseInt(${jarowinkler});
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['Levenstein',   leve],
          ['Contains',     contains],
          ['JaroWinkler',  jaro]
        ]);

        var options = {
          title: ' ',
          pieHole: 0.4,
        };


        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));

        chart.draw(data, options);
      }
    </script>

    
<title>Admin - home page</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet"  type="text/css" href= <%=request.getContextPath() + "/resources/styleadmin.css"%>>
</head>
<body>

<div class="container">
    <div class="row mt-5">
        <div class="col-md">
            <p class="h1">Ciao, ${userName} </p>
        </div>
    </div>
    <div class="row align-content-md-center mt-2">
        <div class="col-md mt-3">
            
                <div class="card text-center shadow-lg">
                
                <div class="card-body">
                    <h5 class="card-title">Sinonimi da approvare</h5>
                    <p class="card-text">In questa sezione si trova una lista di sinonimi che dovresti approvare.</p>
                    <p class="card-text ">Ci sono <label style="color:orange; font-weight: bold;">n</label> sinonimi da approvare.</p>
                    <form:form id="visSynA" modelAttribute="synonymusapprove" action="fetchApprove" method="post">
                    <input type="submit" value="GO!" class="btn btn-primary">
                    </form:form>
                </div>
                </div>
        </div>
        <div class="col-md mt-3">
                <div class="card text-center shadow-lg" >
                
                <div class="card-body">
                    <h5 class="card-title">Sinonimi senza soluzione</h5>
                    <p class="card-text">In questa sezione si trova una lista di sinonimi a cui non è stata trovata una corrispondenza nel DB.</p>
                    <p class="card-text">Ci sono <label style="color: red; font-weight: bold;">n</label> sinonimi da associare.</p>
                    <form:form id="visSynNF" modelAttribute="synonymousnotfound" action="fetchNoFound" method="post">
                    <input type="submit" value="GO!" class="btn btn-primary">
                    </form:form>
                </div>
                </div>
        </div>
        <div class="col-md mt-3">
                <div class="card text-center shadow-lg" >
                
                <div class="card-body">
                    <h5 class="card-title">Sinonimi</h5>
                    <p class="card-text">In questa sezione si trova una lista con i sinonimi all'interno del DB, i quali possono essere filtrati.</p>
                    <p class="card-text">Ci sono  <label value="${numberSyn}" style="color:green; font-weight: bold;">${numberSyn}</label> sinonimi nel DB.</p>
                   	<form:form id="visSynF" modelAttribute="synonymous" action="fetch" method="post">
                    <input type="submit" value="GO!" class="btn btn-primary">
                    </form:form>
                </div>
                </div>
        </div>      
    </div>
    
     <div class="row align-content-md-center mt-4">
        <div class="col-md mt-3">
            
                <div class="card text-center shadow-lg">
                
                <div class="card-body">
                    <h5 class="card-title">Utenti</h5>
                    <p class="card-text">In questa sezione si trovano gli utenti presenti nel DB</p>
                   
                    <form:form id="visSynA" modelAttribute="synonymusapprove" action="fetchApprove" method="post">
                    <input type="submit" value="GO!" class="btn btn-primary">
                    </form:form>
                </div>
                </div>
        </div>
        <div class="col-md mt-3">
                <div class="card text-center shadow-lg" >
                
                <div class="card-body">
                    <h5 class="card-title">Utenti altro</h5>
                    <p class="card-text">In questa sezione ci sono cose degli utenti</p>
                    
                    <form:form id="visSynNF" modelAttribute="synonymousnotfound" action="fetchNoFound" method="post">
                    <input type="submit" value="GO!" class="btn btn-primary">
                    </form:form>
                </div>
                </div>
        </div>
    </div>
    
    <div class="row mt-5">
        <div class="col-md">
            <p class="h1">Statistica algoritmi:</p>
        </div>
    </div>
    <div class="row">
        <div class="col-md align-content-md-center">
            <div id="donutchart" class="shadow-lg" style="width: 940px; height: 540px;"></div>
        </div>
    </div>
</div>
            

     
      
      


     
</body>
</html>