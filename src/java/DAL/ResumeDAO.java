package DAL;

import static DAL.NotificationDAO.Instance;
import Model.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class ResumeDAO extends DBContext {

    List<Resume> listResume;
    public static ResumeDAO Instance = new ResumeDAO();
    private Connection con;

    private ResumeDAO() {
        if (Instance == null) {
            try {
                con = connection;
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
    }

    public void loadListResume() {
        String sql = "SELECT * FROM Resumes";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listResume.add(
                        new Resume(
                                rs.getInt(1),
                                rs.getInt(2),
                                rs.getString(3),
                                rs.getString(4),
                                rs.getTimestamp(4)
                        ));
            }
            ps.close();
            rs.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public Resume getResumeBySeekerId(int seekerId) {
        String sql = "SELECT * FROM Resumes WHERE SeekerId = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, seekerId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) { // Move the cursor to the first row
                Resume resume = new Resume(
                        rs.getInt(1), // 
                        rs.getInt(2), // 
                        rs.getString(3),
                        rs.getString(4),
                        rs.getTimestamp(5)
                );
                return resume;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public void addSeekerCV(int seekerId, String cvUrl, String coverLetter) {
        String sql = "INSERT INTO [dbo].[Resumes]\n"
                + "           ([SeekerId]\n"
                + "           ,[CVUrl]\n"
                + "           ,[CoverLetter]\n"
                + "           ,[CreateTime])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, GETDATE())";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, seekerId);
            stm.setString(2, cvUrl);
            stm.setString(3, coverLetter);
            stm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateSeekerCV(int seekerId, String cvUrl, String coverLetter) {
        String sql = "UPDATE [dbo].[Resumes]"
                + "   SET "
                + "      [CVUrl] = ?"
                + "      ,[CoverLetter] = ?"
                + "      ,[CreateTime] = GETDATE()"
                + " WHERE [seekerId] = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, cvUrl);
            stm.setString(2, coverLetter);
            stm.setInt(3, seekerId);
            stm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Resume> getListResume() {
        return listResume;
    }

    public void setListResume(List<Resume> listResume) {
        this.listResume = listResume;
    }
}
