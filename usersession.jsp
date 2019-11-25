<%-- 
    Document   : usersession
    Created on : Sep 20, 2014, 4:02:55 PM
    Author     : godwit-8
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="control.ConnectionManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blockchain</title>
    </head>
    <body>
        
        <%
        //HttpSession session=null;
 try
        {
            
     session = request.getSession(true);
            String user = request.getParameter("user");
            String password = request.getParameter("password");
            session.setAttribute("emailid", user);
            
            
            ConnectionManager cm = new ConnectionManager();
            Statement st = cm.statement();
            String query = "select username,password from registration where username='"+user+"' and password='"+password+"'";
            System.out.println(query);
            ResultSet res = st.executeQuery(query);
            if(res.next())
            {
                
                response.sendRedirect("homepage.jsp");                           
            }
                       else{
                System.out.println("Fdshfb xzdnxfgnststg");
                       }
//            Loginbean logbean = new Loginbean();
//            logbean.setEmail(email);
//            logbean.setPassword(password);
            
            
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
%>
        
        
        <h1>Hello World!</h1>
    </body>
</html>
