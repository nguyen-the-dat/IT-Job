/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Timestamp;

/**
 *
 * @author thain
 */
public class JobFavourite {
    private Job job;
    private JobSeeker jobSeeker;
    private Timestamp createdTime;

    public JobFavourite() {
    }

    public JobFavourite(Job job, JobSeeker jobSeeker, Timestamp createdTime) {
        this.job = job;
        this.jobSeeker = jobSeeker;
        this.createdTime = createdTime;
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

    public Timestamp getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Timestamp createdTime) {
        this.createdTime = createdTime;
    }
    
    
}
