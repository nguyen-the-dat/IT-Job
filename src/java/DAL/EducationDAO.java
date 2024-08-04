/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Education;
import Model.JobSeeker;
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
public class EducationDAO extends DBContext {

    public List<Education> getEducationsForJobSeeker(int jobSeekerId) {
        List<Education> educations = new ArrayList<>();
        String sql = "SELECT * FROM Educations WHERE SeekerId = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, jobSeekerId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Education education = new Education();
                int id = rs.getInt("Id");
                education.setId(id);

                String schoolName = rs.getString("SchoolName");
                education.setSchoolName(schoolName);

                String major = rs.getString("Major");
                if (rs.wasNull()) {
                    major = null;
                }
                education.setMajor(major);

                String degree = rs.getString("Degree");
                if (rs.wasNull()) {
                    degree = null;
                }
                education.setDegree(degree);

                Date startTime = rs.getDate("StartTime");
                education.setStartTime(startTime);

                Date endTime = rs.getDate("EndTime");
                education.setEndTime(endTime);

                String description = rs.getString("Description");
                if (rs.wasNull()) {
                    description = null;
                }
                education.setDescription(description);

                JobSeeker jobSeeker = new JobSeekerDAO().getJobSeekerById(jobSeekerId);
                education.setJobSeeker(jobSeeker);

                educations.add(education);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return educations;
    }

    public void insert(String title, String school, String degree, Timestamp startTime, Timestamp endTime, String description, int id) {
        try {
            String sql = "INSERT INTO [dbo].[Educations]\n"
                    + "           ([SchoolName]\n"
                    + "           ,[Major]\n"
                    + "           ,[Degree]\n"
                    + "           ,[StartTime]\n"
                    + "           ,[EndTime]\n"
                    + "           ,[Description]\n"
                    + "           ,[SeekerId])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, school);
            st.setString(2, title);
            st.setString(3, degree);
            st.setTimestamp(4, startTime);
            st.setTimestamp(5, endTime);
            st.setString(6, description);
            st.setInt(7, id);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(WorkExperienceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void edit(String title, String school, String degree, Timestamp startTime, Timestamp endTime, String description, int id) {
        try {
            String sql = "UPDATE [dbo].[Educations]\n"
                    + "   SET [SchoolName] = ?\n"
                    + "      ,[Major] = ?\n"
                    + "      ,[Degree] = ?\n"
                    + "      ,[StartTime] = ?\n"
                    + "      ,[EndTime] = ?\n"
                    + "      ,[Description] = ?\n"
                    + " WHERE Id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, school);
            st.setString(2, title);
            st.setString(3, degree);
            st.setTimestamp(4, startTime);
            st.setTimestamp(5, endTime);
            st.setString(6, description);
            st.setInt(7, id);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(WorkExperienceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void delete(int id) {
        try {
            String sql = "DELETE FROM [dbo].[Educations]\n"
                    + "      WHERE Id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(WorkExperienceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
