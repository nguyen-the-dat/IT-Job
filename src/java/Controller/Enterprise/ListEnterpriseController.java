package Controller.Enterprise;

import DAL.EnterpriseDAO;
import DAL.EnterpriseSizeDetailDAO;
import DAL.JobDAO;
import DAL.JobSeekerDAO;
import Model.Account;
import Model.Enterprise;
import Model.EnterpriseSizeDetail;
import Model.JobSeeker;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ListEnterpriseController extends HttpServlet {

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

    private void loadCommonData(HttpServletRequest request) {
        List<EnterpriseSizeDetail> enterpriseSizeDetailsList = new EnterpriseSizeDetailDAO().getAllEnterpriseSizeDetails();
        request.setAttribute("enterpriseSizeDetailsList", enterpriseSizeDetailsList);
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

    private void handleRequest(HttpServletRequest request, HttpServletResponse response, boolean isPost)
            throws ServletException, IOException {
        loadCommonData(request);
        HttpSession session = request.getSession(false);
        setUserRoleAndName(request, session);

        EnterpriseDAO enterpriseDAO = new EnterpriseDAO();

        List<Enterprise> enterprises;

        String sortOrder = request.getParameter("sortOrder");
        if (sortOrder == null || sortOrder.isEmpty()) {
            sortOrder = "mostRelevant";
        }

        String companyNameOrKeyword = request.getParameter("keyword");
        String location = request.getParameter("location");
        String[] selectedSizes = request.getParameterValues("selectedSizes");

        if (companyNameOrKeyword != null) {
            companyNameOrKeyword = companyNameOrKeyword.trim();
            if (companyNameOrKeyword.isEmpty()) {
                companyNameOrKeyword = null;
            }
        }
        if (location != null) {
            location = location.trim();
            if (location.isEmpty()) {
                location = null;
            }
        }
        if (selectedSizes != null) {
            for (int i = 0; i < selectedSizes.length; i++) {
                selectedSizes[i] = selectedSizes[i].trim();
                if (selectedSizes[i].isEmpty()) {
                    selectedSizes = null;
                    break;
                }
            }
        }

        boolean isSearchCriteriaPresent = (companyNameOrKeyword != null)
                || (location != null)
                || (selectedSizes != null);

        String pageIndexStr = request.getParameter("pageIndex");
        int pageIndex = pageIndexStr != null ? Integer.parseInt(pageIndexStr.trim()) : 1;
        int pageSize = 4;

        int totalEnterprises;
        int totalPages;

        if (!"mostRelevant".equals(sortOrder)) {
            if (isSearchCriteriaPresent) {
                totalEnterprises = enterpriseDAO.countEnterprisesWithCriteria(companyNameOrKeyword, location, selectedSizes);
                enterprises = enterpriseDAO.searchEnterprisesWithMultipleCriteria(companyNameOrKeyword, location, selectedSizes, pageIndex, pageSize);
                calculateJob(request, enterprises);
                totalPages = (int) Math.ceil((double) totalEnterprises / pageSize);
                request.setAttribute("enterprises", enterprises);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("currentPage", pageIndex);
            } else {
                enterprises = new EnterpriseDAO().getEnterprisesSortedWithPagination(sortOrder, pageIndex, pageSize);
                calculateJob(request, enterprises);
                totalEnterprises = enterpriseDAO.getTotalEnterprisesCount();
                totalPages = (int) Math.ceil((double) totalEnterprises / pageSize);
                request.setAttribute("enterprises", enterprises);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("currentPage", pageIndex);
            }
        } else {
            if (isSearchCriteriaPresent) {
                totalEnterprises = enterpriseDAO.countEnterprisesWithCriteria(companyNameOrKeyword, location, selectedSizes);
                enterprises = enterpriseDAO.searchEnterprisesWithMultipleCriteria(companyNameOrKeyword, location, selectedSizes, pageIndex, pageSize);
                calculateJob(request, enterprises);
                totalPages = (int) Math.ceil((double) totalEnterprises / pageSize);
                request.setAttribute("enterprises", enterprises);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("currentPage", pageIndex);
            } else {
                enterprises = new EnterpriseDAO().getEnterprisesWithPagination(pageIndex, pageSize);
                calculateJob(request, enterprises);
                totalEnterprises = enterpriseDAO.getTotalEnterprisesCount();
                totalPages = (int) Math.ceil((double) totalEnterprises / pageSize);
                request.setAttribute("enterprises", enterprises);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("currentPage", pageIndex);
            }

        }
        request.getRequestDispatcher("enterpriselist.jsp").forward(request, response);
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
