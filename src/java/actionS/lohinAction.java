/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package actionS;

import Utils.DbConnector;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jp
 */
public class lohinAction extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
       
         try {
            
            String v1 = request.getParameter("username");
            String v2 = request.getParameter("password");
          
             System.out.println(v1+","+v2);
            
            Connection con = DbConnector.getConnection();
            Statement st = con.createStatement();
            String selec = "select * from userreg where name = '"+v1+"' ";
            ResultSet rs = st.executeQuery(selec);
            if(rs.next()){
                
                String duser = rs.getString("name");
                String dpass = rs.getString("pass");
                if(v1.equals(duser)&&(v2.equals(dpass))){
                   HttpSession session = request.getSession(true);
                    session.setAttribute("userMailID",rs.getString("mail"));
                   // response.sendRedirect("userHome.jsp?m="+v1);    
                    response.sendRedirect("userLoginChk.jsp?m="+v1);    
                    
                  
                }
                else{
                    response.sendRedirect("login.jsp?m=login failed...!");
                }
                
            }
           
            if(v1.equalsIgnoreCase("ADMIN")&&(v2.equalsIgnoreCase("ADMIN"))){
              response.sendRedirect("AdminPage.jsp"); 
            }
            
            
            
            
            
        } catch (SQLException ex) {
            Logger.getLogger(lohinAction.class.getName()).log(Level.SEVERE, null, ex);
        } finally {            
            out.println("<h2 style='margin-left:1s0px;margin-top:250px;'> <center>UserName / PassWord Error.. <br> Check The Fileds.....!</center></h2>");
       // response.sendRedirect("login.jsp?m=check Filedz");
         }
    
    
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
