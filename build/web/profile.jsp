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
.home
{
    margin-left: 250px;
}

        </style>
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
      <a class="navbar-brand" href="home.jsp">Pixels</a>
   </div>
    <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li ><a href="home.jsp">Home</a></li>
            <li class="active"><a href="profile.jsp">Profile</a></li>
            <li ><a href="edit_profile.jsp">Edit Profile</a></li>
            <li><a href="upload_photo.jsp">Upload</a></li>
          </ul>
        </div><!--/.nav-collapse -->
   <div class="collapse navbar-collapse navbar-right" id="example-navbar-collapse">
      <ul class="nav navbar-nav">
         <li><a href="logout.jsp">Logout</a></li>
      </ul>
   </div>
</nav>
        <div class="col-sm-3 col-md-2 sidebar">
<%
String email=(String)request.getSession().getAttribute("emailid");
Class.forName("oracle.jdbc.driver.OracleDriver"); 
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","aezakmi");
PreparedStatement ps=con.prepareStatement("select * from FILE_UPLOAD where email=?");
ps.setString(1,email);
ResultSet Rs = ps.executeQuery();
while(Rs.next())
{
    String p1=Rs.getString(1);
        %>
              <div id="LeftCol">
                  <h3>Profile</h3>
                  <div class="thumbnail"><img src="images/<%=p1%>" 
         alt=""></div>
              </div>
                  <%
                                   }
%>

            <div id="info">
<%
PreparedStatement Ps=con.prepareStatement("select * from photoreg where email=?");
Ps.setString(1,email);
ResultSet rs = Ps.executeQuery();
while(rs.next())
{
    String p1=rs.getString(1);
    String p2=rs.getString(2);
    String p3=rs.getString(4);
    %>
        <ul class="nav nav-sidebar">
            <li><strong>Name: </strong><span><%=p1%></span></li>
            <li><strong>Email: </strong><span><%=p2%></span></li>
            <li><strong>Gender: </strong><span><%=p3%></span></li>
          </ul>
           <%
                                  }
%>
            </div>
          
        </div>
         

<div class="home">
<div class="row">
    <%

PreparedStatement ws=con.prepareStatement("select * from FILE_UPLOAD where email=?");
ws.setString(1,email);
ResultSet qs = ws.executeQuery();
while(qs.next())
{
    String p1=qs.getString(1);
//    String p2=qs.getString(3);
//    String p3=qs.getString(4);
        %>
   <div class="col-sm-6 col-md-2">
      <div class="thumbnail">
         <img src="images/<%=p1%>" 
         alt="images/blank-person.png">
      </div>
      <div class="caption">
         <h3></h3>
         <p></p>
         <p>
            <a href="#" class="btn btn-primary" role="button">
               Download
            </a> 
        </p>
      </div>
   </div>
         <%
                 }
%>
</div>
</div>
          

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    </body>
</html>
