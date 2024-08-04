/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Enterprise;

import DAL.EducationDAO;
import DAL.EnterpriseDAO;
import DAL.JobSeekerDAO;
import DAL.SkillDAO;
import DAL.WorkExperienceDAO;
import Model.Account;
import Model.Education;
import Model.Enterprise;
import Model.JobSeeker;
import Model.Skill;
import Model.WorkExperience;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author thain
 */
public class CandidateDetail extends HttpServlet {

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
            out.println("<title>Servlet CandidateDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CandidateDetail at " + request.getContextPath() + "</h1>");
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
        if (session != null) {
            Account account = (Account) session.getAttribute("account");
            if (account != null && account.getRoleId() == 1) {
                EnterpriseDAO eDAO = new EnterpriseDAO();
                Enterprise enterprise = eDAO.getEnterpriseByAccountId(account.getUsername());
                if (enterprise != null) {
                    //code vao day
                    String jobSeekerId = request.getParameter("candidateId");
                    JobSeeker jobSeeker = new JobSeekerDAO().getJobSeekerById(Integer.parseInt(jobSeekerId));
                    request.setAttribute("jobSeeker", jobSeeker);

                    Map<Integer, List<Skill>> skillsMap = new HashMap<>();
                    SkillDAO skillDAO = new SkillDAO();
                    List<Skill> skills = skillDAO.getSkillsForJobSeeker(jobSeeker.getId());
                    skillsMap.put(jobSeeker.getId(), skills);
                    request.setAttribute("skillsMap", skillsMap);

                    Map<Integer, List<WorkExperience>> workExperiencesMap = new HashMap<>();
                    WorkExperienceDAO workExperienceDAO = new WorkExperienceDAO();
                    List<WorkExperience> workExperiences = workExperienceDAO.getWorkExperiencesForJobSeeker(jobSeeker.getId());
                    workExperiencesMap.put(jobSeeker.getId(), workExperiences);
                    request.setAttribute("workExperiencesMap", workExperiencesMap);

                    Map<Integer, List<Education>> educationsMap = new HashMap<>();
                    EducationDAO educationDAO = new EducationDAO();
                    List<Education> educations = educationDAO.getEducationsForJobSeeker(jobSeeker.getId());
                    educationsMap.put(jobSeeker.getId(), educations);
                    request.setAttribute("educationsMap", educationsMap);

                    //doan nay cung la phan quyen
                    request.setAttribute("eDAO", eDAO);
                    
                    //doan nay la href
                    request.getRequestDispatcher("candidatedetail.jsp").forward(request, response);

                }
            } else {

                response.sendRedirect("Home");
            }

        } else {
            response.sendRedirect("Home");
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
