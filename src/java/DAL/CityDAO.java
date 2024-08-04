/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.City;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author thain
 */
public class CityDAO extends DBContext {

    public City getCityById(int id) {
        City city = null;
        String sql = "SELECT * FROM City WHERE Id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int cId = rs.getInt("Id");
                String cityName = rs.getString("Name");
                if (rs.wasNull()) {
                    cityName = null;
                }
                city = new City(cId, cityName);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return city;
    }
    
    public List<City> getAllCities() {
        List<City> cities = new ArrayList<>();
        String sql = "SELECT * FROM City;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("Id");
                String name = rs.getString("Name");
                if (rs.wasNull()) {
                    name = null;
                }
                City city = new City(id, name);
                cities.add(city);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cities;
    }

}
