/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.StatusJobDetail;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author thain
 */
public class StatusJobDetailDAO extends DBContext {

    public StatusJobDetail getStatusJobDetailById(int id) {
        StatusJobDetail statusJobDetail = null;
        String sql = "SELECT * FROM StatusJobDetails WHERE Id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int sjdId = rs.getInt("Id");
                String statusJob = rs.getString("StatusJob");
                if (rs.wasNull()) {
                    statusJob = null;
                }
                statusJobDetail = new StatusJobDetail(sjdId, statusJob);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return statusJobDetail;
    }
    
    public List<StatusJobDetail> getAllStatus(){
        List<StatusJobDetail> list = new ArrayList();
        String sql = "select * from StatusJobDetails";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                StatusJobDetail status = new StatusJobDetail();
                status.setId(rs.getInt("Id"));
                status.setStatusJob(rs.getString("StatusJob"));
                list.add(status);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

}
