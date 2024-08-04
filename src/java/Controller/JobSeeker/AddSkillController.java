/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.JobSeeker;

import DAL.SkillDAO;
import Model.JobSeeker;
import Model.Skill;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class AddSkillController extends HttpServlet {

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
            SkillDAO skillDAO = new SkillDAO();
            JobSeeker jobSeeker = (JobSeeker) request.getSession().getAttribute("jobseeker");
            String skillName = request.getParameter("skillName");
            int level = Integer.parseInt(request.getParameter("level"));

            boolean skillExists = skillDAO.checkSkillExist(skillName, jobSeeker.getId());
            if (skillExists==false) {
                skillDAO.insertSkill(skillName, level, jobSeeker.getId());
                List<Skill> skills = skillDAO.getSkillsForJobSeeker(jobSeeker.getId());
                request.getSession().setAttribute("skillList", skills);
            } else {
                request.setAttribute("error", "Skill already exists.");
                List<Skill> skills = skillDAO.getSkillsForJobSeeker(jobSeeker.getId());
                request.getSession().setAttribute("skillList", skills);
                request.getRequestDispatcher("jobseeker_editprofile_editresume.jsp").forward(request, response);
                return;
            }
            response.sendRedirect("EditResume");
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
        processRequest(request, response);
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
