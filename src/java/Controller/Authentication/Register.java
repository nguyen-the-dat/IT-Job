/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Authentication;

import DAL.AccountDAO;
import Model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;

/**
 *
 * @author admin
 */
public class Register extends HttpServlet {
   
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
            out.println("<title>Servlet Register</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Register at " + request.getContextPath () + "</h1>");
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
        request.getRequestDispatcher("sign-up.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullName");
        int gender = Integer.parseInt(request.getParameter("gender"));
        AccountDAO d = new AccountDAO();

        if (d.getAccountByUsername(username) != null || d.checkExistEmail(email) == false) { // da ton tai trong database

            HttpSession session = request.getSession();
            String err = "Username or Email has already exists!";
            session.setAttribute("error", err);
            request.getRequestDispatcher("sign-up.jsp").forward(request, response);
        } else {

            Account newAccount = new Account();
            long currentTimeMillis = System.currentTimeMillis();
            newAccount.setCreatedTime(new Timestamp(currentTimeMillis));
            newAccount.setUpdatedTime(new Timestamp(currentTimeMillis));
            newAccount.setStatusId(2);
            newAccount.setRoleId(2);
            newAccount.setPlanId(1);
            newAccount.setLastActiveTime(new Timestamp(currentTimeMillis));
            newAccount.setUsername(username);
            newAccount.setPassword(password);
            d.registerAccount(newAccount, fullName, email, gender);

            SendEmail s = new SendEmail();
            s.sendEmail(email, fullName);
            String message = "Register successfully, please enter Username and Password to login.";
            HttpSession session = request.getSession();
            session.setAttribute("message", message);
            response.sendRedirect("Login");
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
