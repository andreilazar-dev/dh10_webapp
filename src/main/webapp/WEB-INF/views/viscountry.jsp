<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%> 
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <link rel="stylesheet" type="text/css" href="style.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
   <!-- Bootstrap Font Icon CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    
    <script type="text/javascript">
      google.charts.load('current', {
        'packages':['geochart'],
      });
      google.charts.setOnLoadCallback(drawRegionsMap);

      function drawRegionsMap() {
        var data = google.visualization.arrayToDataTable([
        	${html}
        ]);

        var options = {};

        var chart = new google.visualization.GeoChart(document.getElementById('regions_div'));

        chart.draw(data, options);
      }
    </script>
   <title>Admin - Nazioni</title>
   
</head>
<body>


 
<div class= "container">

	 <div class="row mt-5">
	        <div class="col-md">
	            <p class="h1">Visualizza le nazioni</p>
	        </div>
	</div>
	<div class="row">
        <div class="col-md ">
            <label class="h4">Nazione nel DB: <label>${numCountry} </label></label>
            <div class="btn-group float-right"">
             <a href="reserve">
   				<input type="button" value="Home" class="btn btn-primary float-right" style="margin-left:5px; "/>
			</a>
			<form:form id="visSynRS" modelAttribute="refreshSynonymusAll" action="refreshnofound" method="post">
                  <input type="submit" value="Refresh" class="btn btn-success float-right" style="margin-left:5px;"/>
            </form:form>
            </div>
            
        </div>
    </div>
	<div class="row mt-3">
			<table class="table table-striped">
				<thead class="thead-dark">
				<tr>
					<th scope="col">#</th>
					<th scope="col">Nazione</th>
					<th scope="col">N. Sinonimi</th>
					<th scope="col">Info</th>
				</tr>
				</thead>
			<tbody>
			
			<c:forEach begin="0" end="${fn:length(listCountry) - 1}" var="index">
				<tr>
					<th scope="row">${index + 1}</th>
					<td><c:out value="${listCountry[index]}" /></td>
					<td><c:out value="${numSyn[index]}" /></td>
					<c:if test="${listCountry[index] != null}">
                    <td><a href="country/${listCountry[index]}"> <span class="bi-search"></span></a></td>
                    </c:if>
                    <c:if test="${listCountry[index] == null}">
                    <td></td>
                    </c:if>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="row mt-3">
		<div id="regions_div" style="width: 900px; height: 500px;"></div>
	</div>
</div>



</body>
</html>