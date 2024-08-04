package DAL;

import java.sql.Connection;
import Model.*;
import DAL.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class NotificationDAO extends DBContext {

    public static NotificationDAO Instance = new NotificationDAO();
    private Connection con;
    private HashMap<Integer, Notification> notificationsById = new HashMap<>();
    private HashMap<Integer, List<Notification>> notificationsBySeekerId = new HashMap<>();

    private NotificationDAO() {
        if (Instance == null) {
            try {
                con = connection;
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
    }

    public void loadNotificationsById() {
        String sql = "SELECT * FROM Notifications";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                notificationsById.put(rs.getInt(1),
                        new Notification(
                                rs.getInt(1),
                                rs.getInt(2),
                                rs.getInt(3),
                                rs.getInt(4),
                                rs.getTimestamp(5),
                                rs.getBoolean(6),
                                rs.getBoolean(7),
                                rs.getInt(8),
                                rs.getInt(9)
                        ));
            }
            ps.close();
            rs.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void notificationsBySeekerId(int seekerId) {
        String sql = "SELECT * FROM Notifications WHERE SeekerId = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, seekerId);
            ResultSet rs = ps.executeQuery();
            List<Notification> notifySeekerId = new ArrayList<>();
            while (rs.next()) {
                notifySeekerId.add(new Notification(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getTimestamp(5),
                        rs.getBoolean(6),
                        rs.getBoolean(7),
                        rs.getInt(8),
                        rs.getInt(9)
                ));
            }
            notificationsBySeekerId.put(seekerId, notifySeekerId);
            ps.close();
            rs.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void addNotification(Notification notification) {
        String sql = "INSERT INTO [dbo].[Notifications]\n"
                + "           ([Id]\n"
                + "           ,[SeekerId]\n"
                + "           ,[JobId]\n"
                + "           ,[NotifyTypeId]\n"
                + "           ,[IsSeen]\n"
                + "           ,[ApplicationId]\n"
                + "           ,[ReceiverId])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";
    }

    public void updateNotificationStatus(int notificationId, boolean isSeen, boolean isSent) {
        String sql = "UPDATE [dbo].[Notifications]\n"
                + "   SET \n"
                + "      [SeekerId] = ?\n"
                + "      ,[JobId] = ?\n"
                + "      ,[NotifyTypeId] = ?\n"
                + "      ,[IsSeen] = ?\n"
                + "      ,[ApplicationId] = ?\n"
                + "      ,[ReceiverId] = ?\n"
                + " WHERE Id = ?";
    }

    public int predictNotification() {
        String sql = "DECLARE @NewId INT;\n"
                + "SELECT TOP 1 @NewId = Id + 1 \n"
                + "FROM [dbo].[Notifications] AS N1\n"
                + "WHERE NOT EXISTS (\n"
                + "    SELECT 1 \n"
                + "    FROM [dbo].[Notifications] AS N2\n"
                + "    WHERE N2.Id = N1.Id + 1\n"
                + ")\n"
                + "ORDER BY N1.Id;\n"
                + "IF @NewId IS NULL\n"
                + "    SET @NewId = (SELECT ISNULL(MAX(Id), 0) + 1 FROM [dbo].Notifications);\n"
                + "SELECT @NewId AS NewID;";
        int predict = -1;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                predict = rs.getInt("NewID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return predict;
    }

    public Notification getNotificationById(int id) {
        return notificationsById.get(id);
    }

    public List<Notification> getNotificationBySeekerId(int seekerId) {
        List<Notification> seekerNotifications = notificationsBySeekerId.get(seekerId);
        if (seekerNotifications == null) {
            return Collections.emptyList();
        }
        return seekerNotifications;
    }

    public HashMap<Integer, Notification> getNotificationsById() {
        return notificationsById;
    }

    public void setNotificationsById(HashMap<Integer, Notification> notificationsById) {
        this.notificationsById = notificationsById;
    }

    public HashMap<Integer, List<Notification>> getNotificationsBySeekerId() {
        return notificationsBySeekerId;
    }

    public void setNotificationsBySeekerId(HashMap<Integer, List<Notification>> notificationsBySeekerId) {
        this.notificationsBySeekerId = notificationsBySeekerId;
    }
}
