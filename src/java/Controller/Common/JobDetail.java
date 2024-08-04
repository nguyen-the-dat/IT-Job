/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Common;

import DAL.ApplicationDAO;
import DAL.EnterpriseDAO;
import DAL.JobDAO;
import DAL.JobSeekerDAO;
import DAL.ReportDAO;
import DAL.TagJobDAO;
import Model.Account;
import Model.Application;
import Model.Enterprise;
import Model.Job;
import Model.JobSeeker;
import Model.ReportTypeDetail;
import Model.Tag;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 *
 * @author thain
 */
public class JobDetail extends HttpServlet {

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
            out.println("<title>Servlet JobDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet JobDetail at " + request.getContextPath() + "</h1>");
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
        int jobId = Integer.parseInt(request.getParameter("jobId"));
        Job job = new JobDAO().getJobById(jobId);
        if (job.getStatusJobDetail().getId() != 1) {
            response.sendRedirect("/ITJob/Home");
        } else {
            request.setAttribute("job", job);

            long daysAgo = calDay(job);
            request.setAttribute("daysAgo", daysAgo);

            long daysExpire = calculateDaysUntilExpiration(job);
            request.setAttribute("daysExpire", daysExpire);

            HttpSession session = request.getSession(false);
            String userRole = "guest";
            String displayName = "";

            /*LAMNB Get applied job*/
            Account a = (Account) session.getAttribute("account");
            if (a != null && a.getRoleId() == 2) {
                List<Integer> appliedJobIds = new ArrayList<Integer>();
                List<Application> applicationList = new ApplicationDAO().getAllApplications();
                for (Application application : applicationList) {
                    if (application.getJobSeeker().getId()
                            == new JobSeekerDAO().getJobSeekerByAccountId(a.getUsername()).getId()) {
                        appliedJobIds.add(application.getJob().getId());
                    }
                }
                session.setAttribute("appliedJobIds", appliedJobIds);
            }
            /*---------------------*/

            /*DATNT get report type detail*/
            ReportDAO rd = new ReportDAO();
            List<ReportTypeDetail> detailReportType = rd.getReportTypeDetail();
            session.setAttribute("detailReport", detailReportType);
           /*---------------------------------*/
            if (session != null && session.getAttribute("account") != null) {
                Account account = (Account) session.getAttribute("account");
                switch (account.getRoleId()) {
                    case 1:
                        Enterprise enterprise = new EnterpriseDAO().getEnterpriseByAccountId(account.getUsername());
                        request.setAttribute("user", enterprise);
                        userRole = "enterprise";
                        displayName = enterprise.getShortName();
                        break;
                    case 2:
                        JobSeeker jobSeeker = new JobSeekerDAO().getJobSeekerByAccountId(account.getUsername());
                        request.setAttribute("user", jobSeeker);
                        userRole = "jobseeker";
                        displayName = jobSeeker.getName();
                        break;
                    case 3:
                        userRole = "admin";
                        displayName = account.getUsername();
                        break;
                }
            }
            List<Job> top4RandomJobs = new JobDAO().getTop4RandomJobs();
            List<Long> daysAgoList = new ArrayList<>();
            for (Job randomJob : top4RandomJobs) {
                long daysAgo1 = calDay(randomJob);
                daysAgoList.add(daysAgo1);
            }

            List<Tag> tags = new TagJobDAO().findTagsByJob(jobId);

            request.setAttribute("tags", tags);
            request.setAttribute("daysAgoList", daysAgoList);
            request.setAttribute("top4RandomJob", top4RandomJobs);
            request.setAttribute("userRole", userRole);
            request.setAttribute("displayName", displayName);
            request.getRequestDispatcher("jobdetail.jsp").forward(request, response);
        }
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

    private static long calculateDaysUntilExpiration(Job job) {
        Timestamp expiredTime = job.getExpiredTime();
        Instant expirationInstant = expiredTime.toInstant();
        Instant nowInstant = Instant.now();
        long daysUntilExpiration = ChronoUnit.DAYS.between(nowInstant, expirationInstant);
        return daysUntilExpiration;
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
