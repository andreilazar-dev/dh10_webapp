
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%> <%@taglib
        uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
    <title>Login Form</title>
</head>
<body>
<h2><spring:message code="lg.page" text="New Login" /></h2>
<br/>

<div class="jumbotron">
    <h1>Login:</h1>      
    <p>Please enter your credentials</p>
 </div>
 
<div class= "container">
<form:form method="post" modelAttribute="loginBean">
            
       
         	 <div class="form-group">
  			 <form:label path="userId">Username:</form:label>
             <spring:message code="lg.User" text="UserName" />  
                <form:input path="userId" class="form-control"  placeholder="Enter username" />
               <form:errors path="userId" cssClass="error" />
          </div>
           <div class="form-group">
            <form:label path="password">Password:</form:label>
              <spring:message code="lg.Password" text="Password" />  
               <form:input path="password" class="form-control" placeholder="Enter password" />
               <form:errors path="password" cssClass="error" />
          </div>
         
         <div class="form-group">
                <input type="submit" value="Login" class="btn btn-primary"/>
                
         <div class="form-group">
               <p><a href="register">new user? go to registration page!</a></p>
         </div>
    </div>
</form:form>
</div>

</body>
</html>