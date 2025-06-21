package com.example.itinermanager.entity;

public class User {
    int UserID;
    String UserPwd;
    String UserName;
    String UserImgPath;

    public User() {
    }

    public User(int userID, String userPwd, String userName, String userImgPath) {
        UserID = userID;
        UserPwd = userPwd;
        UserName = userName;
        UserImgPath = userImgPath;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int userID) {
        UserID = userID;
    }

    public String getUserPwd() {
        return UserPwd;
    }

    public void setUserPwd(String userPwd) {
        UserPwd = userPwd;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String userName) {
        UserName = userName;
    }

    public String getUserImgPath() {
        return UserImgPath;
    }

    public void setUserImgPath(String userImgPath) {
        UserImgPath = userImgPath;
    }
}
