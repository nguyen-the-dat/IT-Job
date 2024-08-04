/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Common;

import Controller.JobSeeker.FavouriteJob;
import DAL.CityDAO;
import DAL.EnterpriseDAO;
import DAL.JobDAO;
import DAL.JobFavouriteDAO;
import DAL.JobSeekerDAO;
import DAL.TagDAO;
import DAL.TagJobDAO;
import Model.Account;
import Model.City;
import Model.Enterprise;
import Model.Job;
import Model.JobFavourite;
import Model.JobSeeker;
import Model.Tag;
import Model.TagJob;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.TimeUnit;

/**
 *
 * @author thain
 */
public class HomeController extends HttpServlet {

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
            out.println("<title>Servlet HomeController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeController at " + request.getContextPath() + "</h1>");
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
    private void calculateDaysAgo(HttpServletRequest request, List<Job> jobs) {
        long currentTime = System.currentTimeMillis();
        List<Long> daysAgoList = new ArrayList<>();
        for (Job job : jobs) {
            Date createdTime = job.getCreatedTime();
            Date updatedTime = job.getUpdatedTime();
            long timeDifference = updatedTime != null ? updatedTime.getTime() - createdTime.getTime() : 0;
            Date chosenTime = updatedTime != null && timeDifference >= 0 ? updatedTime : createdTime;
            long daysAgo = TimeUnit.DAYS.convert(currentTime - chosenTime.getTime(), TimeUnit.MILLISECONDS);
            daysAgoList.add(daysAgo);
        }
        request.setAttribute("daysAgoList", daysAgoList);
    }
    
    private Map<Integer, Integer> getJobCounts(List<Enterprise> enterprises) {
        JobDAO jobDAO = new JobDAO();
        Map<Integer, Integer> jobCounts = new HashMap<>();
        for (Enterprise enterprise : enterprises) {
            int jobCount = jobDAO.countJobsByEnterpriseId(enterprise.getId());
            jobCounts.put(enterprise.getId(), jobCount);
        }
        return jobCounts;
    }
    
    private void calculateJob(HttpServletRequest request, List<Enterprise> enterprises) {
        Map<Integer, Integer> jobCounts = getJobCounts(enterprises);
        request.setAttribute("jobCounts", jobCounts);
    }

    private void loadCommonData(HttpServletRequest request) {
        int countAllJobs = new JobDAO().countAllJobs();
        request.setAttribute("countAllJobs", countAllJobs);

        List<Tag> tags = new TagDAO().getAllTags();
        request.setAttribute("tags", tags);

        List<City> cities = new CityDAO().getAllCities();
        request.setAttribute("cities", cities);

        List<Enterprise> enterprises = new EnterpriseDAO().getAllEnterprises();
        request.setAttribute("enterprises", enterprises);
        calculateJob(request, enterprises);
    }

