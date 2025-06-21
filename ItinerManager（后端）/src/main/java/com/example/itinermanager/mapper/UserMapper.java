package com.example.itinermanager.mapper;


import com.example.itinermanager.entity.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface UserMapper {



    @Select("select * from user ")
    List<User> getUserInfo();

    @Select("select * from user where userID = #{userID}")
    User getUserInfoByID(int userID);

    @Update("update user set UserName = #{userName}, UserPwd = #{userPwd},UserImgPath = #{userImgPath} where UserID = #{userID}")
    int updateUserInfo(User user);

    @Delete("delete from user where userID = #{userID}")
    int delUserInfo(int userID);

    @Select("select count(1) from user where userID = #{uID} and userPwd = #{uPwd}")
    int Login(String uID,String uPwd);

    @Insert("insert into user(userID,userPwd,userName,userImgPath) values(#{userID},#{userPwd},#{userName},#{userImgPath})")
    int addUserInfo(User user);

}

