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
import Model.*;
import java.util.ArrayList;
import java.util.List;
import DAL.*;
import jakarta.servlet.http.HttpSession;
import org.json.JSONObject;
import org.json.JSONArray;

/**
 *
 * @author Admin
 */
public class AjaxAutoFillController extends HttpServlet {

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
            out.println("<title>Servlet AjaxAutoFillController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AjaxAutoFillController at " + request.getContextPath() + "</h1>");
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
        String appliedId = request.getParameter("appliedId");
        try {
            int appliedIdInt = Integer.parseInt(appliedId);
            List<Application> listApplication = new ArrayList<>();
            listApplication = new ApplicationDAO().getAllApplications();
            String titleJob, coverLetter;
            Application applied = null;
            JSONObject json = new JSONObject();
            for (Application app : listApplication) {
                if (app.getId() == appliedIdInt) {
                    applied = app;
                    titleJob = app.getJob().getTitle();
                    coverLetter = app.getLetter();
                    json.put("titleJob", titleJob);
                    json.put("coverLetter", coverLetter);
                    json.put("statusAppliedId", applied.getStatusApplicationDetail().getId());
                }
            }
            HttpSession ses = request.getSession();
            Account acc = (Account) ses.getAttribute("account");
            if (acc.getRoleId() == 2) {
                String fullName = new JobSeekerDAO().getJobSeekerByAccountId(acc.getUsername()).getName();
                json.put("fullName", fullName);
            } else if (acc.getRoleId() == 1) {
                String fullName = applied.getJobSeeker().getName();
                json.put("fullName", fullName);
            }
            JSONArray statusDetailArray = new JSONArray();
            List<StatusApplicationDetail> statusDetail = new StatusApplicationDetailDAO().getAllStatusApplicationDetails();
            for (StatusApplicationDetail detail : statusDetail) {
                JSONObject detailJson = convertDetailToJson(detail);
                statusDetailArray.put(detailJson);
            }
            json.put("statusDetail", statusDetailArray);
            String cvUrl = applied.getCvUrl();
            json.put("cvUrl", cvUrl);
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json");
            response.getWriter().print(json);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    private static JSONObject convertDetailToJson(StatusApplicationDetail detail) {
        JSONObject detailJson = new JSONObject();
        detailJson.put("id", detail.getId());
        detailJson.put("statusApplication", detail.getStatusApplication());
        return detailJson;
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
