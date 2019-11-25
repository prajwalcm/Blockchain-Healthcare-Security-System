<%@page import="com.sun.istack.internal.Nullable"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="control.GlobalFunction"%>

<%@page import="control.ConnectionManager"%>
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
<body>

	<%
		if (request.getParameter("request") != null) {
			out.print("<script>alert('Request Updated')</script>");
		}

		String user_id = null;
		if (session.getAttribute("username") != null) {
			user_id = (String) session.getAttribute("username");
	%>

<div class="main">

		<div class="header">
			<div class="header_resize">
				<div class="logo">
					<h1>
						<a href="index.html" class="nobg">Blockchain Based Medical Healthcare Security System</a>
					</h1>
				</div>
				<div class="menu_nav">
					<ul>
					<li><a href="AdminHome.jsp">Home</a></li>
					<li><a href="AllFiles.jsp">User Files</a></li>
					<li><a href="userPrivileges.jsp">User Privileges</a></li>
					<li><a href="logout.jsp">Logout</a></li>
				</ul>				</div>
				<div class="clr"></div>
			</div>
		</div>

		<div class="article">
			<%@include file="WelcomeName.jsp"%>

			<div class="content">



				<h2 align="center">User Privileges</h2>
				<br />
				<div class="article" style="height: 200px">



					<form action="">
						<table border="2" align="center" cellpadding="4" cellspacing="4">
							<tr>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Username</th>
								<th>Total Upload</th>
								<th>Total Download</th>
								<th>Current Privileges</th>
								<th>Request Status</th>
								<th>Action</th>
								<th>Privileges</th>
							</tr>
							<%
								String username1, fname, lname, privilege, status;
									Connection con = ConnectionManager.getConnection();
									Statement stmt = con.createStatement();
									GlobalFunction gf=new GlobalFunction();
									
									
									ResultSet rs = stmt.executeQuery("select * from reg");
									
									while (rs.next()) 
									{
										username1 = rs.getString("userid");
										fname = rs.getString("fname");
										lname = rs.getString("lname");
										status = rs.getString("status");
										privilege = rs.getString("privilege");
										int count=gf.getTotalCountUpload(username1);
										int dcount=gf.getTotalCountDownload(username1);
								
							%>



							<tr>
								<td><%=fname%></td>
								<td><%=lname%></td>
								<td><%=username1%></td>
								<td><%=count%></td>
								<td><%=dcount%></td>
								<td><%=privilege%></td>
								<td><%=status%></td>
								<td><a href="AcceptRequest?username=<%=username1%>&status=Accept">accept</a>
									| <a href="AcceptRequest?username=<%=username1%>&status=Reject">Reject</a>
								</td>
								<td><a href="AcceptRequest?username=<%=username1%>&privilege=Upload">Upload</a> | <a href="AcceptRequest?username=<%=username1%>&privilege=Download">Download</a> | <a href="AcceptRequest?username=<%=username1%>&privilege=BOTH">BOTH</a></td>
								
							</tr>


							<%
								}
							%>
						</table>
					</form>




				</div>


			</div>

			<div class="clr"></div>
		</div>
		<div class="clr"></div>

		<div class="footer">
			<%@include file="footer.jsp"%>

		</div>
	</div>

	<%
		} else {
			response.sendRedirect("index.jsp");
		}
	%>
</body>
</html>