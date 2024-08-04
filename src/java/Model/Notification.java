/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Timestamp;

/**
 *
 * @author Admin
 */
public class Notification {
    private int id;
    private int seekerId;
    private int jobId;
    private int notifyTypeId;
    private Timestamp createdTime;
    private boolean isSeen;
    private boolean isSent;
    private int applicationId;
    private int receiverId;

    public Notification() {
    }

    public Notification(int id, int seekerId, int jobId, int notifyTypeId, Timestamp createdTime, boolean isSeen, boolean isSent, int applicationId, int receiverId) {
        this.id = id;
        this.seekerId = seekerId;
        this.jobId = jobId;
        this.notifyTypeId = notifyTypeId;
        this.createdTime = createdTime;
        this.isSeen = isSeen;
        this.isSent = isSent;
        this.applicationId = applicationId;
        this.receiverId = receiverId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSeekerId() {
        return seekerId;
    }

    public void setSeekerId(int seekerId) {
        this.seekerId = seekerId;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public int getNotifyTypeId() {
        return notifyTypeId;
    }

    public void setNotifyTypeId(int notifyTypeId) {
        this.notifyTypeId = notifyTypeId;
    }

    public Timestamp getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Timestamp createdTime) {
        this.createdTime = createdTime;
    }

    public boolean isIsSeen() {
        return isSeen;
    }

    public void setIsSeen(boolean isSeen) {
        this.isSeen = isSeen;
    }

    public boolean isIsSent() {
        return isSent;
    }

    public void setIsSent(boolean isSent) {
        this.isSent = isSent;
    }

    public int getApplicationId() {
        return applicationId;
    }

    public void setApplicationId(int applicationId) {
        this.applicationId = applicationId;
    }

    public int getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(int receiverId) {
        this.receiverId = receiverId;
    }

    
    
}
