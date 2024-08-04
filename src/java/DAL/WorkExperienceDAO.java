/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.JobSeeker;
import Model.WorkExperience;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author thain
 */
public class WorkExperienceDAO extends DBContext {

    public List<WorkExperience> getWorkExperiencesForJobSeeker(int jobSeekerId) {
        List<WorkExperience> workExperiences = new ArrayList<>();
        String sql = "SELECT Id, Title, CompanyName, Description, StartTime, EndTime FROM WorkExperiences WHERE SeekerId = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, jobSeekerId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                WorkExperience workExperience = new WorkExperience();
                int id = rs.getInt("Id");
                workExperience.setId(id);

                String title = rs.getString("Title");
                workExperience.setTitle(title);

                String companyName = rs.getString("CompanyName");
                workExperience.setCompanyName(companyName);

                String description = rs.getString("Description");
                if (rs.wasNull()) {
                    description = null;
                }
                workExperience.setDescription(description);

                Date startTime = rs.getDate("StartTime");
                workExperience.setStartTime(startTime);

                Date endTime = rs.getDate("EndTime");
                if (rs.wasNull()) {
                    endTime = null;
                }
                workExperience.setEndTime(endTime);

                JobSeeker jobSeeker = new JobSeekerDAO().getJobSeekerById(jobSeekerId);
                workExperience.setJobSeeker(jobSeeker);

                workExperiences.add(workExperience);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return workExperiences;
    }

    public void insert(String title, String company, Timestamp startTime, Timestamp endTime, String description, int seekerID) {
        try {
            String sql = "INSERT INTO [dbo].[WorkExperiences]\n"
                    + "           ([Title]\n"
                    + "           ,[CompanyName]\n"
                    + "           ,[Description]\n"
                    + "           ,[StartTime]\n"
                    + "           ,[EndTime]\n"
                    + "           ,[SeekerId])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            st.setString(2, company);
            st.setString(3, description);
            st.setTimestamp(4, startTime);
            st.setTimestamp(5, endTime);
            st.setInt(6, seekerID);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(WorkExperienceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void edit(String title, String company, Timestamp startTime, Timestamp endTime, String description, int id) {
        try {
            String sql = "UPDATE [dbo].[WorkExperiences]\n"
                    + "   SET [Title] = ?\n"
                    + "      ,[CompanyName] = ?\n"
                    + "      ,[Description] = ?\n"
                    + "      ,[StartTime] = ?\n"
                    + "      ,[EndTime] = ?\n"
                    + " WHERE Id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            st.setString(2, company);
            st.setString(3, description);
            st.setTimestamp(4, startTime);
            st.setTimestamp(5, endTime);
            st.setInt(6, id);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(WorkExperienceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteExperience(int id) {
        try {
            String sql = "DELETE FROM [dbo].[WorkExperiences]\n"
                    + "      WHERE Id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(WorkExperienceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
