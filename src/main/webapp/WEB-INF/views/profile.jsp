<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <title>Profile</title>

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

        h1 {
            color : orange !important;
        }

        .gradient-custom {
            /* fallback for old browsers */
            background: #f6d365;

            /* Chrome 10-25, Safari 5.1-6 */
            background: -webkit-linear-gradient(to right bottom, rgba(246, 211, 101, 1), rgba(253, 160, 133, 1));

            /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            background: linear-gradient(to right bottom, rgba(246, 211, 101, 1), rgba(253, 160, 133, 1))
        }

        #intro {
            background-image: url("<%=request.getContextPath() + "/resources/img/logoTr.jpg"%>");
            height: 100vh;
        }

        /* Height for devices larger than 576px */
        @media (min-width: 992px) {
            #intro {
                margin-top: -58.59px;
            }
        }

        .navbar .nav-link {
            color: #fff !important;
        }

    </style>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <!-- Brand/logo -->
    <a class="navbar-brand" href="#">

        <img src=<%=request.getContextPath() + "/resources/img/logoTr.jpg"%> alt="logo" style="width:40px;"/>

    </a>
    <!-- Links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="home">Home Page</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href=<%=request.getContextPath() + "/resources/gameArea.html"%>>Game area</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="countryexplorer">Country Explorer</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="profile">Profile</a>
        </li>
        <li>
            <form:form action="logout">
                <input type="submit" value="logout" class="btn btn-danger">
            </form:form>
        </li>
    </ul>
</nav>

<!-- Background image -->
<div id="intro" class="bg-image shadow-2-strong">
    <div class="mask" style="background-color: rgba(0, 0, 0, 0.8);">
        <div class="container d-flex align-items-center justify-content-center text-center h-100">
            <!-- Card -->
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-lg-6 mb-4 mb-lg-0">
                        <div class="card mb-3" style="border-radius: .5rem;">
                            <div class="row g-0">
                                <div class="col-md-4 gradient-custom text-center text-white" style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">
                                    <img
                                            src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.png"
                                            alt="..."
                                            class="img-fluid my-5"
                                            style="width: 80px;"
                                    />
                                    <h5>${userName}</h5>
                                    <p>Normal user</p>
                                    <i class="far fa-edit mb-5"></i>
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body p-4">
                                        <h6>Personal Information</h6>
                                        <hr class="mt-0 mb-4">
                                        <div class="row pt-1">
                                            <div class="col-6 mb-3">
                                                <h6>FirstName</h6>
                                                <p class="text-muted">${Name}</p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>LastName</h6>
                                                <p class="text-muted">${LastName}</p>
                                            </div>
                                        </div>
                                        <h6>Country</h6>
                                        <hr class="mt-0 mb-4">
                                        <div class="row">
                                            <div class="col">
                                                <p class="text-muted">${Country}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <!--Card-->
            </div>
        </div>
    </div>
</div>
<!-- Background image -->

<footer class=" text-center text-lg-start bg-dark ">
    <!-- Copyright -->
    <div class="text-center p-3 text-white" >
        © 2021 Copyright: DH10
    </div>
    <!-- Copyright -->
</footer>

</body>
</html>
