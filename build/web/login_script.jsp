<%-- 
    Document   : login_script
    Created on : Jul 4, 2014, 4:24:20 PM
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
        <title>JSP Page</title>
    </head>
    <body>
        <%
String email = request.getParameter("email");
String password = request.getParameter("password");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","aezakmi");
PreparedStatement Ps = con.prepareStatement("Select * from photoreg where email=? and password=?");
Ps.setString(1,email);
Ps. setString(2,password);
ResultSet rs = Ps.executeQuery();
   if(rs.next())
         {
                String emailid;
                request.getSession().setAttribute("emailid", email);
                response.sendRedirect("home.jsp");
         }
   else
         {
            response.sendRedirect("login_failed.jsp");
         }
         
        %>
    </body>
</html>
