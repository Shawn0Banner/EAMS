
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.80.0">
        <title>Signin Template · Bootstrap v5.0</title>

        <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">



        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Favicons -->
        <link rel="apple-touch-icon" href="/docs/5.0/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
        <link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
        <link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
        <link rel="manifest" href="/docs/5.0/assets/img/favicons/manifest.json">
        <link rel="mask-icon" href="/docs/5.0/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
        <link rel="icon" href="icons/eam-icon.png">
        <meta name="theme-color" content="#7952b3">


        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
        </style>


        <!-- Custom styles for this template -->
        <link href="css/signin.css" rel="stylesheet">
    </head> 
    <script>
        function verifyPassword() {
            var pw = document.getElementById("form3Example5").value;
            var user = document.getElementById("form3Example3").value;
            var dept = document.getElementById("form3Example4").value;

            if (user == "") {
                document.getElementById("message1").innerHTML = "Enter User Name";
            }

            if (dept == "") {
                document.getElementById("message2").innerHTML = "Enter Department Name";
            }


            //check empty password field  
            if (pw == "") {
                document.getElementById("message").innerHTML = "Enter password";
                return false;
            }

            //minimum password length validation  
            if (pw.length < 6) {
                document.getElementById("message").innerHTML = "Password must be 6 characters";
                return false;
            }
            else {
                alert("Password is correct");
            }
        }
    </script> 
    <body class="text-center">
        <div class="container">
            <main class="form-signin">
                <form onsubmit="return verifyPassword()">
                    <img class="mb-4" src="icons/eams-icon.png" alt="" width="200" height="57">
                    <h1 class="h3 mb-3 fw-normal">Register Here</h1>
                    <!-- Email input -->
                    <div class="form-outline mb-4">
                        <input type="text" id="form3Example3" class="form-control" placeholder="User Name" />
                        <span id = "message1" class="bg-danger rounded-2"> </span>
                    </div>

                    <div class="form-outline mb-4">
                        <input type="text" id="form3Example4" class="form-control" placeholder="Department" />    
                        <span id = "message2" class="bg-danger rounded-2"> </span>
                    </div>


                    <!-- Password input -->
                    <div class="form-outline mb-4">
                        <input type="password" id="form3Example5" class="form-control" placeholder="Password"/>
                        <span id = "message" class="bg-danger rounded-2"> </span>
                    </div>

                    <div class="form-outline mb-4">
                        <input type="password" id="form3Example6" class="form-control" placeholder="Re-Type Password"/>
                    </div>
                    <!-- Submit button -->
                    <button type="submit" class="btn btn-primary btn-block mb-4">Sign up</button>
                </form>

            </main>
        </div>

    </body>
</html>
