<%-- 
    Document   : logout
    Created on : Jul 8, 2014, 8:32:31 PM
    Author     : Shantanu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session.invalidate();
            out.println("<script>parent.location.href='index.jsp'</script>");
%>
    </body>
</html>
