<%-- 
    Document   : register
    Created on : Jul 3, 2014, 11:28:07 PM
    Author     : Shantanu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="stylesheet" href="bootstrap-3.1.1-dist/css/bootstrap.css" media="screen" type="text/css" />

    </head>
    <body>
        <nav class="navbar navbar-inverse" role="navigation">
             <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" 
                    data-target="#example-navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">Photo Gallery</a>
            </div>
            <div class="collapse navbar-collapse navbar-right" id="example-navbar-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="register.jsp">Register</a></li>
                    <li><a href="login.jsp">Sign-in</a></li>
                </ul>
            </div>
        </nav>
        
        <div class="container">
            <form class="form-signin" onsubmit="return myFunction()">
                <input type="text" name="name" class="form-control1" placeholder="Your Name" required autofocus>
                <input type="email" name="email" class="form-control1" placeholder="Email address" required autofocus>
                <input type="password" name="password" id="password" class="form-control1" placeholder="Password" required>
                <input type="password" name="cpassword" id="cpassword" class="form-control1" placeholder="Re-enter Password" required>
                <select class="select">
                    <option>Male</option><option>Female</option>
                </select>              
                <input class="btn btn-lg btn-primary btn-block" id="regForm" type="submit" value="Register">
                 <script>
                    function myFunction() {
                        var pass1 = document.getElementById("password").value;
                        var pass2 = document.getElementById("cpassword").value;
                        if (pass1 != pass2) {
                            alert("Passwords Do not match");
                            document.getElementById("password").style.borderColor = "#E34234";
                            document.getElementById("cpassword").style.borderColor = "#E34234";
                        }
                        else {
                            alert("Passwords Match!!!");
                            document.getElementById("regForm").submit();
                        }
                    }
               </script>
           </form>
           <p>&nbsp;</p>
           <p>Already a member? <a href="login.jsp">Sign-in</a> to continue</p>
        </div>
    </body>
</html>
