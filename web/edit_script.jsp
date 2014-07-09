<%-- 
    Document   : edit_script
    Created on : Jul 10, 2014, 1:02:34 AM
    Author     : Shantanu
--%>

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
            String uname = request.getParameter("name");
            String email = request.getParameter("email");
            String gender = request.getParameter("gender");
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "aezakmi");
            PreparedStatement Ps = con.prepareStatement("update photoreg set name=?, gender=? where email=?");
            Ps.setString(1,uname);
            Ps.setString(2,gender);
            Ps.setString(3,email);
            int i = Ps.executeUpdate();
            if (i > 0) 
            {
                response.sendRedirect("home.jsp");
            }
            else
            {
                out.println("Updation Failed.");
            }
        %>
    </body>
</html>
