<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix = "form"%>
<!DOCTYPE html>
<html>
<head>
    <title>JSP Test Country Checker</title>
</head>

<body>
<h1>Test Country Checker</h1>

	<form:form method = "POST" action = "com.dh10.dh10_web/countryTest">
		<table>
            <tr>
               <td><form:label path = "country">Countrys</form:label></td>
               <td><form:input path = "country" /></td>
            </tr>
		</table>
		<input type = "submit" value = "Submit"/>
	</form:form>



</body>	
	
</html>