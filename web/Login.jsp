<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Scrolling Nav - Start Bootstrap Template</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <style>
            .login-container{
                margin-top: 5%;
                margin-bottom: 5%;
            }
            .login-logo{
                position: relative;
                margin-left: -41.5%;
            }
            .login-logo img{
                position: absolute;
                width: 20%;
                margin-top: 19%;
                background: #282726;
                border-radius: 4.5rem;
                padding: 5%;
            }
            .login-form-1{
                padding: 9%;
                background:#cc0000;
                box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
            }
            .login-form-1 h3{
                text-align: center;
                margin-bottom:12%;
                color:#fff;
            }
            .login-form-2{
                padding: 9%;
                background: grey;
                box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
            }
            .login-form-2 h3{
                text-align: center;
                margin-bottom:12%;
                color: #fff;
            }
            .btnSubmit{
                font-weight: 600;
                width: 50%;
                color: #282726;
                background-color: #fff;
                border: none;
                border-radius: 1.5rem;
                padding:2%;
            }
            .btnForgetPwd{
                color: #fff;
                font-weight: 600;
                text-decoration: none;
            }
            .btnForgetPwd:hover{
                text-decoration:none;
                color:#fff;
            }
        </style>

    </head>

    <body id="page-top">
        
        <%
            String error = (String) request.getAttribute("error");
            System.out.println(error);
        %>
        
        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-secondary fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">
                    <img src="https://www.exavalu.com/wp-content/uploads/2019/05/exavaluLogo.png" alt="" width="150" height="50" class="d-inline-block align-mid">
                    ASSET MANAGEMENT
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item" id="errorMessage"></li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="index.jsp" style ="color: white">Home</a>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>

        <br>
        <br>
        <br>
        <!-- admin login section -->
        <div class="container login-container">
            <div class="row">
                <div class="col-md-6 login-form-1">
                    <h3>Admin Login</h3>
                    <form method="post" action="Login">
                        <div class="form-group">
                            <input type="text" id="adminemail" name="email" class="form-control" placeholder="Enter Email" value="" />
                        </div>
                        <div class="form-group">
                            <input type="password" name="password" class="form-control" placeholder="Enter Password" value="" />
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btnSubmit" value="Login" />
                        </div>
                        <!-- <div class="form-group">
                            <a href="#" class="btnForgetPwd">Forget Password?</a>
                        </div> -->
                    </form>

                    <script>
                        if (errorMessage === "fail")
                            document.getElementById("adminemail").placeholder = "wrong";
                    </script>
                </div>

                <!-- user login section-->
                <div class="col-md-6 login-form-2">
                    <div class="login-logo">
                        <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt=""/>
                    </div>
                    <h3>User Login</h3>
                    <form method="POST" action="UserLogin">
                        <div class="form-group">
                            <input type="text" class="form-control" name="email" placeholder="Enter Email" value="" />
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" name="password" placeholder="Enter Password" value="" />
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btnSubmit" value="Login" />
                        </div>
                        <!-- <div class="form-group">
    
                            <a href="#" class="btnForgetPwd" value="Login">Forget Password?</a>
                        </div> -->
                    </form>
                </div>
            </div>
        </div>


        <footer class="py-5 bg-dark">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; Team3@exavalu</p>
            </div>
            <!-- /.container -->
        </footer>       


        <!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
    </body>

</html>
