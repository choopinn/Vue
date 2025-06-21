package com.example.itinermanager.mapper;


import com.example.itinermanager.entity.ManagerInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface ManagerInfoMapper {
    @Select("select * from managerinfo where managerId=#{mID}")
    ManagerInfo getManagerInfoByID(int mID);

    @Update("update managerinfo set managerEml=#{managerEml},managerTel=#{managerTel} where managerId=#{managerId}")
    int updateManagerInfo(ManagerInfo managerInfo);
}
