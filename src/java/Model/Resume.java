
package Model;

import java.sql.Timestamp;

public class Resume {
    public int id;
    public int seekerId;
    public String url;
    public String coverLetter;
    public Timestamp createdTime;

    public Resume() {
    }

    public Resume(int id, int seekerId, String url, String coverLetter, Timestamp createdTime) {
        this.id = id;
        this.seekerId = seekerId;
        this.url = url;
        this.coverLetter = coverLetter;
        this.createdTime = createdTime;
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

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getCoverLetter() {
        return coverLetter;
    }

    public void setCoverLetter(String coverLetter) {
        this.coverLetter = coverLetter;
    }

    public Timestamp getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Timestamp createdTime) {
        this.createdTime = createdTime;
    }

    
}
