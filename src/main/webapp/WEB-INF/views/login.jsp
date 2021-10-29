<%--
  Created by IntelliJ IDEA.
  User: Andrei Lazar
  Date: 28/10/2021
  Time: 13:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%> <%@taglib
        uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login Form</title>
</head>
<body>
<h2><spring:message code="lg.page" text="New Login" /></h2>
<br/>
<form:form method="post" modelAttribute="loginBean">
    <div align="center">
            <%-- <form:errors path="*" cssClass="error" /> --%>
        <table>
            <tr>
                <td><spring:message code="lg.User" text="UserName" /></td>
                <td><form:input path="userName" /></td>
                <td><form:errors path="userName" cssClass="error" /></td>
            </tr>
            <tr>
                <td><spring:message code="lg.Password" text="Password" /></td>
                <td><form:input path="password" /></td>
                <td><form:errors path="password" cssClass="error" /></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Login"/></td>
            </tr>
        </table>
    </div>
</form:form>
</body>
</html>