
package DAL;

import Model.StatusApplicationDetail;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author thain
 */
public class StatusApplicationDetailDAO extends DBContext {

    public StatusApplicationDetail getStatusApplicationDetailById(int id) {
        StatusApplicationDetail statusApplicationDetail = null;
        String sql = "SELECT * FROM StatusApplicationDetails WHERE Id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                statusApplicationDetail = new StatusApplicationDetail();
                statusApplicationDetail.setId(rs.getInt("Id"));

                String statusApplication = rs.getString("StatusApplication");
                if (rs.wasNull()) {
                    statusApplicationDetail.setStatusApplication(null);
                } else {
                    statusApplicationDetail.setStatusApplication(statusApplication);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return statusApplicationDetail;
    }
    
    public List<StatusApplicationDetail> getAllStatusApplicationDetails() {
        List<StatusApplicationDetail> list = new ArrayList<>();
        String sql = "SELECT * FROM StatusApplicationDetails;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                StatusApplicationDetail statusApplicationDetail = new StatusApplicationDetail();
                statusApplicationDetail.setId(rs.getInt("Id"));

                String statusApplication = rs.getString("StatusApplication");
                if (rs.wasNull()) {
                    statusApplicationDetail.setStatusApplication(null);
                } else {
                    statusApplicationDetail.setStatusApplication(statusApplication);
                }

                list.add(statusApplicationDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

}
