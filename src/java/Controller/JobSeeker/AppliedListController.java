/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.JobSeeker;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import DAL.*;
import Model.*;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONObject;

/**
 *
 * @author Admin
 */
public class AppliedListController extends HttpServlet {

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
            out.println("<title>Servlet AppliedListController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AppliedListController at " + request.getContextPath() + "</h1>");
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
        Account a = (Account) session.getAttribute("account");
        if (a.getRoleId() == 2) {
            List<Application> appliedJobIds = new ArrayList<Application>();
            List<Application> applicationList = new ApplicationDAO().getAllApplications();
            for (Application application : applicationList) {
                if (application.getJobSeeker().getId()
                        == new JobSeekerDAO().getJobSeekerByAccountId(a.getUsername()).getId()) {
                    appliedJobIds.add(application);
                }
            }
            request.setAttribute("appliedJob", appliedJobIds);
        }
        request.setAttribute("jobseekerDAO", new JobSeekerDAO());
        request.getRequestDispatcher("appliedJob.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String jobId = request.getParameter("jobId");
        HttpSession session = request.getSession(false);
        Account a = (Account) session.getAttribute("account");
        try {
            int jobIdInt = Integer.parseInt(jobId);
            int seekerId = new JobSeekerDAO().getJobSeekerByAccountId(a.getUsername()).getId();
            new ApplicationDAO().UpdateAppliedJobCancel(jobIdInt, seekerId);
            if (a.getRoleId() == 2) {
            List<Application> appliedJobIds = new ArrayList<Application>();
            List<Application> applicationList = new ApplicationDAO().getAllApplications();
            for (Application application : applicationList) {
                if (application.getJobSeeker().getId()
                        == new JobSeekerDAO().getJobSeekerByAccountId(a.getUsername()).getId()) {
                    appliedJobIds.add(application);
                }
            }
            request.setAttribute("appliedJob", appliedJobIds);
        }
        request.setAttribute("jobseekerDAO", new JobSeekerDAO());
        request.getRequestDispatcher("appliedJob.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