    private void setUserRoleAndNameAndRecommendJob(HttpServletRequest request, HttpSession session) {
        String userRole = "guest";
        String displayName = "";
        if (session != null && session.getAttribute("account") != null) {
            Account account = (Account) session.getAttribute("account");
            switch (account.getRoleId()) {
                case 1:
                    Enterprise enterprise = new EnterpriseDAO().getEnterpriseByAccountId(account.getUsername());
                    request.setAttribute("user", enterprise);
                    userRole = "enterprise";
                    displayName = enterprise.getShortName();
                    List<Job> jobs = new JobDAO().getJobByEnterprise(enterprise.getId());
                    request.setAttribute("jobs", jobs);
                    calculateDaysAgo(request, jobs);
                    break;
                case 2:
                    JobSeeker jobSeeker = new JobSeekerDAO().getJobSeekerByAccountId(account.getUsername());
                    List<JobFavourite> jobFavourites = new JobFavouriteDAO().getAllFavouriteJobsByJobSeekerId(jobSeeker.getId());
                    Set<Job> uniqueJobs = new HashSet<>();
                    for (JobFavourite jobFavourite : jobFavourites) {
                        List<Tag> tags = new TagJobDAO().findTagsByJob(jobFavourite.getJob().getId());
                        for (Tag tag : tags) {
                            List<Job> jobsWithTag = new TagJobDAO().findJobsByTag(tag.getId());
                            uniqueJobs.addAll(jobsWithTag);
                        }
                    }
                    calculateDaysAgo(request, new ArrayList<>(uniqueJobs));
                    request.setAttribute("jobs", new ArrayList<>(uniqueJobs));
                    request.setAttribute("user", jobSeeker);
                    userRole = "jobseeker";
                    displayName = jobSeeker.getName();

                    break;
                case 3:
                    userRole = "admin";
                    displayName = account.getUsername();
                    break;
            }
            request.setAttribute("userRole", userRole);
            request.setAttribute("displayName", displayName);
        } else {
            List<Job> jobs = new JobDAO().getTop6Jobs();
            calculateDaysAgo(request, jobs);
            request.setAttribute("jobs", jobs);
            request.setAttribute("userRole", userRole);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        loadCommonData(request);
        HttpSession session = request.getSession(false);
        setUserRoleAndNameAndRecommendJob(request, session);
        List<Job> jobs;
        JobDAO jobDao = new JobDAO();

        String pageIndexStr = request.getParameter("pageIndex");
        int pageIndex = pageIndexStr != null ? Integer.parseInt(pageIndexStr.trim()) : 1;
        int pageSize = 2;

        int totalJobs;
        int totalPages;

        String sortOrder = request.getParameter("sortOrder");
        if (sortOrder != null) {
            sortOrder = sortOrder.trim();
            if (sortOrder.isEmpty()) {
                sortOrder = null;
            }
        }

        String key = request.getParameter("keyword");
        if (key != null) {
            key = key.trim();
            if (key.isEmpty()) {
                key = null;
            }
        }

        String cityIdStr = request.getParameter("cityId");
        if (cityIdStr != null) {
            cityIdStr = cityIdStr.trim();
            if (cityIdStr.isEmpty() || cityIdStr.equals("0")) {
                cityIdStr = null;
            }
        }

        String[] type = request.getParameterValues("employmentTypes");
        if (type != null) {
            for (int i = 0; i < type.length; i++) {
                type[i] = type[i].trim();
                if (type[i].isEmpty()) {
                    type = null;
                    break;
                }
            }
        }

        String[] level = request.getParameterValues("experienceLevels");
        if (level != null) {
            for (int i = 0; i < level.length; i++) {
                level[i] = level[i].trim();
                if (level[i].isEmpty()) {
                    level = null;
                    break;
                }
            }
        }

        String[] salaryRanges = request.getParameterValues("priceRange");
        if (salaryRanges != null) {
            for (int i = 0; i < salaryRanges.length; i++) {
                salaryRanges[i] = salaryRanges[i].trim();
                if (salaryRanges[i].isEmpty()) {
                    salaryRanges = null;
                    break;
                }
            }
        }

        boolean isSearchCriteriaPresent = (key != null)
                || (cityIdStr != null)
                || (type != null)
                || (level != null)
                || (salaryRanges != null);

        int cityid = 0;
        if (cityIdStr != null && !cityIdStr.isEmpty()) {
            try {
                cityid = Integer.parseInt(cityIdStr.trim());
            } catch (NumberFormatException e) {
            }
        }
        if (isSearchCriteriaPresent) {
            totalJobs = jobDao.countJobsWithCriteria(key, cityid, type, level, salaryRanges);
            jobs = jobDao.searchJobsWithMultipleCriteria(key, cityid, type, level, salaryRanges, pageIndex, pageSize);
            calculateDaysAgo(request, jobs);
            totalPages = (int) Math.ceil((double) totalJobs / pageSize);
            request.setAttribute("jobs", jobs);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("currentPage", pageIndex);
            request.getRequestDispatcher("joblist.jsp").forward(request, response);
        }

        request.getRequestDispatcher("home.jsp").forward(request, response);
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
