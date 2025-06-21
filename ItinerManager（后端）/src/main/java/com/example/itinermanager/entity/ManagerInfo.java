package com.example.itinermanager.entity;

public class ManagerInfo {
    int managerId;
    String managerEml;
    String managerTel;

    public ManagerInfo() {
    }

    public ManagerInfo(int managerId, String managerEml, String managerTel) {
        this.managerId = managerId;
        this.managerEml = managerEml;
        this.managerTel = managerTel;
    }

    public int getManagerId() {
        return managerId;
    }

    public void setManagerId(int managerId) {
        this.managerId = managerId;
    }

    public String getManagerEml() {
        return managerEml;
    }

    public void setManagerEml(String managerEml) {
        this.managerEml = managerEml;
    }

    public String getManagerTel() {
        return managerTel;
    }

    public void setManagerTel(String managerTel) {
        this.managerTel = managerTel;
    }
}
