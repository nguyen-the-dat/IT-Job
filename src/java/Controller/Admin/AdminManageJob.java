/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Admin;

import DAL.ApplicationDAO;
import DAL.JobDAO;
import Model.Account;
import Model.Job;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ngoba
 */
public class AdminManageJob extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminManageJob</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminManageJob at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session != null) {
            Account account = (Account) session.getAttribute("account");
            if (account != null && account.getRoleId() == 3) {
                
                ApplicationDAO ad = new ApplicationDAO();
                    JobDAO jd = new JobDAO();
                    List<Job> jobs = jd.getAll();

                    int btnFilter = Utils.CommonUtils.getIntParameter(request, "btnFilter");
                    int filterType = Utils.CommonUtils.getIntParameter(request, "filterType");
                    int filterStatus = Utils.CommonUtils.getIntParameter(request, "filterStatus");

                    if (btnFilter == 1) {
                        List<Job> filterJob = new ArrayList<>();
                        for (Job job : jobs) {
                            boolean matchesStatus = false;
                            boolean matchesType = false;

                            if (filterType == 0 || (filterType == 1 && job.getJobTypeDetail().getId() == 1)
                                    || (filterType == 2 && job.getJobTypeDetail().getId() == 2)
                                    || (filterType == 3 && job.getJobTypeDetail().getId() == 3)
                                    || (filterType == 4 && job.getJobTypeDetail().getId() == 4)) {
                                matchesType = true;
                            }

                            if (filterStatus == 0 || (filterStatus == 1 && job.getStatusJobDetail().getId() == 1)
                                    || (filterStatus == 2 && job.getStatusJobDetail().getId() == 2)
                                    || (filterStatus == 3 && job.getStatusJobDetail().getId() == 3)
                                    || (filterStatus == 4 && job.getStatusJobDetail().getId() == 4)) {
                                matchesStatus = true;
                            }

                            if (matchesStatus && matchesType) {
                                filterJob.add(job);
                            }

                            jobs = filterJob;

                            request.setAttribute("curFilterType", filterType);
                            request.setAttribute("curFilterStatus", filterStatus);
                        }
                    }

                    request.setAttribute("ad", ad);
                    request.setAttribute("listJobs", jobs);
                    request.getRequestDispatcher("admin_manage_job.jsp").forward(request, response);
                
            } else {
                response.sendRedirect("Home");
            }
        } else {
            response.sendRedirect("Home");
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
