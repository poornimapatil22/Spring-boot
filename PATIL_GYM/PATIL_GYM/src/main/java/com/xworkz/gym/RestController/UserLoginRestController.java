package com.xworkz.gym.RestController;

import com.xworkz.gym.service.GymService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.http.MediaType;

import java.awt.*;

@Slf4j
@RestController
@RequestMapping("/")
public class UserLoginRestController {
    @Autowired
    GymService gymService;
    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE,value = "/emailOfUser/{email}")
    public String getUser(@PathVariable String email){
        Long count= gymService.getCountOfRegEmail(email);
        log.info("email is: "+email);
        if(count>0){
            log.info("count is: "+count);
            return "";
        }
        else{
            return "User not found!";
        }

    }
}
