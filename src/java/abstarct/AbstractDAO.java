/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package abstarct;

import java.util.List;

/**
 *
 * @author tranq
 * @param <T>
 */
public interface AbstractDAO<T> {

    public List<T> getAll();

    public List<T> getByColor(String color);

    public T getById(int id);

    public List<T> sortByPrice(boolean isIncrease);

    public List<T> getByName(String name);
}
