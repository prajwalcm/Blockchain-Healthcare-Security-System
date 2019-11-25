<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Blockchain</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<script>
function checkFName()
{

var fname=document.f1.fname.value;
var l=fname.length;

if(l<=0)
{
t1.innerHTML="Not empty";
document.f1.fname.focus();
}
var c=0;
var aChar;
for(var i = 0; i != l; i++) {
 aChar = fname.substring(i,i+1) 
if(aChar.search(/[A-Za-z]/)==-1)
{
c=2;
break;
}
else{

c=3;

}}
if(c==2)
{
t1.innerHTML="Not valid";
document.f1.fname.focus();

}
if(c==3)
{
t1.innerHTML="<img src=\"./Images/correct.JPG \">"
}

}



function checkLName()
{

var lname=document.f1.lname.value;
var l1=lname.length;
if(l1<=0)
{
t2.innerHTML="Not empty";
document.f1.lname.focus();
}
var c1=0;
var aChar1;
for(var i = 0; i != l1; i++) {
 aChar1 = lname.substring(i,i+1) 
if(aChar1.search(/[A-Za-z]/)==-1)
{
c1=2;
}
else
{
c1=3;
}
}
if(c1==2)
{
t2.innerHTML="Not valid";
document.f1.lname.focus();

}
if(c1==3)
{
t2.innerHTML="<img src=\"./Images/correct.JPG \">"
}

}

function checkEId()
{

var eid=document.f1.emid.value;
if(eid.search(/[a-zA-Z]\w+\@[a-zA-Z]\w+/)!=0)
{
t3.innerHTML="Not Valid";
document.f1.emid.focus();

}
}
function checkId()
{
var id=document.f1.uid.value;
if(id.search(/[a-zA-Z]\w+/)!=0)
{
t4.innerHTML="Not Empty";
document.f1.uid.focus();
}
var l3=id.length;
var c3=0;
var aChar3;
for(var i = 0; i != l3; i++) {
 aChar3 =id.substring(i,i+1) 
if(aChar3.search(/[A-Za-z]/)==-1)
{
c3=2;
}
else
{
c3=3;
}
}
if(c3==2)
{
t4.innerHTML="Not valid";
document.f1.uid.focus();

}
if(c3==3)
{
t4.innerHTML="<img src=\"./Images/correct.JPG \">"
}
}
function checkPwd()
{
 var pwd1=document.f1.pwd.value;
 if(pwd1.length<6){
 t5.innerHTML="Not valid";
 document.f1.pwd.focus();

 }
 else
{
t5.innerHTML="<img src=\"./Images/correct.JPG \">"
}
} 
function chechRpwd()
{
var pwd1=document.f1.pwd.value;
var pwd2=document.f1.rpwd.value;
if(pwd1!=pwd2)
{
t6.innerHTML="Not same";
document.f1.rpwd.focus();

}
else
{
t6.innerHTML="<img src=\"./Images/correct.JPG \">"
}
}

function checkNo()
{
var phno=document.f1.pno.value;
if(phno.length!=10 )
{
t8.innerHTML="Invalid Phone no";
document.f1.pno.focus();

}

var c5=0;
var aChar5=phno;
for(var i = 0; i != 10; i++) {
 aChar5 =phno.substring(i,i+1) 
if(aChar5.search(/[0-9]+/)==-1)
{
c5=2;
}
else
{
c5=3;
}
}
if(c5==2)
{
t8.innerHTML="Invalid Phone no";
document.f1.pno.focus();
}
if(c5==3)
{
t8.innerHTML="<img src=\"./Images/correct.JPG \">"
}
}

function checkButton()
{

checkId();
checkPwd();
}
</script>
</head>
<body>
     <%
    String user_id=null;
