/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class Interviews {

    int Id;
    String MeetingTime;
    String MeetingUrl;
    int ApplicationId;
    int status;
    String statusName;

    public Interviews(int Id, String MeetingTime, String MeetingUrl, int ApplicationId) {
        this.Id = Id;
        this.MeetingTime = MeetingTime;
        this.MeetingUrl = MeetingUrl;
        this.ApplicationId = ApplicationId;
    }

    public Interviews(int Id, String MeetingTime, String MeetingUrl, int ApplicationId, int status) {
        this.Id = Id;
        this.MeetingTime = MeetingTime;
        this.MeetingUrl = MeetingUrl;
        this.ApplicationId = ApplicationId;
        this.status = status;
        this.statusName = InterviewStatusEnum.findByCode(status).name;
    }
    

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getMeetingTime() {
        return MeetingTime;
    }

    public void setMeetingTime(String MeetingTime) {
        this.MeetingTime = MeetingTime;
    }

    public String getMeetingUrl() {
        return MeetingUrl;
    }

    public void setMeetingUrl(String MeetingUrl) {
        this.MeetingUrl = MeetingUrl;
    }

    public int getApplicationId() {
        return ApplicationId;
    }

    public void setApplicationId(int ApplicationId) {
        this.ApplicationId = ApplicationId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    
    
}
