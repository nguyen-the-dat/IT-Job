/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.WorkLevelDetail;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author thain
 */
public class WorkLevelDetailDAO extends DBContext {

    public WorkLevelDetail getWorkLevelDetailById(int id) {
        WorkLevelDetail workLevelDetail = null;
        String sql = "SELECT * FROM WorkLevelDetails WHERE Id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int wId = rs.getInt("Id");
                String workLevelName = rs.getString("Level");
                if (rs.wasNull()) {
                    workLevelName = null;
                }
                workLevelDetail = new WorkLevelDetail(wId, workLevelName);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return workLevelDetail;
    }

    public List<WorkLevelDetail> getAllWorkLevel() {
        List<WorkLevelDetail> workLevels = new ArrayList<>();
        String sql = "SELECT * FROM WorkLevelDetails;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("Id");
                String workLevelName = rs.getString("Level");
                if (rs.wasNull()) {
                    workLevelName = null;
                }
                WorkLevelDetail workLevelDetail = new WorkLevelDetail(id, workLevelName);
                workLevels.add(workLevelDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return workLevels;
    }

}
