
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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

<script>


function AllowAlphabet() 
{
    if (!f1.fname.value.match(/^[a-zA-Z]+$/)
            && f1.fname.value != "") {
    	f1.fname.value = "";
    	f1.fname.focus();
        alert("Please Enter only alphabet in text");
    }
    
    if (!f1.lname.value.match(/^[a-zA-Z]+$/) 
    		&& f1.lname.value != "") {
    	f1.lname.value = "";
    	f1.lname.focus();
        alert("Please Enter only alphabets in text");
    }

}

function Validate()
{ 
    var y = document.f1.pno.value;
   
   if(isNaN(y)||y.indexOf(" ")!=-1)
   {
	   
	   f1.pno.value="";
	   f1.pno.focus();
      alert("Enter Only Numeric value");
      return false;
   }
    if (y.length!=10)
   {
        alert("Enter 10 Number");
        return false;
   } 
   
   if (!y.match(/^[0-9]+$/) 
   		&& y != "") {
   	y = "";
   	f1.pno.focus();
       alert("Enter only Digits in textbox");
   }

}



function validEmail1() {
	var mail=document.f1.emid.value;
	if(mail== ""){
        alert("Enter Email id");
        document.f1.emid.focus();
        return false;
    }
    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail))  
    {  
    }else{
    	alert("Enter Valid Email id");
    	 document.f1.emid.focus();
       return false;
	}
}





</script>
</head>
<body>
	<%
		if (request.getParameter("status") != null) {
			out.println("<script>alert('Successfully registred!')</script>");
		}
	%>
	<div class="main">

		<div class="header">
			<div class="header_resize">
				<div class="logo">
					<h1>
						<a href="index.html" class="nobg">Private and Secured Data Transmission</a>
					</h1>
				</div>
				<div class="menu_nav">
					     <ul>
                        <li><a href="index.jsp">Home</a></li>
                         <li><a href="ServerLogin.jsp">Admin</a></li>
                        <li><a href="reg.jsp">New Registration</a></li>
                       
                       
                    </ul>
				</div>
				<div class="clr"></div>
			</div>
		</div>

		<div class="article">
			<%@include file="WelcomeName.jsp"%>

			<div class="content">

					<h2 align="center">
						Registration Form<br />
					</h2>
					<form action="./reg.jsp" name="f1" id="f1">

						<table align="center">
							<tr>
								<td>First Name</td>
								<td><input type="text" name="fname" id="fname" onblur="AllowAlphabet()" required/></td>
								<td><label id="t1" class="style6"></label></td>
							</tr>
							<tr>
								<td><br></td>
							</tr>
							<tr>
								<td>Last Name</td>
								<td><input type="text" class="style5" name="lname" id="lname" onblur="AllowAlphabet()" required/></td>
								<td><label id="t2"></label></td>
							</tr>
							<tr>
								<td><br></td>
							</tr>
							<tr>
								<td>E-mail id</td>
								<td><input type="text" class="style5" name="emid" id="emid" onblur="return validEmail1()" required/></td>
								<td><label id="t3"></label></td>
							</tr>
							<tr>
								<td><br></td>
							</tr>
							<tr>
								<td>User Id</td>
								<td><input type="text" name="uid" required /></td>
								<td><label id="t4"></label></td>
							</tr>
							<tr>
								<td><br></td>
							</tr>
							<tr>
								<td>Password</td>
								<td><input type="password" name="pwd" id="pwd" onblur="return validpass()" required /></td>
								<td><label id="t5"></label></td>
							</tr>
							<tr>
								<td><br></td>
							</tr>
							<tr>
								<td>Date of Birth</td>
								<td><input type="date" name="dob" required/></td>
								<td><label id="t7"></label></td>
							</tr>
							<tr>
								<td><br></td>
							</tr>

							<tr>
								<td>Phone No</td>
								<td><input type="text" class="style5" id="pno" name="pno"maxlength="10" onblur="return Validate()" required/></td>
								<td><label id="t8"></label></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td>Address</td>
								<td><textarea class="style5" name="address" required></textarea></td>
								<td><label id="t9"></label></td>
							</tr>
							<tr>
								<td><br></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="submit" value="Register" class="style5"
									onclick="checkButton()" /></td>
								<td><label></label></td>
							</tr>
							<tr>
								<td><br></td>
							</tr>

							<tr>
								<td></td>
								<td><center>
										<h4>
											<font color="green"><a href="index.jsp"> click
													here to login</a></font>
										</h4>
									</center></td>
								<td><label></label></td>
							</tr>

						</table>

					</form>
				</div>


			</div>

			<div class="clr"></div>
		</div>
		<div class="clr"></div>



		<%!Connection con = null;%>
		<%
			try {
				response.setContentType("text/html");
				String fname = request.getParameter("fname");
				String lname = request.getParameter("lname");
				String emid = request.getParameter("emid");
				String uid = request.getParameter("uid");
				String pwd = request.getParameter("pwd");
				String dob = request.getParameter("dob");
				String pno = request.getParameter("pno");
				String address = request.getParameter("address");

				if (fname != null && lname != null && emid != null
						&& uid != null && pwd != null) {
					Statement st = null;
					ServletContext sc = getServletContext();
					String url = sc.getInitParameter("url");
					String driver = sc.getInitParameter("driver");
					String password = sc.getInitParameter("password");
					String username = sc.getInitParameter("username");
					con = ConnectionManager.getConnection();

					System.out.println("Connection established");

					PreparedStatement insert_row = con
							.prepareStatement("INSERT INTO reg(fname,lname,emailid,userid,pass,dob,phone,address,status) VALUES(?,?,?,?,?,?,?,?,?)");

					insert_row.setString(1, fname);
					insert_row.setString(2, lname);
					insert_row.setString(3, emid);
					insert_row.setString(4, uid);
					insert_row.setString(5, pwd);
					insert_row.setString(6, dob);
					insert_row.setString(7, pno);
					insert_row.setString(8, address);
					insert_row.setString(9, "Waitting");
					System.out.println(insert_row);
					int insert = insert_row.executeUpdate();
					out.println("");
					out.println("");
					response.sendRedirect("reg.jsp?status=success");
					//out.println("successfully inserted");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (con != null) {
					con.close();
					System.out.println("Connection closed");
				}
			}
		%>
		<div class="footer">
			<%@include file="footer.jsp"%>

		</div>
	</div>
</body>
</html>