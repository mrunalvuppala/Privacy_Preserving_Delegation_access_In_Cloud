/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package actionS;

import Utils.DbConnector;
import Utils.SimpleFTPClient;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.naming.spi.DirStateFactory;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/*import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
 */

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.fileupload.util.*;
import org.apache.commons.fileupload.disk.*;

/**
 *
 * @author jp
 */
public class uploadAction extends HttpServlet {

    private static final String TMP_DIR_PATH = "c:\\tmp";
    private File tmpDir;
    private static final String DESTINATION_DIR_PATH = "file";
    private File destinationDir;
    Calendar currentDate = Calendar.getInstance();
    SimpleDateFormat formatter =
            new SimpleDateFormat("yyyy/MMM/dd HH:mm:ss");
    String dateNow = formatter.format(currentDate.getTime());

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

        DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
        fileItemFactory.setSizeThreshold(1 * 1024 * 1024);
        fileItemFactory.setRepository(tmpDir);

        ServletFileUpload uploadHandler = new ServletFileUpload(fileItemFactory);
        Connection con = null;
        PreparedStatement pstm = null;
        PreparedStatement pstm1 = null;
        PreparedStatement pstm2 = null;
        PreparedStatement pstm3 = null;

        try {
            /*
             * Parse the request
             */
            con = DbConnector.getConnection();
            List items = uploadHandler.parseRequest(request);
            Iterator itr = items.iterator();
            String fileName = "";
            FileItem item = (FileItem) itr.next();
            String fName = item.getName();
            System.out.println("fname " + fName);

            fileName = (String) item.getName();
            System.out.println("filename " + fileName);
            // File file = new File(Constant.file, item.getName());
            // item.write(file);
            // System.out.println("" + file.getAbsolutePath());
            int x = fileName.lastIndexOf('\\');
            String fN = fileName.substring(x + 1, fileName.length());
            System.out.println(fN);
            SimpleFTPClient client = null;

            String sq1 = "select * from adserver ";

            pstm3 = con.prepareStatement(sq1);
            ResultSet rs1 = pstm3.executeQuery();
            String user = "";
            String cld = "";
            while (rs1.next()) {
                client = new SimpleFTPClient();
                cld = rs1.getString("host_name");
                user = rs1.getString("username");
                client.setHost(rs1.getString("host_name"));
                client.setUser(rs1.getString("username"));
                client.setPassword(rs1.getString("password"));
                client.setRemoteFile(fN);

                boolean log = client.connect();
                if (log) {
                    if (client.uploadFile(item.getInputStream())) {
                        HttpSession session = request.getSession(false);
                        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + user);
                        String sq2 = "insert into upload (file_name,domain,sub_domain,date,file_data,mail)values(?,?,?,?,?,?)";
                        pstm1 = con.prepareStatement(sq2);
                        pstm1.setString(1, fileName);
                        pstm1.setString(2, "not set");
                        pstm1.setString(3, "not set");
                        pstm1.setString(4, dateNow);
                        pstm1.setBinaryStream(5, item.getInputStream(), item.getSize());
                        pstm1.setString(6, (String)session.getAttribute("OwnerMailID"));
                        pstm1.execute();
                        response.sendRedirect("ownerHome.jsp?msg=File Uploaded..");
                    } else {
                        System.out.println(">>>>>>else");
                    }
                } else {
                    System.out.println("not connected");
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendRedirect("upload.jsp?msg=Cloud Not Connected");
            // log("Error encountered while uploading file", ex);
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
