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
public class Job {
    private int id;
    private String title;
    private JobTypeDetail jobTypeDetail;
    private float salaryMin;
    private float salaryMax;
    private int numRecruit;
    private String genderRequire; 
    private int expYearRequire;
    private String overview;
    private String responsabilities;
    private String address;
    private Timestamp createdTime;
    private Timestamp updatedTime;
    private Timestamp deletedTime;
    private Timestamp expiredTime;
    private Enterprise enterprise;
    private String requirements;
    private String skills;
    private WorkLevelDetail workLevelDetail;
    private City city;
    private StatusJobDetail statusJobDetail;

    public Job() {
    }

    public Job(int id, String title, JobTypeDetail jobTypeDetail, float salaryMin, float salaryMax, int numRecruit, String genderRequire, int expYearRequire, String overview, String responsabilities, String address, Timestamp createdTime, Timestamp updatedTime, Timestamp deletedTime, Timestamp expiredTime, Enterprise enterprise, String requirements, String skills, WorkLevelDetail workLevelDetail, City city, StatusJobDetail statusJobDetail) {
        this.id = id;
        this.title = title;
        this.jobTypeDetail = jobTypeDetail;
        this.salaryMin = salaryMin;
        this.salaryMax = salaryMax;
        this.numRecruit = numRecruit;
        this.genderRequire = genderRequire;
        this.expYearRequire = expYearRequire;
        this.overview = overview;
        this.responsabilities = responsabilities;
        this.address = address;
        this.createdTime = createdTime;
        this.updatedTime = updatedTime;
        this.deletedTime = deletedTime;
        this.expiredTime = expiredTime;
        this.enterprise = enterprise;
        this.requirements = requirements;
        this.skills = skills;
        this.workLevelDetail = workLevelDetail;
        this.city = city;
        this.statusJobDetail = statusJobDetail;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public JobTypeDetail getJobTypeDetail() {
        return jobTypeDetail;
    }

    public void setJobTypeDetail(JobTypeDetail jobTypeDetail) {
        this.jobTypeDetail = jobTypeDetail;
    }

    public float getSalaryMin() {
        return salaryMin;
    }

    public void setSalaryMin(float salaryMin) {
        this.salaryMin = salaryMin;
    }

    public float getSalaryMax() {
        return salaryMax;
    }

    public void setSalaryMax(float salaryMax) {
        this.salaryMax = salaryMax;
    }

    public int getNumRecruit() {
        return numRecruit;
    }

    public void setNumRecruit(int numRecruit) {
        this.numRecruit = numRecruit;
    }

    public String getGenderRequire() {
        return genderRequire;
    }

    public void setGenderRequire(String genderRequire) {
        this.genderRequire = genderRequire;
    }

    public int getExpYearRequire() {
        return expYearRequire;
    }

    public void setExpYearRequire(int expYearRequire) {
        this.expYearRequire = expYearRequire;
    }

    public String getOverview() {
        return overview;
    }

    public void setOverview(String overview) {
        this.overview = overview;
    }

    public String getResponsabilities() {
        return responsabilities;
    }

    public void setResponsabilities(String responsabilities) {
        this.responsabilities = responsabilities;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public Timestamp getExpiredTime() {
        return expiredTime;
    }

    public void setExpiredTime(Timestamp expiredTime) {
        this.expiredTime = expiredTime;
    }

    public Enterprise getEnterprise() {
        return enterprise;
    }

    public void setEnterprise(Enterprise enterprise) {
        this.enterprise = enterprise;
    }

    public String getRequirements() {
        return requirements;
    }

    public void setRequirements(String requirements) {
        this.requirements = requirements;
    }

    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }

    public WorkLevelDetail getWorkLevelDetail() {
        return workLevelDetail;
    }

    public void setWorkLevelDetail(WorkLevelDetail workLevelDetail) {
        this.workLevelDetail = workLevelDetail;
    }

    public City getCity() {
        return city;
    }

    public void setCity(City city) {
        this.city = city;
    }

    public StatusJobDetail getStatusJobDetail() {
        return statusJobDetail;
    }

    public void setStatusJobDetail(StatusJobDetail statusJobDetail) {
        this.statusJobDetail = statusJobDetail;
    }

}
