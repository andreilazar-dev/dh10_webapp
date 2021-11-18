<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@taglib
        uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
   	body{
   	 background-color: lightgrey ;

	}
	
	.carousel-inner img {
    width: 100%;
    height: 100%;
  }
  
  h1 {
  	color : orange !important;
  	 font-weight: bold;
  	 text-shadow: 1px 1px black;
  }
  
   p{
      font-size:20px;
     }
     
    h2{
    	text-shadow: 1px 1px orange;
    }
     
   </style>
</head>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand/logo -->
  <a class="navbar-brand" href="#">
 
   <img src= <%=request.getContextPath() + "/resources/img/logoTr.jpg"%> alt="logo" style="width:40px;" />
 
  </a>
  
  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="#">Home Page</a>
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



<div id="demo" class="carousel slide" data-ride="carousel">

  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src= <%=request.getContextPath() + "/resources/img/logo_carosello.png"%> alt="Logo DH10" width="1100" height="500">
      <div class="carousel-caption">
   
      </div>   
    </div>
    <div class="carousel-item">
      <img src=<%=request.getContextPath() + "/resources/img/logo2.png"%> alt="GameAreaImg" width="1100" height="500">
      <div class="carousel-caption">
       
      </div>   
    </div>
    <div class="carousel-item">
      <img src=<%=request.getContextPath() + "/resources/img/logoNero.png"%> alt="CountryImg" width="1100" height="500">
      <div class="carousel-caption">
 
      </div>   
    </div>
  </div>
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>




<div class="jumbotron text-center">
  <h1  >WELCOME TO DH10 WEB APPLICATION</h1>
  <h4> Are you ready to explore DH10 world? &#128187 </h4>
  <p> In this web application you can have fun playing our videogams or else you can browse some informations
  about nations in the countries explorer section.<br> i won't to spoil more, so jump in the site! </p> 
</div>

<br>
<br>

<div class="container">
  <h2>Main works</h2>
  <p>Here there are our main works that will explain the various skills and technology that we learned in the course.</p>
  <p>we decided to focus our web application to three different areas and you can find theese down below</p>
  <p><strong>Note:</strong> we work was equally divided in 4 part as many developer this webapp has</p>
  <div class="card-deck">
  <!-- carta uno -->
    <div class="card" style="width:400px">
      <div class="card-body text-center">
       <img class="card-img-top" src=<%=request.getContextPath() + "/resources/img/logo_card.png"%> alt="Card image" style="width:100%">
       <div class="card-body">
         <h4 class="card-title">DH10 webapp</h4>
      <p class="card-text">
our main job was to put into practice the skills acquired during the course. 
therefore we have tried to include
 as many technologies as possible within the site.</p>
      <a href="#"  onClick="window.location.reload();" class="btn btn-primary">Home page</a>
    </div>
      </div>
    </div>
   
     <div class="card" style="width:400px">
      <div class="card-body text-center">
       <img class="card-img-top" src=<%=request.getContextPath() + "/resources/img/game_zone.png"%> alt="Card image" style="width:100%">
       <div class="card-body">
         <h4 class="card-title">Game Zone</h4>
      <p class="card-text">In the game zone you can have fun trying our games developed during the course.There are 4 games all with the same initial imprinting which have then been customized</p>
      <a href=<%=request.getContextPath() + "/resources/gameArea.html"%> class="btn btn-primary">Game Zone</a>
    </div>
      </div>
    </div>
    
     <div class="card" style="width:400px">
      <div class="card-body text-center">
       <img class="card-img-top" src=<%=request.getContextPath() + "/resources/img/bandiere.png"%> alt="Card image" style="width:100%">
       <div class="card-body">
         <h4 class="card-title">Country Explorer</h4>
      <p class="card-text">
In this section you can explore the world. <br> I mean that you can discover the various geographical characteristics of each country</p>
      <a href= <%=request.getContextPath() + "/countryexplorer"%> class="btn btn-primary">Country Explorer</a>
    </div>
      </div>
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