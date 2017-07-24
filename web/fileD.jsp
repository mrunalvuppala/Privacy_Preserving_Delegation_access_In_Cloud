<%@page import="Utils.DbConnector"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<title>fastpage | About</title>
</head>

<body>		
<%
     


 //String us = session.getAttribute("userId").toString();
 //System.out.println(us);
       
              String getf = request.getParameter("fileName");
              System.out.println("file name is " + getf);
              Class.forName("com.mysql.jdbc.Driver");
              Connection conn = DbConnector.getConnection();
              Statement st = conn.createStatement();
              String qqq = "select * from upload where file_name= '"+getf+"' ";
              
              ResultSet rs = st.executeQuery(qqq);
              if(rs.next()) {
                String OwnerKey = (String)session.getAttribute("OwnerKey");
                String userKey = (String)request.getParameter("key");
                System.out.println("file name is " + getf + "Owner Key is : " + OwnerKey  + userKey);
                if(OwnerKey.equals(userKey)) {
		Blob b = rs.getBlob("file_data");
                //System.out.println(b);
		if(b != null)
		{
                   // System.out.println("Fdsf");
			String fileName = "image";
			byte[] ba = b.getBytes(1, (int)b.length());
			 response.setContentType("text/plain");
			response.setHeader("Content-Disposition","attachment; filename=\""+getf+"\"");
			
			OutputStream os = response.getOutputStream();
			os.write(ba);
			os.close();
			ba = null;
			//session.removeAttribute("document1");
		} }
		else
		{
			response.sendRedirect("down.jsp");
		}
                               }
%>

</body>
</html>