/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Account;
import Model.CompanyTypeDetail;
import Model.Enterprise;
import Model.EnterpriseSizeDetail;
import Model.EnterprisesClone;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.text.Normalizer;

/**
 *
 * @author thain
 */
public class EnterpriseDAO extends DBContext {
    
    public List<Enterprise> getAllEnterprises() {
        List<Enterprise> enterprises = new ArrayList<>();
        String sql = "SELECT * FROM Enterprises;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Enterprise enterprise = new Enterprise();
                enterprise.setId(rs.getInt("Id"));
                enterprise.setShortName(rs.getString("ShortName"));
                enterprise.setFullCompanyName(rs.getString("FullCompanyName"));
                enterprise.setLogoUrl(rs.getString("LogoUrl"));
                enterprise.setFoundedYear(rs.getInt("FoundedYear"));
                
                int enterpriseSizeId = rs.getInt("EnterpriseSizeId");
                EnterpriseSizeDetailDAO enterpriseSizeDetailDAO = new EnterpriseSizeDetailDAO();
                EnterpriseSizeDetail enterpriseSizeDetail = enterpriseSizeDetailDAO.getEnterpriseSizeDetailById(enterpriseSizeId);
                enterprise.setEnterpriseSizeDetail(enterpriseSizeDetail);
                
                enterprise.setTaxCode(rs.getString("TaxCode"));
                enterprise.setBusinessLicenseFront(rs.getString("BusinessLicenseFront"));
                enterprise.setBusinessLicenseBack(rs.getString("BusinessLicenseBack"));
                String websiteUrl = rs.getString("WebsiteUrl");
                enterprise.setWebsiteUrl(rs.wasNull() ? null : websiteUrl);
                
                String facebookUrl = rs.getString("FacebookUrl");
                enterprise.setFacebookUrl(rs.wasNull() ? null : facebookUrl);
                
                String phoneContact = rs.getString("PhoneContact");
                enterprise.setPhoneContact(rs.wasNull() ? null : phoneContact);
                enterprise.setEmailContact(rs.getString("EmailContact"));
                
                String imageUrl = rs.getString("ImageUrl");
                enterprise.setImageUrl(rs.wasNull() ? null : imageUrl);
                
                String description = rs.getString("Description");
                enterprise.setDescription(rs.wasNull() ? null : description);
                
                String address = rs.getString("Address");
                enterprise.setAddress(rs.wasNull() ? null : address);
                int companyTypeId = rs.getInt("CompanyTypeId");
                CompanyTypeDetailDAO companyTypeDetailDAO = new CompanyTypeDetailDAO();
                CompanyTypeDetail companyTypeDetail = companyTypeDetailDAO.getCompanyTypeDetailById(companyTypeId);
                enterprise.setCompanyTypeDetail(companyTypeDetail);
                
                enterprise.setWorkingday(rs.getInt("WorkingDay"));
                
                String country = rs.getString("Country");
                enterprise.setCountry(rs.wasNull() ? null : country);
                
                String accountId = rs.getString("AccountId");
                
                enterprises.add(enterprise);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return enterprises;
    }
    
    public List<Enterprise> getEnterprisesWithPagination(int pageIndex, int pageSize) {
        List<Enterprise> enterprises = new ArrayList<>();
        int offset = (pageIndex - 1) * pageSize;
        String sql = "SELECT * FROM Enterprises ORDER BY Id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, offset); // Set OFFSET
            st.setInt(2, pageSize); // Set FETCH NEXT
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Enterprise enterprise = new Enterprise();
                enterprise.setId(rs.getInt("Id"));
                enterprise.setShortName(rs.getString("ShortName"));
                enterprise.setFullCompanyName(rs.getString("FullCompanyName"));
                enterprise.setLogoUrl(rs.getString("LogoUrl"));
                enterprise.setFoundedYear(rs.getInt("FoundedYear"));
                
                int enterpriseSizeId = rs.getInt("EnterpriseSizeId");
                EnterpriseSizeDetailDAO enterpriseSizeDetailDAO = new EnterpriseSizeDetailDAO();
                EnterpriseSizeDetail enterpriseSizeDetail = enterpriseSizeDetailDAO.getEnterpriseSizeDetailById(enterpriseSizeId);
                enterprise.setEnterpriseSizeDetail(enterpriseSizeDetail);
                
                enterprise.setTaxCode(rs.getString("TaxCode"));
                enterprise.setBusinessLicenseFront(rs.getString("BusinessLicenseFront"));
                enterprise.setBusinessLicenseBack(rs.getString("BusinessLicenseBack"));
                String websiteUrl = rs.getString("WebsiteUrl");
                enterprise.setWebsiteUrl(rs.wasNull() ? null : websiteUrl);
                
                String facebookUrl = rs.getString("FacebookUrl");
                enterprise.setFacebookUrl(rs.wasNull() ? null : facebookUrl);
                
                String phoneContact = rs.getString("PhoneContact");
                enterprise.setPhoneContact(rs.wasNull() ? null : phoneContact);
                enterprise.setEmailContact(rs.getString("EmailContact"));
                
                String imageUrl = rs.getString("ImageUrl");
                enterprise.setImageUrl(rs.wasNull() ? null : imageUrl);
                
                String description = rs.getString("Description");
                enterprise.setDescription(rs.wasNull() ? null : description);
                
                String address = rs.getString("Address");
                enterprise.setAddress(rs.wasNull() ? null : address);
                int companyTypeId = rs.getInt("CompanyTypeId");
                CompanyTypeDetailDAO companyTypeDetailDAO = new CompanyTypeDetailDAO();
                CompanyTypeDetail companyTypeDetail = companyTypeDetailDAO.getCompanyTypeDetailById(companyTypeId);
                enterprise.setCompanyTypeDetail(companyTypeDetail);
                
                enterprise.setWorkingday(rs.getInt("WorkingDay"));
                
                String country = rs.getString("Country");
                enterprise.setCountry(rs.wasNull() ? null : country);
                
                String accountId = rs.getString("AccountId");
                
                enterprises.add(enterprise);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return enterprises;
    }
    
