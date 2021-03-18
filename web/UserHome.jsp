<%@page import="eams.bean.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>User-Home_Page</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/scrolling-nav.css" rel="stylesheet">





        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"> 

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous"> 






        <style>



            .card {
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
                max-width: 300px;
                margin: auto;
                text-align: center;
                font-family: arial;
                border : 4 px;
                border-color: black;
                background-color :#cc0000;

            }

            .price {
                color: grey;
                font-size: 22px;
            }

            .card button {
                border: none;
                outline: 0;
                padding: 12px;
                color: #cc0000,;
                background-color: #A4A4A4;
                text-align: center;
                cursor: pointer;
                width: 100%;
                font-size: 18px;
                font-weight: bold;
                font-family: Cursive;
                font-style :LucidaHandwriting
            }

            .card button:hover {
                opacity: 0.7;
            }
        </style>

    </head>


    <body id="page-top">

        <%
            User user = (User) request.getSession().getAttribute("user");
        %>

        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-secondary fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="#">
                    <img src="https://www.exavalu.com/wp-content/uploads/2019/05/exavaluLogo.png" alt="" width="200" height="50" class="d-inline-block align-mid">
                    ASSET MANAGEMENT
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" style ="font-weight: bold; color: white">USER ID: <c:out value="${user.getUserId()}"></c:out></a>
                        </li>
                        <li class="nav-item">
                                <a class="nav-link js-scroll-trigger" style ="font-weight: bold; color: white">Email: <c:out value="${user.getUserName()}"></c:out></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="Logout" style ="font-weight: bold; color: white">Logout</a>
                        </li>


                    </ul>
                </div>
            </div>
        </nav>



        <br>
        <br>
        <br>
        <br>


        <div class="container"> 
            <div class="row"> 
                <div class="col-lg-6 mb-4"> 
                    <div class="card">
                        <img src="https://novosolutions.com/wp-content/uploads/2016/08/am-better-organization-control.jpg" alt="Denim Jeans" style="width:300px;height:300px">
                        <p style="font-color : black ; font-weight: bold ">Using the below button you can see the assets which is allocated to you.</p>
                        <p><button>My Asset</button></p>
                    </div>
                </div>

                <div class="col-lg-6 mb-4"> 
                    <div class="card">
                        <img src="https://revisionprocess.com/wp-content/uploads/2015/10/problem-solution2.jpg" alt="Denim Jeans" style="width:300px;height:300px">
                        <p style="font-color : black ; font-weight: bold ">Using the below button you can see generate request for your assets.</p>
                        <p><button>Raise Request</button></p>
                    </div>
                </div>
            </div>
        </div>





        <br>
        <br>
        <!-- Footer -->
        <footer class="py-5 bg-dark">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; Team3@exavalu</p>
            </div>
            <!-- /.container -->
        </footer>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Plugin JavaScript -->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom JavaScript for this theme -->
        <script src="js/scrolling-nav.js"></script>

    </body>

</html>
