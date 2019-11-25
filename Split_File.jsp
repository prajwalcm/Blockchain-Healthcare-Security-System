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
						<a href="index.jsp" class="nobg">Blockchain Based Medical Healthcare Security System</a>
					</h1>
				</div>
				<div class="menu_nav">
				<div class="clr"></div>
			</div>
		</div>

		<div class="article">
			<%@include file="WelcomeName.jsp"%>

			<div class="content">
                
                
                <div class="mainbar">
                    <div class="article" style="height:auto">

					 <%  
					
					
					 //String fileName = request.getParameter("fileName");
					 String fileName = session.getAttribute("fileName").toString();
                        int totLine = 0;
                        String line;
                        
                        FileReader file = new FileReader("E://upload//Plain_" + fileName);
                        BufferedReader br = new BufferedReader(file);
                        int i = 0;
                        int mi = 0;
                        String fb = "";
                        String mb = "";
                        String lb = "";
                        while ((line = br.readLine()) != null) {
                            if (!line.isEmpty()) {
                                totLine++;
                            }
                        }
                        mi = totLine / 3;
                        System.out.println("Size of mi = " + mi);
						
                        
                        BufferedReader br1 = new BufferedReader(new FileReader("E://upload//Plain_" + fileName));
                        while ((line = br1.readLine()) != null) {
                            if (!line.isEmpty()) {
                                if (totLine >= 3) {
                                    if (mi >= i) {
                                        fb = fb + line + "\n";
                                        i++;
                                    } else if ((mi * 2) >= i) {
                                        mb = mb + line + "\n";
                                        i++;
                                    } else {
                                        lb = lb + line + "\n";
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
                        
                		//String digest = GF.getDigest(new FileInputStream(uploadFolder+FileName), md, 2048);
                        
                    %>
                        
                        
                        
                     <div class="post1s">

                            <div  style="width:50%; height: auto; border: 0px solid #2B70C9; margin-left: auto; margin-right: auto">

                                <div style="height: 10%; float: left; width: 100%;border: 0px solid #2B70C9">
                                    <div style="width: 20%; height: 100%; float: left;"><span class="fontT">File Name :</span></div>
                                    <div style="width: 50%;height: 100%;  float: left"><span class="fontT"><%= session.getAttribute("fileName")%></span></div>
                                    <div class="fontT" style="width: 30%;height: 100%;  float: left;">Degest Key</div>
                                </div>
                                <form action="StoreContent" method="post" name="form1">
                                    <div class="blockOne">
                                        <div class="sec1"><span class="fontT">First Block :</span></div>
                                        <div class="sec2"><span>
                                        <input type="hidden" name="FileID" id="FileID" value="<%= GF.getLatestFileID() %>"></input>
                                        <input type="hidden" name="fileName" id="fileName" value="<%= session.getAttribute("fileName")%>"></input>
                                        <textarea name="firstBlock" id="firstBlock" rows="5" cols="30" class="splittextarea"><%= fb.trim()%></textarea>
                                        <input type="hidden" name="Block1" id="Block1" value="Block1"></input>
                                        </span></div>
                                   <div class="sec3">
                                       <%
                                       
                                       String b1 = fu.createChecksumStr(fb.trim(), "MD5");
                                       out.println("Degest Key 1 Block - "+b1);
                                       %>
                                       <input type="hidden" name="b1" style="width:240px" id="b1" value="<% out.println(b1); %>"></input>
                                       
                                   </div>
                                </div>
                                
                                
                                
                                <div class="blockOne">
                                    <div class="sec1"><span class="fontT">Middle Block :</span></div>
                                    <div class="sec2"><span>
                                    <textarea name="middleBlock" id="middleBlock" rows="5" cols="30" class="splittextarea"><%= mb.trim()%></textarea>
                                    <input type="hidden" name="Block2" id="Block2" value="Block2"></input>
                                    </span></div>
                                   <div class="sec3">
                                      <%
                                       
                                       String b2 = fu.createChecksumStr(mb.trim(), "MD5");
                                       out.println("Degest Key 2 Block - "+b2);
                                       %>
                                       <input type="hidden" name="b2" style="width:240px" id="b2" value="<% out.println(b2); %>"></input>
                                   </div>
                                </div>
                                
                                <div class="blockOne">
                                    <div class="sec1"><span class="fontT">Last Block :</span></div>
                                    <div class="sec2"><span>
                                    <textarea name="lastBlock" id="lastBlock" rows="5" cols="30" class="splittextarea"><%= lb.trim()%></textarea>
                                    <input type="hidden" name="Block3" id="Block3" value="Block3"></input>
                                    </span></div>
                                   <div class="sec3">
                                      <%
                                       
                                       String b3 = fu.createChecksumStr(lb.trim(), "MD5");
                                       out.println("Degest Key 3 Block - "+b3);
                                       %>
                                       <input type="hidden" name="b3" style="width:240px" id="b3" value="<% out.println(b3); %>"></input>
                                   </div>
                                </div>
                                     
                                           
                                <div style="height: 10%; float: left; width: 100%;border: 0px solid #2B70C9; margin-top: 20px">
                                    <div style="width: 20%; height: 100%; float: left;"><span class="fontT">&nbsp;</span></div>
                                    <div style="width: 50%;height: 100%;  float: left"><input type="submit" name="submit" value="SUBMIT"></input></div>
                                    <div class="fontT" style="width: 30%;height: 100%;  float: left;"><span class="fontT">&nbsp;</span></div>
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
             <%@include file="footer.jsp" %>
       			        
            </div>
        </div>
        
        <%
            } else {
                response.sendRedirect("index.jsp");
            }
        %>
    </body>
</html>