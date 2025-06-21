package com.example.itinermanager.controller;


import com.example.itinermanager.entity.User;
import com.example.itinermanager.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@RestController
@CrossOrigin
public class UserController {
    @Autowired
    UserMapper userMapper;
    @GetMapping ("/getUserInfo")
    public List<User> getUserInfo(){
        return userMapper.getUserInfo();
    }

    @RequestMapping("/getUserInfoByID")
    public User getUserInfoByID(int userID){
        return userMapper.getUserInfoByID(userID);
    }
    @RequestMapping("/uploadimg")
    public String getImg(MultipartFile file,User user) throws IOException {
        String km=file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));//获取文件后缀名
        String fileName=UUID.randomUUID().toString()+km;
        File f=new File("C:\\Users\\86157\\Documents\\坐牢\\IMG\\UserImg\\"+fileName);//创建文件对象
        file.transferTo(f);//保存文件
        user.setUserImgPath(fileName);//设置用户头像
        if (userMapper.updateUserInfo(user)>0){
            return "ok";
        }
        return "false";
    }

    @RequestMapping("/uploadimg1")
    public String getImg1(MultipartFile file,User user) throws IOException {
        String km=file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));//获取文件后缀名
        String fileName=UUID.randomUUID().toString()+km;
        File f=new File("C:\\Users\\86157\\Documents\\坐牢\\IMG\\UserImg\\"+fileName);//创建文件对象
        file.transferTo(f);//保存文件
        user.setUserImgPath(fileName);//设置用户头像
        return fileName;
    }
    @RequestMapping("/updateUserName")
    public String updateUserName(User user){
        if (userMapper.updateUserInfo(user)>0){
            return "ok";
        }
        return "false";
    }

    @RequestMapping("/delUserInfo")
    public String delUserInfo(int userID){
        if (userMapper.delUserInfo(userID)>0){
            return "ok";
        }
        return "false";
    }

    @RequestMapping("/userlogin")
    public String Login(String uID,String uPwd){
        if (userMapper.Login(uID,uPwd)>0){
            return "ok";
        }return "false";
    }
    @RequestMapping("/upuser")
    public String updateUser(User user){
        if (userMapper.updateUserInfo(user)>0){
            return "ok";
        }
        return "false";
    }
    @RequestMapping("/addUser")
    public String addUser(User user){
        if (userMapper.addUserInfo(user)>0){
            return "success";
        }
        return "false";
    }

}
