<%-- 
    Document   : UsemainTable
    Created on : Mar 21, 2021, 9:07:01 AM
    Author     : Windows10
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

    <head>

        <meta chamainTableet="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>PemainTableonal Asset</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/scrolling-nav.css" rel="stylesheet">

        <!-- Style -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    
    <script type="text/javascript">
            window.history.forward();
            function noBack()
            {
                window.history.forward();
            }
        </script>

    <body onLoad="noBack();" onpageshow="if (event.persisted) noBack();" onUnload="">

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
        
        #myInput {
            background-image: url('/css/searchicon.png'); /* Add a search icon to input */
            background-position: 10px 12px; /* Position the search icon */
            background-repeat: no-repeat; /* Do not repeat the icon image */
            width: 30%; /* Full-width */
            font-size: 16px; /* Increase font-size */
            padding: 12px 20px 12px 40px; /* Add some padding */
            border: 1px solid #ddd; /* Add a grey border */
            /*  margin-bottom: 12px;  Add some space below the input */
        }

        #sailorTable tr.header, #sailorTable tr:hover {
            /* Add a grey background color to the table header and on hover #cc0000*/
            background-color: lightcoral;
            color:white;
        }
    </style>

    <%
        ResultSet mainTable = (ResultSet) request.getAttribute("mainTable");
        ResultSet totalAssetTable = (ResultSet) request.getAttribute("totalAssetTable");
        ResultSet activeAssets = (ResultSet) request.getAttribute("activeAssets");
        System.out.println(totalAssetTable);
    %>

    <body id="page-top">
        <nav class="navbar navbar-expand-lg navbar-dark bg-secondary fixed-top navbar-default navbar-static-top" id="mainNav">
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
                            <a class="nav-link js-scroll-trigger" href="AdminHome.jsp" style ="color: white">Home</a>
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


        <div class="container-fluid" style="margin-top: 78px">
            <div class="row">
                <div class="col-md-8" style="background: lightgreen">
                    <div class="table-responsive" id="sailorTableArea">
                        <br><br>
                        <table class="table table-striped table-bordered" width="100%">
                            <thead>
                                <tr>
                                    <th scope="col">Model No</th>
                                    <th scope="col">User Id</th>
                                    <th scope="col">Type</th>
                                    <th scope="col">Department</th>
                                    <th scope="col">Value</th>
                                    <th scope="col">Status</th>
                                </tr>
                            </thead>
                            <%
                                while (mainTable.next()) {
                            %>
                            <tbody id="sailorTable">
                                <tr>
                                    <td><%= mainTable.getInt("modelNo")%></td>
                                    <td><%= mainTable.getInt("userId")%></td>
                                    <td><%= mainTable.getString("type")%></td>
                                    <td><%= mainTable.getString("department")%></td>
                                    <td><%= mainTable.getString("value")%></td>
                                    <td><%= mainTable.getString("status")%></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-md-4" >
                    <div class="row rounded" style="background: lightgoldenrodyellow">
                        <div class="table-responsive" id="sailorTableArea">
                            <br><br>
                            <table  class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th scope="col">Asset</th>
                                        <th scope="col">Total Assets</th>
                                    </tr>
                                </thead>
                                <%
                                    while (totalAssetTable.next()) {
                                %>
                                <tbody id="sailorTable">
                                    <tr>
                                        <td><%= totalAssetTable.getString("Asset Name")%></td>
                                        <td><%= totalAssetTable.getString("Total")%></td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div
                        <div class="row rounded" style="background: lightgoldenrodyellow">
                            <div class="table-responsive" id="sailorTableArea">
                                <br><br>
                                <table  class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th scope="col">Asset</th>
                                            <th scope="col">Total Active Assets</th>
                                        </tr>
                                    </thead>
                                    <%
                                        while (activeAssets.next()) {
                                    %>
                                    <tbody id="sailorTable">
                                        <tr>
                                            <td><%= activeAssets.getString("Asset Name")%></td>
                                            <td><%= activeAssets.getString("Total Active Assets")%></td>
                                            <td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </body>

    <footer class="py-3 bg-dark fixed-bottom">
        <div class="container">
            <p class="m-0 text-center text-white">Copyright &copy; Team3@exavalu</p>
        </div>
        <!-- /.container -->
    </footer>
</html>
