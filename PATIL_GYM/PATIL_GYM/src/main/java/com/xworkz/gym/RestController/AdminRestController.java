package com.xworkz.gym.RestController;

import com.xworkz.gym.service.GymService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.awt.*;

@Slf4j
@RequestMapping
@RestController
public class AdminRestController {
    @Autowired
    GymService  gymService;

    public AdminRestController(){
        log.info("its controller of Admin Controller");
    }

    @GetMapping(value="/emailOfAdmin/{email}",produces = MediaType.APPLICATION_JSON_VALUE)
  public String checkCount(@PathVariable("email") String email){
       // log.info(email);
        Long count=gymService.getCountOfAdminUserName(email);
        log.info("count email is:"+count);
        if(count<=0){
            return "Admin doesn't exist";
        }
        else{
            return "";
        }

  }
}
