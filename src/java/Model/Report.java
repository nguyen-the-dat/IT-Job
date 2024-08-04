/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Timestamp;

/**
 *
 * @author admin
 */
public class Report {

    private int jobId;
    private String accountId;
    private String content;
    private Timestamp createdDate;
    private int reportTypeId;
    private boolean isRead;

    public Report() {
    }

    public Report(int jobId, String accountId, String content, Timestamp createdDate, int reportTypeId, boolean isRead) {
        this.jobId = jobId;
        this.accountId = accountId;
        this.content = content;
        this.createdDate = createdDate;
        this.reportTypeId = reportTypeId;
        this.isRead = isRead;
    }

    public int getReportTypeId() {
        return reportTypeId;
    }

    public void setReportTypeId(int reportTypeId) {
        this.reportTypeId = reportTypeId;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }

    public boolean isIsRead() {
        return isRead;
    }

    public void setIsRead(boolean isRead) {
        this.isRead = isRead;
    }

    @Override
    public String toString() {
        return "Report{" + "jobId=" + jobId + ", accountId=" + accountId + ", content=" + content + ", createdDate=" + createdDate + ", reportTypeId=" + reportTypeId + ", isRead=" + isRead + '}';
    }

   

}
