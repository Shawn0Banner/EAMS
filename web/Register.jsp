<html>
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <style>
            .register{
                background: -webkit-linear-gradient(left, #cc0000,grey);
                margin-top: 3%;
                padding: 3%;
            }
            .register-left{
                text-align: center;
                color: #fff;
                margin-top: 4%;
            }
            .register-left input{
                border: none;
                border-radius: 1.5rem;
                padding: 2%;
                width: 60%;
                background: #f8f9fa;
                font-weight: bold;
                color: #383d41;
                margin-top: 30%;
                margin-bottom: 3%;
                cursor: pointer;
            }
            .register-right{
                background: #f8f9fa;
                border-top-left-radius: 10% 50%;
                border-bottom-left-radius: 10% 50%;
            }
            .register-left img{
                margin-top: 15%;
                margin-bottom: 5%;
                width: 25%;
                -webkit-animation: mover 2s infinite  alternate;
                animation: mover 1s infinite  alternate;
            }
            @-webkit-keyframes mover {
                0% { transform: translateY(0); }
                100% { transform: translateY(-20px); }
            }
            @keyframes mover {
                0% { transform: translateY(0); }
                100% { transform: translateY(-20px); }
            }
            .register-left p{
                font-weight: lighter;
                padding: 12%;
                margin-top: -9%;
            }
            .register .register-form{
                padding: 10%;
                margin-top: 10%;
            }
            .btnRegister{
                float: right;
                margin-top: 10%;
                border: none;
                border-radius: 1.5rem;
                padding: 2%;
                background: #cc0000;
                color: #fff;
                font-weight: 600;
                width: 50%;
                cursor: pointer;
            }
            .register .nav-tabs{
                margin-top: 3%;
                border: none;
                background: #0062cc;
                border-radius: 1.5rem;
                width: 28%;
                float: right;
            }
            .register .nav-tabs .nav-link{
                padding: 2%;
                height: 34px;
                font-weight: 600;
                color: #fff;
                border-top-right-radius: 1.5rem;
                border-bottom-right-radius: 1.5rem;
            }
            .register .nav-tabs .nav-link:hover{
                border: none;
            }
            .register .nav-tabs .nav-link.active{
                width: 100px;
                color: #0062cc;
                border: 2px solid #0062cc;
                border-top-left-radius: 1.5rem;
                border-bottom-left-radius: 1.5rem;
            }
            .register-heading{
                text-align: center;
                margin-top: 8%;
                margin-bottom: -15%;
                color: #495057;
            }
        </style>
    </head>

    <script>
        // Function to check Whether both passwords 
        // is same or not. 
        function checkPassword(form) {
            password1 = form.password1.value;
            password2 = form.password2.value;
            email = form.email.value;


            var form1 = document.querySelector("form");

            if (email == '') {
                alert("Please enter email");
                return false;
            }

            if (password1.length < 6) {
                alert("Password should be 6 characters long");
                return false;
            }

            // If password not entered 
            if (password1 == '') {
                alert("Please enter Password");
                return false;
            }

            // If confirm password not entered 
            else if (password2 == '') {
                alert("Please enter confirm password");
                return false;
            }

            // If Not same return False.     
            else if (password1 != password2) {
                alert("\nPassword did not match: Please try again...");
                return false;
            }

            // If same return True. 
            else {
                form1.setAttribute("action", "Register");
                return true;
            }
        }
    </script> 

    <body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-secondary fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">
                    <img src="https://www.exavalu.com/wp-content/uploads/2019/05/exavaluLogo.png" alt="" width="200" height="50" class="d-inline-block align-mid">
                    ASSET MANAGEMENT
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="index.jsp" style ="color: white">Home</a>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>


        <div class="container register">
            <div class="row">
                <div class="col-md-3 register-left">
                    <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt="">
                    <h3>Welcome</h3>
                    <p>Register now to get started!</p>

                </div>
                <div class="col-md-9 register-right">
                    <form method="POST" onsubmit="return checkPassword(this)">
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <h3 class="register-heading">Registration Form</h3>
                                <div class="row register-form">

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input type="email" name="email" class="form-control" placeholder="Enter Email" value="">
                                        </div>
                                        
                                        <div class="form-group">
                                            <input type="text" name="userName" class="form-control" placeholder="Enter User Name" value="">
                                        </div>

                                        <div class="form-group">
                                            <select class="form-control" name="department">
                                                <option class="hidden" selected="" disabled="">Please select your department</option>
                                                <option>HR</option>
                                                <option>Accounts</option>
                                                <option>R&D</option>
                                                <option>IT</option>
                                                <option>Sales</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="password1" class="form-control" placeholder="Enter Password" value="">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="password2" class="form-control" placeholder="Confirm Password" value="">
                                        </div>


                                        <input type="submit" class="btnRegister" value="Register">
                                    </div>
                                </div>
                            </div>

                        </div>
                    </form>
                </div>
            </div>

        </div>   <br><br>
        <footer class="py-3 bg-dark fixed-bottom">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; Team3@exavalu</p>
            </div>
            <!-- /.container -->
        </footer>

        <script type="text/javascript"></script>
    </body>

</html>