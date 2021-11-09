<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <title>Registration</title>
</head>
<body>

<div class="jumbotron">
    <h1>Registration:</h1>      
    <p>Please insert your personal data</p>
 </div>
  
<div class="container">
<form:form id="regForm" modelAttribute="user" action="registerProcess" method="post">

  <div class="form-group">
     
            <form:label path="userId">Username:</form:label>
            <form:input path="userId" name="userId" id="userId" class="form-control" placeholder="Enter username" />
  </div>
   <div class="form-group">     
            <form:label path="password">Password:</form:label>
            <form:password path="password" name="password"
                               id="password" class="form-control" placeholder="Enter password"/>
   </div>                       
   <div class="form-group">
       
           <form:label path="firstName">FirstName:</form:label>
           <form:input path="firstName" name="firstName"
                            id="firstName" class="form-control" placeholder="Enter first name"/>
    </div>
    <div class="form-group">
       
            <form:label path="lastName">LastName:</form:label>
            <form:input path="lastName" name="lastName" id="lastName" class="form-control" placeholder="Enter lastName"/>
     </div>
     <div class="form-group">
        
           <form:label path="Country">Country:</form:label>
            <form:input path="Country" name="Country" id="Country" class="form-control" placeholder="Enter country"/>
     </div>
     <div class="form-group">
       
           
          <form:button id="register" name="register" class="btn btn-primary">Register</form:button>
     </div>
     
     <div class="form-group">
           <a href="/dh10_web/">Are you already registered ?</a>
      </div>
   
</form:form>

</div>
</body>

<script>



</script>
</html>