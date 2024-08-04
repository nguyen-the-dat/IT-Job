/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.JobSeeker;

import DAL.EducationDAO;
import Model.JobSeeker;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneOffset;

/**
 *
 * @author ADMIN
 */
public class AddEducationController extends HttpServlet {
   
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
            String title = request.getParameter("title");
            String school = request.getParameter("school");
            String degree = request.getParameter("degree");
            String startTime = request.getParameter("start");
            String endTime = request.getParameter("end");
            String description = request.getParameter("description");
            JobSeeker jobSeeker = (JobSeeker) request.getSession().getAttribute("jobseeker");
            EducationDAO educationDAO = new EducationDAO();
            educationDAO.insert(title,school,degree,convertStringToTimeStamp(startTime),convertStringToTimeStamp(endTime),description,jobSeeker.getId());
            response.sendRedirect("EditResume");
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
        processRequest(request, response);
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
    
    private Timestamp convertStringToTimeStamp(String dateString){
        LocalDate date = LocalDate.parse(dateString);
        
        // Tạo LocalTime mặc định (00:00:00) cho ngày
        LocalTime time = LocalTime.of(0, 0);
        
        // Kết hợp LocalDate và LocalTime để tạo LocalDateTime
        LocalDateTime dateTime = LocalDateTime.of(date, time);
        
        // Lấy timestamp từ LocalDateTime
        long timestamp = dateTime.toEpochSecond(ZoneOffset.UTC) * 1000;
        return new Timestamp(timestamp);
    }

}
