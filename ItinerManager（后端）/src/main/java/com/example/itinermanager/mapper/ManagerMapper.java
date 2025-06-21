package com.example.itinermanager.mapper;


import com.example.itinermanager.entity.Manager;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface ManagerMapper {
    @Select("select count(1) from manager where managerID=#{mID} and managerPwd=#{mPwd}")
    int Login(String mID,String mPwd);

    @Select("select * from manager where managerID=#{mID}")
    Manager getManagerInfoByID(String mID);

    @Update("update manager set managerName=#{managerName},managerId=#{managerId},managerPwd=#{managerPwd},managerImg=#{managerImg}  where managerId=#{managerId}")
    int updateManager(Manager manager);
}
