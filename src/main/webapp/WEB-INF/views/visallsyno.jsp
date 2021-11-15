<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    <title>Admin - All synonymus</title>

    <script>
        var app = angular.module("myApp", []);
        app.controller("recuperaPaese",

            function ($scope, $http) {
                $scope.titolo = "Ecco il paese";
                var url = "https://restcountries.com/v2/name/Italy";
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

<div class="container">

    <div class="row mt-5">
        <div class="col-md">
            <p class="h1">Visualizza i sinonimi</p>
        </div>
    </div>
    <div class="row">
        <div class="col-md">
            <p class="h4">Sinonimi presenti nel database: <label style="color:green">${numSyn} </label></p>
        </div>
    </div>
    <div class="row mt-3">
        <table class="table table-striped">
            <thead class="thead-dark">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Nation</th>
                <th scope="col">Algorithm</th>
                <th scope="col">Status</th>
                <th scope="col">Country</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="syn" items="${listSyn}" varStatus="status">
                <tr>
                    <th scope="row">${status.index + 1}</th>
                    <td><c:out value="${syn.synonymus_name}"/></td>
                    <td><c:out value="${syn.algorithm_name}"/></td>
                    <c:if test="${syn.status=='0'}">
                        <td style="color:green"><c:out value="Approvato"/></td>
                    </c:if>
                    <c:if test="${syn.status=='1'}">
                        <td style="color:red"><c:out value="Non approvato"/></td>
                    </c:if>
                    <td><c:out value="${syn.country.getCountry_name()}"/></td>
                    <td><div ng-controller="recuperaPaese">
                        {{state.name }} <img width="20px" height="15px" src="{{state.flag}}">
                    </div></td>
                    <td><a href="country/${syn.country.getCountry_name()}"> CLICKA QUA</a></td>


                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>


</body>
</html>