/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package actionS;

import Utils.DbConnector;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.DriverManager;
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
public class fileReq extends HttpServlet {

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
            String dom = null, sdom = null, dom1 = null, sdom1 = null;
            String User = (String) request.getSession().getAttribute("uID").toString();
            System.out.println("Serv " + User);
            String file = request.getParameter("getName");
            Connection con = DbConnector.getConnection();
            PreparedStatement pstm = null;
            PreparedStatement pstm1 = null;
            PreparedStatement pstm2 = null;

            String sql = "select * from userreg where name = '" + User + "'";
            pstm = con.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            System.out.println("rs");
            while (rs.next()) {
                dom = rs.getString("domain");
                sdom = rs.getString("sub_domain");
            }

            pstm2 = con.prepareStatement("select * from upload where file_name = '" + file + "' ");
            ResultSet rr = pstm2.executeQuery();
            while (rr.next()) {
                dom1 = rr.getString("domain");
                sdom1 = rr.getString("sub_domain");
            }

             if(dom.equals(dom1)&&(sdom.equals(sdom1))){





            System.out.println(dom + " " + sdom);
            System.out.println("java");
            System.out.println("begin update");
            String sq2 = "insert into filereq values('" + file + "','" + User + "','" + dom + "','" + sdom + "','Request Sent')";
            pstm1 = con.prepareStatement(sq2);
            pstm1.execute();
            System.out.println("update complete");
            response.sendRedirect("userHome.jsp?Request Sent");

             }else{
                 
                          //out.println("<script>alert('fgdsgdsfgfd')</script>");
                  response.sendRedirect("read.jsp?gg=domain / sub domain mismatch");
             }
        } catch (SQLException ex) {
            Logger.getLogger(fileReq.class.getName()).log(Level.SEVERE, null, ex);
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
