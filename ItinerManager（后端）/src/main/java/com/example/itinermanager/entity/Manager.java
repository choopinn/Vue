package com.example.itinermanager.entity;

public class Manager {
    String managerName;
    Integer managerId;
    String managerPwd;
    String managerImg;

    public Manager() {
    }

    public Manager(String managerName, Integer managerId, String managerPwd, String managerImg) {
        this.managerName = managerName;
        this.managerId = managerId;
        this.managerPwd = managerPwd;
        this.managerImg = managerImg;
    }

    public String getManagerName() {
        return managerName;
    }

    public void setManagerName(String managerName) {
        this.managerName = managerName;
    }

    public Integer getManagerId() {
        return managerId;
    }

    public void setManagerId(Integer managerId) {
        this.managerId = managerId;
    }

    public String getManagerPwd() {
        return managerPwd;
    }

    public void setManagerPwd(String managerPwd) {
        this.managerPwd = managerPwd;
    }

    public String getmanagerImg() {
        return managerImg;
    }

    public void setmanagerImg(String managerImg) {
        this.managerImg = managerImg;
    }
}
