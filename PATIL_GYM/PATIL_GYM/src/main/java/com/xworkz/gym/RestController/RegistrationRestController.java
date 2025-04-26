package com.xworkz.gym.RestController;

import com.xworkz.gym.service.GymService;
import javafx.application.Application;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.awt.*;

@RestController
@Slf4j
@RequestMapping("/")
public class RegistrationRestController {

    @Autowired
    GymService gymService;
    @GetMapping(value ="/emailOfReg/{email}",produces= MediaType.APPLICATION_JSON_VALUE)
    public String getCountOfRegEmail(@PathVariable String email){
        Long count= gymService.getCountOfRegEmail(email);
        if(count>0){
            return "email already exist";
        }
        else{
            return "";
        }

    }
}
