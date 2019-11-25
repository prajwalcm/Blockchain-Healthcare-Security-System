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
		if (request.getParameter("status") != null) {
			out.print("<script>alert('Your Status Is Not Activated Please Contact To Admin')</script>");
		}
	%>
	<div class="main">

		<div class="header">
			<div class="header_resize">
				<div class="logo">
					<h1>
						<a href="index.html" class="nobg">Blockchain Based Medical DB Security System</a>
					</h1>
				</div>
				<div class="menu_nav">
					<ul>
                        <li><a href="index.jsp"><h2>Home</h2></a></li>
                         <li><a href="ServerLogin.jsp"><h2>Admin</h2></a></li>
                         <li><a href="hack1.jsp"><h2>Hacker</h2></a></li>
                        <li><a href="reg.jsp"><h2>New Registration</h2></a></li>
                       
                       
                    </ul>
				</div>
				<div class="clr"></div>
			</div>
		</div>

		<div class="content">
			<div class="content_resize">
				<div class="article">
				<div align="center">
					<h1><font color="white"><b>User Login</b></font></h1>
					</div>
					<form action="session.jsp" name="f1" id="f1">

						<table align="center">

							<tr>
								<td></td>
							</tr>
							<tr>
								<td><h2>User Id</h2></td>
								<td><input type="text" class="style5" name="uid" required /></td>
								<td><label id="t4"></label></td>
							</tr>
							<tr>
								<td><br></td>
							</tr>
							<tr>
								<td><h2>Password</h2></td>
								<td><input type="password" name="pwd" id="pwd" required /></td>
								<td><label id="t5"></label></td>
							</tr>
							<tr>
								<td><br></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="submit" value="Login" class="style5"
									onclick="checkButton()" /></td>
								<td><label></label></td>
							</tr>
							<tr>
								<td><br></td>
							</tr>

						</table>

					</form>
				</div>

				<!--<div class="pagenavi"><span class="pages">Page 1 of 2</span><span class="current">1</span><a href="#">2</a><a href="#" >&raquo;</a></div>-->
			</div>

			<div class="clr"></div>
		</div>
		<div class="clr"></div>
		<div class="footer">
			<%@include file="footer.jsp"%>

		</div>
	</div>
</body>
</html>