/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.JobSeeker;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author thain
 */
public class JobSeekerDAO extends DBContext {

    public void insertJobSeeker(JobSeeker jobSeeker) {
        String sql = "INSERT INTO JobSeekers (Id, ImageUrl, Name, Gender, DOB, Country, Description, PhoneContact, EmailContact, FacebookUrl, LinkedinUrl, AccountId) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, jobSeeker.getId());
            if (jobSeeker.getImageUrl() != null) {
                st.setString(2, jobSeeker.getImageUrl());
            } else {
                st.setNull(2, java.sql.Types.VARCHAR);
            }

            st.setString(3, jobSeeker.getName());
            st.setBoolean(4, jobSeeker.isGender());
            if (jobSeeker.getDOB() != null) {
                st.setDate(5, new java.sql.Date(jobSeeker.getDOB().getTime()));
            } else {
                st.setNull(5, java.sql.Types.DATE);
            }

            if (jobSeeker.getCountry() != null) {
                st.setString(6, jobSeeker.getCountry());
            } else {
                st.setNull(6, java.sql.Types.NVARCHAR);
            }

            if (jobSeeker.getDescription() != null) {
                st.setString(7, jobSeeker.getDescription());
            } else {
                st.setNull(7, java.sql.Types.NVARCHAR);
            }

            if (jobSeeker.getPhoneContact() != null) {
                st.setString(8, jobSeeker.getPhoneContact());
            } else {
                st.setNull(8, java.sql.Types.VARCHAR);
            }

            st.setString(9, jobSeeker.getEmailContact());

            if (jobSeeker.getFacebookUrl() != null) {
                st.setString(10, jobSeeker.getFacebookUrl());
            } else {
                st.setNull(10, java.sql.Types.VARCHAR);
            }

            if (jobSeeker.getLinkedinUrl() != null) {
                st.setString(11, jobSeeker.getLinkedinUrl());
            } else {
                st.setNull(11, java.sql.Types.VARCHAR);
            }

            st.setString(12, jobSeeker.getAccountId());

            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<JobSeeker> getAllJobSeekers() {
        List<JobSeeker> list = new ArrayList<>();
        String sql = "SELECT * FROM JobSeekers;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                JobSeeker jobSeeker = new JobSeeker();
                jobSeeker.setId(rs.getInt("Id"));

                String imageUrl = rs.getString("ImageUrl");
                jobSeeker.setImageUrl(rs.wasNull() ? null : imageUrl);
                
                jobSeeker.setEmailContact(rs.getString("EmailContact"));

                jobSeeker.setName(rs.getString("Name"));
                jobSeeker.setGender(rs.getBoolean("Gender"));

                Date dob = rs.getDate("DOB");
                jobSeeker.setDOB(rs.wasNull() ? null : dob);

                String country = rs.getString("Country");
                jobSeeker.setCountry(rs.wasNull() ? null : country);

                String description = rs.getString("Description");
                jobSeeker.setDescription(rs.wasNull() ? null : description);

                String phoneContact = rs.getString("PhoneContact");
                jobSeeker.setPhoneContact(rs.wasNull() ? null : phoneContact);

                String facebookUrl = rs.getString("FacebookUrl");
                jobSeeker.setFacebookUrl(rs.wasNull() ? null : facebookUrl);

                String linkedinUrl = rs.getString("LinkedinUrl");
                jobSeeker.setLinkedinUrl(rs.wasNull() ? null : linkedinUrl);

                jobSeeker.setAccountId(rs.getString("AccountId"));
                list.add(jobSeeker);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public JobSeeker getJobSeekerByAccountId(String accountId) {
        JobSeeker jobSeeker = null;
        String sql = "SELECT * FROM JobSeekers WHERE AccountId = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, accountId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                jobSeeker = new JobSeeker();
                jobSeeker.setId(rs.getInt("Id"));

                String imageUrl = rs.getString("ImageUrl");
                jobSeeker.setImageUrl(rs.wasNull() ? null : imageUrl);

                jobSeeker.setName(rs.getString("Name"));
                jobSeeker.setGender(rs.getBoolean("Gender"));

                jobSeeker.setEmailContact(rs.getString("EmailContact"));
                Date dob = rs.getDate("DOB");
                jobSeeker.setDOB(rs.wasNull() ? null : dob);

                String country = rs.getString("Country");
                jobSeeker.setCountry(rs.wasNull() ? null : country);

                String description = rs.getString("Description");
                jobSeeker.setDescription(rs.wasNull() ? null : description);

                String phoneContact = rs.getString("PhoneContact");
                jobSeeker.setPhoneContact(rs.wasNull() ? null : phoneContact);

                String facebookUrl = rs.getString("FacebookUrl");
                jobSeeker.setFacebookUrl(rs.wasNull() ? null : facebookUrl);

                String linkedinUrl = rs.getString("LinkedinUrl");
                jobSeeker.setLinkedinUrl(rs.wasNull() ? null : linkedinUrl);

                jobSeeker.setAccountId(rs.getString("AccountId"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return jobSeeker;
    }

    public JobSeeker getJobSeekerById(int id) {
        JobSeeker jobSeeker = null;
        String sql = "SELECT * FROM JobSeekers WHERE Id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                jobSeeker = new JobSeeker();
                jobSeeker.setId(rs.getInt("Id"));

                String imageUrl = rs.getString("ImageUrl");
                jobSeeker.setImageUrl(rs.wasNull() ? null : imageUrl);

                jobSeeker.setName(rs.getString("Name"));
                jobSeeker.setGender(rs.getBoolean("Gender"));

                Date dob = rs.getDate("DOB");
                jobSeeker.setDOB(rs.wasNull() ? null : dob);

                String country = rs.getString("Country");
                jobSeeker.setCountry(rs.wasNull() ? null : country);

                String description = rs.getString("Description");
                jobSeeker.setDescription(rs.wasNull() ? null : description);

                String phoneContact = rs.getString("PhoneContact");
                jobSeeker.setPhoneContact(rs.wasNull() ? null : phoneContact);

                String emailContact = rs.getString("EmailContact");
                jobSeeker.setEmailContact(rs.wasNull() ? null : emailContact);

                String facebookUrl = rs.getString("FacebookUrl");
                jobSeeker.setFacebookUrl(rs.wasNull() ? null : facebookUrl);

                String linkedinUrl = rs.getString("LinkedinUrl");
                jobSeeker.setLinkedinUrl(rs.wasNull() ? null : linkedinUrl);

                jobSeeker.setAccountId(rs.getString("AccountId"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return jobSeeker;
    }
     public boolean updateJobseeker(JobSeeker us) {
        String sql = "UPDATE [dbo].[JobSeekers] "
                + "SET [ImageUrl] = ?, [Name] = ?, [Gender] = ?, "
                + "[DOB] = ?, [Country] = ?, [Description] = ?, "
                + "[PhoneContact] = ?, [EmailContact] = ?, [FacebookUrl] = ?, "
                + "[LinkedinUrl] = ? "
                + "WHERE [AccountId] = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, us.getImageUrl());
            stm.setString(2, us.getName());
            stm.setBoolean(3, us.isGender());
            stm.setDate(4, new java.sql.Date(us.getDOB().getTime()));
            stm.setString(5, us.getCountry());
            stm.setString(6, us.getDescription());
            stm.setString(7, us.getPhoneContact());
            stm.setString(8, us.getEmailContact());
            stm.setString(9, us.getFacebookUrl());
            stm.setString(10, us.getLinkedinUrl());
            stm.setString(11, us.getAccountId());

            // Execute the update
            int affectedRows = stm.executeUpdate();
            return affectedRows > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public String getJobSeekerImageUrlByAccountId(String accountId) {

        String query = "SELECT ImageUrl FROM JobSeekers WHERE AccountId = ?";
        String imageUrl =null;
        try {

            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, accountId);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                imageUrl = rs.getString("ImageUrl");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } 
        

        return imageUrl;
    }
    
    public int countJobseekers() {
        String sql = "select count(*) as countJobseekers from JobSeekers";
        int count = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("countJobseekers");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
}
