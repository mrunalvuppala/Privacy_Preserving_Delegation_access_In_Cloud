/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package actionS;

import Utils.DbConnector;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jp
 */
public class userReg extends HttpServlet {

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
            
            String v1 = request.getParameter("name");
            String v2 = request.getParameter("password");
            String v4 = request.getParameter("domain");
            String v5 = request.getParameter("subDomain");
            String v3 = request.getParameter("email");
            String ttt[] = {v3};
          Random r = new Random();
          int tt = r.nextInt(1000-500)+500;
          String gen =""+tt;
            
            
            Connection con = DbConnector.getConnection();
            Statement st = con.createStatement();
            String ins = "insert into userreg values('"+v1+"','"+v2+"','"+v4+"','"+v5+"','"+v3+"')";
            int i = st.executeUpdate(ins);
            if(i!=0){
                response.sendRedirect("HomePage.jsp?msg1=registered successfully...!");
               
            }
            else{
                response.sendRedirect("userRegister.jsp?msg=not registered..!!");
            }
            
            
        } catch (SQLException ex) {
            Logger.getLogger(userReg.class.getName()).log(Level.SEVERE, null, ex);
        } finally {            
            out.close();
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
