<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>fastpage | About</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<script type="text/javascript" src="js/radius.js"></script>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css" />
  
  
  
</head>
    
 
<body>
 
  <%
request.getSession().removeAttribute("adminUid");  
  %>
  
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo"> <img src="images/logo_img.gif" alt="" width="51" height="48" />
          <h2 style="width: 1000px;"><a href="#"><span style="color: #0d2c52;font-size: larger">Privacy preserving Delegated Access </span><span style="font-size: larger">Control in public Clouds</span></a></h2>
      </div>
      <div class="clr"></div>
      <div class="menu_nav">
        <ul>
          <li><a href="#">Home</a></li>
          <li><a href="Alogin.jsp">Admnin SignIn</a></li>
          <li><a href="Ulogin.jsp">User SignIn</a></li>
          <li><a href="OWnerlogin.jsp">DataOwner SignIn</a></li>
        </ul>
        <div class="search">
          <form id="form" name="form" method="post" action="#">
            <span>
            <input name="q" type="text" class="keywords" id="textfield" maxlength="50" value="Search..." />
            <input name="b" type="image" src="images/search.gif" class="button" />
            </span>
          </form>
        </div>
      </div>
      <div class="clr"></div>
      <div class="header_img"> <img src="images/jpimage.jpg" alt="" width="960" height="326" /></div>
    </div>
  </div>
  <div class="clr"></div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2><span>Project </span> Concept</h2>
          <div class="clr"></div>
          <p><strong>Current approaches to enforce fine-grained access control on confidential data hosted in the cloud are based on fine-grained
                     encryption of the data. Under such approaches, data owners are in charge of encrypting the data before uploading them on the
                     cloud and re-encrypting the data whenever user credentials change. Data owners thus incur high communication and computation 
                     costs. A better approach should delegate the enforcement of fine-grained access control to the cloud, so to minimize the 
                     overhead at the data owners, while assuring data confidentiality from the cloud. We propose an approach, based on two layers 
                     of encryption, that addresses such requirement.</strong></p>
          <p> Under our approach, the data owner performs a coarse-grained encryption, whereas the cloud performs a fine-grained 
              encryption on top of the owner encrypted data. A challenging issue is how to decompose access control policies 
              (ACPs) such that the two layer encryption can be performed. We show that this problem is NP-complete and propose 
              novel optimization algorithms. We utilize an efficient group key management scheme that supports expressive ACPs.
              Our system assures the confidentiality of the data and preserves the privacy of users from the cloud while
              delegating most of the access control enforcement to the cloud.</p>
        </div>
       
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star">Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu">
            <li><a href="#">Home</a></li>
            <li><a href="Alogin.jsp">Admin Sign In</a></li>
          </ul>
        </div>
       
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg">
   
    <div class="footer">
        <p  class="lf">Get More  from <a target="_blank" href="http://www.jpinfotech.org">JPINFOTECH</a></p>
      <div class="clr"></div>
    </div>
  </div>
</div>
</body>
</html>
