<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <title>Visualizza la Nazione</title>
    <script>
        var app = angular.module("myApp", []);
        app.controller("recuperaPaese",

            function ($scope, $http) {
                $scope.titolo = "Ecco il paese";
                var url = "https://restcountries.com/v2/name/${state}";
                $http.get(url).then(
                    function (x) {
                        //alert(JSON.stringify(x));
                        $scope.state = x.data[0];
                    }
                )
            }
        );
    </script>
    
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {
        'packages':['geochart'],
      });
      google.charts.setOnLoadCallback(drawRegionsMap);

      function drawRegionsMap() {
        var data = google.visualization.arrayToDataTable([
          ['Country', 'Popularity'],
          ['Germany', 200],
          ['United States', 300],
          ['Brazil', 400],
          ['Canada', 500],
          ['France', 600],
          ['RU', 700]
        ]);

        var options = {};

        var chart = new google.visualization.GeoChart(document.getElementById('regions_div'));

        chart.draw(data, options);
      }
    </script>
</head>
<body ng-app="myApp">
<div ng-controller="recuperaPaese">
    
    <div class= "container">

	 <div class="row mt-5">
	        <div class="col-md">
	            <p class="h1">Visualizza la nazione</p>
	        </div>
	</div>
	<div class="row">
	        <div class="col-md">
	            <p class="h2">  <label>{{state.name }}</label>
	             <a href="/dh10_web/reserve">
   				<input type="button" value="Home" class="btn btn-primary float-right"/>
				</a></p>
	        </div>
	</div>
	<div class="row">
	        <div class="col-md-6">
	           <img width="100%" height="100%" src="{{state.flag}}">
	        </div>
	         <div class="col-md-6">
	           <p><div class="d-inline"><label class="h4">Capitale: </label> {{state.capital}}</div><br>
	           <div class="d-inline"><label class="h4">Continente: </label>  {{state.region}}</div><br>
	           <div class="d-inline"><label class="h4">Sub-Continente: </label>  {{state.subregion}}</div><br>
	           <div class="d-inline"><label class="h4">Superficie: </label> {{state.area}} Kmq</div><br>
	           <div class="d-inline"><label class="h4">Popolazione: </label> {{state.population}} di {{state.demonym}}</div><br>
	           <div class="d-inline"><label class="h4">Moneta: </label> {{state.currencies[0].name}}</div><br>
	           
	           </p>
	        </div>
	</div>
	<div class="row  mt-5">
		<div class="col-md">
			 <div id="regions_div" style="width: 900px; height: 500px;"></div>
		</div>
	</div>
	
</div>
    
</div>
</body>
</html>
