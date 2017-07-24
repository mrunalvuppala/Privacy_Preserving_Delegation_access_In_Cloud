/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package actionS;

import Utils.DbConnector;
//import java.awt.Component;
import java.io.IOException;
import java.io.PrintWriter;
/*import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;*/
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.util.Random;
import java.util.StringTokenizer;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jp
 */
public class mailAction extends HttpServlet {

//private static String emailMsgTxt = "";
    private static String emailSubjectTxt = "";
    private static String emailFromAddress = "";
    private static String[] emailList = new String[10];

    public void postMail(String recipients[], String subject, int message, String from, String toAddress) throws MessagingException {
        String host = "", user = "", pass = "";
        int a = (int) (Math.random() * 100000);
        String c = Integer.toString(message);
        String e = "key is=";
        // String emailid ="in.sivasankar@gmail.com";
        host = "smtp.gmail.com"; //"smtp.gmail.com";
        user = "customerservice404@gmail.com"; //"YourEmailId@gmail.com" // email id to send the emails
        pass = "customer@404"; //Your gmail password
        String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
        from = "customerservice404@gmail.com"; //Email id of the recipient
        subject = "welcome";
        String messageText = "Login key is=<b>" + c + "</b>";
        //session.setAttribute("userid",userid);
        //session.setAttribute("password",c);
        //session.setAttribute("emailid",emailid);
        boolean sessionDebug = true;
        Properties props = System.getProperties();
        props.put("mail.host", host);
        props.put("mail.transport.protocol.", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.", "true");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.socketFactory.fallback", "false");
        props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
        try {
            Session mailSession = Session.getDefaultInstance(props, null);
            mailSession.setDebug(sessionDebug);
            Message msg = new MimeMessage(mailSession);
            msg.setFrom(new InternetAddress(from));
            InternetAddress[] address = {new InternetAddress(toAddress)};
            msg.setRecipients(Message.RecipientType.TO, address);
            msg.setSubject(subject);
            msg.setContent(messageText, "text/html"); // use setText if you want to send text
            Transport transport = mailSession.getTransport("smtp");
            transport.connect(host, user, pass);
            transport.sendMessage(msg, msg.getAllRecipients());
            //out.println("message successfully sended"); // assume it was sent
            //response.sendRedirect("request2.jsp");
        } catch (MessagingException mex) {
            mex.printStackTrace();
        } catch (Exception err) {
            err.printStackTrace();
            //out.println("message not successfully sended"); // assume it’s a fail
        }
        // ends here
    }

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
            int tt = r.nextInt(1000 - 500) + 500;
            String gen = "" + tt;
            Connection con = DbConnector.getConnection();
            Statement st1 = con.createStatement();
            String ins = "insert into userreg values('" + v1 + "','" + v2 + "','" + v4 + "','" + v5 + "','" + v3 + "','" + gen + "')";
            int i1 = st1.executeUpdate(ins);
            if (i1 != 0) {
                //   try {
                String toAddress = v3;
                String sub = "Welcome message";
                String msg = gen;
                String emailMsgTxt = msg;
                emailSubjectTxt = sub;
                emailFromAddress = "customerservice404@gmail.com";
                // Add List of Email address to who email needs to be sent to
                int i = 0;
                if (toAddress.contains(",")) {
                    StringBuilder sb = new StringBuilder(toAddress);
                    StringTokenizer st = new StringTokenizer(toAddress);
                    System.out.println("Mail id is : " + toAddress);
                    while (st.hasMoreTokens()) {
                        emailList[i] = st.nextToken(",");
                        System.err.println(i + "   " + emailList[i]);
                        i++;
                    }
                }
                if (i == 0) {
                    emailList[i] = toAddress;
                    i++;
                }
                String emailReceipeint[] = new String[i];
                for (int j = 0; j < i; j++) {
                    emailReceipeint[j] = emailList[j];
                    System.out.println("Actually emails are " + j + " " + emailReceipeint[j]);
                }
                mailAction smtpMailSender = new mailAction();
                try {
                    smtpMailSender.postMail(emailReceipeint, emailSubjectTxt, tt, emailFromAddress, toAddress);
                } catch (MessagingException ex) {
                    ex.printStackTrace();
                    //Logger.getLogger(Home.class.getName()).log(Level.SEVERE, null, ex);
                }
                System.out.println("Sucessfully Sent mail to All Users");
                // response.sendRedirect("mail.jsp?msg=mail sent successfully...!");
                //}
                response.sendRedirect("HomePage.jsp?msg1=registered successfully...!");
            } else {
                response.sendRedirect("userRegister.jsp?msg=not registered..!!");
            }
        } catch (SQLException ex) {
            System.out.println("In ProcessRequest - " + ex.getMessage());
            Logger.getLogger(userReg.class.getName()).log(Level.SEVERE, null, ex);
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
