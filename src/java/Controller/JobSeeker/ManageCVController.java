/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.JobSeeker;

import DAL.JobSeekerDAO;
import DAL.ResumeDAO;
import Model.Account;
import Model.JobSeeker;
import Model.Resume;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author ngoba
 */
public class ManageCVController extends HttpServlet {

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
            out.println("<title>Servlet ManageCVController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageCVController at " + request.getContextPath() + "</h1>");
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
            if (account != null && account.getRoleId() == 2) {
                JobSeeker jobSeeker = new JobSeekerDAO().getJobSeekerByAccountId(account.getUsername());

                if (jobSeeker != null) {
                    request.setAttribute("user", jobSeeker);
                    userRole = "jobseeker";
                    displayName = jobSeeker.getName();

                    Resume existResume = ResumeDAO.Instance.getResumeBySeekerId(jobSeeker.getId());
                    if (existResume != null) 
                    {
                        String urlCV = ResumeDAO.Instance.getResumeBySeekerId(jobSeeker.getId()).getUrl();
                        String coverLetter = ResumeDAO.Instance.getResumeBySeekerId(jobSeeker.getId()).getCoverLetter();
                        request.setAttribute("uploadFromServlet", urlCV);
                        request.setAttribute("letterFromServlet", coverLetter);
                    }
                    request.setAttribute("userRole", userRole);
                    request.setAttribute("displayName", displayName);
                    request.getRequestDispatcher("jobseeker_managecv.jsp").forward(request, response);
                }
            } else {
                response.sendRedirect("/ITJob/Home");
            }
        } else {
            response.sendRedirect("/ITJob/Home");
        }
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
        HttpSession session = request.getSession(false);
        String userRole = "guest"; // Default user role
        String displayName = ""; // Default display name

        if (session != null) {
            Account account = (Account) session.getAttribute("account");
            if (account != null && account.getRoleId() == 2) {
                JobSeeker jobSeeker = new JobSeekerDAO().getJobSeekerByAccountId(account.getUsername());

                if (jobSeeker != null) {
                    request.setAttribute("user", jobSeeker);
                    userRole = "jobseeker";
                    displayName = jobSeeker.getName();

                    String upload = "cvs/" + request.getParameter("upload");
                    String letter = request.getParameter("letter");
                    JobSeeker jobseeker = (new JobSeekerDAO()).getJobSeekerByAccountId(account.getUsername());
                    Resume exitResume = ResumeDAO.Instance.getResumeBySeekerId(jobseeker.getId());
                    if (exitResume != null) {
                        ResumeDAO.Instance.updateSeekerCV(jobseeker.getId(), upload, letter);
                    } else {
                        ResumeDAO.Instance.addSeekerCV(jobseeker.getId(), upload, letter);
                    }
                    request.setAttribute("uploadFromServlet", upload);
                    request.setAttribute("letterFromServlet", letter);
                    
                    request.setAttribute("userRole", userRole);
                    request.setAttribute("displayName", displayName);
                    request.getRequestDispatcher("jobseeker_managecv.jsp").forward(request, response);
                }
            } else {
                response.sendRedirect("/ITJob/Home");
            }
        } else {
            response.sendRedirect("/ITJob/Home");
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
