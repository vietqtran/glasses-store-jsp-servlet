/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tranq
 */
public class Image {

    private int id;
    private String i1;
    private String i2;
    private String i3;
    private String i4;
    private String i5;

    public Image() {
    }

    public Image(int id, String i1, String i2, String i3, String i4, String i5) {
        this.id = id;
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
        return "Image{" + "id=" + id + ", i1=" + i1 + ", i2=" + i2 + ", i3=" + i3 + ", i4=" + i4 + ", i5=" + i5 + '}';
    }

}
