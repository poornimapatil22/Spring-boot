package com.xworkz.gym.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RequestMapping
@RestController
public class AdminRestController {
    public AdminRestController(){
        log.info("its controller of Admin Controller");
    }

}
