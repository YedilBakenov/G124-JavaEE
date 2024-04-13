package db;

import java.util.ArrayList;

public class Car {
    private String model;
    private String country;
    private double volume;

    private String color;

    private int price;

    private int id;

    public Car() {
    }

    public Car(int id, String model, String country, double volume, String color, int price) {
        this.model = model;
        this.country = country;
        this.volume = volume;
        this.color = color;
        this.price = price;
        this.id = id;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public double getVolume() {
        return volume;
    }

    public void setVolume(double volume) {
        this.volume = volume;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
