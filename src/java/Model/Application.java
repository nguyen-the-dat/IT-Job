package Model;

import java.sql.Timestamp;

public class Application {

    private int id;
    private Job job;
    private JobSeeker jobSeeker;
    private String cvUrl;
    private String letter;
    private StatusApplicationDetail statusApplicationDetail;
    private Timestamp applyTime;
    private Interviews interviews;

    public Application() {
    }

    public Application(int id, Job job, JobSeeker jobSeeker, String cvUrl, String letter, StatusApplicationDetail statusApplicationDetail, Timestamp applyTime) {
        this.id = id;
        this.job = job;
        this.jobSeeker = jobSeeker;
        this.cvUrl = cvUrl;
        this.letter = letter;
        this.statusApplicationDetail = statusApplicationDetail;
        this.applyTime = applyTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Job getJob() {
        return job;
    }

    public void setJob(Job job) {
        this.job = job;
    }

    public JobSeeker getJobSeeker() {
        return jobSeeker;
    }

    public void setJobSeeker(JobSeeker jobSeeker) {
        this.jobSeeker = jobSeeker;
    }

    public String getCvUrl() {
        return cvUrl;
    }

    public void setCvUrl(String cvUrl) {
        this.cvUrl = cvUrl;
    }

    public String getLetter() {
        return letter;
    }

    public void setLetter(String letter) {
        this.letter = letter;
    }

    public StatusApplicationDetail getStatusApplicationDetail() {
        return statusApplicationDetail;
    }

    public void setStatusApplicationDetail(StatusApplicationDetail statusApplicationDetail) {
        this.statusApplicationDetail = statusApplicationDetail;
    }

    public Timestamp getApplyTime() {
        return applyTime;
    }

    public void setApplyTime(Timestamp applyTime) {
        this.applyTime = applyTime;
    }

    public Interviews getInterviews() {
        return interviews;
    }

    public void setInterviews(Interviews interviews) {
        this.interviews = interviews;
    }

    

}
