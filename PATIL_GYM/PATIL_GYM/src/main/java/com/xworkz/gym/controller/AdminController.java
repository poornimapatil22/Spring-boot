package com.xworkz.gym.controller;

import com.xworkz.gym.dto.AdminDto;
import com.xworkz.gym.entity.AdminEntity;
import com.xworkz.gym.repository.GymRepository;
import com.xworkz.gym.service.GymService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;


@Slf4j
@Controller
@RequestMapping("/")
public class AdminController {

    @Autowired
    GymService gymService;

    AdminEntity adminEntity;

    public AdminController() {
        log.info("This is constructor of AdminController");
    }

    @PostMapping(value = "/adminLogin")
    public String adminLogin(@RequestParam String email, String password, Model model) {
        AdminEntity admin = gymService.getAdminByEmail(email, password);
        AdminEntity adminDetails=gymService.getAdminDeatilsByEmail(email);
        log.info("admin details:"+adminDetails.getLockTime());
        if(adminDetails.getLockTime()==null){
            adminDetails.setLockTime(LocalDateTime.now());
            gymService.save(adminDetails);
        }
        log.info("admin: " + admin);

        String storedPassword = adminDetails.getPassword();
        log.info("stored password is: "+storedPassword);
        if (!storedPassword.equals(password)) {
            adminDetails.setFailedAttempt(adminDetails.getFailedAttempt() + 1);

            if (adminDetails.getFailedAttempt() > 3) {
                adminDetails.setIsLocked(true);
                adminDetails.setLockTime(LocalDateTime.now());
                gymService.save(adminDetails);
                model.addAttribute("failedAdmin", "Your Account has locked try again after 24 hours");
                return "AdminLogin";
            } else {
                gymService.save(adminDetails);
                int remainingAttempts = 3 - adminDetails.getFailedAttempt();
                model.addAttribute("fail", "Incorrect password. You have " + remainingAttempts + " attempts remaining.");
                return "AdminLogin";
            }
        } else {
            adminDetails.setFailedAttempt(0);
            gymService.save(adminDetails);
            model.addAttribute("success", "Admin Login Success!");
            return "Home";
        }
    }

    @PostMapping("/setNewPassword")
    public String setNewPassword(@RequestParam String email,String password,Model model,String confirmPassword) {
        // Validate the password fields
        if (!password.equals(confirmPassword)) {
            model.addAttribute("error", "Passwords do not match.");
            return "AdminForgotPassword";
        }


        boolean isUpdated = gymService.validAndSaveNewPassword(email,password);
        if (isUpdated) {
            model.addAttribute("success", "Password updated successfully.");
            return "AdminLogin";
        } else {
            model.addAttribute("error", "Failed to update password.");
            return "AdminForgotPassword";
        }


    }
}
