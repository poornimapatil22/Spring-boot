package com.xworkz.gym.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
@Slf4j
public class GymController {
    @ExceptionHandler(Exception.class)
    public String handleAnyException(Exception e, Model model) {
        log.error("Unhandled exception", e);
        model.addAttribute("error", "An unexpected error occurred. Please try again.");
        return "AdminLogin";
    }
}


