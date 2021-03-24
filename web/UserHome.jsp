<%@page import="eams.bean.User"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="eams.utilities.ConnectionProviderToDB"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.InputStream"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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




        <!-- Style -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <script>
            function myFunction() {
                // Declare variables
                var input, filter, table, tr, td, i, txtValue;
                input = document.getElementById("myInput");
                filter = input.value.toUpperCase();
                table = document.getElementById("sailorTable");
                tr = table.getElementsByTagName("tr");

                // Loop through all table rows, and hide those who don't match the search query
                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[1];
                    if (td) {
                        txtValue = td.textContent || td.innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }
            }
        </script>




        <style>



            #sailorTable tr.header, #sailorTable tr:hover {
                /* Add a grey background color to the table header and on hover */
                background-color: lightcoral;
                color:white;

            }


            .radio-inline
            {


                font-color : white ; 
                font-weight: bold ;
                font-size: 18px; 
            }

            .login-container{
                margin-top: 5%;
                margin-bottom: 1%;
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
                background:lightgreen;
                box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
            }
            .login-form-1 h3{
                text-align: center;
                margin-bottom:12%;
                color:#fff;
            }
            .login-form-2{
                box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
            }
            .login-form-2 h3{
                text-align: center;
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
                font-size: 24px;
            }



            body {font-family: Arial, Helvetica, sans-serif;}

            /* Full-width input fields */
            input[type=text], input[type=password] {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                box-sizing: border-box;
            }

            /* Set a style for all buttons */
            button {
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: 100%;
            }

            button:hover {
                opacity: 0.8;
            }

            /* Extra styles for the cancel button */
            .cancelbtn {
                width: auto;
                padding: 10px 18px;
                background-color: #f44336;
            }

            /* Center the image and position the close button */
            .imgcontainer {
                text-align: center;
                margin: 24px 0 12px 0;
                position: relative;
            }

            img.avatar {
                width: 40%;
                border-radius: 50%;
            }

            .container {
                padding: 16px;
            }

            span.psw {
                float: right;
                padding-top: 16px;
            }

            /* The Modal (background) */
            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
                padding-top: 60px;
            }

            /* Modal Content/Box */
            .modal-content {
                background-color: #fefefe;
                margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
                border: 1px solid #888;
                width: 80%; /* Could be more or less, depending on screen size */
            }

            /* The Close Button (x) */
            .close {
                position: absolute;
                right: 25px;
                top: 0;
                color: #000;
                font-size: 35px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: red;
                cursor: pointer;
            }

            /* Add Zoom Animation */
            .animate {
                -webkit-animation: animatezoom 0.6s;
                animation: animatezoom 0.6s
            }

            @-webkit-keyframes animatezoom {
                from {-webkit-transform: scale(0)} 
                to {-webkit-transform: scale(1)}
            }

            @keyframes animatezoom {
                from {transform: scale(0)} 
                to {transform: scale(1)}
            }

            /* Change styles for span and cancel button on extra small screens */
            @media screen and (max-width: 300px) {
                span.psw {
                    display: block;
                    float: none;
                }
                .cancelbtn {
                    width: 100%;
                }
            }

            .navbar .navbar-nav .nav-link {
                color: #000000;
                font-size: 1.1em;
                position: relative;
            }
            .navbar .navbar-nav .nav-link:hover {
                color: #000000;
            }
            .navbar .navbar-nav .nav-link::after {
                position: absolute;
                bottom: 0;
                left: 0;
                right: 0;
                margin: auto;
                background-color: #000000;
                color: transparent;
                width: 0%;
                content: '.';
                height: 3px;
            }
            .navbar .navbar-nav .nav-link:hover::after {
                width: 100%;
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
                            <a class="nav-link js-scroll-trigger" style="color: white">User Name: <c:out value="${user.getUserName()}"></c:out></a>
                            </li>

                            <li class="nav-item active">
                                <a class="nav-link js-scroll-trigger" href="Logout"style ="color: white">Logout</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>


            <br>




            <div class="container-fluid" style="margin-top: 5%">
                <div class="row">
                    <div class="col-md-4 login-form-1">
                        <h3>WELCOME</h3>
                        <p class="rounded" style="font-weight: bold">User ID : <c:out value="${user.getUserId()}"></c:out></p>
                    <p class="rounded" style="font-weight: bold">User Name : <c:out value="${user.getUserName()}"></c:out></p>
                        <br>
                        <div class="form-group">
                            <input type="submit" class="btn btn-light" onclick="document.getElementById('id01').style.display = 'block'" value="Raise Request" />
                        </div>
                    </div>
                    <div id="id01" class="modal">
                        <form class="modal-content animate" action="RaiseRequest" method="post">
                            <div class="imgcontainer">
                                <span onclick="document.getElementById('id01').style.display = 'none'" class="close" title="Close Modal">&times;</span>

                            </div>

                            <div class="container-fluid">
                                <label for="uname"><b>User Id</b></label>
                                <input type="text" placeholder="Enter Your Email ID" name="userEmail" required>

                                <label for="psw"><b>Model Id</b></label>
                                <input type="text" placeholder="Enter Model No" name="modelNo" required>

                                <br> 
                                <label class="radio-inline" style="color : black ; font-weight: bold">
                                    <input  type="radio" name="category" style="color : white  " value="personalasset"> Personal Asset
                                </label>
                                <label class="radio-inline" style="color : black ;font-weight: bold ">
                                    <input  type="radio" name="category" style="color : white  " vale="departmentalasset"> Departmental Asset 
                                </label>
                                <br>
                                <button class="btn btn-dark" type="submit" onclick="alert('Details submitted successfully.')">Raise Request</button>
                            </div>
                        </form>
                    </div>

                    <div class="col-md-8 login-form-2">

                        <h3 style="font-weight: bold ;font-size: 30px; ">MY ASSETS :-</h3>

                        <table class="table table-striped table-bordered" width="100%">
                            <thead>

                                <tr style="font-size: 22px">
                                    <th scope="col">ModelNo</th>
                                    <th scope="col">Type</th>
                                    <th scope="col">Value</th>
                                    <th scope="col">Status</th>
                                    <!--                    <th scope="col">info</th>-->
                                </tr>
                            </thead>

                        <%
                            InputStream inputFile = getServletContext().getResourceAsStream("/WEB-INF/db_params.properties");
                            System.out.println(inputFile);

                            Connection con = ConnectionProviderToDB.getConnectionObject().getConnection(inputFile);

                            PreparedStatement ps = con.prepareStatement("SELECT modelNo,type,value,status FROM personalasset WHERE userID=?");
                            ps.setInt(1, user.getUserId());
                            ResultSet rs = ps.executeQuery();
                            while (rs.next()) {

                        %>
                        <tbody id="sailorTable">
                            <tr style="font-size: 22px">
                                <td><%= rs.getInt("modelNo")%></td>
                                <td><%= rs.getString("type")%></td>
                                <td><%= rs.getString("value")%></td>
                                <td><%= rs.getString("status")%></td>
                            </tr>

                            <%}

                                con.close();
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>	

        <footer class="py-3 bg-dark fixed-bottom" style="margin-top: 280px">
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
        <script>
                                    // Get the modal
                                    var modal = document.getElementById('id01');

                                    // When the user clicks anywhere outside of the modal, close it
                                    window.onclick = function (event) {
                                        if (event.target == modal) {
                                            modal.style.display = "none";
                                        }
                                    }
        </script>
    </body>
</html>
