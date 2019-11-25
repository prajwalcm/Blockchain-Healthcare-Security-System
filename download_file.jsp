<%-- 
    Document   : download_file
    Created on : Jan 7, 2014, 9:01:08 PM
    Author     : Godwit-3
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="control.GlobalFunction"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="control.AESFile"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="control.decryptData"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="control.ConnectionManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%--<%@page import="cpabe.Decrypt_file"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
     <% 
     
    
     
     
     long startET = 0, endtimeET = 0;
     long elapsedTimeMillisET = 0;
     float elapsedTimeSecET = 0;
    
     long startDT = 0, endtimeDT = 0;
     long elapsedTimeMillisDT = 0;
     float elapsedTimeSecDT = 0;
     GlobalFunction GF = new GlobalFunction();
            String user_id = null;
            if (session.getAttribute("username") != null) {
                user_id = (String) session.getAttribute("username");

        
                String ids=request.getParameter("id");
                int id=Integer.parseInt(ids);
                String file_name=request.getParameter("file");
           
                ServletOutputStream output1 = response.getOutputStream();
//      
                String file=file_name;    //request.getParameter("file");
//          
                 Connection con = null;

                            ServletContext sc = getServletContext();
                            String url = sc.getInitParameter("url");
                            String driver = sc.getInitParameter("driver");
                            String password = sc.getInitParameter("password");
                            String username = sc.getInitParameter("username");
                            Blob hash_data;
                            byte[] db_enc_data=null;
                            Class.forName(driver);
                            con = ConnectionManager.getConnection();
                            System.out.println("Connection established");
         Statement  stm = con.createStatement();
         String query = "select * from file where id="+id+"";
         ResultSet res = stm.executeQuery(query);
    while(res.next())
               {
         hash_data=res.getBlob("secrete_key");
                                
                               db_enc_data = hash_data.getBytes(1,(int)hash_data.length());
                              System.out.println("db_enc_data"+db_enc_data);
          FileOutputStream fos11 = new FileOutputStream("E://upload//enc_"+file_name);
         byte[] array1 = new byte[1];
        byte[] buffer = new byte[1];
        InputStream is = res.getBinaryStream("file");
        
         while (is.read(buffer) > 0) {
        fos11.write(buffer);
      }
      fos11.close();
         
              }
         
         
        System.out.println("dfhfgb");
      
             String decrypted_str =null;
             
             
             ///////////////////decrypt file
              FileReader f = new FileReader("E://upload//enc_"+file_name);

                          
                            BufferedReader reader = new BufferedReader(f);
                            String text = "";
                            String line = reader.readLine();
                            while (line != null) {
                                text += line;
                                line = reader.readLine();
                              //  out.println("line");
                            }
                            reader.close();
                            
                             AESFile ae = new AESFile();

                            ae.generateKey(db_enc_data, "AES");

                            startET=System.currentTimeMillis();
                            String plainText = text;
                            String decryptedText = AESFile.decrypt(plainText);
                            
 							endtimeET = System.currentTimeMillis();
                            
                            elapsedTimeMillisET = endtimeET - startET;
                            elapsedTimeSecET = elapsedTimeMillisET / 1000F;
                            System.out.println("Decryption Time-------"+elapsedTimeSecET);
                            String dec_file = "E://upload//dec_"+file_name;
                            
                            startDT=System.currentTimeMillis();
                            
                            PrintWriter writer = new PrintWriter(dec_file, "UTF-8");
                            writer.println(decryptedText);
                            writer.close();


                           
                        String decfile = "E://upload//dec_"+file_name;
         StringBuffer sb = new StringBuffer();
         BufferedReader br = null;    
         
 
		try {
 
			String sCurrentLine;
 
			br = new BufferedReader(new FileReader(decfile));
 
			while ((sCurrentLine = br.readLine()) != null) {
				//System.out.println(sCurrentLine);
                            sb.append(sCurrentLine);
			}
 
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (br != null)br.close();
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
                
                
                String cont=sb.toString();
                
                byte requestBytes[] = cont.getBytes();
ByteArrayInputStream bis = new ByteArrayInputStream(requestBytes);
response.reset();
response.setContentType("application/text");
String ft=file;
response.setHeader("Content-disposition","attachment; filename="+ft);
byte[] buf = new byte[1024];
int len;
int size=0;
while ((len = bis.read(buf)) > 0){
output1.write(buf, 0, len);
size++;
}
output1.flush();
output1.close();
endtimeDT = System.currentTimeMillis();

elapsedTimeMillisDT = endtimeDT - startDT;
elapsedTimeSecDT = elapsedTimeMillisDT / 1000F;
System.out.println("Download Time-------"+elapsedTimeSecDT);

GF.setGraphDownloadTime(id, elapsedTimeSecDT, elapsedTimeSecET, user_id);


System.out.print("File name "+ft);


try{
	PreparedStatement ps=con.prepareStatement("INSERT INTO `cloud_deduplication`.`downloadedfile` (`id`, `filename`, `username`) VALUES (NULL, '"+ft+"', '"+user_id+"')");
	int downcount=ps.executeUpdate();
	if(downcount>0)
	{
		System.out.print("Insert Done ");
	}
	else
	{
		System.out.print("Insert Fails");
	}
}
catch(Exception e)
{
	System.out.print("Exc "+e);
}






response.sendRedirect("download.jsp");
         
         
        %>
            
            
            <% }else {
                response.sendRedirect("index.jsp");
            }%>
</html>
