/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tranq
 */
public class Product {

    private int id;
    private String name;
    private double price;
    private String description;
    private String color;
    private int imgId;
    private String i1;
    private String i2;
    private String i3;
    private String i4;
    private String i5;

    public Product() {
    }

    public Product(int id, String name, double price, String description, String color, int imgId) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.color = color;
        this.imgId = imgId;
    }

    public Product(int id, String name, double price, String description, String color, int imgId, String i1, String i2) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.color = color;
        this.imgId = imgId;
        this.i1 = i1;
        this.i2 = i2;
    }

    public Product(int id, String name, double price, String description, String color, int imgId, String i1, String i2, String i3, String i4, String i5) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.color = color;
        this.imgId = imgId;
        this.i1 = i1;
        this.i2 = i2;
        this.i3 = i3;
        this.i4 = i4;
        this.i5 = i5;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getImgId() {
        return imgId;
    }

    public void setImgId(int imgId) {
        this.imgId = imgId;
    }

    public String getI1() {
        return i1;
    }

    public void setI1(String i1) {
        this.i1 = i1;
    }

    public String getI2() {
        return i2;
    }

    public void setI2(String i2) {
        this.i2 = i2;
    }

    public String getI3() {
        return i3;
    }

    public void setI3(String i3) {
        this.i3 = i3;
    }

    public String getI4() {
        return i4;
    }

    public void setI4(String i4) {
        this.i4 = i4;
    }

    public String getI5() {
        return i5;
    }

    public void setI5(String i5) {
        this.i5 = i5;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", price=" + price + ", description=" + description + ", color=" + color + ", imgId=" + imgId + '}';
    }

}
