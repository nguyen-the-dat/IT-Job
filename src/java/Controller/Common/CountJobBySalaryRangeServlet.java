/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Common;

import DAL.JobDAO;
import org.json.JSONObject;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author thain
 */
public class CountJobBySalaryRangeServlet extends HttpServlet {

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
            out.println("<title>Servlet CountJobBySalaryRangeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CountJobBySalaryRangeServlet at " + request.getContextPath() + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        String range = request.getParameter("priceRange");
        JobDAO jobDao = new JobDAO();
        int count;

        try {
            if ("under8000".equals(range)) {
                count = jobDao.getCountOfJobsUnderSalary(8000.0f);
            } else if ("between8000And12000".equals(range)) {
                count = jobDao.getCountOfJobsBetweenSalary(8000.0f, 12000.0f);
            } else if ("above12000".equals(range)) {
                count = jobDao.getCountOfJobsAboveSalary(12000.0f);
            } else {
                count = 0;
            }

            JSONObject result = new JSONObject();
            result.put("jobCount", count);
            out.print(result.toString());
        } catch (Exception e) {
            // It's a good idea to return some indication of error in the JSON response
            JSONObject result = new JSONObject();
            result.put("error", "An error occurred while processing the job counts.");
            out.print(result.toString());
            e.printStackTrace();
        } finally {
            out.flush();
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
