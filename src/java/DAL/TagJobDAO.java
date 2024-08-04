/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.City;
import Model.Enterprise;
import Model.Job;
import Model.JobTypeDetail;
import Model.StatusJobDetail;
import Model.Tag;
import Model.WorkLevelDetail;
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
public class TagJobDAO extends DBContext {

    public List<Job> findJobsByTag(int tagId, int pageIndex, int pageSize) {
        List<Job> jobs = new ArrayList<>();
        List<Integer> jobIds = new ArrayList<>();

        String sqlTagJobs = "SELECT * FROM TagJobs WHERE TagId = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sqlTagJobs);
            preparedStatement.setInt(1, tagId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                jobIds.add(resultSet.getInt("JobId"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (!jobIds.isEmpty()) {
            int start = (pageIndex - 1) * pageSize;
            int end = start + pageSize;
            for (int i = start; i < end && i < jobIds.size(); i++) {
                int jobId = jobIds.get(i);
                Job job = new JobDAO().getJobById(jobId);
                jobs.add(job);
            }
        }
        return jobs;
    }

    public List<Job> findJobsByTag(int tagId) {
        List<Job> jobs = new ArrayList<>();
        List<Integer> jobIds = new ArrayList<>();

        String sqlTagJobs = "SELECT * FROM TagJobs WHERE TagId = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sqlTagJobs);
            preparedStatement.setInt(1, tagId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                jobIds.add(resultSet.getInt("JobId"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        for (Integer jobId : jobIds) {
            Job job = new JobDAO().getJobById(jobId);
            if (job != null) {
                jobs.add(job);
            }
        }

        return jobs;
    }

    public int countJobsByTag(int tagId) {
        int count = 0;
        List<Integer> jobIds = new ArrayList<>();

        String sqlTagJobs = "SELECT * FROM TagJobs WHERE TagId = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sqlTagJobs);
            preparedStatement.setInt(1, tagId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                jobIds.add(resultSet.getInt("JobId"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (!jobIds.isEmpty()) {
            String sqlCountJobs = "SELECT COUNT(*) AS JobCount FROM Jobs WHERE ExpiredTime > GETDATE() AND Id = ?;";
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(sqlCountJobs);
                for (Integer jobId : jobIds) {
                    preparedStatement.setInt(1, jobId);
                    ResultSet resultSet = preparedStatement.executeQuery();
                    if (resultSet.next()) {
                        count += resultSet.getInt("JobCount");
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return count;
    }

    public List<Tag> findTagsByJob(int jobId) {
        List<Tag> tags = new ArrayList<>();
        String sql = "SELECT * FROM TagJobs WHERE JobId = ?";

        try ( PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, jobId);
            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    int tagId = resultSet.getInt("TagId");
                    TagDAO tagDAO = new TagDAO();
                    Tag tag = tagDAO.getTagById(tagId);
                    tags.add(tag);
                    System.out.println(tag.getId() + " " + tag.getTag());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return tags;
    }

    public void insertJobTags(int jobId, int tagId) {
        // Validate jobId and tagId before insertion
        if (!doesJobIdExist(jobId)) {
            System.out.println("Job ID " + jobId + " does not exist in Jobs table.");
            return;
        }
        if (!doesTagIdExist(tagId)) {
            System.out.println("Tag ID " + tagId + " does not exist in Tags table.");
            return;
        }

        String sql = "INSERT INTO [dbo].[TagJobs] ([JobId], [TagId]) VALUES (?, ?)";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, jobId);
            st.setInt(2, tagId);
            st.executeUpdate();
            System.out.println("Insert successful");
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public boolean doesJobIdExist(int jobId) {
        String sql = "SELECT 1 FROM [dbo].[Jobs] WHERE [Id] = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, jobId);
            ResultSet rs = st.executeQuery();
            return rs.next(); // Returns true if jobId exists
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public boolean doesTagIdExist(int tagId) {
        String sql = "SELECT 1 FROM [dbo].[Tags] WHERE [Id] = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, tagId);
            ResultSet rs = st.executeQuery();
            return rs.next(); // Returns true if tagId exists
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public void deleteTagsByJobId(int jobId) {
        String sql = "DELETE FROM TagJobs WHERE JobId = ?;";

        try ( PreparedStatement pstmt = connection.prepareStatement(sql)) {
            // Set the JobId parameter
            pstmt.setInt(1, jobId);

            // Execute the delete statement
            int affectedRows = pstmt.executeUpdate();
            System.out.println("Deleted " + affectedRows + " tags associated with job ID " + jobId);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

}
