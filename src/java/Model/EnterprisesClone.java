/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author admin
 */
public class EnterprisesClone {

    private int id;
    private String shortName;
    private String fullCompanyName;
    private String logoUrl;
    private int foundedYear;
    private EnterpriseSizeDetail enterpriseSizeDetail;
    private String taxCode;
    private String businessLicenseFront;
    private String businessLicenseBack;
    private String websiteUrl;
    private String facebookUrl;
    private String phoneContact;
    private String emailContact;
    private String imageUrl;
    private String description;
    private String address;
    private CompanyTypeDetail companyTypeDetail;
    private int workingday;
    private String country;
    private String accountId;
    private int status; // 1 : register, 2 : update , 3 : successfull

    public EnterprisesClone() {
    }

    public EnterprisesClone(int id, String shortName, String fullCompanyName, String logoUrl, int foundedYear, EnterpriseSizeDetail enterpriseSizeDetail, String taxCode, String businessLicenseFront, String businessLicenseBack, String websiteUrl, String facebookUrl, String phoneContact, String emailContact, String imageUrl, String description, String address, CompanyTypeDetail companyTypeDetail, int workingday, String country, String accountId, int Status) {
        this.id = id;
        this.shortName = shortName;
        this.fullCompanyName = fullCompanyName;
        this.logoUrl = logoUrl;
        this.foundedYear = foundedYear;
        this.enterpriseSizeDetail = enterpriseSizeDetail;
        this.taxCode = taxCode;
        this.businessLicenseFront = businessLicenseFront;
        this.businessLicenseBack = businessLicenseBack;
        this.websiteUrl = websiteUrl;
        this.facebookUrl = facebookUrl;
        this.phoneContact = phoneContact;
        this.emailContact = emailContact;
        this.imageUrl = imageUrl;
        this.description = description;
        this.address = address;
        this.companyTypeDetail = companyTypeDetail;
        this.workingday = workingday;
        this.country = country;
        this.accountId = accountId;
        this.status = Status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getShortName() {
        return shortName;
    }

    public void setShortName(String shortName) {
        this.shortName = shortName;
    }

    public String getFullCompanyName() {
        return fullCompanyName;
    }

    public void setFullCompanyName(String fullCompanyName) {
        this.fullCompanyName = fullCompanyName;
    }

    public String getLogoUrl() {
        return logoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
    }

    public int getFoundedYear() {
        return foundedYear;
    }

    public void setFoundedYear(int foundedYear) {
        this.foundedYear = foundedYear;
    }

    public EnterpriseSizeDetail getEnterpriseSizeDetail() {
        return enterpriseSizeDetail;
    }

    public void setEnterpriseSizeDetail(EnterpriseSizeDetail enterpriseSizeDetail) {
        this.enterpriseSizeDetail = enterpriseSizeDetail;
    }

    public String getTaxCode() {
        return taxCode;
    }

    public void setTaxCode(String taxCode) {
        this.taxCode = taxCode;
    }

    public String getBusinessLicenseFront() {
        return businessLicenseFront;
    }

    public void setBusinessLicenseFront(String businessLicenseFront) {
        this.businessLicenseFront = businessLicenseFront;
    }

    public String getBusinessLicenseBack() {
        return businessLicenseBack;
    }

    public void setBusinessLicenseBack(String businessLicenseBack) {
        this.businessLicenseBack = businessLicenseBack;
    }

    public String getWebsiteUrl() {
        return websiteUrl;
    }

    public void setWebsiteUrl(String websiteUrl) {
        this.websiteUrl = websiteUrl;
    }

    public String getFacebookUrl() {
        return facebookUrl;
    }

    public void setFacebookUrl(String facebookUrl) {
        this.facebookUrl = facebookUrl;
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

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public CompanyTypeDetail getCompanyTypeDetail() {
        return companyTypeDetail;
    }

    public void setCompanyTypeDetail(CompanyTypeDetail companyTypeDetail) {
        this.companyTypeDetail = companyTypeDetail;
    }

    public int getWorkingday() {
        return workingday;
    }

    public void setWorkingday(int workingday) {
        this.workingday = workingday;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int Status) {
        this.status = Status;
    }

    @Override
    public String toString() {
        return "EnterprisesClone{" + "id=" + id + ", shortName=" + shortName + ", fullCompanyName=" + fullCompanyName + ", logoUrl=" + logoUrl + ", foundedYear=" + foundedYear + ", enterpriseSizeDetail=" + enterpriseSizeDetail + ", taxCode=" + taxCode + ", businessLicenseFront=" + businessLicenseFront + ", businessLicenseBack=" + businessLicenseBack + ", websiteUrl=" + websiteUrl + ", facebookUrl=" + facebookUrl + ", phoneContact=" + phoneContact + ", emailContact=" + emailContact + ", imageUrl=" + imageUrl + ", description=" + description + ", address=" + address + ", companyTypeDetail=" + companyTypeDetail + ", workingday=" + workingday + ", country=" + country + ", accountId=" + accountId + ", status=" + status + '}';
    }

}
