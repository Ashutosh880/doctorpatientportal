  <%-- 
    Document   : adddoctor
    Created on : 11 Apr, 2021, 5:11:08 PM
    Author     : aashu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.entities.Patient"%>
<%@page import="java.sql.*"  %>
<%@page import="com.helper.ConnectionProvider" %>
<%
    Patient patient = (Patient) session.getAttribute("currentPatient");
    if (patient == null) {
        response.sendRedirect("login.jsp");
    }
    
String s = patient.getEmail();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,200;0,400;1,300&display=swap"
              rel="stylesheet">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    </head>
    <style>
        .sidebar {
            margin: 0;
            padding: 0;
            width: 200px;
            background-color: #f1f1f1;
            position: fixed;
            height: 100%;
            overflow: auto;
        }

        /* Sidebar links */
        .sidebar a {
            display: block;
            color: black;
            padding: 16px;
            text-decoration: none;
        }

        /* Active/current link */
        .sidebar a.active {
            background-color: #4CAF50;
            color: white;
        }

        /* Links on mouse-over */
        .sidebar a:hover:not(.active) {
            background-color: #555;
            color: white;
        }

        /* Page content. The value of the margin-left property should match the value of the sidebar's width property */
        div.content {
            margin-left: 200px;
            padding: 1px 16px;
            height: 1000px;
        }

        /* On screens that are less than 700px wide, make the sidebar into a topbar */
        @media screen and (max-width: 700px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }
            .sidebar a {float: left;}
            div.content {margin-left: 0;}
        }

        /* On screens that are less than 400px, display the bar vertically, instead of horizontally */
        @media screen and (max-width: 400px) {
            .sidebar a {
                text-align: center;
                float: none;
            }
        }
    </style>
    <body style="background-image: url(image/img10.jpg); background-repeat: no-repeat;background-size: 100%">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand text-white"><span class="fa fa-user-circle"  style="color:red"></span></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>


            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="admin.jsp"><span class="fa fa-home" ></span> Home <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link active" href="adddoctor.jsp"><span class="fa fa-plus-square " ></span> Add Doctor</a>
                    </li>
                </ul>
                <div>
                    <a class="btn btn-outline-success" href="LogoutServlet" role="button">Logout</a>
                </div>
            </div>
        </nav>
        <div>
            <div class="sidebar bg-secondary">
                <a href="#news"><p class="text-white">Update Doctor</p></a>
                <a href="#contact"><p class="text-white">Delete Doctor</p></a>
                <a href="#about"><p class="text-white">See Doctor Patient</p></a>
            </div>

            <!-- Page content -->
            <div class="content">
                <div class="container mt-5">

                    <div class="card">
                        <div class="card-header text-center mt-3">
                            <h2>Add Doctors</h2>
                        </div>

                        <div class="card-body">
                            <form id="form" action="DoctorServlet" method="POST">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Name</label>
                                        <input type="text" required="required" name="name" class="form-control" id="inputEmail4" placeholder="Name">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Mobile</label>
                                        <input type="text" name="number" required class="form-control" id="inputPassword4" placeholder="Mobile">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="type">Specialization</label>
                                        <select id="type" required class="form-control" name="specialist">
                                            <option selected value="Neurologist">Neurologist</option>
                                            <option value="Rheumatologist">Rheumatologist</option>
                                            <option value="Immunologist">Immunologist</option>
                                            <option value="Nephrologist">Nephrologist</option>
                                            <option value="Surgeon">Surgeon</option>
                                            <option value="Oncologist">Oncologist</option>
                                            <option value="Urologist">Urologist</option>
                                            <option value="Radiologist">Radiologist</option>
                                            <option value="Cardiologist">Cardiologist</option>
                                            <option value="Orthopedist">Orthopedist</option>
                                            <option value="Dentist">Dentist</option>
                                            <option value="ENT Specialist">ENT Specialist</option>
                                            <option value="Anestheologists">Anestheologists</option>
                                            <option value="Gastroenterologist">Gastroenterologist</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail">Email</label>
                                        <input type="email" name="email" required autocomplete="username" class="form-control" id="inputEmail" placeholder="Email">
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label for="inputAddress">Address</label>
                                        <input type="text" name="address" class="form-control" id="inputAddress" placeholder="Address">
                                    </div>

                                    <span><input type="hidden" name="admin" id="admin" value="<%= s%>"></span>
                                    <span><input type="hidden" name="user" id="user_doctor" value="doctor"></span>
                                    <div class="form-group col-md-3">
                                        <label for="password">Password</label>
                                        <input type="password" autocomplete="current-password" class="form-control" name="password" id="password" placeholder="Password" required="required" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"  title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">

                                    </div>
                                    <div class="form-group col-md-5">
                                        <label for="hname">Hospital Name</label>
                                        <select id="hname" name="h_name" required class="form-control">

                                            <option selected value="Arihant Hospital">Arihant Hospital</option>
                                            <option value="Sai Hospital">Sai Hospital</option>
                                            <option value="Apollo Hospital">Apollo Hospital</option>
                                            <option value="Akash Hospital">Akash Hospital</option>
                                            <option value="Devi Ahilya Cancer Hospital">Devi Ahilya Cancer Hospital</option>
                                            <option value="Bapat Hospital">Bapat Hospital</option>
                                            <option value="Charak Hospital">Charak Hospital</option>
                                            <option value="Geetanjali Hospital">Geetanjali Hospital</option>
                                            <option value="Bombay Hospital">Bombay Hospital</option>
                                            <option value="CHL Hospital">CHL Hospital</option>
                                            <option value="Choithram Hospital">Choithram Hospital</option>
                                            <option value="Vishesh Hospital">Vishesh Hospital</option>
                                            <option value="Gokuldas Hospital">Gokuldas Hospital</option>
                                            <option value="Motherhood Hospital">Motherhood Hospital</option>

                                        </select>
                                    </div>

                                </div>
                                <!--                                 <div class="container text-center" id="loader" style="display: none;">
                                                                    <span class="fa fa-refresh fa-spin fa-1.5x"></span>Please Wait........
                                          
                                </div>-->
                                <div class="text-center" id="loader" style="display: none;"><span class="fa fa-refresh fa-spin fa-1x"> </span> Please Wait......</div>

                                <div class="text-center">
                                    <button id="submit" type="submit"  class="btn btn-primary">Add</button>
                                </div>
                            </form>

                        </div>

                    </div>
                </div>

            </div>
        </div>



        <script
            src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>



        <script>
            $(document).ready(function () {
                console.log("loaded")

                $('#form').on('submit', function (event) {
                    event.preventDefault();




                    let form = new FormData(this);

                    $("#submit").hide();
                    $("#loader").show();


                    $.ajax({

                        url: "DoctorServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)


                            $("#submit").show();
                            $("#loader").hide();

                            swal({
                                title: "Doctor added succesfully",
                                text: "Please Login",
                                icon: "success",
                                button: "OK",
                            })

                        },

                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(jqXHR)

                            $("#submit").show();
                            $("#loader").hide();
                        },
                        processData: false,
                        contentType: false
                    });


                });

            });



        </script>



    </body>
</html>
