/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.JobSeeker;

import DAL.ReportDAO;
import Model.Account;
import Model.Report;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;

/**
 *
 * @author admin
 */
public class PostReportJob extends HttpServlet {

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
            out.println("<title>Servlet PostReportJob</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PostReportJob at " + request.getContextPath() + "</h1>");
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
        System.out.println("Vao doGet report job");
        response.sendRedirect("Login");
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
        System.out.println("Vao do Post Post report job");
        HttpSession session = request.getSession();
        String message = request.getParameter("jobDescription");
        int idReportDetail = 1;
        if (request.getParameter("typeOfReportDetail") != null) {
            System.out.println("Nhay vao day");
            idReportDetail = Integer.parseInt(request.getParameter("typeOfReportDetail"));
            System.out.println(idReportDetail);
        }
        System.out.println("Nhay ra");
        Report report = new Report();
        if (message != null) {
            message = new String(message.getBytes("ISO-8859-1"), "UTF-8");
            // set account name (username)
            String username = ((Account) (session.getAttribute("account"))).getUsername();
            report.setAccountId(username);
            // set jobId
            String id_raw = request.getParameter("jobId");
            if (id_raw != null) {
                int id = Integer.parseInt(id_raw);
                report.setJobId(id);
            }
            // set content
            report.setContent(message);
            // set createdDate
            Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
            report.setCreatedDate(currentTimestamp);
            // set isRead
            report.setIsRead(false);
            // set report type id
            report.setReportTypeId(idReportDetail);
            ReportDAO rd = new ReportDAO();
            
            // insert new report to the DB
            rd.insertReport(report);
            session.setAttribute("Status", "Da report jobID thanh cong");
            System.out.println("Ket qua report la: " + report);
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
