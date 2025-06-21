package com.example.itinermanager.controller;


import com.example.itinermanager.entity.Manager;
import com.example.itinermanager.entity.User;
import com.example.itinermanager.mapper.ManagerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@RestController
@CrossOrigin
public class ManagerController {
    @Autowired
    ManagerMapper managerMapper;

    @RequestMapping("/managerlogin")
    public String Login( String mID,  String mPwd)
    {
        if (managerMapper.Login(mID, mPwd)>0){
            return "ok";
        }
        return "false";
    }

    @RequestMapping("/managerinfo")
    public Manager getManagerInfo(String mID)
    {
        Manager manager = managerMapper.getManagerInfoByID(mID);
        return manager;
    }

    @RequestMapping("/updatemanager")
    public String updateManager(Manager manager)
    {
        if(managerMapper.updateManager(manager)>0){
            return "success";
        }
        return "false";
    }
    @RequestMapping("/uploadmanagerimg")
    public String getImg(MultipartFile file,Manager manager) throws IOException {
        String km=file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));//获取文件后缀名
        String fileName= UUID.randomUUID().toString()+km;
        File f=new File("C:\\Users\\86157\\Documents\\坐牢\\IMG\\UserImg\\"+fileName);//创建文件对象
        file.transferTo(f);//保存文件
        manager.setmanagerImg(fileName);//设置用户头像
        if (managerMapper.updateManager(manager)>0){
            return "ok";
        }
        return "false";
    }
}
