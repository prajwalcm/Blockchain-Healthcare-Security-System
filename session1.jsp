<%@page import="org.apache.el.lang.ELSupport"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="control.ConnectionManager"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Blockchain</title>
</head>
<body>

	<%
	  
		String uid=session.getAttribute("username").toString();
	

		try {

			Connection con = ConnectionManager.getConnection();
			System.out.println("Connection established");
			System.out.println( uid);
			Statement st = con.createStatement();
			ResultSet rst = st.executeQuery("select * from file where userid='" + uid+"' ");
			if (rst.next()) {

				String sts = rst.getString("hack_req");

				if (sts.equals("Waitting")) {
					
					session.setAttribute("username", uid);
					
						response.sendRedirect("notification.jsp?succ");
					

				} else if(sts.equals("Accept")) {
					response.sendRedirect("notification.jsp");

				}

			} else {
				out.println("in else");
				response.sendRedirect("index.jsp");
			}

		} catch (Exception e) {
			//System.out.println("Exception caught" + e.getMessage());
			e.printStackTrace();
		}
	%>
</body>
</html>