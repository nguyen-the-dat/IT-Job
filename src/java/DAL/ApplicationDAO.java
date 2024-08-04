package DAL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.List;
import java.util.Vector;
import Model.*;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;

public class ApplicationDAO extends DBContext {

    public void addApplication(int jobId, int seekerId, String cvUrl, String letter, int statusId) {
        String countSql = "SELECT MAX(Id) FROM [dbo].[Applications]";
        int nextId = 1;

        try ( PreparedStatement psCount = connection.prepareStatement(countSql)) {
            ResultSet rs = psCount.executeQuery();
            if (rs.next()) {
                nextId = rs.getInt(1) + 1; // Tăng ID lên 1 đơn vị so với ID lớn nhất hiện tại
            }
        } catch (SQLException e) {
            System.out.println("Error getting next ID: " + e.getMessage());
        }

        // Sử dụng PreparedStatement để bảo vệ chống lại SQL injection
        String sql = "INSERT INTO [dbo].[Applications]\n"
                + "   ([Id]\n"
                + "   ,[JobId]\n"
                + "   ,[SeekerId]\n"
                + "   ,[CVUrl]\n"
                + "   ,[Letter]\n"
                + "   ,[StatusId]\n"
                + "   ,[ApplyTime])\n"
                + "  VALUES\n"
                + "   (?\n"
                + "   ,?\n"
                + "   ,?\n"
                + "   ,?\n"
                + "   ,?\n"
                + "   ,?\n"
                + "   , GETDATE())";

        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, nextId);
            ps.setInt(2, jobId);
            ps.setInt(3, seekerId);
            ps.setString(4, cvUrl);
            ps.setString(5, letter);
            ps.setInt(6, statusId);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error inserting application: " + e.getMessage());
        }
    }

    public void removeApplication(int id) {
        String sql = "DELETE FROM [dbo].[Applications]\n"
                + "      WHERE id = ?";
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public int countApplications() {
        String sql = "select COUNT(*) as countApp from Applications";
        int count = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("countApp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public List<Application> getAllApplications() {
        List<Application> list = new ArrayList<>();
        String sql = "SELECT * FROM Applications;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Application application = new Application();
                application.setId(rs.getInt("Id"));

                JobDAO jobDAO = new JobDAO();
                Job job = jobDAO.getJobById(rs.getInt("JobId"));
                application.setJob(job);

                JobSeekerDAO jobSeekerDAO = new JobSeekerDAO();
                JobSeeker jobSeeker = jobSeekerDAO.getJobSeekerById(rs.getInt("SeekerId"));
                application.setJobSeeker(jobSeeker);

                String cvUrl = rs.getString("CVUrl");
                application.setCvUrl(rs.wasNull() ? null : cvUrl);

                String letter = rs.getString("Letter");
                application.setLetter(rs.wasNull() ? null : letter);

                int statusId = rs.getInt("StatusId");
                StatusApplicationDetail statusApplicationDetail = null;
                if (!rs.wasNull()) {
                    StatusApplicationDetailDAO statusApplicationDetailDAO = new StatusApplicationDetailDAO();
                    statusApplicationDetail = statusApplicationDetailDAO.getStatusApplicationDetailById(statusId);
                }
                application.setStatusApplicationDetail(statusApplicationDetail);

                application.setApplyTime(rs.getTimestamp("ApplyTime"));
                application.setInterviews(new ApplicationDAO().getIterviewsByAid(rs.getInt("Id")));

                list.add(application);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getNumApplicationById(int id) {
        String sql = "select count(*) AS ApplicationJob from Applications where JobId = ?";
        int count = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("ApplicationJob");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;
    }

    public void updateStatusId(int jobId, int seekerId, int statusId) {
        String sql = "UPDATE Applications\n"
                + "SET StatusId = ?\n"
                + "WHERE JobId = ? AND SeekerId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, statusId);
            st.setInt(2, jobId);
            st.setInt(3, seekerId);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
            e.printStackTrace();
        }
    }

    public List<Application> getAllApplicationsByEnterpriseId(int enterpriseId) {
        List<Application> list = new ArrayList<>();
        String sql = "SELECT a.* FROM Applications a "
                + "JOIN Jobs j ON a.JobId = j.Id "
                + "JOIN Enterprises e ON j.EnterpriseId = e.Id "
                + "WHERE e.Id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, enterpriseId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Application application = new Application();
                application.setId(rs.getInt("Id"));

                JobDAO jobDAO = new JobDAO();
                Job job = jobDAO.getJobById(rs.getInt("JobId"));
                application.setJob(job);

                JobSeekerDAO jobSeekerDAO = new JobSeekerDAO();
                JobSeeker jobSeeker = jobSeekerDAO.getJobSeekerById(rs.getInt("SeekerId"));
                application.setJobSeeker(jobSeeker);

                String cvUrl = rs.getString("CVUrl");
                application.setCvUrl(rs.wasNull() ? null : cvUrl);

                String letter = rs.getString("Letter");
                application.setLetter(rs.wasNull() ? null : letter);

                int statusId = rs.getInt("StatusId");
                StatusApplicationDetail statusApplicationDetail = null;
                if (!rs.wasNull()) {
                    StatusApplicationDetailDAO statusApplicationDetailDAO = new StatusApplicationDetailDAO();
                    statusApplicationDetail = statusApplicationDetailDAO.getStatusApplicationDetailById(statusId);
                }
                application.setStatusApplicationDetail(statusApplicationDetail);

                application.setApplyTime(rs.getTimestamp("ApplyTime"));
                application.setInterviews(new ApplicationDAO().getIterviewsByAid(rs.getInt("Id")));
                list.add(application);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void addIterview(String time, String aId, String meet) {
        String sql = "INSERT INTO [dbo].[Interviews] ([MeetingTime] ,[MeetingUrl],[ApplicationId],[StatusId])\n"
                + "     VALUES (?,?,?,1)";
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            DateTimeFormatter originalFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
            DateTimeFormatter targetFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");
            LocalDateTime dateTime = LocalDateTime.parse(time, originalFormatter);
            String convertedDatetime = dateTime.format(targetFormatter);
            ps.setString(1, convertedDatetime);
            ps.setString(2, meet);
            ps.setString(3, aId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Interviews getIterviewsByAid(int aid) {

        try {
            String sql = "  select * from [Interviews] where ApplicationId = " + aid;
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Interviews(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5));
            }
        } catch (Exception e) {
            e.printStackTrace();

        }
        return null;
    }

    public void changeStatusIterview(String id, String ss, String aid) {
        String sql = "Update [dbo].[Interviews] set  [StatusId] =  " + ss
                + "    where [Id] = " + id;

        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.executeUpdate();

            if (ss == "4") {
                String sql2 = "Update Applications set [StatusId] = 4 where Id = " + aid;
                PreparedStatement ps2 = connection.prepareStatement(sql2);
                ps2.executeUpdate();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void DeleteAppliedJob(int jobId, int seekerId) {
        String sql = "DELETE FROM [dbo].[Applications]\n"
                + "      WHERE JobId = ? AND SeekerId = ?";
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, jobId);
            ps.setInt(2, seekerId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void UpdateAppliedJobCancel(int jobId, int seekerId) {
        String sql = "UPDATE [dbo].[Applications]\n"
                + "   SET [StatusId] = 6\n"
                + " WHERE JobId = ? AND SeekerId = ?";
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, jobId);
            ps.setInt(2, seekerId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
