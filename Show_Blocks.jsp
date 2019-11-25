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
      
        if(request.getParameter("status")!=null){
        out.println("<script>alert('Successfully Uploaded!')</script>");
        }
     if(request.getParameter("duplicate")!=null){
         out.println("<script>alert('File is Deduplicated!')</script>");
         }
        
        %>
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

					<%  
					
					
					 int fileID = Integer.parseInt(request.getParameter("id"));
					 String fileName = request.getParameter("file");
                        int totLine = 0;
                        String line;
                        
                      //  FileReader file = new FileReader("D://upload//Plain_" + fileName);
                        //BufferedReader br = new BufferedReader(file);
                        int i = 0;
                        int mi = 0;
                        String fb = "";
                        String mb = "";
                        String lb = "";
                        int blockID1=0;
                        int blockID2=0;
                        int blockID3=0;
                        
                        
                   		
                        Connection con = ConnectionManager.getConnection();
                        
                        Statement st1 = con.createStatement();
                        Statement st2 = con.createStatement();
                        Statement st3 = con.createStatement();
                        
						if(fileName.length()>0){
						
							
							//For BLock 1
							String sql1 = "select * from blocked_files where block='Block1' and fileID="+fileID+" GROUP BY fileID";
							ResultSet rs1 = st1.executeQuery(sql1);
							if(rs1.next()){
								fb = rs1.getString("blockData");
								blockID1 = rs1.getInt("id");
							}else{
								
								
								Statement st11a = con.createStatement();
									String sql111 = "select * from blocked_files where id=(select blockid from debug_block where ref_fid="+fileID+" LIMIT 1)";
									ResultSet rs111 = st11a.executeQuery(sql111);
									if(rs111.next()){
										fb = rs111.getString("blockData");
										blockID1 = rs111.getInt("id");
									}
							}
							
							
							//For BLock 2
							String sql2 = "select * from blocked_files where block='Block2' and fileID="+fileID+" GROUP BY fileID";
							ResultSet rs2 = st2.executeQuery(sql2);
							if(rs2.next()){
								blockID2 = rs2.getInt("id");
								mb = rs2.getString("blockData");
							}else{
								
// 								 Statement st11c = con.createStatement();
// 								String sql11 = "select * from debug_block where ref_fid="+fileID+" LIMIT 1";
// 								ResultSet rs11c = st11c.executeQuery(sql11);
// 								int Blockid = rs11c.getInt("blockid");
								
								//blockID2 = Blockid;
								Statement st11b = con.createStatement();
									String sql111 = "select * from blocked_files where id=(select blockid from debug_block where ref_fid="+fileID+" LIMIT 0,1)";
									ResultSet rs1z = st11b.executeQuery(sql111);
									if(rs1z.next()){
										mb = rs1z.getString("blockData");
										blockID2 = rs1z.getInt("id");
									}
							}
							
							
							//For BLock 3
							String sql3 = "select * from blocked_files where block='Block3' and fileID="+fileID+" GROUP BY fileID";
							ResultSet rs3 = st3.executeQuery(sql3);
							if(rs3.next()){
								blockID3 = rs3.getInt("id");
								lb = rs3.getString("blockData");
							}else{
								
								Statement sql111 = con.createStatement();
									String sql1d = "select * from blocked_files where id=(select blockid from debug_block where ref_fid="+fileID+" LIMIT 1,1)";
									ResultSet rs1q = sql111.executeQuery(sql1d);
									if(rs1q.next()){
										lb = rs1q.getString("blockData");
										blockID3 = rs1q.getInt("id");
									}
							}
							
							
						}
                        
                   
                        MessageDigest md = MessageDigest.getInstance("MD5");
                        FileUtil fu = new FileUtil();
                        GlobalFunction GF = new GlobalFunction();
                        
                		//String digest = GF.getDigest(new FileInputStream(uploadFolder+FileName), md, 2048);
                        
                    %>



					<div class="post1s">

						<div
							style="width: 50%; height: auto; border: 0px solid #2B70C9; margin-left: auto; margin-right: auto">

							<div
								style="height: 10%; float: left; width: 100%; border: 0px solid #2B70C9">
								<div style="width: 20%; height: 100%; float: left;">
									<span class="fontT">File Name :</span>
								</div>
								<div style="width: 50%; height: 100%; float: left">
									<span class="fontT"><%= fileName %></span>
								</div>

							</div>
							<form action="StoreContent" method="post" name="form1">
								<div class="blockOne">
									<div class="sec1">
										<span class="fontT">First Block :</span>
									</div>
									<div class="sec2">
										<span> <input type="hidden" name="FileID" id="FileID"
											value="<%= GF.getLatestFileID() %>"></input> <input
											type="hidden" name="blockID1" id="blockID1"
											value="<%= blockID1 %>"></input> <input type="hidden"
											name="fileName" id="fileName"
											value="<%= session.getAttribute("fileName")%>"></input> <textarea readonly="readonly"
												name="firstBlock" id="firstBlock" class="splittextarea"><%= fb.trim()%></textarea>
											<input type="hidden" name="Block1" id="Block1" value="Block1"></input>
										</span>
									</div>

								</div>

								<div class="blockOne">
									<div class="sec1">
										<span class="fontT">Middle Block :</span>
									</div>
									<div class="sec2">
										<span> <input type="hidden" name="blockID2"
											id="blockID2" value="<%= blockID2 %>"></input> <textarea readonly="readonly"
												name="middleBlock" id="middleBlock" class="splittextarea"><%= mb.trim()%></textarea>
											<input type="hidden" name="Block2" id="Block2" value="Block2"></input>
										</span>
									</div>

								</div>

								<div class="blockOne">
									<div class="sec1">
										<span class="fontT">Last Block :</span>
									</div>
									<div class="sec2">
										<span> <input type="hidden" name="blockID3"
											id="blockID3" value="<%= blockID3 %>"></input> <textarea readonly="readonly"
												name="lastBlock" id="lastBlock" class="splittextarea"><%= lb.trim()%></textarea>
											<input type="hidden" name="Block3" id="Block3" value="Block3"></input>
										</span>
									</div>

								</div>


								<div
									style="height: 10%; float: left; width: 100%; border: 0px solid #2B70C9; margin-top: 20px">
									<div style="width: 20%; height: 100%; float: left;">
										<span class="fontT">&nbsp;</span>
									</div>

									<div class="fontT"
										style="width: 30%; height: 100%; float: left; display: none">
										<span class="fontT">&nbsp;</span>
									</div>
								</div>
						</div>
					</div>
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