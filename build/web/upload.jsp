<%-- 
    Document   : upload
    Created on : Jul 5, 2014, 2:39:25 PM
    Author     : Shantanu
--%>
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
        <title>JSP Page</title>
    </head>
    <body>
               
        <%  
        try {
                String FileToUpload = "", filepath = "", email="";
                boolean isMultipart = ServletFileUpload.isMultipartContent(request);
                if (!isMultipart) {
                } else {
                    FileItemFactory factory = new DiskFileItemFactory();
                    ServletFileUpload upload = new ServletFileUpload(factory);
                    List items = null;
                    try {
                        items = upload.parseRequest(request);
                    } catch (FileUploadException e) {
                        e.printStackTrace();
                    }
                    Iterator itr = items.iterator();
                    while (itr.hasNext()) {
                        FileItem item = (FileItem) itr.next();
                        if (item.isFormField()) {
                            String itemName = item.getFieldName();
                        }
                        else {
                            String itemName = item.getName();

                            //String userFieldName = item.getFieldName();
                            if (itemName != null) {
                                if (itemName.equals("")) {
                                    out.println("No File Uploaded");
                                } else {
                                    int idx = itemName.lastIndexOf("\\");
                                    if (idx > -1) {
                                        //in case of IE, it sends complete path. Hence only file name must be filtered out.
                                        idx = idx + 1;
                                        FileToUpload = itemName.substring(idx);
                                    } else {
//in case of other borwsers, its just filename
                                        FileToUpload = itemName;
                                    }
                                    boolean folderMade = (new File("C:/Users/Shantanu/Documents/NetBeansProjects/Photo_gallery/web/images")).mkdirs();
                                    filepath = "C:/Users/Shantanu/Documents/NetBeansProjects/Photo_gallery/web/images/" + FileToUpload;
                                    File savedFile = new File(filepath);
                                    item.write(savedFile);
                                }
                            }
                        }//else
                    }
                    email=(String)request.getSession().getAttribute("emailid");
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "aezakmi");

                    PreparedStatement ps = con.prepareStatement("update FILE_UPLOAD set file_u=? where email=?");
                    ps.setString(1,FileToUpload);
                    ps.setString(2, email);
                    int i = ps.executeUpdate();

                   if (i > 0) {
                        response.sendRedirect("home.jsp");
                    } else {
                        out.println("Profile Picture not updated.");

                    }
                }
            } catch (UnknownHostException e) {
                e.printStackTrace();
            } catch (SocketException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>
