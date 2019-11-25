<%-- 
    Document   : logout
    Created on : Oct 2, 2013, 6:03:41 PM
    Author     : Godwit-4
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blockchain</title>
    </head>
    <body>
   <%@page import="java.util.*" %>

<%session.invalidate();
response.sendRedirect("index.jsp");
%>
    </body>
</html>