    public Enterprise getEnterpriseById(int id) {
        Enterprise enterprise = null;
        String sql = "SELECT * FROM Enterprises WHERE Id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                enterprise = new Enterprise();
                enterprise.setId(rs.getInt("Id"));
                enterprise.setShortName(rs.getString("ShortName"));
                enterprise.setFullCompanyName(rs.getString("FullCompanyName"));
                enterprise.setLogoUrl(rs.getString("LogoUrl"));
                enterprise.setFoundedYear(rs.getInt("FoundedYear"));
                int enterpriseSizeId = rs.getInt("EnterpriseSizeId");
                EnterpriseSizeDetailDAO enterpriseSizeDetailDAO = new EnterpriseSizeDetailDAO();
                EnterpriseSizeDetail enterpriseSizeDetail = enterpriseSizeDetailDAO.getEnterpriseSizeDetailById(enterpriseSizeId);
                enterprise.setEnterpriseSizeDetail(enterpriseSizeDetail);
                enterprise.setTaxCode(rs.getString("TaxCode"));
                enterprise.setBusinessLicenseFront(rs.getString("BusinessLicenseFront"));
                enterprise.setBusinessLicenseBack(rs.getString("BusinessLicenseBack"));
                String websiteUrl = rs.getString("WebsiteUrl");
                enterprise.setWebsiteUrl(rs.wasNull() ? null : websiteUrl);
                String facebookUrl = rs.getString("FacebookUrl");
                enterprise.setFacebookUrl(rs.wasNull() ? null : facebookUrl);
                String phoneContact = rs.getString("PhoneContact");
                enterprise.setPhoneContact(rs.wasNull() ? null : phoneContact);
                enterprise.setEmailContact(rs.getString("EmailContact"));
                String imageUrl = rs.getString("ImageUrl");
                enterprise.setImageUrl(rs.wasNull() ? null : imageUrl);
                String description = rs.getString("Description");
                enterprise.setDescription(rs.wasNull() ? null : description);
                String address = rs.getString("Address");
                enterprise.setAddress(rs.wasNull() ? null : address);
                int companyTypeId = rs.getInt("CompanyTypeId");
                CompanyTypeDetailDAO companyTypeDetailDAO = new CompanyTypeDetailDAO();
                CompanyTypeDetail companyTypeDetail = companyTypeDetailDAO.getCompanyTypeDetailById(companyTypeId);
                enterprise.setCompanyTypeDetail(companyTypeDetail);
                enterprise.setWorkingday(rs.getInt("WorkingDay"));
                String country = rs.getString("Country");
                enterprise.setCountry(rs.wasNull() ? null : country);
                String accountId = rs.getString("AccountId");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return enterprise;
    }
    
