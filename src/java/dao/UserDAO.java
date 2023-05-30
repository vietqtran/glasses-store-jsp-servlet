/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;

/**
 *
 * @author tranq
 */
public class UserDAO extends db.DBContext {

    public void createUser(User user) {
        String sql = "insert into users(username, password) values(?, ?);";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user.getUserName());
            ps.setString(2, user.getPassword());
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public boolean checkExistedUser(String userName) {
        String sql = "select * from users";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                if (userName.equals(rs.getString(2))) {
                    return true;
                }
            }
        } catch (SQLException e) {
        }
        return false;
    }

    public User getUser(String userName, String pass) {
        String sql = "select * from users where username = ? and password = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, userName);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1), rs.getString(2), rs.getString(3));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public static void main(String[] args) {
        System.out.println(new UserDAO().getUser("user1", "password1"));
    }
}
