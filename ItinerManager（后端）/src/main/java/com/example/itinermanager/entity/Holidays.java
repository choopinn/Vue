package com.example.itinermanager.entity;

public class Holidays {
    String  date;
    String  name;
    String  type;

    public Holidays() {
    }

    public Holidays(String date, String name, String type) {
        this.date = date;
        this.name = name;
        this.type = type;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
