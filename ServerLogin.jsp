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
                        <li><a href="index.jsp">Home</a></li>
                         <li><a href="ServerLogin.jsp">Admin</a></li>
                        <li><a href="reg.jsp">New Registration</a></li>
                       
                       
                    </ul>
				</div>
				<div class="clr"></div>
			</div>
		</div>

		<div class="content">
			<div class="content_resize">
				<div class="article">
				<div align="center">
					<h2>Admin Login</h2>
					</div>
					<form action="AdminLogin" name="f1" method="post" id="f1">

						<table align="center">

							<tr>
								<td></br></td>
							</tr>
							<tr>
								<td>User Name</td>
								<td><input type="text" class="style5" name="uid" /></td>
								
							</tr>
							<tr>
								<td><br></td>
							</tr>
							<tr>
								<td>Password</td>
								<td><input type="password" name="pwd" id="pwd" /></td>
								
							</tr>
							<tr>
								<td><br></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="submit" value="Login" class="style5" /></td>
								
							</tr>
							<tr>
								<td><br></td>
							</tr>
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
</body>
</html>