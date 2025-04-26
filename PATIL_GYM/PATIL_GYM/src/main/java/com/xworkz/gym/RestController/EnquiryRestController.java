package com.xworkz.gym.RestController;

import com.xworkz.gym.service.GymService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

@CrossOrigin(origins = "http://localhost:7878")
@RequestMapping("/")
@RestController
@Slf4j
public class EnquiryRestController {
    @Autowired
private GymService gymService;
    @GetMapping(value = "/email/{email}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String getName(@PathVariable String email) {
        log.info(email);

        Long count = gymService.getCountOfEmail(email);
        log.info("count is: "+count);

        if (count > 0) {
            log.info("email already exists");
            return "email already exists";
        } else {
            log.info("enquiry Email doesn't exists");
            return "";
        }
    }


}
