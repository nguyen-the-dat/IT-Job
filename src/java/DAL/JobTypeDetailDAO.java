/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.JobTypeDetail;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author thain
 */
public class JobTypeDetailDAO extends DBContext {

    public JobTypeDetail getJobTypeDetailById(int id) {
        JobTypeDetail jobTypeDetail = null;
        String sql = "SELECT * FROM JobTypeDetails WHERE Id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                jobTypeDetail = new JobTypeDetail();
                jobTypeDetail.setId(rs.getInt("Id"));
                jobTypeDetail.setJobType(rs.getString("JobType"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return jobTypeDetail;
    }

    public List<JobTypeDetail> getAllJobTypeDetails() {
        List<JobTypeDetail> jobTypeDetails = new ArrayList<>();
        String sql = "SELECT * FROM JobTypeDetails;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("Id");
                String jobType = rs.getString("JobType");

                JobTypeDetail jobTypeDetail = new JobTypeDetail(id, jobType);
                jobTypeDetails.add(jobTypeDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return jobTypeDetails;
    }

}
