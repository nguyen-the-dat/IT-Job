/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Enterprise;

import DAL.CityDAO;
import DAL.EnterpriseDAO;
import DAL.JobDAO;
import DAL.JobTypeDetailDAO;
import DAL.TagDAO;
import DAL.TagJobDAO;
import DAL.WorkLevelDetailDAO;
import Model.Account;
import Model.City;
import Model.Enterprise;
import Model.Job;
import Model.JobTypeDetail;
import Model.StatusJobDetail;
import Model.Tag;
import Model.WorkLevelDetail;
import Utils.CommonUtils;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.List;

/**
 *
 * @author ngoba
 */
public class UpdateJob extends HttpServlet {

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
            out.println("<title>Servlet UpdateJob</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateJob at " + request.getContextPath() + "</h1>");
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
        String userRole = "guest";
        String displayName = "";
        if (session != null) {
            Account account = (Account) session.getAttribute("account");
            if (account != null && account.getRoleId() == 1) {
                Enterprise enterprise = new EnterpriseDAO().getEnterpriseByAccountId(account.getUsername());
                if (enterprise != null) {
                    request.setAttribute("user", enterprise);
                    userRole = "enterprise";
                    displayName = enterprise.getShortName();
                    request.setAttribute("userRole", userRole);
                    request.setAttribute("displayName", displayName);
                    int jobId = Utils.CommonUtils.getIntParameter(request, "id");
                    JobDAO jd = new JobDAO();
                    JobTypeDetailDAO jtdd = new JobTypeDetailDAO();
                    List<JobTypeDetail> jtd = jtdd.getAllJobTypeDetails();
                    request.setAttribute("JobType", jtd);

                    WorkLevelDetailDAO wldd = new WorkLevelDetailDAO();
                    List<WorkLevelDetail> wld = wldd.getAllWorkLevel();
                    request.setAttribute("WorkLevel", wld);

                    CityDAO cd = new CityDAO();
                    List<City> cities = cd.getAllCities();
                    request.setAttribute("cities", cities);
                    Job job = jd.getJobById(jobId);

                    TagDAO td = new TagDAO();
                    List<Tag> tags = td.getAllTags();

                    TagJobDAO tjd = new TagJobDAO();
                    List<Tag> taglinked = tjd.findTagsByJob(jobId);

                    request.setAttribute("taglinked", taglinked);
                    request.setAttribute("tags", tags);
                    request.setAttribute("job", job);
                    request.getRequestDispatcher("updateJob.jsp").forward(request, response);
                }
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
        HttpSession session = request.getSession(false);
        if (session != null) {
            Account account = (Account) session.getAttribute("account");
            if (account != null && account.getRoleId() == 1) {
                Enterprise enterprise = new EnterpriseDAO().getEnterpriseByAccountId(account.getUsername());
                if (enterprise != null) {

                    JobDAO jd = new JobDAO();
                    JobTypeDetailDAO jtdd = new JobTypeDetailDAO();
                    WorkLevelDetailDAO wldd = new WorkLevelDetailDAO();
                    CityDAO cd = new CityDAO();
                    EnterpriseDAO ed = new EnterpriseDAO();

                    int id = Utils.CommonUtils.getIntParameter(request, "id");
                    String title = CommonUtils.getStringParameter(request, "title");
                    JobTypeDetail jtd = jtdd.getJobTypeDetailById(CommonUtils.getIntParameter(request, "jobType"));
                    String address = CommonUtils.getStringParameter(request, "address");
                    Timestamp expiredTime = CommonUtils.getTimestampParameter(request, "expiredTime");
                    String overview = CommonUtils.getStringParameter(request, "overview");
                    float salaryMin = CommonUtils.getFloatParameter(request, "salaMin");
                    float salaryMax = CommonUtils.getFloatParameter(request, "salaMax");
                    int numRecruit = CommonUtils.getIntParameter(request, "numRecruit");
                    int expRequire = CommonUtils.getIntParameter(request, "expRequired");
                    String genderRequired = CommonUtils.getStringParameter(request, "genderRequired");
                    WorkLevelDetail wld = wldd.getWorkLevelDetailById(CommonUtils.getIntParameter(request, "workLevel"));
                    City city = cd.getCityById(CommonUtils.getIntParameter(request, "city"));
                    String skill = CommonUtils.getStringParameter(request, "skill");
                    String responsibilities = CommonUtils.getStringParameter(request, "responsibilities");
                    String requirements = CommonUtils.getStringParameter(request, "requirement");
                    int status = CommonUtils.getIntParameter(request, "status");
                    String[] selectedTagsStrings = request.getParameterValues("tags");
                    int[] selectedTags = null;
                    // Kiểm tra xem có checkbox nào được chọn không
                    if (selectedTagsStrings != null) {
                        // Khởi tạo mảng int để lưu các giá trị đã chuyển đổi
                        selectedTags = new int[selectedTagsStrings.length];

                        for (int i = 0; i < selectedTagsStrings.length; i++) {
                            try {
                                // Chuyển đổi từ String sang int và lưu vào mảng
                                selectedTags[i] = Integer.parseInt(selectedTagsStrings[i]);
                            } catch (NumberFormatException e) {
                                // Xử lý trường hợp không thể chuyển đổi
                                System.out.println("Error converting to int: " + selectedTagsStrings[i]);
                                // Bạn có thể gán giá trị mặc định hoặc xử lý lỗi ở đây
                            }
                        }

                        // Tại điểm này, selectedTags chứa mảng int của các giá trị đã chọn
                        // Tiếp theo, bạn có thể xử lý mảng int này theo nhu cầu
                    } else {
                        // Không có checkbox nào được chọn
                        System.out.println("No tags were selected.");
                    }
                    Job job = jd.getJobById(id);

                    job.setTitle(title);
                    job.setJobTypeDetail(jtd);
                    job.setSalaryMin(salaryMin);
                    job.setSalaryMax(salaryMax);
                    job.setNumRecruit(numRecruit);
                    job.setGenderRequire(genderRequired);
                    job.setExpYearRequire(expRequire);
                    job.setOverview(overview);
                    job.setResponsabilities(responsibilities);
                    job.setAddress(address);
                    job.setExpiredTime(expiredTime);
                    job.setEnterprise(enterprise);
                    job.setRequirements(requirements);
                    job.setSkills(skill);
                    job.setWorkLevelDetail(wld);
                    job.setCity(city);
                    StatusJobDetail sjd = new StatusJobDetail();
                    sjd.setId(status);
                    job.setStatusJobDetail(sjd);
                    TagJobDAO tjd = new TagJobDAO();
                    tjd.deleteTagsByJobId(id);
                    if (selectedTags != null) {
                        for (int i : selectedTags) {
                            tjd.insertJobTags(id, i);
                        }
                    }

                    jd.updateJob(job);
//                    session.setAttribute("noti", "Job updated successfully!");
                    response.sendRedirect("ManageJob");
                }
            } else {

                response.sendRedirect("Home");
            }

        } else {
            response.sendRedirect("Home");
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
