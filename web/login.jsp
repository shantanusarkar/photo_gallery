<%-- 
    Document   : login
    Created on : Jul 3, 2014, 11:15:45 PM
    Author     : Shantanu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
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
            <form class="form-signin" action="login_script.jsp" method="post">
                <h2 class="form-signin-heading">Please sign in</h2>
                <input type="email" class="form-control" name="email" placeholder="Email address" required autofocus>
                <input type="password" class="form-control" name="password" placeholder="Password" required>
                <label class="checkbox">
                    <input type="checkbox" value="remember-me"> Remember me
                </label>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
            </form>
            <p>&nbsp;</p>
            <p>Not a member? <a href="register.jsp">Sign up now</a></p>
        </div>
</body>
</html>
