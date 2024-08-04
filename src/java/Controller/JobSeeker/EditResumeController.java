/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.JobSeeker;

import DAL.EducationDAO;
import DAL.JobDAO;
import DAL.JobSeekerDAO;
import DAL.SkillDAO;
import DAL.WorkExperienceDAO;
import Model.Account;
import Model.Education;
import Model.JobSeeker;
import Model.Skill;
import Model.WorkExperience;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileNotFoundException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
public class EditResumeController extends HttpServlet {

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
            out.println("<title>Servlet EditResumeController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditResumeController at " + request.getContextPath() + "</h1>");
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
        JobSeeker jobSeeker = (JobSeeker) request.getSession().getAttribute("jobseeker");

        if (jobSeeker != null) {
            SkillDAO skillDAO = new SkillDAO();
            List<Skill> skills = skillDAO.getSkillsForJobSeeker(jobSeeker.getId());
            WorkExperienceDAO workExperienceDAO = new WorkExperienceDAO();
            List<WorkExperience> workExperiencesForJobSeeker = workExperienceDAO.getWorkExperiencesForJobSeeker(jobSeeker.getId());
            EducationDAO educationDAO = new EducationDAO();
            List<Education> educationsForJobSeeker = educationDAO.getEducationsForJobSeeker(jobSeeker.getId());
            request.getSession().setAttribute("skillList", skills);
            request.getSession().setAttribute("expList", workExperiencesForJobSeeker);
            request.getSession().setAttribute("eduList", educationsForJobSeeker);
            request.getRequestDispatcher("jobseeker_editprofile_editresume.jsp").forward(request, response);
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
        try {
            JobSeeker jobSeeker = (JobSeeker) request.getSession().getAttribute("jobseeker");
            String id = request.getParameter("id");
            String name = request.getParameter("Name");
            String dob = request.getParameter("DOB");
            String country = request.getParameter("Country");
            String gender = request.getParameter("Gender");
            String username = request.getParameter("username");
            String email = request.getParameter("EmailContact");
            String phone = request.getParameter("PhoneContact");
            String description = request.getParameter("Description");
            jobSeeker.setName(name);
            Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dob);
            jobSeeker.setDOB(date);
            jobSeeker.setCountry(country);
            jobSeeker.setGender(gender.equals("Male"));
            jobSeeker.setGender(gender.equals("FeMale"));
            jobSeeker.setName(name);
            jobSeeker.setEmailContact(email);
            jobSeeker.setPhoneContact(phone);
            jobSeeker.setDescription(description);
            String uploadPath = getServletContext().getRealPath("").substring(0, getServletContext().getRealPath("").length() - 10) + File.separator + "web" + File.separator + "images";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            try {
                String fileName = jobSeeker.getImageUrl();
                for (Part part : request.getParts()) {
                    fileName = getFileName(part);
                    if (!fileName.isEmpty() && !fileName.equals("default.file") && !fileName.equals(jobSeeker.getImageUrl())) {
                        part.write(uploadPath + File.separator + fileName);
                        break;
                    }
                }
                jobSeeker.setImageUrl("images/" + fileName);
                JobSeekerDAO jobSeekerDAO = new JobSeekerDAO();
                jobSeekerDAO.updateJobseeker(jobSeeker);
                jobSeeker = jobSeekerDAO.getJobSeekerByAccountId(username);
                request.getSession().setAttribute("jobseeker", jobSeeker);
                doGet(request, response);
            } catch (FileNotFoundException fne) {
                request.setAttribute("message", "There was an error: " + fne.getMessage());
            }
        } catch (ParseException ex) {
            Logger.getLogger(EditResumeController.class.getName()).log(Level.SEVERE, null, ex);
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

    private static final long serialVersionUID = 1L;

    private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return "default.file";
    }
}
