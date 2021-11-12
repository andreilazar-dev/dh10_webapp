<%--
  Created by IntelliJ IDEA.
  User: Andrei Lazar
  Date: 12/11/2021
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<html>
<head>
    <title>Title</title>
    <script>
        var app = angular.module("myApp", []);
        app.controller("recuperaPaese",

            function ($scope, $http) {
                $scope.titolo = "Ecco il paese";
                var url = "https://restcountries.com/v2/name/${stato}";
                $http.get(url).then(
                    function (x) {
                        //alert(JSON.stringify(x));
                        $scope.state = x.data[0];
                    }
                )
            }
        );
    </script>
</head>
<body ng-app="myApp">
<div ng-controller="recuperaPaese">
    {{state.name }} <img width="20px" height="15px" src="{{state.flag}}">
</div>
</body>
</html>
