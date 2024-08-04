
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Account;
import Model.Enterprise;
import Model.EnterprisesClone;
import Model.JobSeeker;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.ArrayList;
import java.util.Spliterator;

/**
 *
 * @author admin
 */
public class AccountDAO extends DBContext {

    public ArrayList<Account> getAllAccount() {
        ArrayList<Account> list = new ArrayList<>();
        String sql = "SELECT * FROM Accounts";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account acc = new Account();
                acc.setUsername(rs.getString("Username"));
                acc.setPassword(rs.getString("Password"));
                acc.setUpdatedTime(rs.getTimestamp("UpdatedTime"));
                acc.setDeletedTime(rs.getTimestamp("DeletedTime"));
                acc.setLastActiveTime(rs.getTimestamp("LastActiveTime"));
                acc.setStatusId(rs.getInt("StatusId"));
                acc.setRoleId(rs.getInt("RoleId"));
                acc.setPlanId(rs.getInt("PlanId"));
                list.add(acc);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Account getAccountByUsername(String username) {
        String sql = "SELECT * FROM Accounts WHERE Username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account account = new Account();
                account.setCreatedTime(rs.getTimestamp("CreatedTime"));

                Timestamp updatedTime = rs.getTimestamp("UpdatedTime");
                account.setUpdatedTime(rs.wasNull() ? null : updatedTime);

                Timestamp deletedTime = rs.getTimestamp("DeletedTime");
                account.setDeletedTime(rs.wasNull() ? null : deletedTime);

                account.setStatusId(rs.getInt("StatusId"));
                account.setRoleId(rs.getInt("RoleId"));
                account.setPlanId(rs.getInt("PlanId"));

                Timestamp lastActiveTime = rs.getTimestamp("LastActiveTime");
                account.setLastActiveTime(rs.wasNull() ? null : lastActiveTime);

                account.setUsername(rs.getString("Username"));

                String password = rs.getString("Password");
                account.setPassword(rs.wasNull() ? null : password);

                return account;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insertAccount(Account account) {
        String sql = "INSERT INTO Accounts (CreatedTime, UpdatedTime, DeletedTime, StatusId, RoleId, PlanId, LastActiveTime, Username, Password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setTimestamp(1, account.getCreatedTime());
            if (account.getUpdatedTime() != null) {
                st.setTimestamp(2, account.getUpdatedTime());
            } else {
                st.setNull(2, java.sql.Types.DATE);
            }
            if (account.getDeletedTime() != null) {
                st.setTimestamp(2, account.getDeletedTime());
            } else {
                st.setNull(3, java.sql.Types.DATE);
            }
            st.setInt(4, account.getStatusId());
            st.setInt(5, account.getRoleId());
            st.setInt(6, account.getPlanId());
            st.setTimestamp(7, account.getLastActiveTime());
            st.setString(8, account.getUsername());
            if (account.getPassword() != null) {
                st.setString(9, account.getPassword());
            } else {
                st.setNull(9, java.sql.Types.NVARCHAR);
            }
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean updateAccountLastActiveTime(Account account) {
        String sql = "UPDATE Accounts SET LastActiveTime = ? WHERE Username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setTimestamp(1, account.getLastActiveTime());
            st.setString(2, account.getUsername());
            int rowsUpdated = st.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Account getAccountUser(String username, String password) {
        String sql = "SELECT * from Accounts where Username = ? AND Password = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                Account account = new Account();
                account.setCreatedTime(rs.getTimestamp("CreatedTime"));

                Timestamp updatedTime = rs.getTimestamp("UpdatedTime");
                account.setUpdatedTime(rs.wasNull() ? null : updatedTime);

                Timestamp deletedTime = rs.getTimestamp("DeletedTime");
                account.setDeletedTime(rs.wasNull() ? null : deletedTime);

                account.setStatusId(rs.getInt("StatusId"));
                account.setRoleId(rs.getInt("RoleId"));
                account.setPlanId(rs.getInt("PlanId"));

                Timestamp lastActiveTime = rs.getTimestamp("LastActiveTime");
                account.setLastActiveTime(rs.wasNull() ? null : lastActiveTime);

                account.setUsername(rs.getString("Username"));

                account.setPassword(rs.wasNull() ? null : password);

                return account;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public void updatePassword(String password, String email) {
        String query = " UPDATE [dbo].[Accounts] SET [Password] = ? WHERE [Username] = ? ";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, password);
            preparedStatement.setString(2, email);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void registerAccount(Account account, String fullName, String email, int gender) {
        String sql = "INSERT INTO Accounts (CreatedTime, UpdatedTime, DeletedTime, StatusId, RoleId, PlanId, LastActiveTime, Username, Password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setTimestamp(1, account.getCreatedTime());
            if (account.getUpdatedTime() != null) {
                st.setTimestamp(2, account.getUpdatedTime());
            } else {
                st.setNull(2, java.sql.Types.DATE);
            }
            if (account.getDeletedTime() != null) {
                st.setTimestamp(2, account.getDeletedTime());
            } else {
                st.setNull(3, java.sql.Types.DATE);
            }
            st.setInt(4, account.getStatusId());
            st.setInt(5, account.getRoleId());
            st.setInt(6, account.getPlanId());
            st.setTimestamp(7, account.getLastActiveTime());
            st.setString(8, account.getUsername());
            if (account.getPassword() != null) {
                st.setString(9, account.getPassword());
            } else {
                st.setNull(9, java.sql.Types.NVARCHAR);
            }
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        sql = "DECLARE @NewId INT;\n"
                + "SELECT TOP 1 @NewId = Id + 1\n"
                + "FROM [dbo].[JobSeekers] AS J1\n"
                + "WHERE NOT EXISTS (\n"
                + "    SELECT 1\n"
                + "    FROM [dbo].[JobSeekers] AS J2\n"
                + "    WHERE J2.Id = J1.Id + 1\n"
                + ")\n"
                + "ORDER BY J1.Id;\n"
                + "IF @NewId IS NULL\n"
                + "    SET @NewId = (SELECT ISNULL(MAX(Id) + 1, 1) FROM [dbo].[JobSeekers]);\n"
                + "INSERT INTO [dbo].[JobSeekers]\n"
                + "       ([Id],\n"
                + "	   [AccountId],\n"
                + "	   [Name],\n"
                + "       [Gender],\n"
                + "	   [EmailContact])\n"
                + "VALUES (@NewId, ?,?,?,?)";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, account.getUsername());
            preparedStatement.setString(2, fullName);
            preparedStatement.setInt(3, gender);
            preparedStatement.setString(4, email);
            preparedStatement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean checkExistEmail(String email) {
        String sql = "Select * from [JobSeekers] where [EmailContact] = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, email);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return false; // email has exist already
            }
        } catch (Exception e) {
        }
        return true;
    }

    public void registerAccount(Account account, EnterprisesClone enterprise) throws SQLException {
        String sql = "INSERT INTO Accounts (CreatedTime, UpdatedTime, DeletedTime, StatusId, RoleId, PlanId, LastActiveTime, Username, Password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setTimestamp(1, account.getCreatedTime());
            if (account.getUpdatedTime() != null) {
                st.setTimestamp(2, account.getUpdatedTime());
            } else {
                st.setNull(2, java.sql.Types.DATE);
            }
            if (account.getDeletedTime() != null) {
                st.setTimestamp(2, account.getDeletedTime());
            } else {
                st.setNull(3, java.sql.Types.DATE);
            }
            st.setInt(4, 2);
            st.setInt(5, account.getRoleId());
            st.setInt(6, account.getPlanId());
            st.setTimestamp(7, account.getLastActiveTime());
            st.setString(8, account.getUsername());
            if (account.getPassword() != null) {
                st.setString(9, account.getPassword());
            } else {
                st.setNull(9, java.sql.Types.NVARCHAR);
            }
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        sql = "";
        // insert Enterprise information
        sql = "DECLARE @NewId INT;\n"
                + "SELECT TOP 1 @NewId = Id + 1\n"
                + "FROM [dbo].[EnterprisesClone] AS J1\n"
                + "WHERE NOT EXISTS (\n"
                + "    SELECT 1\n"
                + "    FROM [dbo].[EnterprisesClone] AS J2\n"
                + "    WHERE J2.Id = J1.Id + 1\n"
                + ")\n"
                + "ORDER BY J1.Id;\n"
                + "IF @NewId IS NULL\n"
                + "    SET @NewId = (SELECT ISNULL(MAX(Id) + 1, 1) FROM [dbo].[EnterprisesClone]);\n"
                + "INSERT INTO [dbo].[EnterprisesClone]\n"
                + "       ([Id],\n"
                + "	   [FullCompanyName],\n"
                + "	   [PhoneContact],\n"
                + "       [EmailContact],\n"
                + "	   [Address],\n"
                + "	   [AccountId],\n"
                + "	   [Status])\n"
                + "VALUES (@NewId,?, ?,?,?,?,?)";

        try {
            System.out.println("Thong tin ve Enterprise: " + enterprise);
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, enterprise.getFullCompanyName());
            preparedStatement.setString(2, enterprise.getPhoneContact());
            preparedStatement.setString(3, enterprise.getEmailContact());
            preparedStatement.setString(4, enterprise.getAddress());
            preparedStatement.setString(5, account.getUsername());
            preparedStatement.setInt(6, 1);
            preparedStatement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void acceptEnterpriseByAdmin(EnterprisesClone enterprisesClone) {
        EnterpriseDAO ed = new EnterpriseDAO();
        Enterprise e = ed.getEnterpriseByAccountId(enterprisesClone.getAccountId());
        String sql = "";
        System.out.println("Gia tri la: " + e);
        if (e == null) { // new register
            // process register account to table Enterprise
            sql = "DECLARE @NewId INT;\n"
                    + "SELECT TOP 1 @NewId = Id + 1\n"
                    + "FROM [dbo].[Enterprises] AS J1\n"
                    + "WHERE NOT EXISTS (\n"
                    + "    SELECT 1\n"
                    + "    FROM [dbo].[Enterprises] AS J2\n"
                    + "    WHERE J2.Id = J1.Id + 1\n"
                    + ")\n"
                    + "ORDER BY J1.Id;\n"
                    + "IF @NewId IS NULL\n"
                    + "    SET @NewId = (SELECT ISNULL(MAX(Id) + 1, 1) FROM [dbo].[Enterprises]);\n"
                    + "INSERT INTO [dbo].[Enterprises]\n"
                    + "       ([Id],\n"
                    + "       [ShortName],\n"
                    + "	   [FullCompanyName],\n"
                    + "	   [LogoUrl],\n"
                    + "	   [FoundedYear],\n"
                    + "	   [EnterpriseSizeId],\n"
                    + "	   [TaxCode],\n"
                    + "	   [BusinessLicenseFront],\n"
                    + "	   [BusinessLicenseBack],\n"
                    + "	   [WebsiteUrl],\n"
                    + "	   [FacebookUrl],\n"
                    + "	   [PhoneContact],\n"
                    + "    [EmailContact],\n"
                    + "	   [ImageUrl],\n"
                    + "	   [Description],\n"
                    + "	   [Address],\n"
                    + "	   [CompanyTypeId],\n"
                    + "	   [WorkingDay],\n"
                    + "	   [Country],\n"
                    + "	   [AccountId])\n"
                    + "VALUES (@NewId,?, ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, enterprisesClone.getShortName());
                preparedStatement.setString(2, enterprisesClone.getFullCompanyName());
                preparedStatement.setString(3, enterprisesClone.getLogoUrl());
                preparedStatement.setInt(4, enterprisesClone.getFoundedYear());
                preparedStatement.setInt(5, enterprisesClone.getEnterpriseSizeDetail().getId());
                preparedStatement.setString(6, enterprisesClone.getTaxCode());
                preparedStatement.setString(7, enterprisesClone.getBusinessLicenseFront());
                preparedStatement.setString(8, enterprisesClone.getBusinessLicenseBack());
                preparedStatement.setString(9, enterprisesClone.getWebsiteUrl());
                preparedStatement.setString(10, enterprisesClone.getFacebookUrl());
                preparedStatement.setString(11, enterprisesClone.getPhoneContact());
                preparedStatement.setString(12, enterprisesClone.getEmailContact());
                preparedStatement.setString(13, enterprisesClone.getImageUrl());
                preparedStatement.setString(14, enterprisesClone.getDescription());
                preparedStatement.setString(15, enterprisesClone.getAddress());
                preparedStatement.setInt(16, enterprisesClone.getCompanyTypeDetail().getId());
                preparedStatement.setInt(17, enterprisesClone.getWorkingday());
                preparedStatement.setString(18, enterprisesClone.getCountry());
                preparedStatement.setString(19, enterprisesClone.getAccountId());
                preparedStatement.executeUpdate();
            } catch (SQLException sQLException) {
                sQLException.printStackTrace();
            }

        } else {
            // da co tai khoan trong bang enterprise, thuc hien qua trinh dong bo , cap nhat
            // thong tin cho enterprise
            ed.updateEnterpriseProfile(enterprisesClone);
        }
        // thuc hien cap nhat lai trang thai cho bang enterprisesClone
        sql = "UPDATE [dbo].[EnterprisesClone]\n"
                + "   SET [Status] = ?\n"
                + " WHERE [AccountId] = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, 3);
            preparedStatement.setString(2, enterprisesClone.getAccountId());
            preparedStatement.executeUpdate();
        } catch (SQLException s) {
            s.printStackTrace();
        }

    }

    public boolean deleteJobseekerAccount(String accountId) throws SQLException {
        // Khởi tạo transaction
        try {
            // Lấy ID của JobSeeker
            String seekerIdQuery = "select Id from JobSeekers where AccountId = ?";
            PreparedStatement seekerIdSt = connection.prepareStatement(seekerIdQuery);
            seekerIdSt.setString(1, accountId);
            ResultSet rsSeekerId = seekerIdSt.executeQuery();

            if (rsSeekerId.next()) {
                int seekerId = rsSeekerId.getInt("Id");
                // Xóa các thông tin liên quan                
                // Xóa từ JobFavorites
                try ( PreparedStatement stmt = connection.prepareStatement(" delete from JobFavorites where SeekerId = ? ")) {
                    stmt.setInt(1, seekerId);
                    stmt.executeUpdate();
                }
                // Xóa từ Interviews qua Applications
                try ( PreparedStatement stmt = connection.prepareStatement(" delete from Interviews where ApplicationId IN (select Id from Applications where SeekerId = ? ) ")) {
                    stmt.setInt(1, seekerId);
                    stmt.executeUpdate();
                }
                // Xóa từ Notifications
                try ( PreparedStatement stmt = connection.prepareStatement(" delete from Notifications where SeekerId = ? ")) {
                    stmt.setInt(1, seekerId);
                    stmt.executeUpdate();
                }
                // Xóa Applications
                try ( PreparedStatement stmt = connection.prepareStatement(" delete from Applications where SeekerId = ? ")) {
                    stmt.setInt(1, seekerId);
                    stmt.executeUpdate();
                }
                //resumes
                try ( PreparedStatement stmt = connection.prepareStatement(" delete from Resumes where SeekerId = ? ")) {
                    stmt.setInt(1, seekerId);
                    stmt.executeUpdate();
                }
                //edu
                try ( PreparedStatement stmt = connection.prepareStatement(" delete from Educations where SeekerId = ? ")) {
                    stmt.setInt(1, seekerId);
                    stmt.executeUpdate();
                }
                //work
                try ( PreparedStatement stmt = connection.prepareStatement(" delete from WorkExperiences where SeekerId = ? ")) {
                    stmt.setInt(1, seekerId);
                    stmt.executeUpdate();
                }
                //skill
                try ( PreparedStatement stmt = connection.prepareStatement(" delete from Skills where SeekerId= ? ")) {
                    stmt.setInt(1, seekerId);
                    stmt.executeUpdate();
                }

                //delete account
                try ( PreparedStatement stmt = connection.prepareStatement(" delete from JobSeekers where AccountId = ? ")) {
                    stmt.setString(1, accountId);
                    stmt.executeUpdate();
                }

                try ( PreparedStatement stmt = connection.prepareStatement(" delete from Accounts where Username = ?")) {
                    stmt.setString(1, accountId);
                    stmt.executeUpdate();
                }
                // Xác nhận các thay đổi
                return true;
            } else {
                System.out.println("JobSeeker with AccountId '" + accountId + "' not found.");
                return false;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateAccountUpdatedTime(Account account) {
        String sql = "UPDATE Accounts SET UpdatedTime = ? WHERE Username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setTimestamp(1, account.getUpdatedTime());
            st.setString(2, account.getUsername());
            int rowsUpdated = st.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteEnterpriseAccount(String accountId) {
        // Khởi tạo transaction
        try {
            // Lấy ID của Enterprise
            String enterpriseQuery = "select Id from Enterprises where AccountId = ?";
            PreparedStatement enterpriseIdSt = connection.prepareStatement(enterpriseQuery);
            enterpriseIdSt.setString(1, accountId);
            ResultSet rsEnterpriseId = enterpriseIdSt.executeQuery();

            if (rsEnterpriseId.next()) {
                int enterpriseId = rsEnterpriseId.getInt("Id");
                // Xóa các thông tin liên quan                
                // Xóa từ JobFavorites
                try ( PreparedStatement stmt = connection.prepareStatement(" delete from JobFavorites where JobId IN (select Id from Jobs where EnterpriseId = ? ) ")) {
                    stmt.setInt(1, enterpriseId);
                    stmt.executeUpdate();
                }
                // Xóa từ Notifications
                try ( PreparedStatement stmt = connection.prepareStatement(" delete from Notifications where JobId IN (select Id from Jobs where EnterpriseId = ? ) ")) {
                    stmt.setInt(1, enterpriseId);
                    stmt.executeUpdate();
                }
                // Xóa từ Interviews
                try ( PreparedStatement stmt = connection.prepareStatement(" delete from Interviews where ApplicationId =(select Id from Applications where JobId IN (select Id from Jobs where EnterpriseId = ? )) ")) {
                    stmt.setInt(1, enterpriseId);
                    stmt.executeUpdate();
                }
                // Xóa Applications
                try ( PreparedStatement stmt = connection.prepareStatement(" delete from Applications where JobId IN (select Id from Jobs where EnterpriseId = ? ) ")) {
                    stmt.setInt(1, enterpriseId);
                    stmt.executeUpdate();
                }
                try ( PreparedStatement stmt = connection.prepareStatement(" delete from TagJobs where JobId IN (select Id from Jobs where EnterpriseId = ? ) ")) {
                    stmt.setInt(1, enterpriseId);
                    stmt.executeUpdate();
                }
                //Jobs
                try ( PreparedStatement stmt = connection.prepareStatement(" delete from Jobs where EnterpriseId IN (select Id from Jobs where EnterpriseId = ? ) ")) {
                    stmt.setInt(1, enterpriseId);
                    stmt.executeUpdate();
                }

                //delete account
                try ( PreparedStatement stmt = connection.prepareStatement(" delete from Enterprises where AccountId  = ? ")) {
                    stmt.setString(1, accountId);
                    stmt.executeUpdate();
                }

                try ( PreparedStatement stmt = connection.prepareStatement(" delete from Accounts where Username = ? ")) {
                    stmt.setString(1, accountId);
                    stmt.executeUpdate();
                }
                // Xác nhận các thay đổi
                return true;
            } else {
                System.out.println("JobSeeker with AccountId '" + accountId + "' not found.");
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean banAccountByUserName(String userName) {
        String query = " UPDATE Accounts SET StatusId = 3 WHERE Username = ? ";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, userName);
            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean unBanAccountByUserName(String userName) {
        String query = " UPDATE Accounts SET StatusId = 1 WHERE Username =? ";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, userName);
            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public void denyUpdateByAdmin(String accountId) {
        EnterpriseDAO ed = new EnterpriseDAO();
        Enterprise e = ed.getEnterpriseByAccountId(accountId);
        String sql = "UPDATE [EnterprisesClone]\n"
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
                + " WHERE AccountId = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, e.getShortName());
            preparedStatement.setString(2, e.getFullCompanyName());
            preparedStatement.setString(3, e.getLogoUrl());
            preparedStatement.setInt(4, e.getFoundedYear());
            preparedStatement.setInt(5, e.getEnterpriseSizeDetail().getId());
            preparedStatement.setString(6, e.getTaxCode());
            preparedStatement.setString(7, e.getBusinessLicenseFront());
            preparedStatement.setString(8, e.getBusinessLicenseBack());
            preparedStatement.setString(9, e.getWebsiteUrl());
            preparedStatement.setString(10, e.getFacebookUrl());
            preparedStatement.setString(11, e.getPhoneContact());
            preparedStatement.setString(12, e.getEmailContact());
            preparedStatement.setString(13, e.getImageUrl());
            preparedStatement.setString(14, e.getDescription());
            preparedStatement.setString(15, e.getAddress());
            preparedStatement.setInt(16, e.getCompanyTypeDetail().getId());
            preparedStatement.setInt(17, e.getWorkingday());
            preparedStatement.setString(18, e.getCountry());
            preparedStatement.setInt(19, 3);
            preparedStatement.setString(20, accountId);
            preparedStatement.execute();
        } catch (SQLException s) {
            s.printStackTrace();
        }
    }

    public void deleteEnterprisesCloneAccount(String accountId) {
        String sql = "DELETE FROM [EnterprisesClone]\n"
                + "      WHERE AccountId = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, accountId);
            preparedStatement.execute();

        } catch (SQLException s) {
            s.printStackTrace();
        }
        sql = "DELETE FROM [dbo].[Accounts]\n"
                + "      WHERE Username = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, accountId);
            preparedStatement.execute();

        } catch (SQLException s) {
            s.printStackTrace();
        }
    }

    public static void main(String[] args) {
//        JobSeekerDAO dao = new JobSeekerDAO();
//        AccountDAO d2 = new AccountDAO();
//        JobSeeker job = dao.getJobSeekerByAccountId("minhnv1");
//        System.out.println(job);
//        boolean check = d2.deleteJobseekerAccount("minhnv1");
//        JobSeeker job2 = dao.getJobSeekerByAccountId("minhnv1");
//        System.out.println(job2.toString());

//        EnterpriseDAO dao = new EnterpriseDAO();
//        AccountDAO d2 = new AccountDAO();
//        Enterprise enter = dao.getEnterpriseByAccountId("cocacola");
//        System.out.println(enter);
//        boolean check = d2.deleteEnterpriseAccount("cocacola");
//        Enterprise job2 = dao.getEnterpriseByAccountId("cocacola");
//        System.out.println(job2.toString());
    }

}
