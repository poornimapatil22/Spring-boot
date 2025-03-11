package com.xworkz.gym.controller;

import com.xworkz.gym.dto.AdminDto;
import com.xworkz.gym.entity.AdminEntity;
import com.xworkz.gym.service.GymService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Slf4j
@Controller
@RequestMapping("/")
public class AdminController {

    @Autowired
    GymService gymService;


    public AdminController() {
        log.info("This is constr of AdminController");
    }

    @PostMapping(value = "/adminLogin")
    public String adminLogin(@RequestParam String email, String password, Model model) {
        AdminEntity admin = gymService.getAdminByEmail(email, password);
        log.info("admin: " + admin);
        if (admin != null) {
            if (admin.getPassword().equals(password)) {
                model.addAttribute("success", "Admin Login Success!");
                return "Home";
            } else {
                model.addAttribute("fail", admin);
                model.addAttribute("failedAdmin", "Admin Login Failed!,");
                return "AdminLogin";
            }
        }

        model.addAttribute("failNull", "Admin not found!");
        return "AdminLogin";
    }

    @RequestMapping("/setNewPassword")
    public String onSetNewPassword(AdminDto adminDto){
        gymService.validAndSaveNewPassword(adminDto);
        return "AdminLogin";
    }

}
