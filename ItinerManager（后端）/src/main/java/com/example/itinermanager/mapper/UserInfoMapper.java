package com.example.itinermanager.mapper;

import com.example.itinermanager.entity.UserInfo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface UserInfoMapper {
    @Select("select * from userinfo where UserID=#{userID}")
    UserInfo getUserInfoByID(int userID);

    @Update("update userinfo set UserEml=#{userEml},UserTel=#{userTel} where UserID=#{userID}")
    int updateUserInfo1(UserInfo userInfo);

    @Insert("insert into userinfo(UserID,UserEml,UserTel) values(#{userID},#{userEml},#{userTel})")
    int addUserInfo(UserInfo userInfo);
}
