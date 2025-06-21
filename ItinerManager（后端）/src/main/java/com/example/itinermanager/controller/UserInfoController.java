package com.example.itinermanager.controller;

import com.example.itinermanager.entity.UserInfo;
import com.example.itinermanager.mapper.UserInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin
public class UserInfoController {
    @Autowired
    UserInfoMapper userInfoMapper;

    @RequestMapping("/getuserinfo")
    public UserInfo getUserInfoByID(int userID)
    {
        return userInfoMapper.getUserInfoByID(userID);
    }

    @RequestMapping("/upuserinfo")
    public String updateUserInfo(UserInfo userInfo)
    {
       if (userInfoMapper.updateUserInfo1(userInfo)>0){
           return "success";
       }
       return "false";
    }

    @RequestMapping("/addUserinfo")
    public String addUserInfo(UserInfo userInfo)
    {
        if (userInfoMapper.addUserInfo(userInfo)>0){
            return "success";
        }
        return "false";
    }
}
