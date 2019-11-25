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
			out.print("<script>alert('File hack Successfully')</script>");
		}
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
						<li><a href="Homepage2.jsp">Home</a></li>
						
						<li><a href="logout.jsp">Logout</a></li>
					</ul>
				</div>
				<div class="clr"></div>
			</div>
		</div>
		<%
		System.out.println("hiiiiiiii");
		String fileName = session.getAttribute("name").toString();
		System.out.println(fileName);
		int totLine = 0;
        String line;
		 FileReader file = new FileReader("E://upload//Plain_" + fileName);
		
        BufferedReader br = new BufferedReader(file);
		 String fb = "";
		 int i = 0;
         int mi = 0;
		 while ((line = br.readLine()) != null) {
             if (!line.isEmpty()) {
                 totLine++;
             }
         }
		 mi = totLine;
         System.out.println("Size of mi = " + mi);
			
         
         BufferedReader br1 = new BufferedReader(new FileReader("E://upload//Plain_" + fileName));
         while ((line = br1.readLine()) != null) {
             if (!line.isEmpty()) {
                 if (totLine >= 0) {
                     if (mi >= i) {
                         fb = fb + line + "\n";
                         i++;
                     } 
                 }
             }
         }
         file.close();
         br.close();
         br1.close();
		 MessageDigest md = MessageDigest.getInstance("MD5");
        FileUtil fu = new FileUtil();
        GlobalFunction GF = new GlobalFunction();
		%>
		<form action="text_file" method="post" name="form1">
                                    <div class="blockOne">
                                        <div class="sec1"><span class="fontT">Block :</span></div>
                                        <div class="sec2"><span>
                                        <input type="hidden" name="FileID" id="FileID" value="<%= GF.getLatestFileID() %>"></input>
                                        <input type="hidden" name="fileName" id="fileName" value="<%= session.getAttribute("fileName")%>"></input>
                                        <textarea name="firstBlock" id="firstBlock" rows="5" cols="30" class="splittextarea"><%= fb%></textarea>
                                        <input type="hidden" name="Block1" id="Block1" value="Block1"></input>
                                        </span></div>
                                   <div class="sec3">
                                       <%
                                       
                                       String b1 = fu.createChecksumStr(fb, "MD5");
                                      System.out.println("Degest Key 1 Block - "+b1);
                                       %>
                                       <input type="hidden" name="b1" style="width:240px" id="b1" value=""></input>
                                       
                                   </div>
                                </div>
                                 <div style="height: 10%; float: left; width: 100%;border: 0px solid #2B70C9; margin-top: 20px">
                                    <div style="width: 20%; height: 100%; float: left;"><span class="fontT">&nbsp;</span></div>
                                    <div><input type="hidden" name="hidden" id="hidden" value="2"></div>
                                    <div style="width: 50%;height: 100%;  float: left"><input type="submit" name="submit" value="SUBMIT"></input></div>
                                    <div class="fontT" style="width: 30%;height: 100%;  float: left;"><span class="fontT">&nbsp;</span></div>
                                </div>
</form>
</body>
</html>