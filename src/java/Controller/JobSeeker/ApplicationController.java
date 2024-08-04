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
import jakarta.servlet.http.HttpSession;
import DAL.*;
import Model.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ApplicationController extends HttpServlet {

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
            out.println("<title>Servlet ApplicationController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ApplicationController at " + request.getContextPath() + "</h1>");
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
        HttpSession ses = request.getSession();
        Account account = (Account) ses.getAttribute("account");
        String formSubmitted = request.getParameter("formSubmitted");
        String jobTitle = request.getParameter("jobTitle");
        if ("true".equals(formSubmitted)) {
            String filePath = request.getParameter("upload");
            String letter = request.getParameter("letter");
            String fileNameAlter = request.getParameter("fileNameAlter");
            String isCheck = request.getParameter("isCheck");
            try {
                int jobId = Integer.parseInt(request.getParameter("jobId"));
                JobSeeker jobseeker = new JobSeekerDAO().getJobSeekerByAccountId(account.getUsername());
                String cvFileName;
                if (isCheck.equals("1")) {
                    cvFileName = "cvs/" + fileNameAlter;
                } 
                else {
                    cvFileName = "cvs/" + filePath;
                }
                new ApplicationDAO().addApplication(jobId, jobseeker.getId(), cvFileName, letter, 1);
                response.sendRedirect("/ITJob/JobDetail?jobId=" + jobId);
            } catch (Exception e) {
                System.out.println("jobId must integer number");
            }
        } else {
            JobSeeker jobseeker = new JobSeekerDAO().getJobSeekerByAccountId(account.getUsername());
            Resume resume = ResumeDAO.Instance.getResumeBySeekerId(jobseeker.getId());
            String url = resume.getUrl().split("/")[1];
            request.setAttribute("resumeUrl", url);
            request.setAttribute("resumeCoverLetter", resume.getCoverLetter());
            request.setAttribute("jobTitle", jobTitle);
            request.setAttribute("JobseekerDAO", new JobSeekerDAO());
            request.getRequestDispatcher("application.jsp").forward(request, response);
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
