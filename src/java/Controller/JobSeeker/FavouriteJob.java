/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.JobSeeker;

import DAL.ApplicationDAO;
import DAL.EnterpriseDAO;
import DAL.JobDAO;
import DAL.JobFavouriteDAO;
import DAL.JobSeekerDAO;
import DAL.TagJobDAO;
import Model.Account;
import Model.Application;
import Model.Enterprise;
import Model.Job;
import Model.JobFavourite;
import Model.JobSeeker;
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
public class FavouriteJob extends HttpServlet {

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
            out.println("<title>Servlet FavouriteJob</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FavouriteJob at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession(false);
        String userRole = "guest"; // Default user role
        String displayName = ""; // Default display name

        if (session != null) {
            Account account = (Account) session.getAttribute("account");
            if (account != null) {
                if (account.getRoleId() == 2) {
                    JobSeeker jobSeeker = new JobSeekerDAO().getJobSeekerByAccountId(account.getUsername());
                    if (jobSeeker != null) {
                        request.setAttribute("user", jobSeeker);
                        userRole = "jobseeker";
                        displayName = jobSeeker.getName();
                    }
                }
            }
        }

        request.setAttribute("userRole", userRole);
        request.setAttribute("displayName", displayName);

        Account account = (Account) session.getAttribute("account");

        JobSeeker jobSeeker = new JobSeekerDAO().getJobSeekerByAccountId(account.getUsername());
        List<JobFavourite> favouriteJobs = new JobFavouriteDAO().getAllFavouriteJobsByJobSeekerId(jobSeeker.getId());
        request.setAttribute("favouriteJobs", favouriteJobs);

        request.getRequestDispatcher("jobseeker_editprofile_favouriteJob.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("account") == null) {
            request.setAttribute("loginMessage", "You must be logged in to save job.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        String jobIdStr = request.getParameter("jobId");
        String username = request.getParameter("username");
        JobSeekerDAO jobSeekerDAO = new JobSeekerDAO();
        JobSeeker jobSeeker = jobSeekerDAO.getJobSeekerByAccountId(username);
        JobFavouriteDAO jobFavouriteDAO = new JobFavouriteDAO();

        try {
            int jobID = Integer.parseInt(jobIdStr);
            if (jobSeeker != null) {
                int seekerID = jobSeeker.getId();
                boolean exist = jobFavouriteDAO.doesFavoriteExist(jobID, seekerID);
                if (exist) {
                    request.setAttribute("saveJobMessage", "You have already saved this job.");
                    int jobId = Integer.parseInt(request.getParameter("jobId"));
                    Job job = new JobDAO().getJobById(jobId);
                    request.setAttribute("job", job);

                    long daysAgo = calDay(job);
                    request.setAttribute("daysAgo", daysAgo);

                    long daysExpire = calculateDaysUntilExpiration(job);
                    request.setAttribute("daysExpire", daysExpire);

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
                } else {
                    boolean added = jobFavouriteDAO.addFavoriteJob(jobID, seekerID);
                    if (added) {
                        doGet(request, response);
                    } else {
                        // Redirect or forward to an error page or back to the job list
                    }
                }
            } else {
                // Xử lý trường hợp không tìm thấy jobSeeker
            }
        } catch (NumberFormatException e) {
            // Handle the case where the jobIdStr is not a valid integer
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