if (session.getAttribute("username") != null) {
				user_id = (String) session.getAttribute("username");
			    
%>
<div class="main">
  <div class="search">
    <form method="get" id="search" action="#">
      <span>
      <input type="text" value="Search..." name="s1" id="s" />
      
      <input name="searchsubmit" type="image" src="images/search.gif" value="Go" id="searchsubmit" class="btn"  />
      </span>
    </form>
    <div class="clr"></div>
  </div>
  <div class="clr"></div>
  <div class="header">
    <div class="logo">
      <h1><a href="index1.html"><span> </span><small>    </small></a></h1>
    </div>
    <div class="menu_nav">
      <ul>
        <li class="active"><a href="home.jsp">Home</a></li>
              <li><a href="uploadfile.jsp">Upload File</a></li>
          <!--<li><a href="dedup.jsp">Check De duplication</a></li>-->
          <li><a href="download.jsp">Download File</a></li>
          <li><a href="logout.jsp">Logout</a></li>
      </ul>
      <div class="clr"></div>
    </div>
    <div class="clr"></div>
  </div>
  <div class="hbg"><img src="images/header_images.jpg" width="970" height="294" alt="" /></div>
  <div class="content">
    <div class="mainbar">
      <div class="article">
          <h4 align="right">Welcome <%=user_id%></h4><br />
          </h2>
          <p>  Cloud computing provides seemingly unlimited virtualized
resources to users as services across the whole
Internet, while hiding platform and implementation details.
Todays cloud service providers offer both highly
available storage and massively parallel computing resources
at relatively low costs. As cloud computing
becomes prevalent, an increasing amount of data is being
stored in the cloud and shared by users with specified
privileges, which define the access rights of the stored
data. One critical challenge of cloud storage services is
the management of the ever-increasing volume of data.</p>
      </div>
      <div class="article">
<!--        <h2><span>Lorem Ipsum</span> Dolor Sit</h2>
        <div class="clr"></div>
        <p class="post-data"><a href="#" class="com fr">Comments (7)</a> <span class="date">March 15, 2010</span> &nbsp;|&nbsp; Posted by <a href="#">Owner</a> &nbsp;|&nbsp; Filed under <a href="#">templates</a>, <a href="#">internet</a></p>
        <img src="images/images_2.jpg" width="613" height="193" alt="" />
        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero. Suspendisse bibendum. Cras id urna. <a href="#">Morbi tincidunt, orci ac convallis aliquam, lectus turpis varius lorem, eu posuere nunc justo tempus leo.</a> Donec mattis, purus nec placerat bibendum, dui pede condimentum odio, ac blandit ante orci ut diam. Cras fringilla magna. Phasellus suscipit, leo a pharetra condimentum, lorem tellus eleifend magna, eget fringilla velit magna id neque. Curabitur vel urna. In tristique orci porttitor ipsum. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero. Suspendisse bibendum. Cras id urna. Morbi tincidunt, orci ac convallis aliquam.</p>
        <p>Aenean commodo elit ac ante dignissim iaculis sit amet non velit. Donec magna sapien, molestie sit amet faucibus sit amet, fringilla in urna. Aliquam erat volutpat. Fusce a dui est. Sed in volutpat elit. Nam odio tortor, pulvinar non scelerisque in, eleifend nec nunc. Sed pretium, massa sed dictum dapibus, nibh purus posuere magna, ac porta felis lectus ut neque. Nullam sagittis ante vitae velit facilisis lacinia. Cras vehicula lacinia ornare. Duis et cursus risus. Curabitur consectetur justo sit amet odio viverra vel iaculis odio gravida. Ut imperdiet metus nec erat.</p>
        <p class="spec"><a href="#" class="rm fl">Read more</a></p>
        <div class="clr"></div>-->
      </div>
      <!--<div class="pagenavi"><span class="pages">Page 1 of 2</span><span class="current">1</span><a href="#">2</a><a href="#" >&raquo;</a></div>-->
    </div>
    <div class="sidebar">
      <div class="gadget">
        <h2><span>Sidebar</span> Menu</h2>
        <div class="clr"></div>
        <ul class="sb_menu">
            <li class="active"><a href="home.jsp">Home</a></li>
              <li><a href="uploadfile.jsp">Upload File</a></li>
          
          <li><a href="download.jsp">Download File</a></li>
          <li><a href="logout.jsp">Logout</a></li>
        </ul>
      </div>
      <div class="gadget">
        
      </div>
      <div class="gadget">
        <h2 class="grey"><span></span></h2>
        <div class="clr"></div>
        <div class="testi">
          
         
        </div>
      </div>
    </div>
    <div class="clr"></div>
  </div>
  <div class="clr"></div>
  <div class="fbg">
    <div class="col c1">
<!--      <h2><span>Image Gallery</span></h2>
      <a href="#"><img src="images/pic_1.jpg" width="58" height="58" alt="" /></a> <a href="#"><img src="images/pic_2.jpg" width="58" height="58" alt="" /></a> <a href="#"><img src="images/pic_3.jpg" width="58" height="58" alt="" /></a> <a href="#"><img src="images/pic_4.jpg" width="58" height="58" alt="" /></a> <a href="#"><img src="images/pic_5.jpg" width="58" height="58" alt="" /></a> <a href="#"><img src="images/pic_6.jpg" width="58" height="58" alt="" /></a> </div>-->
    <div class="col c2">
<!--      <h2><span>Lorem Ipsum</span></h2>
      <p>Lorem ipsum dolor<br />
        Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero. Suspendisse bibendum. Cras id urna. <a href="#">Morbi tincidunt, orci ac convallis aliquam</a>, lectus turpis varius lorem, eu posuere nunc justo tempus leo. Donec mattis, purus nec placerat bibendum, dui pede condimentum odio, ac blandit ante orci ut diam.</p>-->
    </div>
    <div class="col c3">
<!--      <h2><span>About</span></h2>
      <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero. Suspendisse bibendum. Cras id urna. Morbi tincidunt, orci ac convallis aliquam, lectus turpis varius lorem, eu posuere nunc justo tempus leo. llorem, eu posuere nunc justo tempus leo. Donec mattis, purus nec placerat bibendum. <a href="#">Learn more...</a></p>-->
    </div>
    <div class="clr"></div>
  </div>
  <div class="footer">
    
  </div>
</div>
<div align=center></div>
<%
}
    else
               {
        response.sendRedirect("index.jsp");
    }
%>
</body>
</html>