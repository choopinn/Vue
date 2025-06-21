package com.example.itinermanager.controller;


import com.example.itinermanager.entity.ManagerInfo;
import com.example.itinermanager.mapper.ManagerInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin
public class ManagerInfoController {
    @Autowired
    ManagerInfoMapper managerInfoMapper;

    @RequestMapping("/getmanagerinfo")
    public ManagerInfo getManagerInfoByID(int mID){
        return managerInfoMapper.getManagerInfoByID(mID);
    }

    @RequestMapping("/updatemanagerinfo")
    public String updateManagerInfo(ManagerInfo managerInfo){
       if (managerInfoMapper.updateManagerInfo(managerInfo)>0){
           return "success";
       }return "false";
    }
}