    public Enterprise getEnterpriseByAccountId(String accountId) {
        Enterprise enterprise = null;
        String sql = "SELECT * FROM Enterprises WHERE AccountId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, accountId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                enterprise = new Enterprise();
                enterprise.setId(rs.getInt("Id"));
                enterprise.setShortName(rs.getString("ShortName"));
                enterprise.setFullCompanyName(rs.getString("FullCompanyName"));
                enterprise.setLogoUrl(rs.getString("LogoUrl"));
                enterprise.setFoundedYear(rs.getInt("FoundedYear"));
                
                int enterpriseSizeId = rs.getInt("EnterpriseSizeId");
                EnterpriseSizeDetailDAO enterpriseSizeDetailDAO = new EnterpriseSizeDetailDAO();
                EnterpriseSizeDetail enterpriseSizeDetail = enterpriseSizeDetailDAO.getEnterpriseSizeDetailById(enterpriseSizeId);
                enterprise.setEnterpriseSizeDetail(enterpriseSizeDetail);
                
                enterprise.setTaxCode(rs.getString("TaxCode"));
                enterprise.setBusinessLicenseFront(rs.getString("BusinessLicenseFront"));
                enterprise.setBusinessLicenseBack(rs.getString("BusinessLicenseBack"));
                String websiteUrl = rs.getString("WebsiteUrl");
                enterprise.setWebsiteUrl(rs.wasNull() ? null : websiteUrl);
                
                String facebookUrl = rs.getString("FacebookUrl");
                enterprise.setFacebookUrl(rs.wasNull() ? null : facebookUrl);
                
                String phoneContact = rs.getString("PhoneContact");
                enterprise.setPhoneContact(rs.wasNull() ? null : phoneContact);
                enterprise.setEmailContact(rs.getString("EmailContact"));
                
                String imageUrl = rs.getString("ImageUrl");
                enterprise.setImageUrl(rs.wasNull() ? null : imageUrl);
                
                String description = rs.getString("Description");
                enterprise.setDescription(rs.wasNull() ? null : description);
                
                String address = rs.getString("Address");
                enterprise.setAddress(rs.wasNull() ? null : address);
                int companyTypeId = rs.getInt("CompanyTypeId");
                CompanyTypeDetailDAO companyTypeDetailDAO = new CompanyTypeDetailDAO();
                CompanyTypeDetail companyTypeDetail = companyTypeDetailDAO.getCompanyTypeDetailById(companyTypeId);
                enterprise.setCompanyTypeDetail(companyTypeDetail);
                
                enterprise.setWorkingday(rs.getInt("WorkingDay"));
                
                String country = rs.getString("Country");
                enterprise.setCountry(rs.wasNull() ? null : country);
                
                enterprise.setAccountId(rs.getString("AccountId"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return enterprise;
    }
    
//    public EnterprisesClone getEnterprisesCloneByAccountId(String accountId) {
//        EnterprisesClone enterprise = null;
//        String sql = "SELECT * FROM EnterprisesClone WHERE AccountId = ?;";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, accountId);
//            ResultSet rs = st.executeQuery();
//            if (rs.next()) {
//                enterprise = new EnterprisesClone();
//                enterprise.setId(rs.getInt("Id"));
//                enterprise.setShortName(rs.getString("ShortName"));
//                enterprise.setFullCompanyName(rs.getString("FullCompanyName"));
//                enterprise.setLogoUrl(rs.getString("LogoUrl"));
//                enterprise.setFoundedYear(rs.getInt("FoundedYear"));
//                
//                int enterpriseSizeId = rs.getInt("EnterpriseSizeId");
//                EnterpriseSizeDetailDAO enterpriseSizeDetailDAO = new EnterpriseSizeDetailDAO();
//                EnterpriseSizeDetail enterpriseSizeDetail = enterpriseSizeDetailDAO.getEnterpriseSizeDetailById(enterpriseSizeId);
//                enterprise.setEnterpriseSizeDetail(enterpriseSizeDetail);
//                
//                enterprise.setTaxCode(rs.getString("TaxCode"));
//                enterprise.setBusinessLicenseFront(rs.getString("BusinessLicenseFront"));
//                enterprise.setBusinessLicenseBack(rs.getString("BusinessLicenseBack"));
//                String websiteUrl = rs.getString("WebsiteUrl");
//                enterprise.setWebsiteUrl(rs.wasNull() ? null : websiteUrl);
//                
//                String facebookUrl = rs.getString("FacebookUrl");
//                enterprise.setFacebookUrl(rs.wasNull() ? null : facebookUrl);
//                
//                String phoneContact = rs.getString("PhoneContact");
//                enterprise.setPhoneContact(rs.wasNull() ? null : phoneContact);
//                enterprise.setEmailContact(rs.getString("EmailContact"));
//                
//                String imageUrl = rs.getString("ImageUrl");
//                enterprise.setImageUrl(rs.wasNull() ? null : imageUrl);
//                
//                String description = rs.getString("Description");
//                enterprise.setDescription(rs.wasNull() ? null : description);
//                
//                String address = rs.getString("Address");
//                enterprise.setAddress(rs.wasNull() ? null : address);
//                int companyTypeId = rs.getInt("CompanyTypeId");
//                CompanyTypeDetailDAO companyTypeDetailDAO = new CompanyTypeDetailDAO();
//                CompanyTypeDetail companyTypeDetail = companyTypeDetailDAO.getCompanyTypeDetailById(companyTypeId);
//                enterprise.setCompanyTypeDetail(companyTypeDetail);
//                
//                enterprise.setWorkingday(rs.getInt("WorkingDay"));
//                
//                String country = rs.getString("Country");
//                enterprise.setCountry(rs.wasNull() ? null : country);
//                
//                enterprise.setAccountId(rs.getString("AccountId"));
//                enterprise.setStatus(rs.getInt("Status"));
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return enterprise;
//    }
    
    public int countEnterprisesBySizeId(int sizeId) {
        String sql = "SELECT COUNT(*) AS enterpriseCount FROM Enterprises WHERE EnterpriseSizeId = ?;";
        int count = 0;
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, sizeId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("enterpriseCount");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
        
    }
    
    public int getTotalEnterprisesCount() {
        int totalEnterprises = 0;
        String sql = "SELECT COUNT(*) AS total FROM Enterprises;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                totalEnterprises = rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalEnterprises;
    }
    
    public List<Enterprise> searchEnterprisesWithMultipleCriteria(String keyword, String location, String[] enterpriseSizes) {
        List<Enterprise> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM Enterprises WHERE 1=1");
        
        List<Object> parameters = new ArrayList<>();

        // Keyword search in company name, description, etc.
        if (keyword != null && !keyword.isEmpty()) {
            sql.append(" AND (ShortName LIKE ? OR FullCompanyName LIKE ? OR Description LIKE ? OR Country LIKE ?)");
            for (int i = 0; i < 4; i++) {
                parameters.add("%" + keyword + "%");
            }
        }

        // Location search
        if (location != null && !location.isEmpty()) {
            sql.append(" AND Address LIKE ?");
            parameters.add("%" + location + "%");
        }

        // Company size search
        if (enterpriseSizes != null && enterpriseSizes.length > 0) {
            sql.append(" AND EnterpriseSizeId IN (");
            sql.append(String.join(",", Collections.nCopies(enterpriseSizes.length, "?")));
            sql.append(")");
            for (String sizeId : enterpriseSizes) {
                parameters.add(Integer.parseInt(sizeId));
            }
        }
        
        try {
            PreparedStatement st = connection.prepareStatement(sql.toString());
            
            int index = 1;
            for (Object param : parameters) {
                st.setObject(index++, param);
            }
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Enterprise enterprise = new Enterprise();
                enterprise.setId(rs.getInt("Id"));
                enterprise.setShortName(rs.getString("ShortName"));
                enterprise.setFullCompanyName(rs.getString("FullCompanyName"));
                enterprise.setLogoUrl(rs.getString("LogoUrl"));
                enterprise.setFoundedYear(rs.getInt("FoundedYear"));
                
                int enterpriseSizeId = rs.getInt("EnterpriseSizeId");
                EnterpriseSizeDetailDAO enterpriseSizeDetailDAO = new EnterpriseSizeDetailDAO();
                EnterpriseSizeDetail enterpriseSizeDetail = enterpriseSizeDetailDAO.getEnterpriseSizeDetailById(enterpriseSizeId);
                enterprise.setEnterpriseSizeDetail(enterpriseSizeDetail);
                
                enterprise.setTaxCode(rs.getString("TaxCode"));
                enterprise.setBusinessLicenseFront(rs.getString("BusinessLicenseFront"));
                enterprise.setBusinessLicenseBack(rs.getString("BusinessLicenseBack"));
                String websiteUrl = rs.getString("WebsiteUrl");
                enterprise.setWebsiteUrl(rs.wasNull() ? null : websiteUrl);
                
                String facebookUrl = rs.getString("FacebookUrl");
                enterprise.setFacebookUrl(rs.wasNull() ? null : facebookUrl);
                
                String phoneContact = rs.getString("PhoneContact");
                enterprise.setPhoneContact(rs.wasNull() ? null : phoneContact);
                enterprise.setEmailContact(rs.getString("EmailContact"));
                
                String imageUrl = rs.getString("ImageUrl");
                enterprise.setImageUrl(rs.wasNull() ? null : imageUrl);
                
                String description = rs.getString("Description");
                enterprise.setDescription(rs.wasNull() ? null : description);
                
                String address = rs.getString("Address");
                enterprise.setAddress(rs.wasNull() ? null : address);
                int companyTypeId = rs.getInt("CompanyTypeId");
                CompanyTypeDetailDAO companyTypeDetailDAO = new CompanyTypeDetailDAO();
                CompanyTypeDetail companyTypeDetail = companyTypeDetailDAO.getCompanyTypeDetailById(companyTypeId);
                enterprise.setCompanyTypeDetail(companyTypeDetail);
                
                enterprise.setWorkingday(rs.getInt("WorkingDay"));
                
                String country = rs.getString("Country");
                enterprise.setCountry(rs.wasNull() ? null : country);
                
                String accountId = rs.getString("AccountId");
                
                list.add(enterprise);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public static String normalizeString(String input) {
        String normalized = Normalizer.normalize(input, Normalizer.Form.NFD);
        String withoutDiacritics = normalized.replaceAll("[\\p{InCombiningDiacriticalMarks}]", "");
        return withoutDiacritics.replaceAll("[^\\p{Alnum}\\s]", "").toLowerCase().replace(" ", "");
    }
    
    public List<Enterprise> searchEnterprisesWithMultipleCriteria(String keyword, String location, String[] enterpriseSizes, int pageIndex, int pageSize) {
        List<Enterprise> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM Enterprises WHERE 1=1");
        
        List<Object> parameters = new ArrayList<>();
        
        if (keyword != null && !keyword.isEmpty()) {
            sql.append(" AND (ShortName LIKE ? OR FullCompanyName LIKE ? OR Description LIKE ? OR Country LIKE ?)");
            for (int i = 0; i < 4; i++) {
                parameters.add("%" + keyword + "%");
            }
        }

        // Location search
        if (location != null && !location.isEmpty()) {
            String normalizedLocation = normalizeString(location);
            sql.append(" AND LOWER(REPLACE(Address, ' ', '')) LIKE LOWER(REPLACE(?, ' ', ''))");
            parameters.add("%" + normalizedLocation + "%");
        }

        // Company size search
        if (enterpriseSizes != null && enterpriseSizes.length > 0) {
            sql.append(" AND EnterpriseSizeId IN (");
            sql.append(String.join(",", Collections.nCopies(enterpriseSizes.length, "?")));
            sql.append(")");
            for (String sizeId : enterpriseSizes) {
                parameters.add(Integer.parseInt(sizeId));
            }
        }

        // Calculate offset for pagination
        int offset = (pageIndex - 1) * pageSize;
        sql.append(" ORDER BY Id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;");
        parameters.add(offset);
        parameters.add(pageSize);
        
        try {
            PreparedStatement st = connection.prepareStatement(sql.toString());
            
            int index = 1;
            for (Object param : parameters) {
                st.setObject(index++, param);
            }
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Enterprise enterprise = new Enterprise();
                enterprise.setId(rs.getInt("Id"));
                enterprise.setShortName(rs.getString("ShortName"));
                enterprise.setFullCompanyName(rs.getString("FullCompanyName"));
                enterprise.setLogoUrl(rs.getString("LogoUrl"));
                enterprise.setFoundedYear(rs.getInt("FoundedYear"));
                
                int enterpriseSizeId = rs.getInt("EnterpriseSizeId");
                EnterpriseSizeDetailDAO enterpriseSizeDetailDAO = new EnterpriseSizeDetailDAO();
                EnterpriseSizeDetail enterpriseSizeDetail = enterpriseSizeDetailDAO.getEnterpriseSizeDetailById(enterpriseSizeId);
                enterprise.setEnterpriseSizeDetail(enterpriseSizeDetail);
                
                enterprise.setTaxCode(rs.getString("TaxCode"));
                enterprise.setBusinessLicenseFront(rs.getString("BusinessLicenseFront"));
                enterprise.setBusinessLicenseBack(rs.getString("BusinessLicenseBack"));
                String websiteUrl = rs.getString("WebsiteUrl");
                enterprise.setWebsiteUrl(rs.wasNull() ? null : websiteUrl);
                
                String facebookUrl = rs.getString("FacebookUrl");
                enterprise.setFacebookUrl(rs.wasNull() ? null : facebookUrl);
                
                String phoneContact = rs.getString("PhoneContact");
                enterprise.setPhoneContact(rs.wasNull() ? null : phoneContact);
                enterprise.setEmailContact(rs.getString("EmailContact"));
                
                String imageUrl = rs.getString("ImageUrl");
                enterprise.setImageUrl(rs.wasNull() ? null : imageUrl);
                
                String description = rs.getString("Description");
                enterprise.setDescription(rs.wasNull() ? null : description);
                
                String address = rs.getString("Address");
                enterprise.setAddress(rs.wasNull() ? null : address);
                int companyTypeId = rs.getInt("CompanyTypeId");
                CompanyTypeDetailDAO companyTypeDetailDAO = new CompanyTypeDetailDAO();
                CompanyTypeDetail companyTypeDetail = companyTypeDetailDAO.getCompanyTypeDetailById(companyTypeId);
                enterprise.setCompanyTypeDetail(companyTypeDetail);
                
                enterprise.setWorkingday(rs.getInt("WorkingDay"));
                
                String country = rs.getString("Country");
                enterprise.setCountry(rs.wasNull() ? null : country);
                
                String accountId = rs.getString("AccountId");
                
                list.add(enterprise);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public int countEnterprisesWithCriteria(String keyword, String location, String[] enterpriseSizes) {
        int count = 0;
        StringBuilder sql = new StringBuilder("SELECT COUNT(*) as EnterpriseCount FROM Enterprises WHERE 1=1");
        List<Object> parameters = new ArrayList<>();

        // Keyword search in company name, description, etc.
        if (keyword != null && !keyword.isEmpty()) {
            sql.append(" AND (ShortName LIKE ? OR FullCompanyName LIKE ? OR Description LIKE ? OR Country LIKE ?)");
            for (int i = 0; i < 4; i++) {
                parameters.add("%" + keyword + "%");
            }
        }

        // Location search
        if (location != null && !location.isEmpty()) {
            sql.append(" AND Address LIKE ?");
            parameters.add("%" + location + "%");
        }

        // Company size search
        if (enterpriseSizes != null && enterpriseSizes.length > 0) {
            sql.append(" AND EnterpriseSizeId IN (");
            sql.append(String.join(",", Collections.nCopies(enterpriseSizes.length, "?")));
            sql.append(")");
            for (String sizeId : enterpriseSizes) {
                parameters.add(Integer.parseInt(sizeId));
            }
        }
        
        try {
            PreparedStatement st = connection.prepareStatement(sql.toString());
            int index = 1;
            for (Object param : parameters) {
                st.setObject(index++, param);
            }
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("EnterpriseCount");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return count;
    }
    
    public List<Enterprise> getEnterprisesSorted(String sortOrder) {
        List<Enterprise> list = new ArrayList<>();
        String orderBy = "";
        
        if ("asc".equalsIgnoreCase(sortOrder)) {
            orderBy = "ORDER BY ShortName ASC";
        } else if ("desc".equalsIgnoreCase(sortOrder)) {
            orderBy = "ORDER BY ShortName DESC";
        }
        
        String sql = "SELECT * FROM Enterprises " + orderBy;
        
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Enterprise enterprise = new Enterprise();
                enterprise.setId(rs.getInt("Id"));
                enterprise.setShortName(rs.getString("ShortName"));
                enterprise.setFullCompanyName(rs.getString("FullCompanyName"));
                enterprise.setLogoUrl(rs.getString("LogoUrl"));
                enterprise.setFoundedYear(rs.getInt("FoundedYear"));
                
                int enterpriseSizeId = rs.getInt("EnterpriseSizeId");
                EnterpriseSizeDetailDAO enterpriseSizeDetailDAO = new EnterpriseSizeDetailDAO();
                EnterpriseSizeDetail enterpriseSizeDetail = enterpriseSizeDetailDAO.getEnterpriseSizeDetailById(enterpriseSizeId);
                enterprise.setEnterpriseSizeDetail(enterpriseSizeDetail);
                
                enterprise.setTaxCode(rs.getString("TaxCode"));
                enterprise.setBusinessLicenseFront(rs.getString("BusinessLicenseFront"));
                enterprise.setBusinessLicenseBack(rs.getString("BusinessLicenseBack"));
                String websiteUrl = rs.getString("WebsiteUrl");
                enterprise.setWebsiteUrl(rs.wasNull() ? null : websiteUrl);
                
                String facebookUrl = rs.getString("FacebookUrl");
                enterprise.setFacebookUrl(rs.wasNull() ? null : facebookUrl);
                
                String phoneContact = rs.getString("PhoneContact");
                enterprise.setPhoneContact(rs.wasNull() ? null : phoneContact);
                enterprise.setEmailContact(rs.getString("EmailContact"));
                
                String imageUrl = rs.getString("ImageUrl");
                enterprise.setImageUrl(rs.wasNull() ? null : imageUrl);
                
                String description = rs.getString("Description");
                enterprise.setDescription(rs.wasNull() ? null : description);
                
                String address = rs.getString("Address");
                enterprise.setAddress(rs.wasNull() ? null : address);
                int companyTypeId = rs.getInt("CompanyTypeId");
                CompanyTypeDetailDAO companyTypeDetailDAO = new CompanyTypeDetailDAO();
                CompanyTypeDetail companyTypeDetail = companyTypeDetailDAO.getCompanyTypeDetailById(companyTypeId);
                enterprise.setCompanyTypeDetail(companyTypeDetail);
                
                enterprise.setWorkingday(rs.getInt("WorkingDay"));
                
                String country = rs.getString("Country");
                enterprise.setCountry(rs.wasNull() ? null : country);
                
                String accountId = rs.getString("AccountId");
                
                list.add(enterprise);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Enterprise> getEnterprisesSortedWithPagination(String sortOrder, int pageIndex, int pageSize) {
        List<Enterprise> list = new ArrayList<>();
        String orderBy = "";
        
        if ("asc".equalsIgnoreCase(sortOrder)) {
            orderBy = "ORDER BY ShortName ASC";
        } else if ("desc".equalsIgnoreCase(sortOrder)) {
            orderBy = "ORDER BY ShortName DESC";
        }
        
        int offset = (pageIndex - 1) * pageSize;
        
        String sql = "SELECT * FROM Enterprises " + orderBy + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, offset);
            st.setInt(2, pageSize);
            ResultSet rs = st.executeQuery();
            
            while (rs.next()) {
                Enterprise enterprise = new Enterprise();
                enterprise.setId(rs.getInt("Id"));
                enterprise.setShortName(rs.getString("ShortName"));
                enterprise.setFullCompanyName(rs.getString("FullCompanyName"));
                enterprise.setLogoUrl(rs.getString("LogoUrl"));
                enterprise.setFoundedYear(rs.getInt("FoundedYear"));
                
                int enterpriseSizeId = rs.getInt("EnterpriseSizeId");
                EnterpriseSizeDetailDAO enterpriseSizeDetailDAO = new EnterpriseSizeDetailDAO();
                EnterpriseSizeDetail enterpriseSizeDetail = enterpriseSizeDetailDAO.getEnterpriseSizeDetailById(enterpriseSizeId);
                enterprise.setEnterpriseSizeDetail(enterpriseSizeDetail);
                
                enterprise.setTaxCode(rs.getString("TaxCode"));
                enterprise.setBusinessLicenseFront(rs.getString("BusinessLicenseFront"));
                enterprise.setBusinessLicenseBack(rs.getString("BusinessLicenseBack"));
                String websiteUrl = rs.getString("WebsiteUrl");
                enterprise.setWebsiteUrl(rs.wasNull() ? null : websiteUrl);
                
                String facebookUrl = rs.getString("FacebookUrl");
                enterprise.setFacebookUrl(rs.wasNull() ? null : facebookUrl);
                
                String phoneContact = rs.getString("PhoneContact");
                enterprise.setPhoneContact(rs.wasNull() ? null : phoneContact);
                enterprise.setEmailContact(rs.getString("EmailContact"));
                
                String imageUrl = rs.getString("ImageUrl");
                enterprise.setImageUrl(rs.wasNull() ? null : imageUrl);
                
                String description = rs.getString("Description");
                enterprise.setDescription(rs.wasNull() ? null : description);
                
                String address = rs.getString("Address");
                enterprise.setAddress(rs.wasNull() ? null : address);
                int companyTypeId = rs.getInt("CompanyTypeId");
                CompanyTypeDetailDAO companyTypeDetailDAO = new CompanyTypeDetailDAO();
                CompanyTypeDetail companyTypeDetail = companyTypeDetailDAO.getCompanyTypeDetailById(companyTypeId);
                enterprise.setCompanyTypeDetail(companyTypeDetail);
                
                enterprise.setWorkingday(rs.getInt("WorkingDay"));
                
                String country = rs.getString("Country");
                enterprise.setCountry(rs.wasNull() ? null : country);
                
                String accountId = rs.getString("AccountId");
                
                list.add(enterprise);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public void updateEnterpriseProfile(EnterprisesClone newE) {
        String sql = "UPDATE [dbo].[Enterprises]\n"
                + "   SET [ShortName] = ?\n"
                + "      ,[FullCompanyName] = ?\n"
                + "      ,[LogoUrl] = ?\n"
                + "      ,[FoundedYear] = ?\n"
                + "      ,[EnterpriseSizeId] = ?\n"
                + "      ,[TaxCode] = ?\n"
                + "      ,[BusinessLicenseFront] = ?\n"
                + "      ,[BusinessLicenseBack] = ?\n"
                + "      ,[WebsiteUrl] = ?\n"
                + "      ,[FacebookUrl] = ?\n"
                + "      ,[PhoneContact] = ?\n"
                + "      ,[EmailContact] = ?\n"
                + "      ,[ImageUrl] = ?\n"
                + "      ,[Description] = ?\n"
                + "      ,[Address] = ?\n"
                + "      ,[CompanyTypeId] = ?\n"
                + "      ,[WorkingDay] = ?\n"
                + "      ,[Country] = ?\n"
                + " WHERE [AccountId] = ?";
        
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, newE.getShortName()); // update shortName;
            preparedStatement.setString(2, newE.getFullCompanyName());    // update fullcompanyname
            preparedStatement.setString(3, newE.getLogoUrl()); // update logourl
            preparedStatement.setInt(4, newE.getFoundedYear()); // update founded year
            preparedStatement.setInt(5, newE.getEnterpriseSizeDetail().getId()); // update enterprisesizeid
            preparedStatement.setString(6, newE.getTaxCode()); // update taxcode
            preparedStatement.setString(7, newE.getBusinessLicenseFront()); // update lisence front
            preparedStatement.setString(8, newE.getBusinessLicenseBack()); // update lisence back
            preparedStatement.setString(9, newE.getWebsiteUrl()); // update website url
            preparedStatement.setString(10, newE.getFacebookUrl()); // update facebook url
            preparedStatement.setString(11, newE.getPhoneContact()); // update phone contact
            preparedStatement.setString(12, newE.getEmailContact()); // update email contact
            preparedStatement.setString(13, newE.getImageUrl()); // update image url
            preparedStatement.setString(14, newE.getDescription()); // update description
            preparedStatement.setString(15, newE.getAddress()); // update address
            preparedStatement.setInt(16, newE.getCompanyTypeDetail().getId()); // update companytypeid
            preparedStatement.setInt(17, newE.getWorkingday()); // update working day
            preparedStatement.setString(18, newE.getCountry()); // update country
            preparedStatement.setString(19, newE.getAccountId()); // update accountid
            preparedStatement.execute();
            
        } catch (Exception e) {
        }
    }

    // get list in EnterprisesClone
    public List<EnterprisesClone> getEnterprisesCloneSortedWithPagination(int pageIndex, int pageSize) {
        List<EnterprisesClone> list = new ArrayList<>();
        String orderBy = "";
        
        orderBy = "ORDER BY Status ASC";
        
        int offset = (pageIndex - 1) * pageSize;
        
        String sql = "SELECT * FROM EnterprisesClone " + orderBy + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, offset);
            st.setInt(2, pageSize);
            ResultSet rs = st.executeQuery();
            
            while (rs.next()) {
                EnterprisesClone enterprise = new EnterprisesClone();
                enterprise.setId(rs.getInt("Id"));
                enterprise.setShortName(rs.getString("ShortName"));
                enterprise.setFullCompanyName(rs.getString("FullCompanyName"));
                enterprise.setLogoUrl(rs.getString("LogoUrl"));
                enterprise.setFoundedYear(rs.getInt("FoundedYear"));
                
                int enterpriseSizeId = rs.getInt("EnterpriseSizeId");
                EnterpriseSizeDetailDAO enterpriseSizeDetailDAO = new EnterpriseSizeDetailDAO();
                EnterpriseSizeDetail enterpriseSizeDetail = enterpriseSizeDetailDAO.getEnterpriseSizeDetailById(enterpriseSizeId);
                enterprise.setEnterpriseSizeDetail(enterpriseSizeDetail);
                
                enterprise.setTaxCode(rs.getString("TaxCode"));
                enterprise.setBusinessLicenseFront(rs.getString("BusinessLicenseFront"));
                enterprise.setBusinessLicenseBack(rs.getString("BusinessLicenseBack"));
                String websiteUrl = rs.getString("WebsiteUrl");
                enterprise.setWebsiteUrl(rs.wasNull() ? null : websiteUrl);
                
                String facebookUrl = rs.getString("FacebookUrl");
                enterprise.setFacebookUrl(rs.wasNull() ? null : facebookUrl);
                
                String phoneContact = rs.getString("PhoneContact");
                enterprise.setPhoneContact(rs.wasNull() ? null : phoneContact);
                enterprise.setEmailContact(rs.getString("EmailContact"));
                
                String imageUrl = rs.getString("ImageUrl");
                enterprise.setImageUrl(rs.wasNull() ? null : imageUrl);
                
                String description = rs.getString("Description");
                enterprise.setDescription(rs.wasNull() ? null : description);
                
                String address = rs.getString("Address");
                enterprise.setAddress(rs.wasNull() ? null : address);
                int companyTypeId = rs.getInt("CompanyTypeId");
                CompanyTypeDetailDAO companyTypeDetailDAO = new CompanyTypeDetailDAO();
                CompanyTypeDetail companyTypeDetail = companyTypeDetailDAO.getCompanyTypeDetailById(companyTypeId);
                enterprise.setCompanyTypeDetail(companyTypeDetail);
                
                enterprise.setWorkingday(rs.getInt("WorkingDay"));
                
                String country = rs.getString("Country");
                enterprise.setCountry(rs.wasNull() ? null : country);
                
                String accountId = rs.getString("AccountId");
                enterprise.setAccountId(accountId);
                enterprise.setStatus(rs.getInt("Status"));
                list.add(enterprise);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    //find EnterprisesClone
    public EnterprisesClone getEnterprisesCloneByAccountId(String accountId) {
        EnterprisesClone enterprise = null;
        String sql = "SELECT * FROM EnterprisesClone WHERE AccountId = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, accountId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                enterprise = new EnterprisesClone();
                enterprise.setId(rs.getInt("Id"));
                enterprise.setShortName(rs.getString("ShortName"));
                enterprise.setFullCompanyName(rs.getString("FullCompanyName"));
                enterprise.setLogoUrl(rs.getString("LogoUrl"));
                enterprise.setFoundedYear(rs.getInt("FoundedYear"));
                
                int enterpriseSizeId = rs.getInt("EnterpriseSizeId");
                EnterpriseSizeDetailDAO enterpriseSizeDetailDAO = new EnterpriseSizeDetailDAO();
                EnterpriseSizeDetail enterpriseSizeDetail = enterpriseSizeDetailDAO.getEnterpriseSizeDetailById(enterpriseSizeId);
                enterprise.setEnterpriseSizeDetail(enterpriseSizeDetail);
                
                enterprise.setTaxCode(rs.getString("TaxCode"));
                enterprise.setBusinessLicenseFront(rs.getString("BusinessLicenseFront"));
                enterprise.setBusinessLicenseBack(rs.getString("BusinessLicenseBack"));
                String websiteUrl = rs.getString("WebsiteUrl");
                enterprise.setWebsiteUrl(rs.wasNull() ? null : websiteUrl);
                
                String facebookUrl = rs.getString("FacebookUrl");
                enterprise.setFacebookUrl(rs.wasNull() ? null : facebookUrl);
                
                String phoneContact = rs.getString("PhoneContact");
                enterprise.setPhoneContact(rs.wasNull() ? null : phoneContact);
                enterprise.setEmailContact(rs.getString("EmailContact"));
                
                String imageUrl = rs.getString("ImageUrl");
                enterprise.setImageUrl(rs.wasNull() ? null : imageUrl);
                
                String description = rs.getString("Description");
                enterprise.setDescription(rs.wasNull() ? null : description);
                
                String address = rs.getString("Address");
                enterprise.setAddress(rs.wasNull() ? null : address);
                int companyTypeId = rs.getInt("CompanyTypeId");
                CompanyTypeDetailDAO companyTypeDetailDAO = new CompanyTypeDetailDAO();
                CompanyTypeDetail companyTypeDetail = companyTypeDetailDAO.getCompanyTypeDetailById(companyTypeId);
                enterprise.setCompanyTypeDetail(companyTypeDetail);
                
                enterprise.setWorkingday(rs.getInt("WorkingDay"));
                
                String country = rs.getString("Country");
                enterprise.setCountry(rs.wasNull() ? null : country);
                
                enterprise.setAccountId(rs.getString("AccountId"));
                enterprise.setStatus(rs.getInt("Status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return enterprise;
    }

    // update EnterprisesClone 
    public void updateEnterprisesCloneProfile(EnterprisesClone newE) {
        String sql = "UPDATE [dbo].[EnterprisesClone]\n"
                + "   SET [ShortName] = ?\n"
                + "      ,[FullCompanyName] = ?\n"
                + "      ,[LogoUrl] = ?\n"
                + "      ,[FoundedYear] = ?\n"
                + "      ,[EnterpriseSizeId] = ?\n"
                + "      ,[TaxCode] = ?\n"
                + "      ,[BusinessLicenseFront] = ?\n"
                + "      ,[BusinessLicenseBack] = ?\n"
                + "      ,[WebsiteUrl] = ?\n"
                + "      ,[FacebookUrl] = ?\n"
                + "      ,[PhoneContact] = ?\n"
                + "      ,[EmailContact] = ?\n"
                + "      ,[ImageUrl] = ?\n"
                + "      ,[Description] = ?\n"
                + "      ,[Address] = ?\n"
                + "      ,[CompanyTypeId] = ?\n"
                + "      ,[WorkingDay] = ?\n"
                + "      ,[Country] = ?\n"
                + "      ,[Status] = ?\n"
                + " WHERE [AccountId] = ?";
        
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, newE.getShortName()); // update shortName;
            preparedStatement.setString(2, newE.getFullCompanyName());    // update fullcompanyname
            preparedStatement.setString(3, newE.getLogoUrl()); // update logourl
            preparedStatement.setInt(4, newE.getFoundedYear()); // update founded year
            preparedStatement.setInt(5, newE.getEnterpriseSizeDetail().getId()); // update enterprisesizeid
            preparedStatement.setString(6, newE.getTaxCode()); // update taxcode
            preparedStatement.setString(7, newE.getBusinessLicenseFront()); // update lisence front
            preparedStatement.setString(8, newE.getBusinessLicenseBack()); // update lisence back
            preparedStatement.setString(9, newE.getWebsiteUrl()); // update website url
            preparedStatement.setString(10, newE.getFacebookUrl()); // update facebook url
            preparedStatement.setString(11, newE.getPhoneContact()); // update phone contact
            preparedStatement.setString(12, newE.getEmailContact()); // update email contact
            preparedStatement.setString(13, newE.getImageUrl()); // update image url
            preparedStatement.setString(14, newE.getDescription()); // update description
            preparedStatement.setString(15, newE.getAddress()); // update address
            preparedStatement.setInt(16, newE.getCompanyTypeDetail().getId()); // update companytypeid
            preparedStatement.setInt(17, newE.getWorkingday()); // update working day
            preparedStatement.setString(18, newE.getCountry()); // update country
            preparedStatement.setInt(19, newE.getStatus());// update status
            preparedStatement.setString(20, newE.getAccountId()); // update accountid
            preparedStatement.execute();
            
        } catch (Exception e) {
        }
    }
    
    public EnterprisesClone getEnterprisesCloneById(int id) {
        EnterprisesClone enterprise = null;
        String sql = "SELECT * FROM EnterprisesClone WHERE Id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                enterprise = new EnterprisesClone();
                enterprise.setId(rs.getInt("Id"));
                enterprise.setShortName(rs.getString("ShortName"));
                enterprise.setFullCompanyName(rs.getString("FullCompanyName"));
                enterprise.setLogoUrl(rs.getString("LogoUrl"));
                enterprise.setFoundedYear(rs.getInt("FoundedYear"));
                int enterpriseSizeId = rs.getInt("EnterpriseSizeId");
                EnterpriseSizeDetailDAO enterpriseSizeDetailDAO = new EnterpriseSizeDetailDAO();
                EnterpriseSizeDetail enterpriseSizeDetail = enterpriseSizeDetailDAO.getEnterpriseSizeDetailById(enterpriseSizeId);
                enterprise.setEnterpriseSizeDetail(enterpriseSizeDetail);
                enterprise.setTaxCode(rs.getString("TaxCode"));
                enterprise.setBusinessLicenseFront(rs.getString("BusinessLicenseFront"));
                enterprise.setBusinessLicenseBack(rs.getString("BusinessLicenseBack"));
                String websiteUrl = rs.getString("WebsiteUrl");
                enterprise.setWebsiteUrl(rs.wasNull() ? null : websiteUrl);
                String facebookUrl = rs.getString("FacebookUrl");
                enterprise.setFacebookUrl(rs.wasNull() ? null : facebookUrl);
                String phoneContact = rs.getString("PhoneContact");
                enterprise.setPhoneContact(rs.wasNull() ? null : phoneContact);
                enterprise.setEmailContact(rs.getString("EmailContact"));
                String imageUrl = rs.getString("ImageUrl");
                enterprise.setImageUrl(rs.wasNull() ? null : imageUrl);
                String description = rs.getString("Description");
                enterprise.setDescription(rs.wasNull() ? null : description);
                String address = rs.getString("Address");
                enterprise.setAddress(rs.wasNull() ? null : address);
                int companyTypeId = rs.getInt("CompanyTypeId");
                CompanyTypeDetailDAO companyTypeDetailDAO = new CompanyTypeDetailDAO();
                CompanyTypeDetail companyTypeDetail = companyTypeDetailDAO.getCompanyTypeDetailById(companyTypeId);
                enterprise.setCompanyTypeDetail(companyTypeDetail);
                enterprise.setWorkingday(rs.getInt("WorkingDay"));
                String country = rs.getString("Country");
                enterprise.setCountry(rs.wasNull() ? null : country);
                String accountId = rs.getString("AccountId");
                enterprise.setAccountId(accountId);
                enterprise.setStatus(rs.getInt("Status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return enterprise;
    }
    public int countEnterprise() {
        String sql = "select count(*) as countEnterprise from Enterprises";
        int count = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("countEnterprise");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
}
