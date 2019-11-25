<%@page import="control.GlobalFunction"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="control.FileUtil"%>
<%@page import="control.ConnectionManager" %>
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
		if (request.getParameter("succ") != null) {
			out.print("<script>alert('Login successfully')</script>");
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
				
                   <form  action="hacksearch" method="post" onsubmit="return formvalidation()">
            
            <center>
            
            <br><br><br><br><br><br><br></br></br></br></br></br></br></br>
            <img alt="ahha" src="images/index1.jpg" height="200px" width="400px">
            <table  cellpadding="3" align="center" height="150px" width="150px">
                
                <tbody>
                    <tr>
                        <td>User Name</td><td>:</td>
                        <td><input type="text" name="search" size="50%" required id="uname" value="" /></td>
                        
                    </tr>
                   
                    <tr>
                    
                    <td><input type="submit" size="20%" value="Search" />&nbsp;&nbsp;&nbsp;</td>
                    <td><input type="reset" value="Reset" />&nbsp;&nbsp;&nbsp;</td>
                    </tr>
                   
                    
                </tbody>
            </table>
            </center>
        </form>
       
        
        </body>
</html>