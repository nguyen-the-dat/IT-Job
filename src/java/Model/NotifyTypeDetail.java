/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class NotifyTypeDetail {
    private int id;
    private String NotifyType;

    public NotifyTypeDetail() {
    }

    public NotifyTypeDetail(int id, String NotifyType) {
        this.id = id;
        this.NotifyType = NotifyType;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNotifyType() {
        return NotifyType;
    }

    public void setNotifyType(String NotifyType) {
        this.NotifyType = NotifyType;
    }
}
