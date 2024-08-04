/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Authentication;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Properties;
import java.util.Random;

/**
 *
 * @author ADMIN
 */
public class ForgotPassController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ForgotPassController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgotPassController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("forgotpass.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        final String fromEmail = "hoangvahe172856@fpt.edu.vn";
        final String password = "okvm jztw nyrn ephw";
        String toEmail = request.getParameter("email");

        int otpvalue = 0;
        if (toEmail != null || !toEmail.isEmpty()) {
            try {
                Random random = new Random();
                otpvalue = 100000 + random.nextInt(900000);
                Properties pr = new Properties();
                pr.setProperty("mail.smtp.host", "smtp.gmail.com");
                pr.setProperty("mail.smtp.port", "587");
                pr.setProperty("mail.smtp.auth", "true");
                pr.setProperty("mail.smtp.starttls.enable", "true");
                pr.put("mail.smtp.socketFactory.port", "587");

                Session session = Session.getInstance(pr, new Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(fromEmail, password);
                    }
                });

                Message mess = new MimeMessage(session);
                mess.setHeader("Content-type", "text/html; charset=UTF-8");
                mess.setFrom(new InternetAddress(fromEmail));
                mess.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
                mess.setSubject("Jobster: Verify your password");
                mess.setText("Your otp is: " + otpvalue);
                Transport.send(mess);
                request.setAttribute("message", "OTP is sent to your email id");
                HttpSession mySession = request.getSession();
                mySession.setAttribute("otp", otpvalue);
                mySession.setAttribute("email", toEmail);
                //request.getRequestDispatcher("validateotp").forward(request, response);
                response.sendRedirect("validateotp");
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
