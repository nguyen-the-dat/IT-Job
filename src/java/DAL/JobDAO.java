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
import Model.WorkLevelDetail;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 *
 * @author thain
 */
public class JobDAO extends DBContext {

    public List<Job> getAllJobs() {
        List<Job> list = new ArrayList<>();
        String sql = "SELECT * FROM Jobs WHERE ExpiredTime > GETDATE() AND statusid = 1;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Job job = new Job();
                job.setId(rs.getInt("Id"));
                job.setTitle(rs.getString("Title"));
                JobTypeDetailDAO jobTypeDetailDAO = new JobTypeDetailDAO();
                JobTypeDetail jobTypeDetail = jobTypeDetailDAO.getJobTypeDetailById(rs.getInt("JobTypeId"));
                job.setJobTypeDetail(jobTypeDetail);
                job.setSalaryMin(rs.getFloat("SalaryMin"));
                job.setSalaryMax(rs.getFloat("SalaryMax"));
                job.setNumRecruit(rs.getInt("NumRecruit"));
                String genderRequire = rs.getString("GenderRequire");
                job.setGenderRequire(rs.wasNull() ? null : genderRequire);
                int expYearRequire = rs.getInt("ExpYearRequire");
                job.setExpYearRequire(rs.wasNull() ? null : expYearRequire);
                String overview = rs.getString("Overview");
                job.setOverview(rs.wasNull() ? null : overview);
                String responsibilities = rs.getString("Responsabilities");
                job.setResponsabilities(rs.wasNull() ? null : responsibilities);
                String address = rs.getString("Address");
                job.setAddress(rs.wasNull() ? null : address);
                job.setCreatedTime(rs.getTimestamp("CreatedTime"));
                Timestamp updatedTime = rs.getTimestamp("UpdatedTime");
                job.setUpdatedTime(rs.wasNull() ? null : updatedTime);
                Timestamp deletedTime = rs.getTimestamp("DeletedTime");
                job.setDeletedTime(rs.wasNull() ? null : deletedTime);
                job.setExpiredTime(rs.getTimestamp("ExpiredTime"));
                EnterpriseDAO enterpriseDAO = new EnterpriseDAO();
                Enterprise enterprise = enterpriseDAO.getEnterpriseById(rs.getInt("EnterpriseId"));
                job.setEnterprise(enterprise);
                String requirements = rs.getString("Requirements");
                job.setRequirements(rs.wasNull() ? null : requirements);
                String skills = rs.getString("Skills");
                job.setSkills(rs.wasNull() ? null : skills);
                WorkLevelDetailDAO workLevelDetailDAO = new WorkLevelDetailDAO();
                WorkLevelDetail workLevelDetail = workLevelDetailDAO.getWorkLevelDetailById(rs.getInt("WorkLevelId"));
                job.setWorkLevelDetail(rs.wasNull() ? null : workLevelDetail);
                CityDAO cityDAO = new CityDAO();
                City city = cityDAO.getCityById(rs.getInt("CityId"));
                job.setCity(city);
                StatusJobDetailDAO statusJobDetailDAO = new StatusJobDetailDAO();
                StatusJobDetail statusJobDetail = statusJobDetailDAO.getStatusJobDetailById(rs.getInt("StatusId"));
                job.setStatusJobDetail(statusJobDetail);
                list.add(job);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Job> getAll() {
        List<Job> list = new ArrayList<>();
        String sql = "SELECT * FROM Jobs";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Job job = new Job();
                job.setId(rs.getInt("Id"));
                job.setTitle(rs.getString("Title"));
                JobTypeDetailDAO jobTypeDetailDAO = new JobTypeDetailDAO();
                JobTypeDetail jobTypeDetail = jobTypeDetailDAO.getJobTypeDetailById(rs.getInt("JobTypeId"));
                job.setJobTypeDetail(jobTypeDetail);
                job.setSalaryMin(rs.getFloat("SalaryMin"));
                job.setSalaryMax(rs.getFloat("SalaryMax"));
                job.setNumRecruit(rs.getInt("NumRecruit"));
                String genderRequire = rs.getString("GenderRequire");
                job.setGenderRequire(rs.wasNull() ? null : genderRequire);
                int expYearRequire = rs.getInt("ExpYearRequire");
                job.setExpYearRequire(rs.wasNull() ? null : expYearRequire);
                String overview = rs.getString("Overview");
                job.setOverview(rs.wasNull() ? null : overview);
                String responsibilities = rs.getString("Responsabilities");
                job.setResponsabilities(rs.wasNull() ? null : responsibilities);
                String address = rs.getString("Address");
                job.setAddress(rs.wasNull() ? null : address);
                job.setCreatedTime(rs.getTimestamp("CreatedTime"));
                Timestamp updatedTime = rs.getTimestamp("UpdatedTime");
                job.setUpdatedTime(rs.wasNull() ? null : updatedTime);
                Timestamp deletedTime = rs.getTimestamp("DeletedTime");
                job.setDeletedTime(rs.wasNull() ? null : deletedTime);
                job.setExpiredTime(rs.getTimestamp("ExpiredTime"));
                EnterpriseDAO enterpriseDAO = new EnterpriseDAO();
                Enterprise enterprise = enterpriseDAO.getEnterpriseById(rs.getInt("EnterpriseId"));
                job.setEnterprise(enterprise);
                String requirements = rs.getString("Requirements");
                job.setRequirements(rs.wasNull() ? null : requirements);
                String skills = rs.getString("Skills");
                job.setSkills(rs.wasNull() ? null : skills);
                WorkLevelDetailDAO workLevelDetailDAO = new WorkLevelDetailDAO();
                WorkLevelDetail workLevelDetail = workLevelDetailDAO.getWorkLevelDetailById(rs.getInt("WorkLevelId"));
                job.setWorkLevelDetail(rs.wasNull() ? null : workLevelDetail);
                CityDAO cityDAO = new CityDAO();
                City city = cityDAO.getCityById(rs.getInt("CityId"));
                job.setCity(city);
                StatusJobDetailDAO statusJobDetailDAO = new StatusJobDetailDAO();
                StatusJobDetail statusJobDetail = statusJobDetailDAO.getStatusJobDetailById(rs.getInt("StatusId"));
                job.setStatusJobDetail(statusJobDetail);
                list.add(job);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Job> getTop6Jobs() {
        List<Job> list = new ArrayList<>();
        String sql = "SELECT TOP 6 * FROM Jobs WHERE ExpiredTime > GETDATE()  AND statusid = 1 ORDER BY CreatedTime DESC;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Job job = new Job();
                job.setId(rs.getInt("Id"));
                job.setTitle(rs.getString("Title"));
                JobTypeDetailDAO jobTypeDetailDAO = new JobTypeDetailDAO();
                JobTypeDetail jobTypeDetail = jobTypeDetailDAO.getJobTypeDetailById(rs.getInt("JobTypeId"));
                job.setJobTypeDetail(jobTypeDetail);
                job.setSalaryMin(rs.getFloat("SalaryMin"));
                job.setSalaryMax(rs.getFloat("SalaryMax"));
                job.setNumRecruit(rs.getInt("NumRecruit"));
                String genderRequire = rs.getString("GenderRequire");
                job.setGenderRequire(rs.wasNull() ? null : genderRequire);
                int expYearRequire = rs.getInt("ExpYearRequire");
                job.setExpYearRequire(rs.wasNull() ? null : expYearRequire);
                String overview = rs.getString("Overview");
                job.setOverview(rs.wasNull() ? null : overview);
                String responsibilities = rs.getString("Responsabilities");
                job.setResponsabilities(rs.wasNull() ? null : responsibilities);
                String address = rs.getString("Address");
                job.setAddress(rs.wasNull() ? null : address);
                job.setCreatedTime(rs.getTimestamp("CreatedTime"));
                Timestamp updatedTime = rs.getTimestamp("UpdatedTime");
                job.setUpdatedTime(rs.wasNull() ? null : updatedTime);
                Timestamp deletedTime = rs.getTimestamp("DeletedTime");
                job.setDeletedTime(rs.wasNull() ? null : deletedTime);
                job.setExpiredTime(rs.getTimestamp("ExpiredTime"));
                EnterpriseDAO enterpriseDAO = new EnterpriseDAO();
                Enterprise enterprise = enterpriseDAO.getEnterpriseById(rs.getInt("EnterpriseId"));
                job.setEnterprise(enterprise);
                String requirements = rs.getString("Requirements");
                job.setRequirements(rs.wasNull() ? null : requirements);
                String skills = rs.getString("Skills");
                job.setSkills(rs.wasNull() ? null : skills);
                WorkLevelDetailDAO workLevelDetailDAO = new WorkLevelDetailDAO();
                WorkLevelDetail workLevelDetail = workLevelDetailDAO.getWorkLevelDetailById(rs.getInt("WorkLevelId"));
                job.setWorkLevelDetail(rs.wasNull() ? null : workLevelDetail);
                CityDAO cityDAO = new CityDAO();
                City city = cityDAO.getCityById(rs.getInt("CityId"));
                job.setCity(city);
                StatusJobDetailDAO statusJobDetailDAO = new StatusJobDetailDAO();
                StatusJobDetail statusJobDetail = statusJobDetailDAO.getStatusJobDetailById(rs.getInt("StatusId"));
                job.setStatusJobDetail(statusJobDetail);
                list.add(job);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Job> getJobsWithPagination(int pageIndex, int pageSize) {
        List<Job> list = new ArrayList<>();
        int offset = (pageIndex - 1) * pageSize;
        String sql = "SELECT * FROM Jobs WHERE ExpiredTime > GETDATE()  AND statusid = 1 ORDER BY Id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, offset);
            st.setInt(2, pageSize);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Job job = new Job();
                job.setId(rs.getInt("Id"));
                job.setTitle(rs.getString("Title"));
                JobTypeDetailDAO jobTypeDetailDAO = new JobTypeDetailDAO();
                JobTypeDetail jobTypeDetail = jobTypeDetailDAO.getJobTypeDetailById(rs.getInt("JobTypeId"));
                job.setJobTypeDetail(jobTypeDetail);
                job.setSalaryMin(rs.getFloat("SalaryMin"));
                job.setSalaryMax(rs.getFloat("SalaryMax"));
                job.setNumRecruit(rs.getInt("NumRecruit"));
                String genderRequire = rs.getString("GenderRequire");
                job.setGenderRequire(rs.wasNull() ? null : genderRequire);
                int expYearRequire = rs.getInt("ExpYearRequire");
                job.setExpYearRequire(rs.wasNull() ? null : expYearRequire);
                String overview = rs.getString("Overview");
                job.setOverview(rs.wasNull() ? null : overview);
                String responsibilities = rs.getString("Responsabilities");
                job.setResponsabilities(rs.wasNull() ? null : responsibilities);
                String address = rs.getString("Address");
                job.setAddress(rs.wasNull() ? null : address);
                job.setCreatedTime(rs.getTimestamp("CreatedTime"));
                Timestamp updatedTime = rs.getTimestamp("UpdatedTime");
                job.setUpdatedTime(rs.wasNull() ? null : updatedTime);
                Timestamp deletedTime = rs.getTimestamp("DeletedTime");
                job.setDeletedTime(rs.wasNull() ? null : deletedTime);
                job.setExpiredTime(rs.getTimestamp("ExpiredTime"));
                EnterpriseDAO enterpriseDAO = new EnterpriseDAO();
                Enterprise enterprise = enterpriseDAO.getEnterpriseById(rs.getInt("EnterpriseId"));
                job.setEnterprise(enterprise);
                String requirements = rs.getString("Requirements");
                job.setRequirements(rs.wasNull() ? null : requirements);
                String skills = rs.getString("Skills");
                job.setSkills(rs.wasNull() ? null : skills);
                WorkLevelDetailDAO workLevelDetailDAO = new WorkLevelDetailDAO();
                WorkLevelDetail workLevelDetail = workLevelDetailDAO.getWorkLevelDetailById(rs.getInt("WorkLevelId"));
                job.setWorkLevelDetail(rs.wasNull() ? null : workLevelDetail);
                CityDAO cityDAO = new CityDAO();
                City city = cityDAO.getCityById(rs.getInt("CityId"));
                job.setCity(city);
                StatusJobDetailDAO statusJobDetailDAO = new StatusJobDetailDAO();
                StatusJobDetail statusJobDetail = statusJobDetailDAO.getStatusJobDetailById(rs.getInt("StatusId"));
                job.setStatusJobDetail(statusJobDetail);
                list.add(job);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int countJobs() {
        String sql = "select COUNT(*) as countJob from Jobs";
        int count = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("countJob");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public Job getJobById(int id) {
        Job job = null;
        String sql = "SELECT * FROM Jobs WHERE Id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                job = new Job();
                job.setId(rs.getInt("Id"));
                job.setTitle(rs.getString("Title"));
                JobTypeDetailDAO jobTypeDetailDAO = new JobTypeDetailDAO();
                JobTypeDetail jobTypeDetail = jobTypeDetailDAO.getJobTypeDetailById(rs.getInt("JobTypeId"));
                job.setJobTypeDetail(jobTypeDetail);
                job.setSalaryMin(rs.getFloat("SalaryMin"));
                job.setSalaryMax(rs.getFloat("SalaryMax"));
                job.setNumRecruit(rs.getInt("NumRecruit"));
                String genderRequire = rs.getString("GenderRequire");
                job.setGenderRequire(rs.wasNull() ? null : genderRequire);
                int expYearRequire = rs.getInt("ExpYearRequire");
                job.setExpYearRequire(rs.wasNull() ? null : expYearRequire);
                String overview = rs.getString("Overview");
                job.setOverview(rs.wasNull() ? null : overview);
                String responsibilities = rs.getString("Responsabilities");
                job.setResponsabilities(rs.wasNull() ? null : responsibilities);
                String address = rs.getString("Address");
                job.setAddress(rs.wasNull() ? null : address);
                job.setCreatedTime(rs.getTimestamp("CreatedTime"));
                Timestamp updatedTime = rs.getTimestamp("UpdatedTime");
                job.setUpdatedTime(rs.wasNull() ? null : updatedTime);
                Timestamp deletedTime = rs.getTimestamp("DeletedTime");
                job.setDeletedTime(rs.wasNull() ? null : deletedTime);
                job.setExpiredTime(rs.getTimestamp("ExpiredTime"));
                EnterpriseDAO enterpriseDAO = new EnterpriseDAO();
                Enterprise enterprise = enterpriseDAO.getEnterpriseById(rs.getInt("EnterpriseId"));
                job.setEnterprise(enterprise);
                String requirements = rs.getString("Requirements");
                job.setRequirements(rs.wasNull() ? null : requirements);
                String skills = rs.getString("Skills");
                job.setSkills(rs.wasNull() ? null : skills);
                WorkLevelDetailDAO workLevelDetailDAO = new WorkLevelDetailDAO();
                WorkLevelDetail workLevelDetail = workLevelDetailDAO.getWorkLevelDetailById(rs.getInt("WorkLevelId"));
                job.setWorkLevelDetail(rs.wasNull() ? null : workLevelDetail);
                CityDAO cityDAO = new CityDAO();
                City city = cityDAO.getCityById(rs.getInt("CityId"));
                job.setCity(city);
                StatusJobDetailDAO statusJobDetailDAO = new StatusJobDetailDAO();
                StatusJobDetail statusJobDetail = statusJobDetailDAO.getStatusJobDetailById(rs.getInt("StatusId"));
                job.setStatusJobDetail(statusJobDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return job;
    }

    public List<Job> getTop4RandomJobs() {
        List<Job> list = new ArrayList<>();
        String sql = "SELECT TOP 4 * FROM Jobs WHERE ExpiredTime > GETDATE()  AND statusid = 1 ORDER BY NEWID();";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Job job = new Job();
                job.setId(rs.getInt("Id"));
                job.setTitle(rs.getString("Title"));
                JobTypeDetailDAO jobTypeDetailDAO = new JobTypeDetailDAO();
                JobTypeDetail jobTypeDetail = jobTypeDetailDAO.getJobTypeDetailById(rs.getInt("JobTypeId"));
                job.setJobTypeDetail(jobTypeDetail);
                job.setSalaryMin(rs.getFloat("SalaryMin"));
                job.setSalaryMax(rs.getFloat("SalaryMax"));
                job.setNumRecruit(rs.getInt("NumRecruit"));
                String genderRequire = rs.getString("GenderRequire");
                job.setGenderRequire(rs.wasNull() ? null : genderRequire);
                int expYearRequire = rs.getInt("ExpYearRequire");
                job.setExpYearRequire(rs.wasNull() ? null : expYearRequire);
                String overview = rs.getString("Overview");
                job.setOverview(rs.wasNull() ? null : overview);
                String responsibilities = rs.getString("Responsabilities");
                job.setResponsabilities(rs.wasNull() ? null : responsibilities);
                String address = rs.getString("Address");
                job.setAddress(rs.wasNull() ? null : address);
                job.setCreatedTime(rs.getTimestamp("CreatedTime"));
                Timestamp updatedTime = rs.getTimestamp("UpdatedTime");
                job.setUpdatedTime(rs.wasNull() ? null : updatedTime);
                Timestamp deletedTime = rs.getTimestamp("DeletedTime");
                job.setDeletedTime(rs.wasNull() ? null : deletedTime);
                job.setExpiredTime(rs.getTimestamp("ExpiredTime"));
                EnterpriseDAO enterpriseDAO = new EnterpriseDAO();
                Enterprise enterprise = enterpriseDAO.getEnterpriseById(rs.getInt("EnterpriseId"));
                job.setEnterprise(enterprise);
                String requirements = rs.getString("Requirements");
                job.setRequirements(rs.wasNull() ? null : requirements);
                String skills = rs.getString("Skills");
                job.setSkills(rs.wasNull() ? null : skills);
                WorkLevelDetailDAO workLevelDetailDAO = new WorkLevelDetailDAO();
                WorkLevelDetail workLevelDetail = workLevelDetailDAO.getWorkLevelDetailById(rs.getInt("WorkLevelId"));
                job.setWorkLevelDetail(rs.wasNull() ? null : workLevelDetail);
                CityDAO cityDAO = new CityDAO();
                City city = cityDAO.getCityById(rs.getInt("CityId"));
                job.setCity(city);
                StatusJobDetailDAO statusJobDetailDAO = new StatusJobDetailDAO();
                StatusJobDetail statusJobDetail = statusJobDetailDAO.getStatusJobDetailById(rs.getInt("StatusId"));
                job.setStatusJobDetail(statusJobDetail);
                list.add(job);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int countJobsByJobTypeId(int id) {
        int count = 0;
        String sql = "SELECT COUNT(*) AS jobCount FROM Jobs WHERE JobTypeId = ? AND ExpiredTime > GETDATE()  AND statusid = 1;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("jobCount");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public int countJobsByWorkLevelId(int id) {
        int count = 0;
        String sql = "SELECT COUNT(*) AS jobCount FROM Jobs WHERE WorkLevelId = ? AND ExpiredTime > GETDATE()  AND statusid = 1;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("jobCount");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public int getCountOfJobsUnderSalary(float salary) {
        int count = 0;
        String sql = "SELECT COUNT(*) AS jobCount FROM Jobs WHERE SalaryMin < ? AND ExpiredTime > GETDATE()  AND statusid = 1;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setFloat(1, salary);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("jobCount");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public int getCountOfJobsBetweenSalary(float salaryMin, float salaryMax) {
        int count = 0;
        String sql = "SELECT COUNT(*) AS jobCount FROM Jobs WHERE SalaryMin >= ? AND SalaryMin < ? AND ExpiredTime > GETDATE()  AND statusid = 1;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setFloat(1, salaryMin);
            st.setFloat(2, salaryMax);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("jobCount");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public int getCountOfJobsAboveSalary(float salary) {
        int count = 0;
        String sql = "SELECT COUNT(*) AS jobCount FROM Jobs WHERE SalaryMin >= ? AND ExpiredTime > GETDATE()  AND statusid = 1;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setFloat(1, salary);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("jobCount");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public List<Job> getJobsSortedByDate(String sortDirection) {
        List<Job> list = new ArrayList<>();
        String orderBy = sortDirection.equalsIgnoreCase("ASC") ? "ASC" : "DESC";
        String sql = "SELECT * FROM Jobs WHERE ExpiredTime > GETDATE()  AND statusid = 1 ORDER BY COALESCE(UpdatedTime, CreatedTime) " + orderBy;

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Job job = new Job();
                job.setId(rs.getInt("Id"));
                job.setTitle(rs.getString("Title"));
                JobTypeDetailDAO jobTypeDetailDAO = new JobTypeDetailDAO();
                JobTypeDetail jobTypeDetail = jobTypeDetailDAO.getJobTypeDetailById(rs.getInt("JobTypeId"));
                job.setJobTypeDetail(jobTypeDetail);
                job.setSalaryMin(rs.getFloat("SalaryMin"));
                job.setSalaryMax(rs.getFloat("SalaryMax"));
                job.setNumRecruit(rs.getInt("NumRecruit"));
                String genderRequire = rs.getString("GenderRequire");
                job.setGenderRequire(rs.wasNull() ? null : genderRequire);
                int expYearRequire = rs.getInt("ExpYearRequire");
                job.setExpYearRequire(rs.wasNull() ? null : expYearRequire);
                String overview = rs.getString("Overview");
                job.setOverview(rs.wasNull() ? null : overview);
                String responsibilities = rs.getString("Responsabilities");
                job.setResponsabilities(rs.wasNull() ? null : responsibilities);
                String address = rs.getString("Address");
                job.setAddress(rs.wasNull() ? null : address);
                job.setCreatedTime(rs.getTimestamp("CreatedTime"));
                Timestamp updatedTime = rs.getTimestamp("UpdatedTime");
                job.setUpdatedTime(updatedTime != null ? updatedTime : rs.getTimestamp("CreatedTime"));
                Timestamp deletedTime = rs.getTimestamp("DeletedTime");
                job.setDeletedTime(rs.wasNull() ? null : deletedTime);
                job.setExpiredTime(rs.getTimestamp("ExpiredTime"));
                EnterpriseDAO enterpriseDAO = new EnterpriseDAO();
                Enterprise enterprise = enterpriseDAO.getEnterpriseById(rs.getInt("EnterpriseId"));
                job.setEnterprise(enterprise);
                String requirements = rs.getString("Requirements");
                job.setRequirements(rs.wasNull() ? null : requirements);
                String skills = rs.getString("Skills");
                job.setSkills(rs.wasNull() ? null : skills);
                WorkLevelDetailDAO workLevelDetailDAO = new WorkLevelDetailDAO();
                WorkLevelDetail workLevelDetail = workLevelDetailDAO.getWorkLevelDetailById(rs.getInt("WorkLevelId"));
                job.setWorkLevelDetail(rs.wasNull() ? null : workLevelDetail);
                CityDAO cityDAO = new CityDAO();
                City city = cityDAO.getCityById(rs.getInt("CityId"));
                job.setCity(city);
                StatusJobDetailDAO statusJobDetailDAO = new StatusJobDetailDAO();
                StatusJobDetail statusJobDetail = statusJobDetailDAO.getStatusJobDetailById(rs.getInt("StatusId"));
                job.setStatusJobDetail(statusJobDetail);
                list.add(job);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Job> getJobsSortedByDateWithPagination(String sortDirection, int pageIndex, int pageSize) {
        List<Job> list = new ArrayList<>();
        String orderBy = sortDirection.equalsIgnoreCase("ASC") ? "ASC" : "DESC";
        int offset = (pageIndex - 1) * pageSize;

        String sql = "SELECT * FROM Jobs WHERE ExpiredTime > GETDATE()  AND statusid = 1 ORDER BY COALESCE(UpdatedTime, CreatedTime) "
                + orderBy + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, offset);
            st.setInt(2, pageSize);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Job job = new Job();
                job.setId(rs.getInt("Id"));
                job.setTitle(rs.getString("Title"));
                JobTypeDetailDAO jobTypeDetailDAO = new JobTypeDetailDAO();
                JobTypeDetail jobTypeDetail = jobTypeDetailDAO.getJobTypeDetailById(rs.getInt("JobTypeId"));
                job.setJobTypeDetail(jobTypeDetail);
                job.setSalaryMin(rs.getFloat("SalaryMin"));
                job.setSalaryMax(rs.getFloat("SalaryMax"));
                job.setNumRecruit(rs.getInt("NumRecruit"));
                String genderRequire = rs.getString("GenderRequire");
                job.setGenderRequire(rs.wasNull() ? null : genderRequire);
                int expYearRequire = rs.getInt("ExpYearRequire");
                job.setExpYearRequire(rs.wasNull() ? null : expYearRequire);
                String overview = rs.getString("Overview");
                job.setOverview(rs.wasNull() ? null : overview);
                String responsibilities = rs.getString("Responsabilities");
                job.setResponsabilities(rs.wasNull() ? null : responsibilities);
                String address = rs.getString("Address");
                job.setAddress(rs.wasNull() ? null : address);
                job.setCreatedTime(rs.getTimestamp("CreatedTime"));
                Timestamp updatedTime = rs.getTimestamp("UpdatedTime");
                job.setUpdatedTime(updatedTime != null ? updatedTime : rs.getTimestamp("CreatedTime"));
                Timestamp deletedTime = rs.getTimestamp("DeletedTime");
                job.setDeletedTime(rs.wasNull() ? null : deletedTime);
                job.setExpiredTime(rs.getTimestamp("ExpiredTime"));
                EnterpriseDAO enterpriseDAO = new EnterpriseDAO();
                Enterprise enterprise = enterpriseDAO.getEnterpriseById(rs.getInt("EnterpriseId"));
                job.setEnterprise(enterprise);
                String requirements = rs.getString("Requirements");
                job.setRequirements(rs.wasNull() ? null : requirements);
                String skills = rs.getString("Skills");
                job.setSkills(rs.wasNull() ? null : skills);
                WorkLevelDetailDAO workLevelDetailDAO = new WorkLevelDetailDAO();
                WorkLevelDetail workLevelDetail = workLevelDetailDAO.getWorkLevelDetailById(rs.getInt("WorkLevelId"));
                job.setWorkLevelDetail(rs.wasNull() ? null : workLevelDetail);
                CityDAO cityDAO = new CityDAO();
                City city = cityDAO.getCityById(rs.getInt("CityId"));
                job.setCity(city);
                StatusJobDetailDAO statusJobDetailDAO = new StatusJobDetailDAO();
                StatusJobDetail statusJobDetail = statusJobDetailDAO.getStatusJobDetailById(rs.getInt("StatusId"));
                job.setStatusJobDetail(statusJobDetail);
                list.add(job);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Job> searchJobsWithMultipleCriteria(String keyword, int cityId, String[] employmentTypes,
            String[] experienceLevels, String[] salaryRanges) {
        List<Job> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM Jobs WHERE 1=1  AND statusid = 1");
        sql.append(" AND ExpiredTime > GETDATE()");
        List<Object> parameters = new ArrayList<>();

        if (keyword != null && !keyword.isEmpty()) {
            String[] keywords = keyword.split("\\s+");
            for (String word : keywords) {
                sql.append(" AND (Title LIKE ? OR Overview LIKE ? OR Responsabilities LIKE ? OR Requirements LIKE ? OR Skills LIKE ? OR Address LIKE ?)");
                for (int i = 0; i < 6; i++) {
                    parameters.add("%" + word + "%");
                }
            }
        }

        if (cityId > 0) {
            sql.append(" AND CityId = ?");
            parameters.add(cityId);
        }

        if (employmentTypes != null && employmentTypes.length > 0) {
            sql.append(" AND JobTypeId IN (");
            sql.append(String.join(",", Collections.nCopies(employmentTypes.length, "?")));
            sql.append(")");
            for (String typeId : employmentTypes) {
                parameters.add(Integer.parseInt(typeId));
            }
        }

        if (experienceLevels != null && experienceLevels.length > 0) {
            sql.append(" AND WorkLevelId IN (").append(String.join(",", Collections.nCopies(experienceLevels.length, "?"))).append(")");
            for (String levelId : experienceLevels) {
                parameters.add(Integer.parseInt(levelId));
            }
        }

        if (salaryRanges != null && salaryRanges.length > 0) {
            List<String> salaryConditions = new ArrayList<>();
            for (String range : salaryRanges) {
                switch (range) {
                    case "under8000":
                        salaryConditions.add("SalaryMin < ?");
                        parameters.add(new BigDecimal("8000"));
                        break;
                    case "between8000And12000":
                        salaryConditions.add("SalaryMin >= ? AND SalaryMin < ?");
                        parameters.add(new BigDecimal("8000"));
                        parameters.add(new BigDecimal("12000"));
                        break;
                    case "above12000":
                        salaryConditions.add("SalaryMin >= ?");
                        parameters.add(new BigDecimal("12000"));
                        break;
                }
            }
            if (!salaryConditions.isEmpty()) {
                sql.append(" AND (").append(String.join(" OR ", salaryConditions)).append(")");
            }
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql.toString());

            int index = 1;
            for (Object param : parameters) {
                st.setObject(index++, param);
            }

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Job job = new Job();
                job.setId(rs.getInt("Id"));
                job.setTitle(rs.getString("Title"));
                JobTypeDetailDAO jobTypeDetailDAO = new JobTypeDetailDAO();
                JobTypeDetail jobTypeDetail = jobTypeDetailDAO.getJobTypeDetailById(rs.getInt("JobTypeId"));
                job.setJobTypeDetail(jobTypeDetail);
                job.setSalaryMin(rs.getFloat("SalaryMin"));
                job.setSalaryMax(rs.getFloat("SalaryMax"));
                job.setNumRecruit(rs.getInt("NumRecruit"));
                String genderRequire = rs.getString("GenderRequire");
                job.setGenderRequire(rs.wasNull() ? null : genderRequire);
                int expYearRequire = rs.getInt("ExpYearRequire");
                job.setExpYearRequire(rs.wasNull() ? null : expYearRequire);
                String overview = rs.getString("Overview");
                job.setOverview(rs.wasNull() ? null : overview);
                String responsibilities = rs.getString("Responsabilities");
                job.setResponsabilities(rs.wasNull() ? null : responsibilities);
                String address = rs.getString("Address");
                job.setAddress(rs.wasNull() ? null : address);
                job.setCreatedTime(rs.getTimestamp("CreatedTime"));
                Timestamp updatedTime = rs.getTimestamp("UpdatedTime");
                job.setUpdatedTime(rs.wasNull() ? null : updatedTime);
                Timestamp deletedTime = rs.getTimestamp("DeletedTime");
                job.setDeletedTime(rs.wasNull() ? null : deletedTime);
                job.setExpiredTime(rs.getTimestamp("ExpiredTime"));
                EnterpriseDAO enterpriseDAO = new EnterpriseDAO();
                Enterprise enterprise = enterpriseDAO.getEnterpriseById(rs.getInt("EnterpriseId"));
                job.setEnterprise(enterprise);
                String requirements = rs.getString("Requirements");
                job.setRequirements(rs.wasNull() ? null : requirements);
                String skills = rs.getString("Skills");
                job.setSkills(rs.wasNull() ? null : skills);
                WorkLevelDetailDAO workLevelDetailDAO = new WorkLevelDetailDAO();
                WorkLevelDetail workLevelDetail = workLevelDetailDAO.getWorkLevelDetailById(rs.getInt("WorkLevelId"));
                job.setWorkLevelDetail(rs.wasNull() ? null : workLevelDetail);
                CityDAO cityDAO = new CityDAO();
                City city = cityDAO.getCityById(rs.getInt("CityId"));
                job.setCity(city);
                StatusJobDetailDAO statusJobDetailDAO = new StatusJobDetailDAO();
                StatusJobDetail statusJobDetail = statusJobDetailDAO.getStatusJobDetailById(rs.getInt("StatusId"));
                job.setStatusJobDetail(statusJobDetail);
                list.add(job);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Job> searchJobsWithMultipleCriteria(String keyword, int cityId, String[] employmentTypes,
            String[] experienceLevels, String[] salaryRanges, int pageIndex, int pageSize) {
        List<Job> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM Jobs WHERE 1=1  AND statusid = 1");
        sql.append(" AND ExpiredTime > GETDATE()");
        List<Object> parameters = new ArrayList<>();

        if (keyword != null && !keyword.isEmpty()) {
            sql.append(" AND (Title LIKE ? OR Overview LIKE ? OR Responsabilities LIKE ? OR Requirements LIKE ? OR Skills LIKE ? OR Address LIKE ?)");
            for (int i = 0; i < 6; i++) {
                parameters.add("%" + keyword + "%");
            }
        }

        if (cityId > 0) {
            sql.append(" AND CityId = ?");
            parameters.add(cityId);
        }

        if (employmentTypes != null && employmentTypes.length > 0) {
            sql.append(" AND JobTypeId IN (");
            sql.append(String.join(",", Collections.nCopies(employmentTypes.length, "?")));
            sql.append(")");
            for (String typeId : employmentTypes) {
                parameters.add(Integer.parseInt(typeId));
            }
        }

        if (experienceLevels != null && experienceLevels.length > 0) {
            sql.append(" AND WorkLevelId IN (").append(String.join(",", Collections.nCopies(experienceLevels.length, "?"))).append(")");
            for (String levelId : experienceLevels) {
                parameters.add(Integer.parseInt(levelId));
            }
        }

        if (salaryRanges != null && salaryRanges.length > 0) {
            List<String> salaryConditions = new ArrayList<>();
            for (String range : salaryRanges) {
                switch (range) {
                    case "under8000":
                        salaryConditions.add("SalaryMin < ?");
                        parameters.add(new BigDecimal("8000"));
                        break;
                    case "between8000And12000":
                        salaryConditions.add("SalaryMin >= ? AND SalaryMin < ?");
                        parameters.add(new BigDecimal("8000"));
                        parameters.add(new BigDecimal("12000"));
                        break;
                    case "above12000":
                        salaryConditions.add("SalaryMin >= ?");
                        parameters.add(new BigDecimal("12000"));
                        break;
                }
            }
            if (!salaryConditions.isEmpty()) {
                sql.append(" AND (").append(String.join(" OR ", salaryConditions)).append(")");
            }
        }

        int offset = (pageIndex - 1) * pageSize;
        sql.append(" ORDER BY Id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;");
        parameters.add(offset);
        parameters.add(pageSize);

        try {
            PreparedStatement st = connection.prepareStatement(sql.toString());
            int index = 1;
            for (Object param : parameters) {
                st.setObject(index++, param);
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Job job = new Job();
                job.setId(rs.getInt("Id"));
                job.setTitle(rs.getString("Title"));
                JobTypeDetailDAO jobTypeDetailDAO = new JobTypeDetailDAO();
                JobTypeDetail jobTypeDetail = jobTypeDetailDAO.getJobTypeDetailById(rs.getInt("JobTypeId"));
                job.setJobTypeDetail(jobTypeDetail);
                job.setSalaryMin(rs.getFloat("SalaryMin"));
                job.setSalaryMax(rs.getFloat("SalaryMax"));
                job.setNumRecruit(rs.getInt("NumRecruit"));
                String genderRequire = rs.getString("GenderRequire");
                job.setGenderRequire(rs.wasNull() ? null : genderRequire);
                int expYearRequire = rs.getInt("ExpYearRequire");
                job.setExpYearRequire(rs.wasNull() ? null : expYearRequire);
                String overview = rs.getString("Overview");
                job.setOverview(rs.wasNull() ? null : overview);
                String responsibilities = rs.getString("Responsabilities");
                job.setResponsabilities(rs.wasNull() ? null : responsibilities);
                String address = rs.getString("Address");
                job.setAddress(rs.wasNull() ? null : address);
                job.setCreatedTime(rs.getTimestamp("CreatedTime"));
                Timestamp updatedTime = rs.getTimestamp("UpdatedTime");
                job.setUpdatedTime(rs.wasNull() ? null : updatedTime);
                Timestamp deletedTime = rs.getTimestamp("DeletedTime");
                job.setDeletedTime(rs.wasNull() ? null : deletedTime);
                job.setExpiredTime(rs.getTimestamp("ExpiredTime"));
                EnterpriseDAO enterpriseDAO = new EnterpriseDAO();
                Enterprise enterprise = enterpriseDAO.getEnterpriseById(rs.getInt("EnterpriseId"));
                job.setEnterprise(enterprise);
                String requirements = rs.getString("Requirements");
                job.setRequirements(rs.wasNull() ? null : requirements);
                String skills = rs.getString("Skills");
                job.setSkills(rs.wasNull() ? null : skills);
                WorkLevelDetailDAO workLevelDetailDAO = new WorkLevelDetailDAO();
                WorkLevelDetail workLevelDetail = workLevelDetailDAO.getWorkLevelDetailById(rs.getInt("WorkLevelId"));
                job.setWorkLevelDetail(rs.wasNull() ? null : workLevelDetail);
                CityDAO cityDAO = new CityDAO();
                City city = cityDAO.getCityById(rs.getInt("CityId"));
                job.setCity(city);
                StatusJobDetailDAO statusJobDetailDAO = new StatusJobDetailDAO();
                StatusJobDetail statusJobDetail = statusJobDetailDAO.getStatusJobDetailById(rs.getInt("StatusId"));
                job.setStatusJobDetail(statusJobDetail);
                list.add(job);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int countAllJobs() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM Jobs WHERE ExpiredTime > GETDATE()  AND statusid = 1;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public int countJobsWithCriteria(String keyword, int cityId, String[] employmentTypes, String[] experienceLevels, String[] salaryRanges) {
        int count = 0;
        StringBuilder sql = new StringBuilder("SELECT COUNT(*) as JobCount FROM Jobs WHERE 1=1  AND statusid = 1");
        sql.append(" AND ExpiredTime > GETDATE()");
        List<Object> parameters = new ArrayList<>();

        if (keyword != null && !keyword.isEmpty()) {
            sql.append(" AND (Title LIKE ? OR Overview LIKE ? OR Responsabilities LIKE ? OR Requirements LIKE ? OR Skills LIKE ? OR Address LIKE ?)");
            for (int i = 0; i < 6; i++) {
                parameters.add("%" + keyword + "%");
            }
        }

        if (cityId > 0) {
            sql.append(" AND CityId = ?");
            parameters.add(cityId);
        }

        if (employmentTypes != null && employmentTypes.length > 0) {
            sql.append(" AND JobTypeId IN (");
            sql.append(String.join(",", Collections.nCopies(employmentTypes.length, "?")));
            sql.append(")");
            for (String typeId : employmentTypes) {
                parameters.add(Integer.parseInt(typeId));
            }
        }

        if (experienceLevels != null && experienceLevels.length > 0) {
            sql.append(" AND WorkLevelId IN (").append(String.join(",", Collections.nCopies(experienceLevels.length, "?"))).append(")");
            for (String levelId : experienceLevels) {
                parameters.add(Integer.parseInt(levelId));
            }
        }

        if (salaryRanges != null && salaryRanges.length > 0) {
            List<String> salaryConditions = new ArrayList<>();
            for (String range : salaryRanges) {
                switch (range) {
                    case "under8000":
                        salaryConditions.add("SalaryMin < ?");
                        parameters.add(new BigDecimal("8000"));
                        break;
                    case "between8000And12000":
                        salaryConditions.add("SalaryMin >= ? AND SalaryMin < ?");
                        parameters.add(new BigDecimal("8000"));
                        parameters.add(new BigDecimal("12000"));
                        break;
                    case "above12000":
                        salaryConditions.add("SalaryMin >= ?");
                        parameters.add(new BigDecimal("12000"));
                        break;
                }
            }
            if (!salaryConditions.isEmpty()) {
                sql.append(" AND (").append(String.join(" OR ", salaryConditions)).append(")");
            }
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql.toString());
            int index = 1;
            for (Object param : parameters) {
                st.setObject(index++, param);
            }
            try ( ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    count = rs.getInt("JobCount");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;
    }

    public int countJobsByEnterpriseId(int enterpriseId) {
        int count = 0;
        String sql = "SELECT COUNT(*) AS jobCount FROM Jobs WHERE EnterpriseId = ? AND ExpiredTime > GETDATE()  AND statusid = 1;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, enterpriseId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("jobCount");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public void insertJob(Job job) {
        String sql = "DECLARE @NewId INT\n"
                + "\n"
                + "-- Find the first gap in the IDs\n"
                + "SELECT TOP 1 @NewId = Id + 1\n"
                + "FROM [dbo].[Jobs] AS J1\n"
                + "WHERE NOT EXISTS (\n"
                + "    SELECT 1\n"
                + "    FROM [dbo].[Jobs] AS J2\n"
                + "    WHERE J2.Id = J1.Id + 1\n"
                + ")\n"
                + "ORDER BY J1.Id\n"
                + "\n"
                + "-- If there is no gap, use the next available ID\n"
                + "IF @NewId IS NULL\n"
                + "    SET @NewId = (SELECT ISNULL(MAX(Id) + 1, 1) FROM [dbo].[Jobs])\n"
                + "\n"
                + "INSERT INTO [dbo].[Jobs]\n"
                + "           ([Id]\n"
                + "           ,[Title]\n"
                + "           ,[JobTypeId]\n"
                + "           ,[SalaryMin]\n"
                + "           ,[SalaryMax]\n"
                + "           ,[NumRecruit]\n"
                + "           ,[GenderRequire]\n"
                + "           ,[ExpYearRequire]\n"
                + "           ,[Overview]\n"
                + "           ,[Responsabilities]\n"
                + "           ,[Address]\n"
                + "           ,[CreatedTime]\n"
                + "           ,[UpdatedTime]\n"
                + "           ,[DeletedTime]\n"
                + "           ,[ExpiredTime]\n"
                + "           ,[EnterpriseId]\n"
                + "           ,[Requirements]\n"
                + "           ,[Skills]\n"
                + "           ,[WorkLevelId]\n"
                + "           ,[CityId]\n"
                + "           ,[StatusId])"
                + "     VALUES(@NewId, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, job.getTitle());
            st.setInt(2, job.getJobTypeDetail().getId());
            st.setFloat(3, job.getSalaryMin());
            st.setFloat(4, job.getSalaryMax());
            st.setInt(5, job.getNumRecruit());
            st.setString(6, job.getGenderRequire());
            st.setInt(7, job.getExpYearRequire());
            st.setString(8, job.getOverview());
            st.setString(9, job.getResponsabilities());
            st.setString(10, job.getAddress());
            st.setTimestamp(11, job.getUpdatedTime());
            st.setTimestamp(12, job.getDeletedTime());
            st.setTimestamp(13, job.getExpiredTime());
            st.setInt(14, job.getEnterprise().getId());
            st.setString(15, job.getRequirements());
            st.setString(16, job.getSkills());
            st.setInt(17, job.getWorkLevelDetail().getId());
            st.setInt(18, job.getCity().getId());
            st.setInt(19, job.getStatusJobDetail().getId());

            st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public int getNextPredictedJobId() {
        String sql = "DECLARE @NewId INT \n"
                + "SELECT TOP 1 @NewId = Id + 1 FROM [dbo].[Jobs] AS J1\n"
                + "                WHERE NOT EXISTS \n"
                + "				(\n"
                + "					SELECT 1 FROM [dbo].[Jobs] AS J2\n"
                + "					WHERE J2.Id = J1.Id + 1\n"
                + "				)\n"
                + "				ORDER BY J1.Id\n"
                + "IF @NewId IS NULL SET @NewId = (SELECT ISNULL(MAX(Id) + 1, 1) FROM [dbo].[Jobs])\n"
                + "\n"
                + "Select @NewId as NewID";
        int predict = -1;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                predict = rs.getInt("NewID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return predict;
    }

    public void updateJob(Job job) {
        String sql = "UPDATE Jobs SET Title = ?, JobTypeId = ?, SalaryMin = ?, "
                + "SalaryMax = ?, NumRecruit = ?, GenderRequire = ?, ExpYearRequire = ?, "
                + "Overview = ?, Responsabilities = ?, Address = ?, UpdatedTime = CURRENT_TIMESTAMP, "
                + "DeletedTime = ?, ExpiredTime = ?, EnterpriseId = ?, Requirements = ?, "
                + "Skills = ?, WorkLevelId = ?, CityId = ?, StatusId = ? WHERE Id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, job.getTitle());
            st.setInt(2, job.getJobTypeDetail().getId());
            st.setFloat(3, job.getSalaryMin());
            st.setFloat(4, job.getSalaryMax());
            st.setInt(5, job.getNumRecruit());
            st.setString(6, job.getGenderRequire());
            st.setInt(7, job.getExpYearRequire());
            st.setString(8, job.getOverview());
            st.setString(9, job.getResponsabilities());
            st.setString(10, job.getAddress());
            st.setTimestamp(11, job.getDeletedTime());
            st.setTimestamp(12, job.getExpiredTime());
            st.setInt(13, job.getEnterprise().getId());
            st.setString(14, job.getRequirements());
            st.setString(15, job.getSkills());
            st.setInt(16, job.getWorkLevelDetail().getId());
            st.setInt(17, job.getCity().getId());
            st.setInt(18, job.getStatusJobDetail().getId());
            st.setInt(19, job.getId());

            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteJob(int id) {

        String sql = "DECLARE @JobId int = ?;\n"
                + "\n"
                + "DELETE FROM [dbo].[Applications]\n"
                + "WHERE JobId = @JobId;\n"
                + "\n"
                + "DELETE FROM [dbo].[JobFavorites]\n"
                + "WHERE JobId = @JobId;\n"
                + "\n"
                + "DELETE FROM [dbo].[Notifications]\n"
                + "WHERE JobId = @JobId;\n"
                + "\n"
                + "DELETE FROM [dbo].[Reports]\n"
                + "WHERE JobId = @JobId;\n"
                + "\n"
                + "DELETE FROM [dbo].[TagJobs]\n"
                + "WHERE JobId = @JobId;\n"
                + "\n"
                + "DELETE FROM [dbo].[Jobs]\n"
                + "WHERE Id = @JobId;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, id);

            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getSQLState());
        }

    }

    public void banJob(int id) {
        String sql = "update Jobs\n"
                + "set StatusId = 3\n"
                + "Where Jobs.Id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, id);

            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getSQLState());
        }
    }

    public void unBanJob(int id) {
        String sql = "update Jobs\n"
                + "set StatusId = 1\n"
                + "Where Jobs.Id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, id);

            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getSQLState());
        }
    }

    public List<Job> getJobByEnterprise(int enterpriseId) {
        List<Job> list = new ArrayList<>();
        String sql = "SELECT * FROM Jobs Where EnterpriseId = ? AND ExpiredTime > GETDATE()";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, enterpriseId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Job job = new Job();
                job.setId(rs.getInt("Id"));
                job.setTitle(rs.getString("Title"));
                JobTypeDetailDAO jobTypeDetailDAO = new JobTypeDetailDAO();
                JobTypeDetail jobTypeDetail = jobTypeDetailDAO.getJobTypeDetailById(rs.getInt("JobTypeId"));
                job.setJobTypeDetail(jobTypeDetail);
                job.setSalaryMin(rs.getFloat("SalaryMin"));
                job.setSalaryMax(rs.getFloat("SalaryMax"));
                job.setNumRecruit(rs.getInt("NumRecruit"));
                String genderRequire = rs.getString("GenderRequire");
                job.setGenderRequire(rs.wasNull() ? null : genderRequire);
                int expYearRequire = rs.getInt("ExpYearRequire");
                job.setExpYearRequire(rs.wasNull() ? null : expYearRequire);
                String overview = rs.getString("Overview");
                job.setOverview(rs.wasNull() ? null : overview);
                String responsibilities = rs.getString("Responsabilities");
                job.setResponsabilities(rs.wasNull() ? null : responsibilities);
                String address = rs.getString("Address");
                job.setAddress(rs.wasNull() ? null : address);
                job.setCreatedTime(rs.getTimestamp("CreatedTime"));
                Timestamp updatedTime = rs.getTimestamp("UpdatedTime");
                job.setUpdatedTime(rs.wasNull() ? null : updatedTime);
                Timestamp deletedTime = rs.getTimestamp("DeletedTime");
                job.setDeletedTime(rs.wasNull() ? null : deletedTime);
                job.setExpiredTime(rs.getTimestamp("ExpiredTime"));
                EnterpriseDAO enterpriseDAO = new EnterpriseDAO();
                Enterprise enterprise = enterpriseDAO.getEnterpriseById(rs.getInt("EnterpriseId"));
                job.setEnterprise(enterprise);
                String requirements = rs.getString("Requirements");
                job.setRequirements(rs.wasNull() ? null : requirements);
                String skills = rs.getString("Skills");
                job.setSkills(rs.wasNull() ? null : skills);
                WorkLevelDetailDAO workLevelDetailDAO = new WorkLevelDetailDAO();
                WorkLevelDetail workLevelDetail = workLevelDetailDAO.getWorkLevelDetailById(rs.getInt("WorkLevelId"));
                job.setWorkLevelDetail(rs.wasNull() ? null : workLevelDetail);
                CityDAO cityDAO = new CityDAO();
                City city = cityDAO.getCityById(rs.getInt("CityId"));
                job.setCity(city);
                StatusJobDetailDAO statusJobDetailDAO = new StatusJobDetailDAO();
                StatusJobDetail statusJobDetail = statusJobDetailDAO.getStatusJobDetailById(rs.getInt("StatusId"));
                job.setStatusJobDetail(statusJobDetail);
                list.add(job);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

}
