package com.example.itinermanager.controller;


import com.example.itinermanager.entity.Holidays;
import com.example.itinermanager.mapper.HolidaysMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@CrossOrigin
public class HolidaysController {

    @Autowired
    HolidaysMapper holidaysMapper;

    @GetMapping ("/getHolidaysInfo")
    public List<Holidays> getHolidaysInfo() {
        return holidaysMapper.getHolidaysInfo();
    }

}
