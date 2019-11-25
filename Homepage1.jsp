<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

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
            String user_id = null;
            if (session.getAttribute("username") != null) {
                user_id = (String) session.getAttribute("username");

        %>
	<div class="main">

		<div class="header">
			<div class="header_resize">
				<div class="logo">
					<h1>
						<a href="index.jsp" class="nobg">Blockchain Based Medical Healthcare Security System</a>
					</h1>
				</div>
				<div class="menu_nav">
					<ul>
						<li><a href="Homepage1.jsp">Home</a></li>
						<li><a href="Upload1.jsp">Upload File</a></li>
						<li><a href="logout.jsp">Logout</a></li>
					</ul>
				</div>
				<div class="clr"></div>
			</div>
		</div>

		<div class="article">
			<%@include file="WelcomeName.jsp"%>

			<div class="content">






				

			</div>
			<div class="article">
				
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