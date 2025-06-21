package com.example.itinermanager.controller;


import com.example.itinermanager.entity.Event;
import com.example.itinermanager.mapper.EventMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@CrossOrigin
public class EventController {
    @Autowired
    EventMapper eventMapper;
    @RequestMapping("/getEventInfo")
    public Event getEventInfo(String userID, String date)
    {
        if (eventMapper.getEventInfo(userID, date) != null){
        return eventMapper.getEventInfo(userID,date);}
        return null;
    }

    @RequestMapping("/getAllEvent")
    public List<Event> getAllEvent(int userID)
    {
       return eventMapper.getAllEvent(userID);
    }
    @RequestMapping("/updateEvent")
    public String updateEvent(Event event)
    {
       if (eventMapper.updateEvent(event)>0) {
           return "success";
       }
        return "fail";
    }

    @RequestMapping("/addEvent")
    public String addEvent(Event event)
    {
        if (eventMapper.addEvent(event)>0) {
            return "success";
        }
        return "fail";
    }
}
