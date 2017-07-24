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
    String get = request.getParameter("m");
    String fileName = request.getParameter("fileName");
    if(get!=null){
         session.setAttribute("uID", get);
         System.out.println("User ID "+session.getAttribute("uID").toString());
    }
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
          <li><a href="HomePage.jsp">Home</a></li>
        </ul>
        <div class="search">
          <form id="form" name="form" method="post" action="#">
            <span>
            <input name="q" type="hidden" class="keywords" id="textfield" maxlength="50" value=<%=fileName%>/>
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
          <h2><span>Enter</span> Secret Key</h2>
          <div class="clr"></div>
          <form action="fileD.jsp" method="get">
              <p>
              
                  <input type ="hidden" name="fileName" value ="<%=fileName%>" readonly/>
          </p>
          <p>
              
              <input type ="text" name="key"/>              
          </p>
           <p>
              
               <input type ="submit" value="Submit"/>              
          </p>
          </form>
        </div>
       
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star">Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu">
            <li><a href="Ulogin.jsp">Back</a></li>
            
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
