/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Tag;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author thain
 */
public class TagDAO extends DBContext {

    public List<Tag> getAllTags() {
        List<Tag> tags = new ArrayList<>();
        String sql = "SELECT * FROM Tags";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Tag tag = new Tag();
                tag.setId(rs.getInt("Id"));

                String tagValue = rs.getString("Tag");
                if (tagValue != null) {
                    tag.setTag(tagValue);
                } else {
                    tag.setTag(null);
                }

                tags.add(tag);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tags;
    }

    public Tag getTagById(int tagId) {
        Tag tag = null;
        String sql = "SELECT * FROM Tags WHERE Id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, tagId);

            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                tag = new Tag();
                tag.setId(rs.getInt("Id"));
                tag.setTag(rs.getString("Tag"));
            }

            rs.close();
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tag;
    }

    public List<Tag> getTagForManage(String searchParam) {
        List<Tag> tags = new ArrayList<>();
        List<Object> list = new ArrayList<>();
        try {
            StringBuilder query = new StringBuilder();
            query.append("SELECT * FROM Tags WHERE 1 = 1");

            if (searchParam != null && !searchParam.trim().isEmpty()) {
                query.append(" AND Tag LIKE ?");
                list.add("%" + searchParam + "%");
            }
            query.append(" ORDER BY id DESC");
            try ( PreparedStatement preparedStatement = connection.prepareStatement(query.toString())) {
                mapParams(preparedStatement, list);
                try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        Tag tag = new Tag();
                        tag.setId(resultSet.getInt("Id"));
                        tag.setTag(resultSet.getString("Tag"));
                        tags.add(tag);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tags;
    }
    // Method to add a new tag

   public boolean addTag(String name) {
    String sql = "INSERT INTO Tags (Tag) VALUES (?)";

    try {
        PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        st.setString(1, name);

        int rowsAffected = st.executeUpdate();
        
        // Retrieve the generated keys
        ResultSet generatedKeys = st.getGeneratedKeys();
        if (generatedKeys.next()) {
            // Retrieve the generated Id
            int generatedId = generatedKeys.getInt(1);
            // Do something with the generated Id if needed
        }
        
        st.close();

        return rowsAffected > 0; // Return true if rows were affected (tag was added)
    } catch (SQLException e) {
        e.printStackTrace();
        return false; // Return false if an exception occurred
    }
}


    // Method to edit an existing tag
    public boolean editTag(Tag tag) {
        String sql = "UPDATE Tags SET Tag = ? WHERE Id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, tag.getTag());
            st.setInt(2, tag.getId());

            int rowsAffected = st.executeUpdate();
            st.close();

            return rowsAffected > 0; // Return true if rows were affected (tag was edited)
        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Return false if an exception occurred
        }
    }

    // Method to delete a tag
    public boolean deleteTag(int tagId) {
        // Check if the tag exists in TagJob table
        // If not, delete the tag
        String checkSql = "SELECT COUNT(*) AS count FROM TagJobs WHERE TagId = ?";

        try {
            PreparedStatement checkSt = connection.prepareStatement(checkSql);
            checkSt.setInt(1, tagId);
            ResultSet rs = checkSt.executeQuery();

            rs.next();
            int count = rs.getInt("count");

            if (count == 0) {
                String deleteSql = "DELETE FROM Tags WHERE Id = ?";
                PreparedStatement deleteSt = connection.prepareStatement(deleteSql);
                deleteSt.setInt(1, tagId);

                int rowsAffected = deleteSt.executeUpdate();
                deleteSt.close();

                return rowsAffected > 0; // Return true if rows were affected (tag was deleted)
            } else {
                // Tag is associated with at least one job in TagJob table, cannot delete
                System.out.println("Cannot delete tag because it is associated with one or more jobs.");
                return false; // Return false as deletion was not performed
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Return false if an exception occurred
        }
    }

    public void mapParams(PreparedStatement ps, List<Object> args) throws SQLException {
        int i = 1;
        for (Object arg : args) {
            if (arg instanceof Date) {
                ps.setTimestamp(i++, new Timestamp(((Date) arg).getTime()));
            } else if (arg instanceof Integer) {
                ps.setInt(i++, (Integer) arg);
            } else if (arg instanceof Long) {
                ps.setLong(i++, (Long) arg);
            } else if (arg instanceof Double) {
                ps.setDouble(i++, (Double) arg);
            } else if (arg instanceof Float) {
                ps.setFloat(i++, (Float) arg);
            } else {
                ps.setString(i++, (String) arg);
            }
        }
    }

    public List<Tag> Paging(List<Tag> tags, int page, int pageSize) {
        int fromIndex = (page - 1) * pageSize;
        int toIndex = Math.min(fromIndex + pageSize, tags.size());
        if (fromIndex > toIndex) {
            fromIndex = toIndex;
        }
        return tags.subList(fromIndex, toIndex);
    }
    public static void main(String[] args) {
        TagDAO a = new TagDAO();
        List<Tag> l = a.getTagForManage("E");
        for (Tag tag : l) {
            System.out.println(tag);
        }
    }
}
