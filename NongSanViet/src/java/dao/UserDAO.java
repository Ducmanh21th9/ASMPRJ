package dao;

import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    public User login(String usernameOrEmail, String password) {
        String sql = """
            SELECT UserId, Username, FullName, Email, Role
            FROM dbo.Users
            WHERE IsActive = 1
              AND (Username = ? OR Email = ?)
              AND [Password] = ?
        """;

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, usernameOrEmail);
            ps.setString(2, usernameOrEmail);
            ps.setString(3, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    User u = new User();
                    u.setUserId(rs.getInt("UserId"));
                    u.setUsername(rs.getString("Username"));
                    u.setFullName(rs.getString("FullName"));
                    u.setEmail(rs.getString("Email"));
                    u.setRole(rs.getString("Role"));
                    return u;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}