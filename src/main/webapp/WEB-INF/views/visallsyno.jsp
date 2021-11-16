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
    <!-- Bootstrap Font Icon CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <title>Admin - All synonymus</title>


</head>
<body>

<div class="container">

    <div class="row mt-5">
        <div class="col-md">
            <p class="h1">Visualizza i sinonimi</p>
        </div>
    </div>
    <div class="row">
        <div class="col-md ">
            <label class="h4">Sinonimi presenti nel DB: <label style="color:green">${numSyn} </label></label>
            <div class="btn-group float-right"">
             <a href="reserve">
   				<input type="button" value="Home" class="btn btn-primary float-right" style="margin-left:5px; "/>
			</a>
			<form:form id="visSynRS" modelAttribute="refreshSynonymusAll" action="refreshallsyno" method="post">
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
                <th scope="col">Nation</th>
                <th scope="col">Algorithm</th>
                <th scope="col">Status</th>
                <th scope="col">Country</th>
                <th></th>
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
                    <c:if test="${syn.country.getCountry_name() != null}">
                    <td><a href="country/${syn.country.getCountry_name()}"> <span class="bi-search"></span></a></td>
                    </c:if>
                    <c:if test="${syn.country.getCountry_name() == null}">
                    <td></td>
                    </c:if>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>


</body>
</html>