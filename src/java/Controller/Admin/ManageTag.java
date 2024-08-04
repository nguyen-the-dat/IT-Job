/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAL.TagDAO;
import Model.Account;
import Model.Tag;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class ManageTag extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //doan nay la phan quyen
        HttpSession session = request.getSession(false);

        if (session != null) {
            Account account = (Account) session.getAttribute("account");
            System.out.println(account);
            if (account != null && account.getRoleId() == 3) {
                //code tiep vao day
                String pageParam = request.getParameter("page");
                String searchParam = request.getParameter("search");
                System.out.println(searchParam);
                int page = 1; // Default to the first page
                int pageSize = 5; // Set the desired page size
                if (pageParam != null && !pageParam.isEmpty()) {
//                // Parse the page parameter to an integer
                    page = Integer.parseInt(pageParam);
                }
                TagDAO tagDAO = new TagDAO();
//           
                List<Tag> listTags = tagDAO.getTagForManage(searchParam);
                List<Tag> pagingTags = tagDAO.Paging(listTags, page, pageSize);
                request.setAttribute("listT", pagingTags);
                request.setAttribute("totalPages", listTags.size() % pageSize == 0 ? (listTags.size() / pageSize) : (listTags.size() / pageSize + 1));
                request.setAttribute("currentPage", page);
                request.setAttribute("searchParam", searchParam);
                request.getRequestDispatcher("manageTag.jsp").forward(request, response);

            } else {
                response.sendRedirect("Home");
            }
        } else {
            response.sendRedirect("Home");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session != null) {
            Account account = (Account) session.getAttribute("account");
            TagDAO tagDAO = new TagDAO();
            if (account != null && account.getRoleId() == 3) {
                String action = request.getParameter("action");
                if (action.equals("edit")) {
                    int tagId = Integer.parseInt(request.getParameter("id"));
                    String tag = request.getParameter("tag");
                    Tag t = new Tag(tagId, tag);
                    boolean isEdited = tagDAO.editTag(t);
                    if (isEdited) {
                        session.setAttribute("notification", "Tag edited successfully");
                    } else {
                        session.setAttribute("notificationErr", "Failed to edit tag");
                    }

                }
                if (action.equals("delete")) {
                    int tagId = Integer.parseInt(request.getParameter("id"));
//                    String tag = request.getParameter("tag");
//                    Tag t = new Tag(tagId, tag);
                    boolean isEdited = tagDAO.deleteTag(tagId);
                    if (isEdited) {
                        session.setAttribute("notification", "Tag delete successfully");
                    } else {
                        session.setAttribute("notificationErr", "Failed to delete tag, This tag is currently use");
                    }

                }
                if (action.equals("add")) {
                    String tag = request.getParameter("tag");
                   
                    boolean isAdded = tagDAO.addTag(tag);
                    if (isAdded) {
                        session.setAttribute("notification", "Tag add successfully");
                    } else {
                        session.setAttribute("notificationErr", "Failed to add tag");
                    }
                }
                response.sendRedirect("ManageTag");
            }
        }
    }
}
