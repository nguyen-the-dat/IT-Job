/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.CompanyTypeDetail;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author thain
 */
public class CompanyTypeDetailDAO extends DBContext {

    public CompanyTypeDetail getCompanyTypeDetailById(int id) {
        CompanyTypeDetail companyTypeDetail = null;
        String sql = "SELECT * FROM CompanyTypeDetails WHERE Id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int ctdId = rs.getInt("Id");
                String typeName = rs.getString("TypeName");
                if (rs.wasNull()) {
                    typeName = null; 
                }
                companyTypeDetail = new CompanyTypeDetail(ctdId, typeName);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return companyTypeDetail;
    }
}
