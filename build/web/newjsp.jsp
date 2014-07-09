<div class="home">
<div class="row">
   <div class="col-sm-6 col-md-2">
      <div class="thumbnail">
         <img src="images/1464642_628538317213647_1610491032_n.jpg" 
         alt="images/blank-person.png">
      </div>
      <div class="caption">
         <h3>Thumbnail label</h3>
         <p>Some sample text. Some sample text.</p>
         <p>
            <a href="#" class="btn btn-primary" role="button">
               Button
            </a> 
            <a href="#" class="btn btn-default" role="button">
               Button
            </a>
         </p>
      </div>
   </div>
   <div class="col-sm-6 col-md-2">
      <div class="thumbnail">
         <img src="images/1464642_628538317213647_1610491032_n.jpg" 
         alt="images/blank-person.png">
      </div>
      <div class="caption">
         <h3>Thumbnail label</h3>
         <p>Some sample text. Some sample text.</p>
         <p>
            <a href="#" class="btn btn-primary" role="button">
               Button
            </a> 
            <a href="#" class="btn btn-default" role="button">
               Button
            </a>
         </p>
      </div>
   </div>
   <div class="col-sm-6 col-md-2">
      <div class="thumbnail">
         <img src="images/laptop-hp-reggae-hd-and-top-widescreen-from-1289043.jpg" 
         alt="images/blank-person.png">
      </div>
      <div class="caption">
         <h3>Thumbnail label</h3>
         <p>Some sample text. Some sample text.</p>
         <p>
            <a href="#" class="btn btn-primary" role="button">
               Button
            </a> 
            <a href="#" class="btn btn-default" role="button">
               Button
            </a>
         </p>
      </div>
   </div>
   <div class="col-sm-6 col-md-2">
      <div class="thumbnail">
         <img src="images/blank-person.png" 
         alt="images/blank-person.png">
      </div>
      <div class="caption">
         <h3>Thumbnail label</h3>
         <p>Some sample text. Some sample text.</p>
         <p>
            <a href="#" class="btn btn-primary" role="button">
               Button
            </a> 
            <a href="#" class="btn btn-default" role="button">
               Button
            </a>
         </p>
      </div>
   </div>
</div>
</div>

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
    if(p1==null)
       p1 = null;
        %>
        
                      <%
                           }
PreparedStatement Ps=con.prepareStatement("select * from photoreg where email=?");
Ps.setString(1,email);
ResultSet rs = Ps.executeQuery();
while(rs.next())
{
    String p1=rs.getString(1);
    String p2=rs.getString(2);
    String p3=rs.getString(4);
    %>
    
              <%
                                  }
%>