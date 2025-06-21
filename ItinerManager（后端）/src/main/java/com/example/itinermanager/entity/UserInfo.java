package com.example.itinermanager.entity;

public class UserInfo {
    int UserID;
    String UserEml;
    String UserTel;

    public UserInfo() {
    }

    public UserInfo(int userID, String userEml, String userTel) {
        UserID = userID;
        UserEml = userEml;
        UserTel = userTel;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int userID) {
        UserID = userID;
    }

    public String getUserEml() {
        return UserEml;
    }

    public void setUserEml(String userEml) {
        UserEml = userEml;
    }

    public String getUserTel() {
        return UserTel;
    }

    public void setUserTel(String userTel) {
        UserTel = userTel;
    }
}
