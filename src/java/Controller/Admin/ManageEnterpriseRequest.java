/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAL.AccountDAO;
import DAL.EnterpriseDAO;
import Model.Account;
import Model.Enterprise;
import Model.EnterprisesClone;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author admin
 */
public class ManageEnterpriseRequest extends HttpServlet {

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
            out.println("<title>Servlet ManageEnterpriseRequest</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageEnterpriseRequest at " + request.getContextPath() + "</h1>");
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
            if (account != null && account.getRoleId() == 3) {
                // xu li phan trang
                String pageIndexStr = request.getParameter("pageIndex");
                int pageIndex = pageIndexStr != null ? Integer.parseInt(pageIndexStr.trim()) : 1;
                int pageSize = 5;
                
                int totalEnterprisesClone;
                int totalPages;
                // end
                EnterpriseDAO d = new EnterpriseDAO();
                List<EnterprisesClone> list = d.getEnterprisesCloneSortedWithPagination(1, 1000);
                totalEnterprisesClone = list.size(); // set total element has found
                totalPages = (int) Math.ceil((double) totalEnterprisesClone / pageSize); // set total pages based number element per pages

                list = d.getEnterprisesCloneSortedWithPagination(pageIndex, pageSize);
                session.setAttribute("listEnterprisesClone", list);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("currentPage", pageIndex);
                request.getRequestDispatcher("admin_dashboard_manage_enterprise_request.jsp").forward(request, response);
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
        EnterpriseDAO ed = new EnterpriseDAO();
        AccountDAO ad = new AccountDAO();
        String action = request.getParameter("action");
        String accountId = request.getParameter("accountId");
        if (action != null && action.trim() != "") {
            System.out.println("Action la: " + action + " account Id la: " + accountId);
            // thuc hien accept
            if (action.equals("accept")) {
                
                System.out.println("Vao do Post, ket qua la: " + action + " la " + accountId);
                EnterprisesClone e = ed.getEnterprisesCloneByAccountId(accountId);
                System.out.println("Gia tri gui di trong do Post " + e);
                if (e != null) {
                    System.out.println("Vao day ne!!!!!");
                    ad.acceptEnterpriseByAdmin(e);
                }
            } else if (action.equals("deny")) {
                // kiem tra xem deny gi
                Enterprise e = ed.getEnterpriseByAccountId(accountId);
                if (e != null) {
                    System.out.println("THuc hien deny update");
                    // thuc hien deny update
                    ad.denyUpdateByAdmin(accountId);
                } else {
// deny register
                    System.out.println("THuc hien deny register");
                    ad.deleteEnterprisesCloneAccount(accountId);
                }
                
            }
        }
        doGet(request, response);
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
