package com.example.itinermanager.entity;

public class Event {
    int userID;
    String date;
    String eventTitle;
    String eventDetail;

    public Event() {
    }

    public Event(int userID, String date, String eventTitle, String eventDetail) {
        this.userID = userID;
        this.date = date;
        this.eventTitle = eventTitle;
        this.eventDetail = eventDetail;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getEventTitle() {
        return eventTitle;
    }

    public void setEventTitle(String eventTitle) {
        this.eventTitle = eventTitle;
    }

    public String getEventDetail() {
        return eventDetail;
    }

    public void setEventDetail(String eventDetail) {
        this.eventDetail = eventDetail;
    }



}
