<%-- 
    Document   : register_script
    Created on : Jul 4, 2014, 4:02:02 PM
    Author     : Shantanu
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="sun.font.Script"%>
<%@page import="java.net.SocketException"%>
<%@page import="java.net.UnknownHostException"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileUploadException"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>
    <body>
        <%
            String uname = request.getParameter("name");
            String pass = request.getParameter("password");
            String email = request.getParameter("email");
            String gender = request.getParameter("gender");
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "aezakmi");
            PreparedStatement Ps = con.prepareStatement("insert into photoreg values(?,?,?,?)");
            Ps.setString(1,uname);
            Ps.setString(2,email);
            Ps.setString(3,pass);
            Ps.setString(4,gender);
            int i = Ps.executeUpdate();
            
            String FileToUpload = "blank-person.png";
            PreparedStatement ps = con.prepareStatement("insert into FILE_UPLOAD  values(?,?)");
            ps.setString(1,FileToUpload);
            ps.setString(2, email);
            int j = ps.executeUpdate();
            
            if (i > 0 && j > 0) 
            {
                response.sendRedirect("index.jsp");
            }
            else
            {
                out.println("Registration Failed.");
            }
        %>
    </body>
</html>
