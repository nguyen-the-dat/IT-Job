/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Enterprise;

import DAL.AccountDAO;
import DAL.EnterpriseDAO;
import Model.Account;
import Model.CompanyTypeDetail;
import java.io.*;

import Model.Enterprise;
import Model.EnterpriseSizeDetail;
import Model.EnterprisesClone;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.File;
import jakarta.servlet.http.Part;
import java.sql.Timestamp;

/**
 *
 * @author admin
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class EditProfile extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final EnterpriseDAO enterpriseDao = new EnterpriseDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProfile at " + request.getContextPath() + "</h1>");
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
        String userRole = "enterprise";
        String displayName = "";

        if (session != null) {
            Account account = (Account) session.getAttribute("account");
            if (account != null && account.getRoleId() == 1) {
                EnterprisesClone enterprise = new EnterpriseDAO().getEnterprisesCloneByAccountId(account.getUsername());

                if (enterprise != null) {
                    request.setAttribute("user", enterprise);
                    userRole = "enterprise";
                    displayName = enterprise.getShortName();
                    request.setAttribute("enterpriseAccount", enterprise);
                    request.setAttribute("userRole", userRole);
                    request.setAttribute("displayName", displayName);
                    request.getRequestDispatcher("../company-dashboard-profile.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        if (a != null && a.getRoleId() == 1) {

            EnterpriseDAO ed = new EnterpriseDAO();
            EnterprisesClone e = ed.getEnterprisesCloneByAccountId(a.getUsername());
            String fullCompanyName = request.getParameter("fullCompanyName");
            if (fullCompanyName != null && fullCompanyName.trim() != null) {
                e.setFullCompanyName(fullCompanyName);
            }
            String shortName = request.getParameter("shortName");
            if (shortName != null && shortName.trim() != "") {
                e.setShortName(shortName);
            }
            String email = request.getParameter("email");
            if (email != null && email.trim() != "") {
                e.setEmailContact(email);
            }
            String phoneNumber = request.getParameter("phoneNumber");
            if (phoneNumber != null && phoneNumber.trim() != "") {

                e.setPhoneContact(phoneNumber);
            }
            String taxcode = request.getParameter("taxcode");
            if (taxcode != null && taxcode.trim() != "") {
                e.setTaxCode(taxcode);
            }
            String websiteUrl = request.getParameter("websiteUrl");
            if (websiteUrl != null && websiteUrl.trim() != "") {

                e.setWebsiteUrl(websiteUrl);
            }
            String description = request.getParameter("description");
            if (description != null && description.trim() != "") {
                e.setDescription(description);

            }
            if (request.getParameter("foundedYear") != null) {
                int foundedYear = Integer.parseInt(request.getParameter("foundedYear"));
                e.setFoundedYear(foundedYear);
            }

            if ((request.getParameter("enterpriseSize")) != null) {
                int enterpriseSize = Integer.parseInt(request.getParameter("enterpriseSize"));
                EnterpriseSizeDetail enterpriseSizeDetail = new EnterpriseSizeDetail();
                enterpriseSizeDetail.setId(enterpriseSize);
                switch (enterpriseSize) {
                    case 1:
                        enterpriseSizeDetail.setSize("Less than 10");
                        break;
                    case 2:
                        enterpriseSizeDetail.setSize("From 10 to 50");
                        break;
                    case 3:
                        enterpriseSizeDetail.setSize("From 50 to 100");
                        break;
                    case 4:
                        enterpriseSizeDetail.setSize("From 100 to 500");
                        break;
                    case 5:
                        enterpriseSizeDetail.setSize("More than 500");
                        break;
                }
                e.setEnterpriseSizeDetail(enterpriseSizeDetail);
            }

            if (request.getParameter("enterpriseType") != null) {
                int enterpriseType = Integer.parseInt(request.getParameter("enterpriseType"));
                CompanyTypeDetail companyTypeDetail = new CompanyTypeDetail();
                companyTypeDetail.setId(enterpriseType);
                switch (enterpriseType) {
                    case 1:
                        companyTypeDetail.setTypeName("PRODUCT");
                        break;
                    case 2:
                        companyTypeDetail.setTypeName("OUTSOURCE");
                        break;
                }
                e.setCompanyTypeDetail(companyTypeDetail);
            }

            if (request.getParameter("workingDay") != null) {
                int workingDay = Integer.parseInt(request.getParameter("workingDay"));
                e.setWorkingday(workingDay);
            }
            String country = request.getParameter("country");
            if (country != null && country.trim() != "") {

                e.setCountry(country);
            }
            String fullAddress = request.getParameter("fullAddress");
            if (fullAddress != null && fullAddress.trim() != "") {

                e.setAddress(fullAddress);
            }
            String facebookLink = request.getParameter("facebookLink");
            if (facebookLink != null && facebookLink.trim() != "") {
                e.setFacebookUrl(facebookLink);
            }

            Part filePart;
            String fileName;
            File file;

            //save logo url 
            filePart = request.getPart("logoUrl");
            fileName = filePart.getSubmittedFileName();
            if (fileName != null && !fileName.isEmpty()) {

                e.setLogoUrl("images/logos/" + fileName);
            } else {
            }

            // save image url 
            filePart = request.getPart("imageUrl");
            fileName = filePart.getSubmittedFileName();
            if (fileName != null && !fileName.isEmpty()) {
                // fileName is null
                e.setImageUrl("images/" + fileName);
            } else {
                // fileName is not null
            }

            // save bussiness lisence front
            filePart = request.getPart("blFront");
            fileName = filePart.getSubmittedFileName();
            if (fileName != null && !fileName.isEmpty()) {
                // fileName is null
                e.setBusinessLicenseFront("images/licenses/" + fileName);
            } else {
            }

            // save bussiness lisence back
            filePart = request.getPart("blBack");
            fileName = filePart.getSubmittedFileName();
            if (fileName != null && !fileName.isEmpty()) {
                // fileName is null
                e.setBusinessLicenseBack("images/licenses/" + fileName);
            } else {
                // fileName is not null
            }

            // cap nhat status
            // kiem tra neu chua co trong bang Enterprise thi se co 
            // status la 1 : new register
            // neu co roi thi se co status la 2 : cho accept update
            EnterpriseDAO eD = new EnterpriseDAO();
            Enterprise enterprises = eD.getEnterpriseByAccountId(e.getAccountId());
            if (enterprises != null) { // da ton tai trong bang enterprise => status = 2
                e.setStatus(2);
            } else {// chua ton tai trong bang enterprise
                e.setStatus(1);
            }
            enterpriseDao.updateEnterprisesCloneProfile(e);

            // cap nhat thoi gian update cho account
            Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
            a.setUpdatedTime(currentTimestamp);
            AccountDAO aD = new AccountDAO();
            aD.updateAccountUpdatedTime(a);
            doGet(request, response);
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
