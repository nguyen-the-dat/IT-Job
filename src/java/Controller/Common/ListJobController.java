/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Common;

import DAL.CityDAO;
import DAL.EnterpriseDAO;
import DAL.JobDAO;
import DAL.JobSeekerDAO;
import DAL.JobTypeDetailDAO;
import DAL.TagDAO;
import DAL.TagJobDAO;
import DAL.WorkLevelDetailDAO;
import Model.Account;
import Model.City;
import Model.Enterprise;
import Model.Job;
import Model.JobSeeker;
import Model.JobTypeDetail;
import Model.Tag;
import Model.WorkLevelDetail;
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
public class ListJobController extends HttpServlet {

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
            out.println("<title>Servlet ListJobController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListJobController at " + request.getContextPath() + "</h1>");
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
    private void loadCommonData(HttpServletRequest request) {
        List<City> cities = new CityDAO().getAllCities();
        request.setAttribute("cities", cities);
        List<JobTypeDetail> jobTypeDetails = new JobTypeDetailDAO().getAllJobTypeDetails();
        request.setAttribute("jobTypeDetails", jobTypeDetails);
        List<WorkLevelDetail> workLevelDetails = new WorkLevelDetailDAO().getAllWorkLevel();
        request.setAttribute("workLevelDetails", workLevelDetails);
        List<Tag> tags = new TagDAO().getAllTags();
        request.setAttribute("tags", tags);
    }

    private void setUserRoleAndName(HttpServletRequest request, HttpSession session) {
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
        request.setAttribute("userRole", userRole);
        request.setAttribute("displayName", displayName);
    }

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

    private void handleRequest(HttpServletRequest request, HttpServletResponse response, boolean isPost)
            throws ServletException, IOException {
        loadCommonData(request);
        HttpSession session = request.getSession(false);
        setUserRoleAndName(request, session);
        JobDAO jobDao = new JobDAO();
        int size = jobDao.countAllJobs();
        request.setAttribute("size", size);

        List<Job> jobs;

        String pageIndexStr = request.getParameter("pageIndex");
        int pageIndex = pageIndexStr != null ? Integer.parseInt(pageIndexStr.trim()) : 1;
        int pageSize = 5;

        int totalJobs;
        int totalPages;

        String tagIdStr = request.getParameter("tagId");
        if (tagIdStr != null) {
            tagIdStr = tagIdStr.trim();
            if (tagIdStr.isEmpty()) {
                tagIdStr = null;
            }
        }
        if (tagIdStr != null) {
            try {
                int tagId = Integer.parseInt(tagIdStr);
                TagJobDAO tagJobDAO = new TagJobDAO();
                jobs = tagJobDAO.findJobsByTag(tagId, pageIndex, pageSize);
                calculateDaysAgo(request, jobs);
                totalJobs = tagJobDAO.countJobsByTag(tagId);
                totalPages = (int) Math.ceil((double) totalJobs / pageSize);
                request.setAttribute("jobs", jobs);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("currentPage", pageIndex);
                request.setAttribute("tagId", tagId);
            } catch (Exception e) {
            }
        } else {
            String sortOrder = request.getParameter("sortOrder");
            if (sortOrder == null || sortOrder.isEmpty()) {
                sortOrder = "mostRelevant";
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

            if (!"mostRelevant".equals(sortOrder)) {
                if (isSearchCriteriaPresent) {
                    totalJobs = jobDao.countJobsWithCriteria(key, cityid, type, level, salaryRanges);
                    jobs = jobDao.searchJobsWithMultipleCriteria(key, cityid, type, level, salaryRanges, pageIndex, pageSize);
                    calculateDaysAgo(request, jobs);
                    totalPages = (int) Math.ceil((double) totalJobs / pageSize);
                    request.setAttribute("jobs", jobs);
                    request.setAttribute("totalJobs", totalJobs);
                    request.setAttribute("totalPages", totalPages);
                    request.setAttribute("currentPage", pageIndex);
                } else {
                    if ("oldest".equals(sortOrder)) {
                        jobs = jobDao.getJobsSortedByDateWithPagination("ASC", pageIndex, pageSize);
                        calculateDaysAgo(request, jobs);
                        totalJobs = jobDao.countAllJobs();
                        totalPages = (int) Math.ceil((double) totalJobs / pageSize);
                        request.setAttribute("jobs", jobs);
                        request.setAttribute("totalJobs", totalJobs);
                        request.setAttribute("totalPages", totalPages);
                        request.setAttribute("currentPage", pageIndex);
                    } else if ("newest".equals(sortOrder)) {
                        jobs = jobDao.getJobsSortedByDateWithPagination("DESC", pageIndex, pageSize);
                        calculateDaysAgo(request, jobs);
                        totalJobs = jobDao.countAllJobs();
                        totalPages = (int) Math.ceil((double) totalJobs / pageSize);
                        request.setAttribute("jobs", jobs);
                        request.setAttribute("totalJobs", totalJobs);
                        request.setAttribute("totalPages", totalPages);
                        request.setAttribute("currentPage", pageIndex);
                    }
                }
            } else {
                if (isSearchCriteriaPresent) {
                    totalJobs = jobDao.countJobsWithCriteria(key, cityid, type, level, salaryRanges);
                    jobs = jobDao.searchJobsWithMultipleCriteria(key, cityid, type, level, salaryRanges, pageIndex, pageSize);
                    calculateDaysAgo(request, jobs);
                    totalPages = (int) Math.ceil((double) totalJobs / pageSize);
                    request.setAttribute("jobs", jobs);
                    request.setAttribute("totalPages", totalPages);
                    request.setAttribute("totalJobs", totalJobs);
                    request.setAttribute("currentPage", pageIndex);
                } else {
                    jobs = jobDao.getJobsWithPagination(pageIndex, pageSize);
                    calculateDaysAgo(request, jobs);
                    totalJobs = jobDao.countAllJobs();
                    totalPages = (int) Math.ceil((double) totalJobs / pageSize);
                    request.setAttribute("jobs", jobs);
                    request.setAttribute("totalJobs", totalJobs);
                    request.setAttribute("totalPages", totalPages);
                    request.setAttribute("currentPage", pageIndex);
                }

            }
        }
        request.getRequestDispatcher("joblist.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        handleRequest(request, response, false);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        handleRequest(request, response, true);
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
