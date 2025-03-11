package com.xworkz.gym.RestController;

import com.xworkz.gym.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

@CrossOrigin(origins = "http://localhost:8989")
@RequestMapping("/")
@RestController
public class EnquiryRestController {
    @Autowired
private GymService gymService;
    @GetMapping(value = "/email/{email}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String getName(@PathVariable String email) {
        System.out.println(email);

        Long count = gymService.getCountOfEmail(email);

        if (count > 0) {
            System.out.println("email already exists");
            return "email already exists";
        } else {
            System.out.println("enquiry Email doesn't exists");
            return "enquiry Email doesn't exists";
        }
    }


}
