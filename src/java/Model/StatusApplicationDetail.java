
package Model;

public class StatusApplicationDetail {
    private int id;
    private String statusApplication;

    public StatusApplicationDetail() {
    }

    public StatusApplicationDetail(int id, String statusApplication) {
        this.id = id;
        this.statusApplication = statusApplication;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStatusApplication() {
        return statusApplication;
    }

    public void setStatusApplication(String statusApplication) {
        this.statusApplication = statusApplication;
    }
    
    
}
