/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAL.AccountDAO;
import DAL.EnterpriseDAO;
import DAL.JobSeekerDAO;
import Model.Account;
import Model.Enterprise;
import Model.JobSeeker;
import jakarta.mail.Session;
import Model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;

/**
 *
 * @author admin
 */
public class ManageUser extends HttpServlet {

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
            out.println("<title>Servlet AdminDashboard</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminDashboard at " + request.getContextPath() + "</h1>");
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
        String role = request.getParameter("role");
        String searchValue = request.getParameter("searchValue");
        if (session != null) {
            Account account = (Account) session.getAttribute("account");
            if (account != null && account.getRoleId() == 3) {
                AccountDAO dao = new AccountDAO();
                EnterpriseDAO endao = new EnterpriseDAO();
                JobSeekerDAO jdao = new JobSeekerDAO();
                ArrayList<Account> accountList = dao.getAllAccount();
                List<Account> finishList = new ArrayList<>();
                String pageParam = request.getParameter("page");
                int page = 1; // Default to the first page
                int pageSize = 5; // Set the desired page size
                if (pageParam != null && !pageParam.isEmpty()) {
//                // Parse the page parameter to an integer
                    page = Integer.parseInt(pageParam);
                }
                for (Account acc : accountList) {
                    String name = null;
                    String imgUrl = null;
                    if (acc.getRoleId() == 1) {
                        Enterprise enterprise = endao.getEnterpriseByAccountId(acc.getUsername());
                        if (enterprise != null) {
                            name = enterprise.getFullCompanyName();
                            imgUrl = enterprise.getImageUrl();
                        }
                    } else if (acc.getRoleId() == 2) {
                        JobSeeker jobSeeker = jdao.getJobSeekerByAccountId(acc.getUsername());
                        if (jobSeeker != null) {
                            name = jobSeeker.getName();
                            imgUrl = jobSeeker.getImageUrl();
                        }
                    } else if (acc.getRoleId() == 3) {
                        name = "This is admin";
                    }
                    acc.setName(name);
                    acc.setImgUrl(imgUrl);
                    finishList.add(acc);
                }
                if (role != null && !role.equals("0") && !role.trim().isEmpty()) {
                    request.setAttribute("role", role);
                    finishList = finishList.stream().filter(n -> n.getRoleId() == Integer.parseInt(role)).collect(Collectors.toList());
                }
                if (searchValue != null && !searchValue.trim().isEmpty()) {
                    request.setAttribute("searchValue", searchValue);
                    finishList = finishList.stream().filter(n -> n.getName().toLowerCase().contains(searchValue.toLowerCase())).collect(Collectors.toList());
                }
                int fromIndex = (page - 1) * pageSize;
                int toIndex = Math.min(fromIndex + pageSize, finishList.size());
                if (fromIndex > toIndex) {
                    fromIndex = toIndex;
                }
                request.setAttribute("accounts", finishList.subList(fromIndex, toIndex));
                request.setAttribute("totalPages", finishList.size() % pageSize == 0 ? (finishList.size() / pageSize) : (finishList.size() / pageSize + 1));
                request.setAttribute("currentPage", page);
                request.getRequestDispatcher("admin_manage_user.jsp").forward(request, response);
            } else {
                response.sendRedirect("Home");
            }
        } else {
            response.sendRedirect("Home");
        }
        //request.getRequestDispatcher("test.jsp").forward(request, response);
    }

//        HttpSession session = request.getSession(false);
//        String userRole = "guest";
//        String displayName = "";
//
//        if (session != null) {
//            Account account = (Account) session.getAttribute("account");
//            if (account != null && account.getRoleId() == 3) {
//                request.setAttribute("user", account);
//                userRole = "admin";
//                displayName = account.getUsername();
//                request.setAttribute("userRole", userRole);
//                request.setAttribute("displayName", displayName);
//                request.getRequestDispatcher("admin_dashboard.jsp").forward(request, response);
//            } else {
//                response.sendRedirect("/ITJob/Home");
//            }
//        } else {
//            response.sendRedirect("/ITJob/Home");
//        }
//    }
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

        if (session != null) {
            Account account = (Account) session.getAttribute("account");
            AccountDAO dao = new AccountDAO();
            EnterpriseDAO endao = new EnterpriseDAO();
            JobSeekerDAO jdao = new JobSeekerDAO();
            if (account != null && account.getRoleId() == 3) {
                String action = request.getParameter("action");

                if (action.equals("ban")) {
                    String userName = request.getParameter("username");
                    boolean isEdited = dao.banAccountByUserName(userName);
                    if (isEdited) {
                        session.setAttribute("notification", "Ban account: " + userName + " successfully");
                    } else {
                        session.setAttribute("notificationErr", "Failed to ban account: " + userName);
                    }
                }
                if (action.equals("unban")) {
                    String userName = request.getParameter("username");
                    boolean isEdited = dao.unBanAccountByUserName(userName);
                    if (isEdited) {
                        session.setAttribute("notification", "Unban account: " + userName + " successfully");
                    } else {
                        session.setAttribute("notificationErr", "Failed to unban account: " + userName);
                    }
                }
                if (action.equals("delete")) {
                    int roleId = Integer.parseInt(request.getParameter("roleId"));
                    String userName = request.getParameter("username");
                    String password = request.getParameter("adminPassword");
                    boolean checkPass = account.getPassword().equals(password);
                    if (checkPass) {
                        boolean isEdited = false;
                        if (roleId == 1) {
                            isEdited = dao.deleteEnterpriseAccount(userName);

                        } else if (roleId == 2) {
                            try {
                                isEdited = dao.deleteJobseekerAccount(userName);
                            } catch (SQLException ex) {
                                Logger.getLogger(ManageUser.class.getName()).log(Level.SEVERE, null, ex);
                            }
                        }
                        if (isEdited) {
                            session.setAttribute("notification", "Account delete successfully");
                        } else {
                            session.setAttribute("notificationErr", "Failed to delete account");
                        }
                    } else {
                        session.setAttribute("notificationErr", "Failed to delete account, Admin password isn't correct");
                    }

                }
//                if (action.equals("add")) {
//                    String tag = request.getParameter("tag");
//                   
//                    boolean isAdded = tagDAO.addTag(tag);
//                    if (isAdded) {
//                        session.setAttribute("notification", "Tag add successfully");
//                    } else {
//                        session.setAttribute("notificationErr", "Failed to add tag");
//                    }
//                }
                response.sendRedirect("ManageUser");
            }
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
