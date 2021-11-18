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

    <title>Admin - Synonymus not Approved</title>

</head>
<body>


<div class="container">

    <div class="row mt-5">
        <div class="col-md">
            <p class="h1">Visualizza i sinonimi senza soluzione</p>
        </div>
    </div>
    <div class="row">
        <div class="col-md ">
            <label class="h4">Sinonimi senza soluzione: <label style="color:red">${numSyn} </label></label>
            <div class="btn-group float-right">
             <a href="reserve">
   				<input type="button" value="Home" class="btn btn-primary float-right" style="margin-left:5px; "/>
			</a>
			<form:form id="visSynRNF" modelAttribute="refreshSynonymusNofound" action="refreshnofound" method="post">
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
                <th scope="col">Synonymous</th>
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
                    <td>
                        <label for="approved" name="${syn.synonymus_name}">
                            <input type="text" id="approved" name="${syn.synonymus_name}">
                        </label>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <td>
            <button id="submit" type="button" class="btn btn-primary float-right">confirms and approves</button>
        </td>
    </div>
</div>


<script>
    const confirm = document.querySelector('#submit');
    confirm.onclick = () => {
        let approvedJson = '[' ;
        for (i = 0; i < approved.length; i++) {
            if (approved[i].value != ""){
                approvedJson +=
                '{"synonimous" :'+ '"'+approved[i].name+'"'+
                ',"country":'+'"'+$(approved[i]).val() +'"'+'}'
                if( i != approved.length -2){
                    approvedJson += ','
                }
            }
        }
        approvedJson += ']'
            console.log(approvedJson)
        fetch("fetchNoFound/mod", {
            method: "POST",
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify(approvedJson) //parse json string into JS object)
        }).then(res => {
            console.log("Request complete! response:", res);
           // location.reload();
        });
    }
</script>

</body>
</html>