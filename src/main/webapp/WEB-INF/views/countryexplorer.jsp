<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
     <!-- Bootstrap Font Icon CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<title>Country explorer</title>

<style>
	body{
   	 background-color: lightgrey ;

	}
	
hr {
 border: 2px solid orange;
}

.mappa{
	padding-left:15px;
}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js">
 </script>
 
 
  <!-- Script google map -->
   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  
  <script type="text/javascript">
  
       var myApp = angular.module("myApp", []);  // prendo l app e la metto in myapp
       
       myApp.controller("userController", function($scope, $http) { //$scope -> oggetto condiviso tra views a model
       
              var url = "https://restcountries.com/v2/all"; 

              this.sceltapaese = function(indice){
                $scope.paesescelto = listaPaesi[indice];
				this.mappa(indice);
              }

              $scope.init = function (){
                $http.get(url).then(
                		
                          function (response) {
                        	  	var sceltainit = Math.round(Math.random()*250);
                                $scope.listaPaesi = response.data;
                                this.listaPaesi = $scope.listaPaesi;
                                $scope.paesescelto = listaPaesi[sceltainit];
                                this.mappa(sceltainit);
                           });
              }
              
              this.mappa= function(indice){
            	  google.charts.load('current', {
            	        'packages':['geochart'],
            	      });
            	      google.charts.setOnLoadCallback(drawRegionsMap);
            	      function drawRegionsMap() {
            	        var data = google.visualization.arrayToDataTable([
            	        	['Country', 'Popularity'],
            	            [listaPaesi[indice].name,  listaPaesi[indice].population]
            	        ]);

            	        var options = { colorAxis: {colors: ['orange', 'orange']}};

            	        var chart = new google.visualization.GeoChart(document.getElementById('regions_div'));

            	       $scope.draw = chart.draw(data, options);
            	      }
              }
              
              
              
              
       });
</script>
</head>
<body ng-app="myApp" ng-controller="userController as uc" data-ng-init="init()" data-ng-load="mappa()">
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand/logo -->
  <a class="navbar-brand" href="#">
 
   <img src= <%=request.getContextPath() + "/resources/img/logoTr.jpg"%> alt="logo" style="width:40px;" />
 
  </a>

    <!-- Links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href=<%=request.getContextPath() + "/home"%>>Home Page</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href=<%=request.getContextPath() + "/resources/gameArea.html"%>>Game Zone</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="countryexplorer">Country Explorer</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="profile">Profile</a>
        </li>
        <li>
            <form:form   action="logout" >
                <input type="submit" value="logout" class="btn btn-danger">
            </form:form>
        </li>
    </ul>
</nav>

 <div class="container-fluid p-5  text-white text-center" style="background-color:orange">
        <h1>Country Explorer 🌍</h1>
 </div>
 <div class= "container mt-5">
 <div class="row">
        <div class="col-md">
            <p class="h2">
Select the country:</p>
        </div>
 </div>
 <div class="row mt-3">
 	<div class="col-md-12">
 		<select ng-model="selectedItem" class="form-select" aria-label="Default select example" ng-change="uc.sceltapaese(selectedItem)">
	        <option value=”--” default value=”-1”>
	        <option ng-repeat="x in listaPaesi"  value="{{$index}}">{{x.name}}</option>
	    </select>
 	</div>
 </div>
 <div class="row mt-3">
 	<div class="col-md ">
 		<img class="rounded" src="{{paesescelto.flag}}" width="500px" class="bandiera">
 	</div>
 	<div class="col-md">
 		
	           <div class="d-inline"><label class="h2"> {{paesescelto.name}}</label> </div><br>
	           <div class="d-inline"><label class="h5">Capital city: </label> <label class="h3">  {{paesescelto.capital}}</label></div><br>
	           <div class="d-inline"><label class="h5">Continent: </label> <label class="h3"> {{paesescelto.region}}</label></div><br>
	           <div class="d-inline"><label class="h5">Sub-Continent: </label>  <label class="h3">  {{paesescelto.subregion}}</label></div><br>
	           <div class="d-inline"><label class="h5">Surface: </label> <label class="h3"> {{paesescelto.area}} Kmq</label></div><br>
	           <div class="d-inline"><label class="h5">Population: </label> <label class="h3"> {{paesescelto.population}} of {{paesescelto.demonym}}</label></div><br>
	           <div class="d-inline"><label class="h5">Currency: </label>  <label class="h3">  {{paesescelto.currencies[0].name}}</label></div><br>
	</div>
	
 </div>
 
 <hr>
 
 <div class= "mappa">
 <div class="row mt-3">
		<div class="col-md"><label class="h3"> Where is the country situated? </label> </div>
	</div>
	<div class="row mt-2" ng-change="uc.mappa(selectedItem)">
		<div id="regions_div" style="width: 900px; height: 500px;">{{draw}}</div>
	</div>
 </div>
 </div>
 
<br>
<br>
<br>


<footer class=" text-center text-lg-start bg-dark ">
  <!-- Copyright -->
  <div class="text-center p-3 text-white" >
     © 2021 Copyright: DH10 
  </div>
  <!-- Copyright -->
</footer>


</body>
</html>