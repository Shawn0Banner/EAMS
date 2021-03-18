<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>User-Raise_Request</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/scrolling-nav.css" rel="stylesheet">



        <style>

            .radio-inline
            {


                font-color : white ; 
                font-weight: bold ;
                font-size: 18px; 
                font-family: Cursive; 
                font-style :LucidaHandwriting;
            }

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
                width: 45%;
                color: #282726;
                background-color: grey;
                border: none;
                border-radius: 1.5rem;
                padding:2%;
                font-family: Cursive; 
                font-style :LucidaHandwriting
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
                            <a class="nav-link js-scroll-trigger" href="Home"style ="font-weight: bold; color: white">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="Logout"style ="font-weight: bold; color: white">Logout</a>
                        </li>


                    </ul>
                </div>
            </div>
        </nav>


        <br>




        <div class="container login-container" style=" ">
            <div class="row">

                <div class="col-md-6 login-form-2">
                    <p></p>
                    <br>
                    <br>
                    <p style="font-color : black ; font-weight: bold ;font-size: 24px; font-family: Cursive; font-style :LucidaHandwriting">Your asset is not working...</p>
                    <p style="font-color : black ; font-weight: bold ;font-size: 24px; font-family: Cursive; font-style :LucidaHandwriting ;text-align: center">Don't worry!!!</p>
                    <p style="font-color : black ; font-weight: bold ;font-size: 24px; font-family: Cursive; font-style :LucidaHandwriting">Fill the right hand side form.</p>

                </div>

                <div class="col-md-6 login-form-1">
                    <h3 style="font-weight: bold ;font-size: 30px; font-family: Cursive; font-style :LucidaHandwriting">REQUEST FOR REPAIR</h3>

                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="User Id" value="" />
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Model Id *" value="" />
                    </div>

                    <form>

                        <label class="radio-inline" style="color : white  ">
                            <input  type="radio" name="optradio" style="color : white  "> Personal Asset 
                        </label>
                        <label class="radio-inline" style="color : white  ">
                            <input  type="radio" name="optradio" style="color : white  "> Departmental Asset
                        </label>
                    </form>
                    <br>
                    <br>
                    <div class="form-group">
                        <input type="submit" class="btnSubmit" value="SUBMIT" />

                        <input type="submit" class="btnSubmit" value="CANCEL" />
                    </div>
                </div>

            </div>
        </div>	





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
