/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tranq
 */
public class Order {

    private int userId;
    private int productId;
    private String name;
    private String color;
    private double price;
    private String img;
    private int quantity;

    public Order(int userId, int productId, String name, String color, double price, String img, int quantity) {
        this.userId = userId;
        this.productId = productId;
        this.name = name;
        this.color = color;
        this.price = price;
        this.img = img;
        this.quantity = quantity;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Order{" + "userId=" + userId + ", productId=" + productId + ", name=" + name + ", color=" + color + ", price=" + price + ", img=" + img + ", quantity=" + quantity + '}';
    }

}
