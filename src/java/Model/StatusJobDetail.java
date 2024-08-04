/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author thain
 */
public class StatusJobDetail {
    private int id;
    private String statusJob;

    public StatusJobDetail() {
    }
    
    public StatusJobDetail(int id) {
        this.id = id;
    }
    public StatusJobDetail(int id, String statusJob) {
        this.id = id;
        this.statusJob = statusJob;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStatusJob() {
        return statusJob;
    }

    public void setStatusJob(String statusJob) {
        this.statusJob = statusJob;
    }
    
    
}
