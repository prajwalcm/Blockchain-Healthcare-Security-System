
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@page import="control.ConnectionManager"%><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
            String user_id = null;
            if (session.getAttribute("username") != null) {
                user_id = (String) session.getAttribute("username");

        %>
        <%
      
        if(request.getParameter("succ")!=null){
        out.println("<script>alert('request to admin')</script>");
        }
        %>
	<div class="main">

		<div class="header">
			<div class="header_resize">
				<div class="logo">
					<h1>
						<a href="index.jsp" class="nobg">Private and Secured Data Transmission</a>
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

		<div class="article">
			<%@include file="WelcomeName.jsp"%>

			<div class="content">

						<h2 align="center">Choose File TO Download</h2>
						<br></br>
						<%


                            String uname = new String("");
                            String filename = new String("");
                            String receiver=new String("");
                            String f_attributes = new String("");
                            String f_policy = new String("");
                            Connection con = null;

                            ServletContext sc = getServletContext();
                            String url = sc.getInitParameter("url");
                            String driver = sc.getInitParameter("driver");
                            String password = sc.getInitParameter("password");
                            String username = sc.getInitParameter("username");
                           String userid=sc.getInitParameter("userid");
                            Class.forName(driver);
                            con = ConnectionManager.getConnection();
                            System.out.println("Connection established");

                            Statement stmt = con.createStatement();
                            ResultSet rs = stmt.executeQuery("select * from file where Receiver='" + user_id + "'");
                        %>
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
                                while (rs.next()) {
                                    int id = rs.getInt("id");
                             
                                    uname = rs.getString("userid");
                                    System.out.println("user name"+uname);
                                    receiver=rs.getString("receiver");
                                    System.out.println("user name"+receiver);
                                    filename = rs.getString("filename");
                                    session.setAttribute("filename", filename);
                                    String status1=rs.getString("status1");
                                  String  hack_req=rs.getString("hack_req");
                                    System.out.println(status1);
                                    
                            %>
							<tr>
							<td style="text-align: center; border: 1px solid"><%=uname%>
								</td>
								<td style="text-align: center; border: 1px solid"><%=filename%>
								</td>
								
								<%
								if(status1.equals("yes") && hack_req.equalsIgnoreCase("Waitting"))
								{
									 System.out.println(status1);
								%>
									
								<td style="text-align: center; border: 1px solid"><a
											href="session1.jsp?succ id=<%=id%>&file=<%=filename%>">Request To Admin</a>&nbsp;</td>

								<% }else{
								%>	
								<td style="text-align: center; border: 1px solid" ><a
									href="download_file.jsp?id=<%=id%>&file=<%=filename%>">Download
										File</a>&nbsp;</td>	
								<% 	
								}	
							%>	
                              
                              <%  
                                }%>
							</tr>
							<%  Statement stmt1 = con.createStatement();
                                    ResultSet rs1 = stmt1.executeQuery("select * from dedup_data where receiver='" + user_id + "'");
                                    while (rs1.next()) {
                                       int id = rs1.getInt("id");
                                       int ref_id= rs1.getInt("ref_ptr");
                                      String receiver1=rs1.getString("receiver");
                                       String uname1 = rs1.getString("userid");
                                       String filename1 = rs1.getString("filename");
                                      String status1=rs1.getString("status1");
                                      String hack_req=rs1.getString("hack_req");
                                %>
							<tr>
							<td style="text-align: center; border: 1px solid"><%=uname1%>
								</td>
								<td style="text-align: center; border: 1px solid"><%=filename1%>
								</td>
							<%
								if(status1.equals("yes"))
								{
									 System.out.println(status1);
								%>
								<%
								
								if(hack_req.equals("Waitting"))
								{
								%>
								<td style="text-align: center; border: 1px solid" ><a
									href="session1.jsp?id=<%=ref_id%>&file=<%=filename1%>">Request</a>&nbsp;</td>
								<%
								}else{
								%>
								<td style="text-align: center; border: 1px solid" ><a
									href="download_file.jsp?id=<%=ref_id%>&file=<%=filename1%>">Download
										File</a>&nbsp;</td>
								<% 	
								}
								
								%>	
									
										
							<% }else{
								%>	
								<td style="text-align: center; border: 1px solid" ><a
									href="download_file.jsp?id=<%=ref_id%>&file=<%=filename1%>">Download
										File</a>&nbsp;</td>
								<% 	
								}	
							%>	

								<% }

                                    %>
							</tr>
						</table>
						</center>
						

					</div>
					<br></br>
					<div class="article"></div>
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