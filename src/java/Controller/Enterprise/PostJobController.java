/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Enterprise;

import DAL.CityDAO;
import DAL.EnterpriseDAO;
import DAL.JobDAO;
import DAL.JobSeekerDAO;
import DAL.JobTypeDetailDAO;
import DAL.StatusJobDetailDAO;
import DAL.TagDAO;
import DAL.TagJobDAO;
import DAL.WorkLevelDetailDAO;
import Model.Account;
import Model.City;
import Model.Enterprise;
import Model.Job;
import Model.JobSeeker;
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
public class PostJobController extends HttpServlet {

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
                    JobTypeDetailDAO jtdd = new JobTypeDetailDAO();
                    List<JobTypeDetail> jtd = jtdd.getAllJobTypeDetails();
                    request.setAttribute("JobType", jtd);

                    TagDAO tjd = new TagDAO();
                    List<Tag> tags = tjd.getAllTags();
                    request.setAttribute("tags", tags);

                    WorkLevelDetailDAO wldd = new WorkLevelDetailDAO();
                    List<WorkLevelDetail> wld = wldd.getAllWorkLevel();
                    request.setAttribute("WorkLevel", wld);
                    StatusJobDetailDAO sjdd = new StatusJobDetailDAO();
                    List<StatusJobDetail> statusJobDetail = sjdd.getAllStatus();
                    request.setAttribute("JobStatus", statusJobDetail);

                    CityDAO cd = new CityDAO();
                    List<City> cities = cd.getAllCities();
                    request.setAttribute("cities", cities);
                    request.getRequestDispatcher("postJob.jsp").forward(request, response);
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
        Job job = new Job();

        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");

        JobDAO jd = new JobDAO();
        JobTypeDetailDAO jtdd = new JobTypeDetailDAO();
        WorkLevelDetailDAO wldd = new WorkLevelDetailDAO();
        CityDAO cd = new CityDAO();
        EnterpriseDAO ed = new EnterpriseDAO();
        Enterprise enterprise = ed.getEnterpriseByAccountId(a.getUsername());

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
        List<Job> list = jd.getAllJobs();
        int newestId = jd.getNextPredictedJobId();
        jd.insertJob(job);

        TagJobDAO tjd = new TagJobDAO();
        if (selectedTags != null && newestId != -1) {
            for (int i : selectedTags) {
                tjd.insertJobTags(newestId, i);
            }
        }
        response.sendRedirect("ManageJob");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
