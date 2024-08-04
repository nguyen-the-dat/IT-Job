/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.EnterpriseSizeDetail;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author thain
 */
public class EnterpriseSizeDetailDAO extends DBContext {

    public EnterpriseSizeDetail getEnterpriseSizeDetailById(int id) {
        EnterpriseSizeDetail enterpriseSizeDetail = null;
        String sql = "SELECT * FROM EnterpriseSizeDetails WHERE Id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int esdId = rs.getInt("Id");
                String size = rs.getString("Size");
                if (rs.wasNull()) {
                    size = null;
                }
                enterpriseSizeDetail = new EnterpriseSizeDetail(esdId, size);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return enterpriseSizeDetail;
    }

    public List<EnterpriseSizeDetail> getAllEnterpriseSizeDetails() {
        List<EnterpriseSizeDetail> enterpriseSizeDetailsList = new ArrayList<>();
        String sql = "SELECT * FROM EnterpriseSizeDetails;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int esdId = rs.getInt("Id");
                String size = rs.getString("Size");
                if (rs.wasNull()) {
                    size = null;
                }
                EnterpriseSizeDetail enterpriseSizeDetail = new EnterpriseSizeDetail(esdId, size);
                enterpriseSizeDetailsList.add(enterpriseSizeDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return enterpriseSizeDetailsList;
    }

}
