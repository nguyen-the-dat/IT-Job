/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Enterprise;
import Model.Job;
import Model.Report;
import Model.ReportDetail;
import Model.ReportTypeDetail;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class ReportDAO extends DBContext {

    public void insertReport(Report report) {
        String sql = "INSERT INTO [Reports]\n"
                + "           ([JobId]\n"
                + "           ,[AccountId]\n"
                + "           ,[Content]\n"
                + "           ,[CreateDate]\n"
                + "           ,[ReportTypeId]\n"
                + "           ,[IsRead])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?)";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, report.getJobId());
            preparedStatement.setString(2, report.getAccountId());
            preparedStatement.setString(3, report.getContent());
            preparedStatement.setTimestamp(4, report.getCreatedDate());
            preparedStatement.setInt(5, report.getReportTypeId());
            preparedStatement.setBoolean(6, report.isIsRead());
            preparedStatement.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Report> getListReportByJobId(int jobId) {
        List<Report> list = new ArrayList<>();
        String sql = "select * from [Reports] where JobId=?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, jobId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Report r = new Report();
                r.setAccountId(rs.getString("AccountId"));
                r.setContent(rs.getString("Content"));
                r.setJobId(jobId);
                r.setCreatedDate(rs.getTimestamp("CreateDate"));
                r.setIsRead(rs.getBoolean("IsRead"));
                list.add(r);
            }
        } catch (Exception e) {
        }

        return list;
    }

    public boolean isReport(String username, int jobId) {
        String sql = "select * from [Reports] where JobId=? and AccountId=?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, jobId);
            preparedStatement.setString(2, username);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    public List<ReportTypeDetail> getReportTypeDetail() {
        List<ReportTypeDetail> result = new ArrayList<>();
        String sql = "select * from [ReportTypeDetail]";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                ReportTypeDetail rtd = new ReportTypeDetail();
                rtd.setId(rs.getInt("Id"));
                rtd.setDetail(rs.getString("Detail"));

                result.add(rtd);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    // tra ve reportdetail
    public List<ReportDetail> getAllReport(int type, int pageIndex, int pageSize) {
        AccountDAO ad = new AccountDAO();
        JobDAO jd = new JobDAO();
        List<ReportDetail> list = new ArrayList<>();
        String sql;
        if (type == 0) {
            sql = "select * from [Reports] order by CreateDate desc " + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        } else {
            sql = "select * from [Reports] where ReportTypeId = ? order by CreateDate desc" + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        }
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            if (type != 0) {
                preparedStatement.setInt(1, type);
                preparedStatement.setInt(2, pageIndex);
                preparedStatement.setInt(3, pageSize);
            } else {
                preparedStatement.setInt(1, pageIndex);
                preparedStatement.setInt(2, pageSize);
            }
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                ReportDetail rd = new ReportDetail();
                // set account 
                String accountId = rs.getString("AccountId");
                rd.setAccount(ad.getAccountByUsername(accountId));

                // set report
                Report report = new Report();
                report.setContent(rs.getString("Content"));
                report.setCreatedDate(rs.getTimestamp("CreateDate"));
                report.setIsRead(rs.getBoolean("IsRead"));
                report.setReportTypeId(rs.getInt("ReportTypeId"));
                report.setJobId(rs.getInt("JobId"));
                rd.setReport(report);

                // set job
                int jobId = rs.getInt("JobId");
                Job job = jd.getJobById(jobId);
                rd.setJob(job);

                // set Enterprise
                Enterprise e = job.getEnterprise();
                rd.setEnterprise(e);
                // set time
                Timestamp timestamp = rs.getTimestamp("CreateDate");
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String formattedDate = dateFormat.format(timestamp);
                rd.setTime(formattedDate);
                list.add(rd);
            }
        } catch (SQLException e) {
            e.printStackTrace();

        }

        return list;
    }
}
