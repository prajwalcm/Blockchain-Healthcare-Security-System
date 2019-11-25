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
      <h1><a href="homepage.jsp"><span>Blockchain Based Medical Healthcare Security</span><small>System</small></a></h1>
    </div>
    <div class="menu_nav">
      <ul>
         <li><a href="home.jsp">Home</a></li>
              <li class="active"><a href="uploadfile.jsp">Upload File</a></li>
          <!--<li><a href="dedup.jsp">Check De duplication</a></li>-->
          <li><a href="download.jsp">Download File</a></li>
          <li><a href="logout.jsp">Logout</a></li>
      </ul>
      <div class="clr"></div>
    </div>
    <div class="clr"></div>
  </div>
  <div class="hbg"> <div class="hbg"><%@include file="image.jsp" %></div></div>
  <div class="content">
    <div class="mainbar">
      <div class="article">
        
              
           <h4 align="right">Welcome <%=user_id%></h4><br />
            <h2>Choose File TO Upload</h2>
           <br></br>
           
          
           <form class="form1" action="UploadServlet" method="post" enctype="multipart/form-data">
      <input type="hidden" name="user" value="<%=user_id%>" />
    Browse File:  :<div><input type="file" value="" name="path" size="30" maxlength="2048" /></div>
<br />
<br />
<div><input name="submit" class="form-login" type="submit" title="submit" value="submit" size="30" maxlength="2048" />&nbsp;&nbsp;
  </div>
</form>




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
           <li><a href="home.jsp">Home</a></li>
              <li class="active"><a href="uploadfile.jsp">Upload File</a></li>
          <!--<li><a href="dedup.jsp">Check De duplication</a></li>-->
          <li><a href="download.jsp">Download File</a></li>
          <li><a href="logout.jsp">Logout</a></li>
        </ul>
      </div>
      <div class="gadget">
       
        <div class="clr"></div>
        <ul class="ex_menu">
<!--          <li class="active"><a href="#">DreamTemplate</a> <span>Over 6,000+ Premium Web Templates</span></li>
          <li><a href="#">TemplateSOLD</a> <span>Premium WordPress &amp; Joomla Themes</span></li>
          <li><a href="#">ImHosted.com</a> <span>Affordable Web Hosting Provider</span></li>
          <li><a href="#">DreamStock</a> <span>Unlimited Amazing Stock Photos</span></li>
          <li><a href="#">Evrsoft</a> <span>Website Builder Software &amp; Tools</span></li>
          <li><a href="http://www.csshub.com/">CSS Hub</a><br />
            <span>Premium CSS Templates</span></li>-->
        </ul>
      </div>
      <div class="gadget">
        <h2 class="grey"><span>Wise Words</span></h2>
        <div class="clr"></div>
        <div class="testi">
          
        </div>
      </div>
    </div>
    <div class="clr"></div>
  </div>
  <div class="clr"></div>
  <div class="fbg">
<!--    <div class="col c1">
      <h2><span>Image Gallery</span></h2>
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

<%
}
    else
               {
        response.sendRedirect("index.jsp");
    }
%>
</body>
</html>