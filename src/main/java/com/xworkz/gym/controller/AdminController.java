package com.xworkz.gym.controller;

import com.xworkz.gym.entity.AdminEntity;
import com.xworkz.gym.service.GymService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;

@Slf4j
@Controller
@RequestMapping("/")
public class AdminController {

    @Autowired
    private GymService gymService;

    public AdminController() {
        log.info("This is constructor of AdminController");
    }

    @GetMapping("/adminLogin")
    public String showLoginPage() {
        return "AdminLogin";
    }

    @PostMapping("/adminLogin")
    public String adminLogin(@RequestParam String email, String password, Model model) {
        try {
            AdminEntity adminDetails = gymService.getAdminDeatilsByEmail(email);
            if (adminDetails == null) {
                model.addAttribute("fail", "No admin found with this email.");
                return "AdminLogin";
            }

            // ✅ Auto-unlock logic after 24 hours
            if (adminDetails.getIsLocked() != null && adminDetails.getIsLocked()) {
                if (adminDetails.getLockTime() != null &&
                        adminDetails.getLockTime().plusHours(24).isBefore(LocalDateTime.now())) {
                    adminDetails.setIsLocked(false);
                    adminDetails.setFailedAttempt(0);
                    adminDetails.setLockTime(null);
                    gymService.save(adminDetails);
                } else {
                    model.addAttribute("failedAdmin", "Your account has been locked. Try again after 24 hours.");
                    return "AdminLogin";
                }
            }

            // Validate password
            String storedPassword = adminDetails.getPassword();
            if (!storedPassword.equals(password)) {
                adminDetails.setFailedAttempt(adminDetails.getFailedAttempt() + 1);
                if (adminDetails.getFailedAttempt() >= 3) {
                    adminDetails.setIsLocked(true);
                    adminDetails.setLockTime(LocalDateTime.now());
                    gymService.save(adminDetails);
                    model.addAttribute("failedAdmin", "Your account has been locked. Try again after 24 hours.");
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
                //model.addAttribute("success", "Admin Login Success!");
                return "Home";
            }
        } catch (Exception e) {
            log.error("Exception during admin login", e);
            model.addAttribute("error", "Something went wrong. Please try again.");
            return "redirect:/AdminLogin";
        }
    }

    @PostMapping("/setNewPassword")
    public String setNewPassword(@RequestParam String email, String password, Model model, String confirmPassword) {
        if (!password.equals(confirmPassword)) {
            model.addAttribute("error", "Passwords do not match.");
            return "AdminForgotPassword";
        }

        boolean isUpdated = gymService.validAndSaveNewPassword(email, password);
        if (isUpdated) {
            model.addAttribute("success", "Password updated successfully.");
            return "AdminLogin";
        } else {
            model.addAttribute("error", "Failed to update password.");
            return "AdminForgotPassword";
        }
    }
}
