/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Timestamp;

import java.sql.Timestamp;

/**
 *
 * @author thain
 */
public class Account {

    private String username;
    private String password;
    private Timestamp createdTime;  
    private Timestamp updatedTime;  
    private Timestamp deletedTime;
    private int statusId;
    private int roleId;
    private int planId;
    private Timestamp lastActiveTime; 
    private String code;
    private String name;
    private String imgUrl;

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public Account() {
    }

    public Account(String username, String password, Timestamp createdTime, Timestamp updatedTime, Timestamp deletedTime, int statusId, int roleId, int planId, Timestamp lastActiveTime, String code) {
        this.username = username;
        this.password = password;
        this.createdTime = createdTime;
        this.updatedTime = updatedTime;
        this.deletedTime = deletedTime;
        this.statusId = statusId;
        this.roleId = roleId;
        this.planId = planId;
        this.lastActiveTime = lastActiveTime;
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Timestamp getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Timestamp createdTime) {
        this.createdTime = createdTime;
    }

    public Timestamp getUpdatedTime() {
        return updatedTime;
    }

    public void setUpdatedTime(Timestamp updatedTime) {
        this.updatedTime = updatedTime;
    }

    public Timestamp getDeletedTime() {
        return deletedTime;
    }

    public void setDeletedTime(Timestamp deletedTime) {
        this.deletedTime = deletedTime;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public int getPlanId() {
        return planId;
    }

    public void setPlanId(int planId) {
        this.planId = planId;
    }

    public Timestamp getLastActiveTime() {
        return lastActiveTime;
    }

    public void setLastActiveTime(Timestamp lastActiveTime) {
        this.lastActiveTime = lastActiveTime;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Override
    public String toString() {
        return "Account{" + "username=" + username + ", password=" + password + ", createdTime=" + createdTime + ", updatedTime=" + updatedTime + ", deletedTime=" + deletedTime + ", statusId=" + statusId + ", roleId=" + roleId + ", planId=" + planId + ", lastActiveTime=" + lastActiveTime + ", code=" + code + '}';
    }

    
}
