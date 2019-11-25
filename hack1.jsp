<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
						<a href="index.html" class="nobg">Blockchain Based Medical Healthcare Security System</a>
					</h1>
				</div>
				<div class="menu_nav">
					<ul>
                        <li><a href="index.jsp">Home</a></li>
                         <li><a href="ServerLogin.jsp">Admin</a></li>
                        
                       
                       
                    </ul>
				</div>
				<div class="clr"></div>
			</div>
		</div>
		
		<div class="content">
			<div class="content_resize">
				<div class="article">
				<div align="center">
					<h2>Hacker Login</h2>
					</div>
					   <form action="hack" method="post">
            <br/>
            <table align="center">
            <tr>
            <td><span style="font-size:20px">Username</span></td><td><input type="text" name="uid" placeholder="username"></input></td>
            </tr>
            <tr>
            <td><br/></td>
            
            <td>
            </td>
            </tr>
            <tr>
            <td><span style="font-size:20px">Password</span></td><td><input type="password" name="pwd" placeholder="password"></input>
            </tr>
            <!-- <tr>
            <td>
            
           

            </tr> -->
            </table>
            <br/>
             <div align="center"><input type="submit" value ="Login" style="font-size:large; 70px; height: 40px; width:60px;"></input></div>
            
            </form>
				</div>
					<!-- END of main wrapper -->
	</div>

</body>
</html>