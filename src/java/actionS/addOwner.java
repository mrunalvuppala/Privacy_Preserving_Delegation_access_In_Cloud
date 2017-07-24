/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package actionS;

import Utils.DbConnector;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import java.sql.*;
import javax.servlet.http.HttpSession;
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
public class addOwner extends HttpServlet {

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
            Random r = new Random();
            int key = r.nextInt(1000-500)+500;
            Connection con = DbConnector.getConnection();
            Statement st = con.createStatement();
            int ii = st.executeUpdate("insert into adowner values('"+request.getParameter("name") +"','"+request.getParameter("pass") +"','"+request.getParameter("mail") +"',"+key+")");
            String recipients[] = request.getParameterValues("mail");
            mailAction ma = new mailAction();
            ma.postMail(recipients, "Your Key", key, "", request.getParameter("mail"));
            HttpSession session = request.getSession();
            session.setAttribute("Key",Integer.valueOf(key));
            session.setAttribute("mail", request.getParameter("mail"));
            if(ii!=0){
                response.sendRedirect("AdminPage.jsp?kk=Owner Registered..!");
            }
            else{
                response.sendRedirect("adDataOwner.jsp?jj=Register Error...!");
            }
            
            
        } catch (SQLException ex) {
            Logger.getLogger(addOwner.class.getName()).log(Level.SEVERE, null, ex);
        } catch(Exception ex) {
            ex.printStackTrace();
        }
            finally {
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
