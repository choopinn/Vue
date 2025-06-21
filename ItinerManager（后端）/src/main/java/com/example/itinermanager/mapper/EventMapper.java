package com.example.itinermanager.mapper;

import com.example.itinermanager.entity.Event;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface EventMapper {

    @Select("select * from event where userID=#{userID} and date=#{date}")
    Event getEventInfo(String userID, String date);

    @Select("select * from event where userID=#{userID}")
    List<Event> getAllEvent(int userID);

    @Update("update event set eventTitle=#{eventTitle},eventDetail=#{eventDetail} where userID=#{userID} and date=#{date}")
    int updateEvent(Event event);

    @Insert("insert into event(userID,date,eventTitle,eventDetail) values(#{userID},#{date},#{eventTitle},#{eventDetail})")
    int addEvent(Event event);
}
