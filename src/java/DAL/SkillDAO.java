/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.JobSeeker;
import Model.Skill;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author thain
 */
public class SkillDAO extends DBContext {

    public List<Skill> getSkillsForJobSeeker(int jobSeekerId) {
        List<Skill> skills = new ArrayList<>();
        String sql = "SELECT * FROM Skills WHERE SeekerId = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, jobSeekerId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Skill skill = new Skill();
                int id = rs.getInt("Id");
                skill.setId(id);

                String skillName = rs.getString("SkillName");
                if (rs.wasNull()) {
                    skillName = null;
                }
                skill.setSkillName(skillName);

                int skillLevel = rs.getInt("SkillLevel");
                if (rs.wasNull()) {
                    skillLevel = -1;
                }
                skill.setSkillLevel(skillLevel);

                JobSeeker jobSeeker = new JobSeekerDAO().getJobSeekerById(jobSeekerId);
                skill.setJobSeeker(jobSeeker);

                skills.add(skill);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return skills;
    }

    public void insertSkill(String name, int level, int seeekerId) {
        String countSql = "SELECT COUNT(*) AS total FROM [Skills]";
        String insertSql = "INSERT INTO [dbo].[Skills] ([Id], [SkillName], [SkillLevel], [SeekerId]) VALUES (?, ?, ?, ?)";
        int id = 1;
        try {
            PreparedStatement stm = connection.prepareStatement(countSql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                id = rs.getInt("total") + 1;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            PreparedStatement stm = connection.prepareStatement(insertSql);
            stm.setInt(1, id);
            stm.setString(2, name);
            stm.setInt(3, level);
            stm.setInt(4, seeekerId);
            stm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public boolean checkSkillExist(String name, int seekerId) {
        String sql = "select count(*) cnt from Skills where SkillName = ? and SeekerId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            stm.setInt(2, seekerId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("cnt") > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public void deleteSkill(int id) {
        String deleteSql = "DELETE FROM [dbo].[Skills]\n"
                + "      WHERE Id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(deleteSql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
