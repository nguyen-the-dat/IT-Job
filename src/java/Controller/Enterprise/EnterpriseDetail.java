/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Enterprise;

import DAL.EnterpriseDAO;
import DAL.JobDAO;
import DAL.JobSeekerDAO;
import Model.Account;
import Model.Enterprise;
import Model.Job;
import Model.JobSeeker;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 *
 * @author thain
 */
public class EnterpriseDetail extends HttpServlet {

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
            out.println("<title>Servlet EnterpriseDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EnterpriseDetail at " + request.getContextPath() + "</h1>");
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
        int enterpriseId;
        try {
            enterpriseId = Integer.parseInt(request.getParameter("enterpriseId"));
        } catch (NumberFormatException e) {
            // Handle the case where the ID is not a valid integer
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"error\":\"Invalid ID format\"}");
            return;
        }

        Enterprise enterprise = new EnterpriseDAO().getEnterpriseById(enterpriseId);
        request.setAttribute("enterprise", enterprise);

        HttpSession session = request.getSession(false);
        String userRole = "guest";
        String displayName = "";
        if (session != null) {
            Account account = (Account) session.getAttribute("account");
            if (account != null) {
                switch (account.getRoleId()) {
                    case 1:
                        Enterprise enterpriseUser = new EnterpriseDAO().getEnterpriseByAccountId(account.getUsername());
                        if (enterpriseUser != null) {
                            request.setAttribute("user", enterpriseUser);
                            userRole = "enterprise";
                            displayName = enterpriseUser.getShortName();
                        }
                        break;
                    case 2:
                        JobSeeker jobSeeker = new JobSeekerDAO().getJobSeekerByAccountId(account.getUsername());
                        if (jobSeeker != null) {
                            request.setAttribute("user", jobSeeker);
                            userRole = "jobseeker";
                            displayName = jobSeeker.getName();
                        }
                        break;
                    case 3:
                        userRole = "admin";
                        displayName = account.getUsername();
                        break;
                }
            }
        }
        request.setAttribute("userRole", userRole);
        request.setAttribute("displayName", displayName);

        List<Job> availableJobs = new JobDAO().getJobByEnterprise(enterpriseId);
        request.setAttribute("availableJobs", availableJobs);
        
        List<Long> daysAgoList = new ArrayList<>();
        for (Job randomJob : availableJobs) {
            long daysAgo1 = calDay(randomJob);
            daysAgoList.add(daysAgo1);
        }
        request.setAttribute("daysAgoList", daysAgoList);

        request.getRequestDispatcher("enterprisedetail.jsp").forward(request, response);
    }

    private long calDay(Job job) {
        long currentTime = System.currentTimeMillis();
        Date createdTime = job.getCreatedTime();
        Date updatedTime = job.getUpdatedTime();
        long timeDifference = updatedTime != null ? updatedTime.getTime() - createdTime.getTime() : 0;
        Date chosenTime = updatedTime != null && timeDifference >= 0 ? updatedTime : createdTime;
        long daysAgo = TimeUnit.DAYS.convert(currentTime - chosenTime.getTime(), TimeUnit.MILLISECONDS);
        return daysAgo;
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
