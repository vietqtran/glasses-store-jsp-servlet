/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Order;

/**
 *
 * @author tranq
 */
public class OrderDAO extends db.DBContext {

    public String capitalize(String str) {
        if (str == null || str.length() == 0) {
            return str;
        }
        return str.substring(0, 1).toUpperCase() + str.substring(1);
    }

    public List<Order> getAllOrderByUserId(int userId) {
        List<Order> list = new ArrayList<>();
        String sql = "select * from orders where userid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getDouble(5), rs.getString(6), rs.getInt(7)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public void createOrder(Order order, int id) {
        for (Order order1 : getAllOrderByUserId(id)) {
            if (order1.getImg().equals(order.getImg())) {
                setQuantity(order.getImg(), id, true);
                return;
            }
        }
        String sql = "insert into orders(userid, productid,productname,productcolor,productprice,productImg, quantity) values(?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, order.getUserId());
            ps.setInt(2, order.getProductId());
            ps.setString(3, order.getName());
            ps.setString(4, capitalize(order.getColor()));
            ps.setDouble(5, order.getPrice());
            ps.setString(6, order.getImg());
            ps.setInt(7, order.getQuantity());
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void removeByImg(String img) {
        String sql = "delete from orders where productImg = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, img);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void setQuantity(String img, int quantity, boolean isIncrease) {
        String sql = "update orders set quantity = ? where productImg = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(2, img);
            if (isIncrease) {
                ps.setInt(1, quantity + 1);
            } else {
                ps.setInt(1, quantity - 1);
            }
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public static void main(String[] args) {
        for (Order arg : new OrderDAO().getAllOrderByUserId(3)) {
            System.out.println(arg);
        }
    }
}
