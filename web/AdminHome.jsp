
<%@page import="eams.bean.User"%>
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
        <link href="vendor/bootstrap/css/bootstrap.min1.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <style>
            .login-container{
                margin-top: 5%;
                margin-bottom: 5%;
            }
            .login-logo{
                position: relative;
                margin-left: -61.5%;
            }
            .login-logo img{
                position: absolute;
                width: 20%;
                margin-top: 19%;
                background: #cc0000;
                border-radius: 4.5rem;
                padding: 5%;
            }
            .login-form-1{
                padding: 9%;
                background:gray;
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
            .login-form-3{
                padding: 9%;
                background: grey;

                box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
            }
            .login-form-3 h3{
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
            #change {



            }
            .photog {
                position:relative;
                width:30px;
                height:80px;
                margin-left:-55px;
            }
            #change2 {

            }
            .description {
                width:250px;
                height:15%;
                background:#cc0000;
                margin-top:115%;
                position: relative;
                margin-left:-55px;

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
                            <a class="nav-link js-scroll-trigger" style="font-weight: bold; color: white">USER ID: <c:out value="${user.getUserId()}"></c:out></a>
                        </li>
                        <li class="nav-item">
                                <a class="nav-link js-scroll-trigger" style="font-weight: bold; color: white">Email: <c:out value="${user.getUserName()}"></c:out></a>
                        </li>
                        <li class ="nav-item">
                            <a class="nav-link js-scroll-trigger" href="Logout" style="font-weight: bold; color: white">Logout</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <br>
        <br>
        <br>
        <div class="container login-container">
            <div class="row">
                <div class="col-md-6 login-form-1">
                    <div class="photog" >
                        <a href="#"> <img src="https://www.forescout.com/wp-content/uploads/2019/06/asset-mgmt-post-1-image.jpg" alt=""  height="240" width="250"/> </a>
                    </div>
                    <div class="description">
                        <h5>Admin can allocate asset</h5>
                    </div>
                    <div class="login-logo">
                        <a href="#"><img src="https://image.ibb.co/n7oTvU/logo_white.png" alt=""/></a>
                    </div>
                    <h3>Insert Asset</h3>


                    <!-- <div class="form-group">
                        <a href="#" class="btnForgetPwd">Forget Password?</a>
                    </div> -->

                </div>
                <div class="col-md-6 login-form-2" id="change2">
                    <div class="photog" >
                        <a href="EditAsset.jsp"><img src="https://www.forescout.com/wp-content/uploads/2019/12/forescout-asset-management-blog-image.jpg" alt=""  height="240" width="250"/></a>
                    </div>
                    <div class="description">
                        <h5>Admin can edit asset</h5>
                    </div>
                    <div class="login-logo">
                        <a href="EditAsset.jsp"><img src="https://image.ibb.co/n7oTvU/logo_white.png" alt=""/></a>
                    </div>
                    <h3>Edit Asset</h3>


                </div>
                <div class="col-md-6 login-form-3" id="change">
                    <div class="photog" >
                        <img src="https://people-hunters.com/wp-content/uploads/2019/10/How-Does-An-Asset-Based-Loan-Work.jpg" alt=""  height="240" width="250"/>
                    </div>
                    <div class="description">
                        <h5>Admin can track asset</h5>
                    </div>
                    <div class="login-logo">
                        <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt=""/>
                    </div>
                    <h3>Track</h3>

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


