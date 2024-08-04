/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Authentication;

import DAL.AccountDAO;
import DAL.EnterpriseDAO;
import DAL.JobSeekerDAO;
import Model.Account;
import Model.Enterprise;
import Model.EnterprisesClone;
import Model.JobSeeker;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class ProfilePassController extends HttpServlet {

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
            out.println("<title>Servlet ProfilePassController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProfilePassController at " + request.getContextPath() + "</h1>");
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
        Account acc = (Account) session.getAttribute("account");
        String userRole = "guest";
        String displayName = "";

        if (acc != null) {
            int roleId = acc.getRoleId();
            String targetJSP = "";

            switch (roleId) {
                case 1: // Enterprise
                    targetJSP = "enterprise_dashboard_changepassword.jsp";
                    EnterprisesClone enterprise = new EnterpriseDAO().getEnterprisesCloneByAccountId(acc.getUsername());
                    request.setAttribute("user", enterprise);
                    userRole = "enterprise";
                    displayName = enterprise.getShortName();
                    break;
                case 2: // Candidate
                    targetJSP = "candidate_dashboard_password.jsp";
                    JobSeeker jobseeker = new JobSeekerDAO().getJobSeekerByAccountId(acc.getUsername());
                    request.setAttribute("user", jobseeker);
                    userRole = "jobseeker";
                    displayName = jobseeker.getName();
                    break;
                case 3: // Admin
                    targetJSP = "admin_dashboard_password.jsp";
                    request.setAttribute("user", acc);
                    userRole = "admin";
                    displayName = acc.getUsername();
                    break;
                default:
                    // Optional: Handle unknown role
                    response.sendRedirect("/ITJob/Login"); // Or some error page
                    return;
            }

            request.setAttribute("userRole", userRole);
            request.setAttribute("displayName", displayName);
            request.setAttribute("userName", acc.getUsername());
            request.setAttribute("passc", acc.getPassword());
            request.getRequestDispatcher(targetJSP).forward(request, response);
        } else {
            response.sendRedirect("/ITJob/Login");
        }
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
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");
        String userRole = "guest";
        String displayName = "";

        if (acc != null) {
            int roleId = acc.getRoleId();
            String targetJSP = "";

            switch (roleId) {
                case 1: // Enterprise
                    targetJSP = "enterprise_dashboard_changepassword.jsp";
                    Enterprise enterprise = new EnterpriseDAO().getEnterpriseByAccountId(acc.getUsername());
                    request.setAttribute("user", enterprise);
                    userRole = "enterprise";
                    displayName = enterprise.getShortName();
                    break;
                case 2: // Candidate
                    targetJSP = "candidate_dashboard_password.jsp";
                    break;
                case 3: // Admin
                    targetJSP = "admin_dashboard_password.jsp";
                    break;
                default:
                    // Optional: Handle unknown role
                    response.sendRedirect("/ITJob/Login"); // Or some error page
                    return;
            }

            String user = acc.getUsername();
            String pass = request.getParameter("pass") == null ? "" : request.getParameter("pass");
            String newpass = request.getParameter("newpass") == null ? "" : request.getParameter("newpass");
            String check = request.getParameter("check") == null ? "" : request.getParameter("check");
            AccountDAO dao = new AccountDAO();

            if (pass.isEmpty() || newpass.isEmpty() || check.isEmpty()) {
                request.setAttribute("mess", "You must fill all input!");
            } else if (!acc.getPassword().equals(pass)) {
                request.setAttribute("mess", "Wrong password");
            } else if (!check.equals(newpass)) {
                request.setAttribute("mess", "Update Failed, confirm pass correct pls!");
            } else {
                dao.updatePassword(newpass, user); // Update password
                acc.setPassword(newpass); // Update password in current session
                request.setAttribute("mess", "Update Success!");
            }

            request.setAttribute("userName", user);

            request.setAttribute("userRole", userRole);
            request.setAttribute("displayName", displayName);
            request.setAttribute("userName", acc.getUsername());
            request.setAttribute("passc", acc.getPassword());
            request.getRequestDispatcher(targetJSP).forward(request, response);
        } else {
            response.sendRedirect("/ITJob/Login");
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
