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
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
</head>
<%
if(request.getParameter("totalcost")!=null)
{
	String totalcost=request.getParameter("totalcost");
	session.setAttribute("totalcost", totalcost);
	System.out.println("Tpotal:"+totalcost);
}

%>

    <body>
        <%
            String user_id = null;
            if (session.getAttribute("username") != null) {
                user_id = (String) session.getAttribute("username");

        %>
        <%
		if (request.getParameter("Accept") != null) {
			out.println("<script>alert('Request Accept Successfully!')</script>");
		}
		%>
		<%
		if (request.getParameter("download") != null) {
			out.println("<script>alert('File Download Successfully!')</script>");
		}
		%>
       <div class="main">

		<div class="header">
			<div class="header_resize">
				<div class="logo">
					<h2>
						<a href="index.jsp" class="nobg">Blockchain Based Medical Healthcare Security System</a>
					</h2>
				</div>
				<div class="menu_nav">
				<ul>
                        <li><a href="Homepage2.jsp">Home</a></li>
                        <!-- <li><a href="Aspace.jsp">Available Space</a></li>
                        <li><a href="UserSReq.jsp">User Request</a></li> -->
                        <li><a href="download2.jsp">Download File</a></li>
                        <li><a href="logout.jsp">Logout</a></li>
                    </ul>
				</div>
				<div class="clr"></div>
			</div>
		</div>

		<div class="article">
			<%@include file="WelcomeName.jsp"%>

			<div class="content">


                        
                        <h2 align="center">Welcome Secure Distributed</h2>
                        <p align="center">  Cloud computing provides seemingly unlimited virtualised
						resources to users as services across the whole
						Internet, while hiding platform and implementation details.
						Todays cloud service providers offer both highly
						available storage and massively parallel computing resources
						at relatively low costs. As cloud computing
						becomes prevalent, an increasing amount of data is being
						stored in the cloud and shared by users with specified
						privileges, which define the access rights of the stored
						data. One critical challenge of cloud storage services is
						the management of the ever-increasing volume of data.</p>     
				<br /> <br /> <br />
                    </div>
                    <div class="article">
                        
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