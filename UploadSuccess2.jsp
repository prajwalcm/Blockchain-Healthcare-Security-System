<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@page import="control.ConnectionManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Blockchain</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link href="style.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
        <script type="text/javascript" src="js/cufon-yui.js"></script>
        <script type="text/javascript" src="js/arial.js"></script>
        <script type="text/javascript" src="js/cuf_run.js"></script>
    </head>
    <body>
     <%
      
        if(request.getParameter("status")!=null){
        out.println("<script>alert('Successfully Uploaded!')</script>");
        }
        
        %>
        <%
        
            String user_id = null;
            if (session.getAttribute("username") != null) {
                user_id = (String) session.getAttribute("username");

        %>
        <div class="main">
           
            <div class="clr"></div>
            <div class="header">
      <div class="logo">
                    <h1>Cloud Deduplication</h1>
                </div>
                <div class="menu_nav">
                    <ul>
                        <li><a href="Homepage2.jsp">Home</a></li>
        <li><a href="download.jsp">Download File</a></li>
                        <li><a href="logout.jsp">Logout</a></li>
                    </ul>
                    <div class="clr"></div>
                </div>
                <div class="clr"></div>
            </div>
            <div class="hbg"> <%@include file="image.jsp" %></div>
            <%@include file="WelcomeName.jsp" %>
            
            <div class="content">
                
                
                <div class="mainbar">
                    <div class="article" style="height:200px">


                        
                        
                        
                      <form class="form1" action="UploadServlet" method="post" enctype="multipart/form-data">
                        <table width="40%" align="center" cellpadding="5" cellspacing="5">    
                            <tr>
                            	<td colspan="3"><h2>Successfully Uploaded</h2></td>
                            </tr>
                           
                            
                           
                            
                        </table>
                        </form>
                               

                    </div>
                    
                    
                </div>
                
                <div class="clr"></div>
            </div>
            <div class="clr"></div>
           
            <div class="footer">
             <%@include file="footer.jsp" %>
       			        
            </div>
        </div>
        
        <%
            } else {
                response.sendRedirect("index.jsp");
            }
        %>
    </body>
</html>