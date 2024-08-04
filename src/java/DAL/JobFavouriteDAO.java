/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Job;
import Model.JobFavourite;
import Model.JobSeeker;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author thain
 */
public class JobFavouriteDAO extends DBContext {

    public List<JobFavourite> getAllFavouriteJobsByJobSeekerId(int seekerId) {
        List<JobFavourite> favouriteJobsWithTime = new ArrayList<>();
        String sql = "SELECT JobId, CreatedTime FROM JobFavorites WHERE SeekerId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, seekerId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int jobId = rs.getInt("JobId");
                Timestamp createdTime = rs.getTimestamp("CreatedTime");
                JobDAO jobDAO = new JobDAO();
                Job job = jobDAO.getJobById(jobId);
                if (job != null) {
                    JobFavourite jobFavourite = new JobFavourite();
                    jobFavourite.setJob(job);
                    jobFavourite.setCreatedTime(createdTime);
                    favouriteJobsWithTime.add(jobFavourite);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return favouriteJobsWithTime;
    }

    public boolean deleteFavouriteJob(int jobId, int seekerId) {
        String sql = "DELETE FROM JobFavorites WHERE JobId = ? AND SeekerId = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, jobId);
            pstmt.setInt(2, seekerId);
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean doesFavoriteExist(int jobId, int seekerId) {
        String sql = "SELECT COUNT(*) FROM JobFavorites WHERE JobId = ? AND SeekerId = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, jobId);
            pstmt.setInt(2, seekerId);

            try ( ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean addFavoriteJob(int jobId, int seekerId) {
        String sql = "INSERT INTO JobFavorites (JobId, SeekerId, CreatedTime) VALUES (?, ?, ?)";

        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, jobId);
            pstmt.setInt(2, seekerId);
            pstmt.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
            int affectedRows = pstmt.executeUpdate();
            return affectedRows == 1;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

}
