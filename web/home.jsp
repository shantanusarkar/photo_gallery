<%-- 
    Document   : home
    Created on : Jul 4, 2014, 4:25:55 PM
    Author     : Shantanu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Photo Gallery</title>
        <link rel="stylesheet" href="bootstrap-3.1.1-dist/css/bootstrap.css" media="screen" type="text/css" />
        <style>
            .sidebar {
  display: none;
}
@media (min-width: 768px) {
  .sidebar {
    position: fixed;
    top: 62px;
    bottom: 0;
    left: 0;
    z-index: 1000;
    display: block;
    padding: 20px;
    overflow-x: hidden;
    overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
    background-color: #E0FFFF;
    border-right: 1px solid #eee;
  }
}
.nav-sidebar {
  margin-right: -21px; /* 20px padding + 1px border */
  margin-bottom: 20px;
  margin-left: -20px;
}
.nav-sidebar > li > a {
  padding-right: 20px;
  padding-left: 20px;
}
.nav-sidebar > .active > a {
  color: #fff;
  background-color: #428bca;
}
#LeftCol
{
    /* Move it to the left */
    float: left;

    width: 200px;
    text-align: center;

    /* Move it away from the content */
    margin-right: 20px;

/* For visibility. Delete me */
/*border: 1px solid white;*/
}

#Photo
{
    /* Width and height of photo container */
    width: 200px;
    height: 200px;

/* For visibility. Delete me */
/*border: 1px solid #3b4148;*/
}

#PhotoOptions
{
    text-align: center;
    width: 200px;

/* For visibility. Delete me */
/*border: 1px solid white;*/
}

#info
{
    text-align: left;
    padding-left: 10px;
    font-family: inherit;
    margin-top: 10px;
}

        </style>
    </head>
    <body>
        <%
String email=(String)request.getSession().getAttribute("emailid");
Class.forName("oracle.jdbc.driver.OracleDriver"); 
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","aezakmi");
PreparedStatement Ps=con.prepareStatement("select * from FILE_UPLOAD where email=?");
Ps.setString(1,email);
ResultSet rs = Ps.executeQuery();
while(rs.next())
{
    String p1=rs.getString(1);
  //  String p2=rs.getString(2);
  //  String p3=rs.getString(4);
        %>
        
<nav class="navbar navbar-inverse" role="navigation">
   <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" 
         data-target="#example-navbar-collapse">
         <span class="sr-only">Toggle navigation</span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="home.jsp">Photo Gallery</a>
   </div>
    <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" role="menu" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
              <ul class="dropdown-menu" >
                <li role="menuitem"><a href="#">Action</a></li>
                <li role="menuitem"><a href="#">Another action</a></li>
                <li role="menuitem"><a href="#">Something else here</a></li>
                <li role="menuitem" class="divider"></li>
                <li role="menuitem" class="dropdown-header">Nav header</li>
                <li role="menuitem"><a href="#">Separated link</a></li>
                <li role="menuitem"><a href="#">One more separated link</a></li>
              </ul>
            </li>
          </ul>
        </div><!--/.nav-collapse -->
   <div class="collapse navbar-collapse navbar-right" id="example-navbar-collapse">
      <ul class="nav navbar-nav">
         <li><a href="login.jsp">Logout</a></li>
      </ul>
   </div>
</nav>
        <div class="col-sm-3 col-md-2 sidebar">
              <div id="LeftCol">
                  <h3>Profile</h3>
                <div id="Photo"><img class="img-responsive" src="images/<%=p1%>" alt="" /></div>
                    <div id="ProfileOptions">
                        <form action="upload.jsp" method="post" enctype="multipart/form-data">
                            <span><input type="file" name="filename"/></span>
                            <p>&nbsp;</p>
                            <span><input type="submit" value="Upload"></span>
                        </form>
                    </div>
            </div>
            <div id="info">
        <ul class="nav nav-sidebar">
            <li><strong>Name: </strong><span></span></li>
            <li><strong>Email: </strong><span></span></li>
            <li><strong>Gender: </strong><span></span></li>
          </ul>
            </div>
        </div>
            <%
                                  }
%>
    </body>
</html>
