<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


        <title>Asset Allocation</title>



        <style type="text/css">
            .navbar .navbar-nav .nav-link {
                color: #cc0000;
                font-size: 1.1em;
                position: relative;
            }
            .navbar .navbar-nav .nav-link:hover {
                color: #cc0000;
            }
            .navbar .navbar-nav .nav-link::after {
                position: absolute;
                bottom: 0;
                left: 0;
                right: 0;
                margin: auto;
                background-color: #cc0000;
                color: transparent;
                width: 0%;
                content: '.';
                height: 3px;
            }
            .navbar .navbar-nav .nav-link:hover::after {
                width: 100%;
            }

            @import url('https://fonts.googleapis.com/css?family=Mukta');
            body{
                font-family: 'Mukta', sans-serif;
                height:100vh;
                min-height:550px;
                background-image: url(http://www.planwallpaper.com/static/images/Free-Wallpaper-Nature-Scenes.jpg);
                background-repeat: no-repeat;
                background-size:cover;
                background-position:center;
                position:relative;
                overflow-y: hidden;
            }
            a{
                text-decoration:none;
                color:#444444;
            }
            .login-reg-panel{
                position: relative;
                top: 50%;
                transform: translateY(-50%);
                text-align:center;
                width:70%;
                right:0;left:0;
                margin:auto;
                height:400px;
                background-color: #cc0000;
            }
            .white-panel{
                background-color: rgba(255,255, 255, 1);
                height:500px;
                position:absolute;
                top:-50px;
                width:50%;
                right:calc(50% - 50px);
                transition:.3s ease-in-out;
                z-index:0;
                box-shadow: 0 0 15px 9px #00000096;
            }
            .login-reg-panel input[type="radio"]{
                position:relative;
                display:none;
            }
            .login-reg-panel{
                color:#B8B8B8;
            }
            .login-reg-panel #label-login, 
            .login-reg-panel #label-register{
                border:1px solid #9E9E9E;
                padding:5px 5px;
                width:150px;
                display:block;
                text-align:center;
                border-radius:10px;
                cursor:pointer;
                font-weight: 600;
                font-size: 18px;
            }
            .login-info-box{
                width:30%;
                padding:0 50px;
                top:20%;
                left:0;
                position:absolute;
                text-align:left;
            }
            .register-info-box{
                width:30%;
                padding:0 50px;
                top:20%;
                right:0;
                position:absolute;
                text-align:left;

            }
            .right-log{right:50px !important;}

            .login-show, 
            .register-show{
                z-index: 1;
                display:none;
                opacity:0;
                transition:0.3s ease-in-out;
                color:#242424;
                text-align:left;
                padding:50px;
            }
            .show-log-panel{
                display:block;
                opacity:0.9;
            }
            .login-show input[type="text"], .login-show input[type="password"]{
                width: 100%;
                display: block;
                margin:20px 0;
                padding: 15px;
                border: 1px solid #b5b5b5;
                outline: none;
            }
            .login-show input[type="button"] {
                max-width: 150px;
                width: 100%;
                background: #444444;
                color: #f9f9f9;
                border: none;
                padding: 10px;
                text-transform: uppercase;
                border-radius: 2px;
                float:right;
                cursor:pointer;
            }
            .login-show a{
                display:inline-block;
                padding:10px 0;
            }

            .register-show input[type="text"], .register-show input[type="password"]{
                width: 100%;
                display: block;
                margin:20px 0;
                padding: 15px;
                border: 1px solid #b5b5b5;
                outline: none;
            }
            .register-show input[type="button"] {
                max-width: 150px;
                width: 100%;
                background: #444444;
                color: #f9f9f9;
                border: none;
                padding: 10px;
                text-transform: uppercase;
                border-radius: 2px;
                float:right;
                cursor:pointer;
            }
            .credit {
                position:absolute;
                bottom:10px;
                left:10px;
                color: #3B3B25;
                margin: 0;
                padding: 0;
                font-family: Arial,sans-serif;
                text-transform: uppercase;
                font-size: 12px;
                font-weight: bold;
                letter-spacing: 1px;
                z-index: 99;
            }
            a{
                text-decoration:none;
                color:#2c7715;
            }
        </style>

        <script>
            function checkAllocateForm(form) {
                email = form.userEmail.value;
                var chks = container1.getElementsByTagName("INPUT");
                var form1 = document.querySelector("form");

                checked = 0;

                //Loop and count the number of checked CheckBoxes.
                for (var i = 0; i < chks.length; i++) {
                    if (chks[i].checked) {
                        checked++;
                    }
                }

                if (email == '') {
                    alert('Enter email');
                    return false;
                } else if (checked <= 0) {
                    alert('Atleast select one asset');
                    return false;
                } else {
                    form1.setAttribute("action", "AllocateAsset");
                    return true;
                }
            }

            function checkDeAllocateForm(form) {
                email = form.userEmail.value;
                var chks = container2.getElementsByTagName("INPUT");
                var form1 = document.getElementById('deAllocateForm')

                checked = 0;

                //Loop and count the number of checked CheckBoxes.
                for (var i = 0; i < chks.length; i++) {
                    if (chks[i].checked) {
                        checked++;
                    }
                }

                if (email == '') {
                    alert('Enter email');
                    return false;
                } else if (checked <= 0) {
                    alert('Atleast select one asset');
                    return false;
                } else {
                    form1.setAttribute("action", "DeAllocate");
                    return true;
                }
            }
        </script>


    </head>

    <%
        ArrayList typeList = (ArrayList) request.getAttribute("typeList");
        request.setAttribute("typeList", typeList);
        System.out.println(typeList);

    %>

    <body onload="myFunc();
            myFunc2();">

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
                            <a class="nav-link js-scroll-trigger" href="AdminHome.jsp" style ="color: white">Home</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="Users.jsp" style ="color: white">Users</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="Logout" style ="color: white">Logout</a>
                        </li>
                        <!--  <li class="nav-item">
                           <a class="nav-link js-scroll-trigger" href="#contact"style ="color: white">Contact</a>
                         </li> -->
                    </ul>
                </div>
            </div>
        </nav>
        <div class="login-reg-panel">
            <div class="login-info-box">
                <h2>Want to allocate asset?</h2>
                <p>Click on the button below</p>
                <label id="label-register" for="log-reg-show">Click Here</label>
                <input type="radio" name="active-log-panel" id="log-reg-show"  checked="checked">
            </div>

            <div class="register-info-box">
                <h2>Need to de-allocate assets?</h2>
                <p>Click on the button below</p>
                <label id="label-login" for="log-login-show">Click Here</label>
                <input type="radio" name="active-log-panel" id="log-login-show">
            </div>

            <div class="white-panel">
                <div class="login-show">
                    <h2>ALLOCATE ASSET </h2>
                    <form method="post" onsubmit="return checkAllocateForm(this)">
                        <input type="text" name="userEmail" class="form-control" placeholder="Enter User Email" value="" />
                        <p id="container1" class="form-control">
                            <!-- new check boxes-->
                        </p>
                        <br>                            
                        <input type="submit" value="Submit" class="btn btn-dark">
                    </form>
                </div>
                <div class="register-show">
                    <h2>DE-ALLOCATE ASSET</h2>
                    <form id="deAllocateForm" method="post" onsubmit="return checkDeAllocateForm(this)">
                        <input type="text" name="userEmail" class="form-control" placeholder="Enter User Email" value="" />
                        <p id="container2" class="form-control">
                            
                        </p>
                        <br>
                        <input type="submit" value="Submit" class="btn btn-dark">
                    </form>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $('.login-info-box').fadeOut();
                $('.login-show').addClass('show-log-panel');
            });


            $('.login-reg-panel input[type="radio"]').on('change', function () {
                if ($('#log-login-show').is(':checked')) {
                    $('.register-info-box').fadeOut();
                    $('.login-info-box').fadeIn();

                    $('.white-panel').addClass('right-log');
                    $('.register-show').addClass('show-log-panel');
                    $('.login-show').removeClass('show-log-panel');

                } else if ($('#log-reg-show').is(':checked')) {
                    $('.register-info-box').fadeIn();
                    $('.login-info-box').fadeOut();

                    $('.white-panel').removeClass('right-log');

                    $('.login-show').addClass('show-log-panel');
                    $('.register-show').removeClass('show-log-panel');
                }
            });



        </script>

        <script>
            function myFunc() {
                var type = new Array();

            <c:forEach items="${typeList}" var="type">
                type.push('<c:out value="${type}"></c:out>');
            </c:forEach>

                for (i = 0; i < type.length; i++) {
                    var chk = document.createElement('input');  // CREATE CHECK BOX.
                    chk.setAttribute('type', 'checkbox');       // SPECIFY THE TYPE OF ELEMENT.
                    chk.setAttribute('id', 'type' + i);     // SET UNIQUE ID.
                    chk.setAttribute('value', type[i]);
                    chk.setAttribute('name', 'type');

                    var lbl = document.createElement('label');  // CREATE LABEL.
                    lbl.setAttribute('for', 'type' + i);

                    // CREATE A TEXT NODE AND APPEND IT TO THE LABEL.
                    lbl.appendChild(document.createTextNode(type[i]));

                    var br = document.createElement('br');

                    // APPEND THE NEWLY CREATED CHECKBOX AND LABEL TO THE <p> ELEMENT.
                    container1.appendChild(chk);
                    container1.appendChild(lbl);
                    container1.appendChild(br);
                }
            }

            function myFunc2() {
                var type = new Array();

            <c:forEach items="${typeList}" var="type">
                type.push('<c:out value="${type}"></c:out>');
            </c:forEach>

                for (i = 0; i < type.length; i++) {
                    var chk = document.createElement('input');  // CREATE CHECK BOX.
                    chk.setAttribute('type', 'checkbox');       // SPECIFY THE TYPE OF ELEMENT.
                    chk.setAttribute('id', 'typea' + i);     // SET UNIQUE ID.
                    chk.setAttribute('value', type[i]);
                    chk.setAttribute('name', 'type');

                    var lbl = document.createElement('label');  // CREATE LABEL.
                    lbl.setAttribute('for', 'type' + i);

                    // CREATE A TEXT NODE AND APPEND IT TO THE LABEL.
                    lbl.appendChild(document.createTextNode(type[i]));

                    var br = document.createElement('br');

                    // APPEND THE NEWLY CREATED CHECKBOX AND LABEL TO THE <p> ELEMENT.
                    container2.appendChild(chk);
                    container2.appendChild(lbl);
                    container2.appendChild(br);
                }
            }
        </script>

        <!-- Footer -->
        <footer class="py-3 bg-dark fixed-bottom">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; Team3@exavalu</p>
            </div>
            <!-- /.container -->
        </footer>



    </body>
</html>
