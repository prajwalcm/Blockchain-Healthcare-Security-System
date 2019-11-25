<%@page import="java.sql.PreparedStatement"%>
<%@page import="sun.security.pkcs11.Secmod.DbMode"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@page import="control.ConnectionManager"%>
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
						<li><a href="Homepage2.jsp">Home</a></li>
						
						<li><a href="logout.jsp">Logout</a></li>
					</ul>
				</div>
				<div class="clr"></div>
			</div>
		</div>
		


                                                
                                 <!--  String userid=session.getAttribute("userid").toString();
 //System.out.print(userid);-->
          <table width="100%"
					style="border: 1px; width: 100%; text-align: center; border: 1px solid">
					<tr>
						<th width="15%" style="text-align: center; border: 1px solid">Sender
							Name</th>
						<th width="15%" style="text-align: center; border: 1px solid">File
							Name</th>
						<th width="15%" style="text-align: center; border: 1px solid">Operation</th>


					</tr>
                       
							
    <%
        
    
    Connection cn=ConnectionManager.getConnection();
    session=request.getSession(false);
    if(session!=null)
    {
   String userid=(String)session.getAttribute("username");
   System.out.println("useeeeeeeeeeeeeeeeee"+userid);
   PreparedStatement ps=cn.prepareStatement("select * from file where userid='"+userid+"'");
    ResultSet rs=ps.executeQuery();
    while(rs.next())
    	
    {
    	int id=rs.getInt("id");
    	String filename=rs.getString("filename");
    	session.setAttribute("name", filename);
    	System.out.println(filename);
    	%>
    	  					<tr>
					<td style="text-align: center; border: 1px solid"><%=rs.getString("userid") %></td>
					<td style="text-align: center; border: 1px solid"><%=rs.getString("filename") %></td>
					<td style="text-align: center; border: 1px solid"><a
									href="text_file.jsp?id=<%=id%>&file=<%=filename%>">View
										File</a>&nbsp;</td>
<%-- 					<td style="text-align: center; border: 1px solid"><a href="viewf.jsp?id=<%=id%>&file=<%=filename%>"></a>View</td> --%>
					</tr>
  <%   	
   }
    }
    
    %>
		

			<div class="footer">
				<%@include file="footer.jsp"%>

			</div>
		</div>

		
	
</body>
</html>