package com.example.itinermanager.mapper;


import com.example.itinermanager.entity.Holidays;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface HolidaysMapper {

    @Select("select * from holidays")
    List<Holidays>getHolidaysInfo();

}
