/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Enterprise;

import DAL.ApplicationDAO;
import DAL.EnterpriseDAO;
import DAL.JobSeekerDAO;
import DAL.StatusApplicationDetailDAO;
import Model.Account;
import Model.Application;
import Model.Enterprise;
import Model.JobSeeker;
import Model.StatusApplicationDetail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.*;
import java.io.*;
import Model.*;
import DAL.*;

/**
 *
 * @author thain
 */
public class ListApplicantController extends HttpServlet {

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
            out.println("<title>Servlet ListApplicantController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListApplicantController at " + request.getContextPath() + "</h1>");
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
        String userRole = "guest";
        String displayName = "";
        String btnFilter = request.getParameter("btnFilter");
        String filterValue = request.getParameter("filterValue");
        String filterValueJob = request.getParameter("filterValueJob");

        if (session != null) {
            Account account = (Account) session.getAttribute("account");
            if (account != null && account.getRoleId() == 1) {
                Enterprise enterprise = new EnterpriseDAO().getEnterpriseByAccountId(account.getUsername());
                if (enterprise != null) {
                    request.setAttribute("user", enterprise);
                    userRole = "enterprise";
                    displayName = enterprise.getShortName();
                }
            }
        }

        request.setAttribute("userRole", userRole);
        request.setAttribute("displayName", displayName);

        Account account = (Account) session.getAttribute("account");
        Enterprise enterprise = new EnterpriseDAO().getEnterpriseByAccountId(account.getUsername());

        List<Application> applications = new ApplicationDAO().getAllApplicationsByEnterpriseId(enterprise.getId());
        if (btnFilter != null) {
            try {
                int filterValueInt = Integer.parseInt(filterValue);
                int filterValueJobInt = Integer.parseInt(filterValueJob);
                List<Application> filteredApplications = new ArrayList<>();

                for (Application app : applications) {
                    boolean matchesStatus = false;
                    boolean matchesJob = false;
                    if (filterValueInt == 0 || (filterValueInt == 1 && app.getStatusApplicationDetail().getId() == 1)
                            || (filterValueInt == 2 && (app.getStatusApplicationDetail().getId() == 2 || app.getStatusApplicationDetail().getId() == 4))
                            || (filterValueInt == 3 && (app.getStatusApplicationDetail().getId() == 3 || app.getStatusApplicationDetail().getId() == 5))) {
                        matchesStatus = true;
                    }
                    if (filterValueJobInt == 0 || app.getJob().getId() == filterValueJobInt) {
                        matchesJob = true;
                    }
                    if (matchesStatus && matchesJob) {
                        filteredApplications.add(app);
                    }
                }
                applications = filteredApplications;
                request.setAttribute("curFilter", filterValueInt);
                request.setAttribute("curFilterJob", filterValueJobInt);
            } catch (Exception e) {
            }
        }
        Collections.sort(applications, new Comparator<Application>() {
            @Override
            public int compare(Application app1, Application app2) {
                return app2.getApplyTime().compareTo(app1.getApplyTime());
            }
        });
        List<Job> jobOfEnterprise = new JobDAO().getJobByEnterprise(new EnterpriseDAO().getEnterpriseByAccountId(account.getUsername()).getId());
        request.setAttribute("jobOfEnterprise", jobOfEnterprise);

        request.setAttribute("applications", applications);

        List<StatusApplicationDetail> statusApplicationDetails = new StatusApplicationDetailDAO().getAllStatusApplicationDetails();
        request.setAttribute("statusApplicationDetails", statusApplicationDetails);

        request.getRequestDispatcher("enterprise_dashboard_candidateslist.jsp").forward(request, response);
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
