<%@page import="org.apache.el.lang.ELSupport"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="control.ConnectionManager"%>
<%@page import="control.SendMailSSL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Blockchain</title>
</head>
<body>

	<%
		String uid = request.getParameter("uid");
		String pwd = request.getParameter("pwd");

		try {

			Connection con = ConnectionManager.getConnection();
			System.out.println("Connection established");
			Statement st = con.createStatement();
			ResultSet rst = st
					.executeQuery("select * from reg where userid='" + uid
							+ "'AND pass='" + pwd + "' ");
			if (rst.next()) {

				String sts = rst.getString("status");
				session.setAttribute("usertype", rst.getString("user"));
				session.setAttribute("fname", rst.getString("fname"));
				session.setAttribute("privilege", rst.getString("privilege"));
				session.setAttribute("user", rst.getString("user"));
				session.setAttribute("id", rst.getString("id"));
				if (!sts.equals("Waitting")) {
					String privilege = rst.getString("privilege");
					session.setAttribute("username", uid);
					if (privilege.equals("Upload")) {
						out.println("in session");
						System.out.println("2");
						response.sendRedirect("Homepage1.jsp");
					} else if (privilege.equals("Download")) {
						out.println("in session");
						System.out.println("2");
						response.sendRedirect("Homepage2.jsp");
					} else if (privilege.equals("BOTH")) {
						out.println("in session");
						System.out.println("2");
						response.sendRedirect("Homepage.jsp");
					}

				} else {
					response.sendRedirect("index.jsp?status=reject");

				}

			} else {
				out.println("in else");
				response.sendRedirect("index.jsp");
			}

		} catch (Exception e) {
			System.out.println("Exception caught" + e.getMessage());
		}
	%>
</body>
</html>
