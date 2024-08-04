/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Authentication;

import DAL.AccountDAO;
import DAL.ApplicationDAO;
import DAL.EnterpriseDAO;
import DAL.JobSeekerDAO;
import Model.Account;
import Model.Application;
import Model.EnterprisesClone;
import Model.JobSeeker;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author thain
 */
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String message = (String) session.getAttribute("message");
        String mess;
        if (message != null) {
            mess = message;
            session.removeAttribute("message");
        } else {
            mess = null;
        }
        session.setAttribute("mess", mess);
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
        String username = request.getParameter("Username");
        String password = request.getParameter("Password");
        AccountDAO accountDAO = new AccountDAO();
        Account a = new Account();
        a = accountDAO.getAccountUser(username, password);
        HttpSession session = request.getSession();
        EnterpriseDAO ed = new EnterpriseDAO();
        JobSeekerDAO jobSeekerDAO = new JobSeekerDAO();
        if (a != null) {

            //banned
            if (a.getStatusId() == 3) {
                request.setAttribute("error", "This account has been banned!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
            a.setLastActiveTime(currentTimestamp);
            accountDAO.updateAccountLastActiveTime(a);
            // EnterpriseDashBoard
            System.out.println("Vao day xong roi ne. Enterprise account");
            session.setAttribute("account", a);
            if (a.getRoleId() == 1) { // role enterprise

                response.sendRedirect("EnterpriseDashBoard");

            } else if (a.getRoleId() == 2) { // role jobseeker
                JobSeeker jobSeeker = jobSeekerDAO.getJobSeekerByAccountId(a.getUsername());
                session.setAttribute("jobseeker", jobSeeker);
                response.sendRedirect("Home");
            } else if (a.getRoleId() == 3) { // role admin
                response.sendRedirect("AdminDashboard");
            }

        } else {
            if (username != null && password != null) {
                request.setAttribute("error", "Username and Password does not matches!");
            }
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
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
