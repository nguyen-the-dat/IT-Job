/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;
import java.util.List;

/**
 *
 * @author thain
 */
public class JobSeeker {
    private int id;
    private String imageUrl;
    private String name;
    private boolean gender;
    private Date DOB;
    private String country;
    private String description;
    private String phoneContact;
    private String emailContact;
    private String facebookUrl;
    private String linkedinUrl;
    private String accountId;
    private List<Skill> skills;

    public JobSeeker() {
    }

    public JobSeeker(int id, String imageUrl, String name, boolean gender, Date DOB, String country, String description, String phoneContact, String emailContact, String facebookUrl, String linkedinUrl, String accountId) {
        this.id = id;
        this.imageUrl = imageUrl;
        this.name = name;
        this.gender = gender;
        this.DOB = DOB;
        this.country = country;
        this.description = description;
        this.phoneContact = phoneContact;
        this.emailContact = emailContact;
        this.facebookUrl = facebookUrl;
        this.linkedinUrl = linkedinUrl;
        this.accountId = accountId;
    }

    public List<Skill> getSkills() {
        return skills;
    }

    public void setSkills(List<Skill> skills) {
        this.skills = skills;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public Date getDOB() {
        return DOB;
    }

    public void setDOB(Date DOB) {
        this.DOB = DOB;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPhoneContact() {
        return phoneContact;
    }

    public void setPhoneContact(String phoneContact) {
        this.phoneContact = phoneContact;
    }

    public String getEmailContact() {
        return emailContact;
    }

    public void setEmailContact(String emailContact) {
        this.emailContact = emailContact;
    }

    public String getFacebookUrl() {
        return facebookUrl;
    }

    public void setFacebookUrl(String facebookUrl) {
        this.facebookUrl = facebookUrl;
    }

    public String getLinkedinUrl() {
        return linkedinUrl;
    }

    public void setLinkedinUrl(String linkedlinUrl) {
        this.linkedinUrl = linkedlinUrl;
    }

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    @Override
    public String toString() {
        return "JobSeeker{" + "id=" + id + ", imageUrl=" + imageUrl + ", name=" + name + ", gender=" + gender + ", DOB=" + DOB + ", country=" + country + ", description=" + description + ", phoneContact=" + phoneContact + ", emailContact=" + emailContact + ", facebookUrl=" + facebookUrl + ", linkedinUrl=" + linkedinUrl + ", accountId=" + accountId + ", skills=" + skills + '}';
    }
    
    
}
