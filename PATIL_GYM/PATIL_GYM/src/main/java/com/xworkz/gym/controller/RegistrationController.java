package com.xworkz.gym.controller;

import com.xworkz.gym.constants.GymPackagesEnum;
import com.xworkz.gym.constants.GymTrainersEnum;
import com.xworkz.gym.dto.RegistrationDto;
import com.xworkz.gym.service.EmailService;
import com.xworkz.gym.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping("/")
public class RegistrationController {

    @Autowired
    private GymService gymService;

    @Autowired
    private EmailService emailService; // Inject EmailService

    // Enum lists for gym packages and trainers
    List<GymPackagesEnum> packagesEnumList = new ArrayList<>(Arrays.asList(GymPackagesEnum.values()));
    List<GymTrainersEnum> gymTrainersEnums = new ArrayList<>(Arrays.asList(GymTrainersEnum.values()));

    // Get the registration form view
    @GetMapping("/register")
    public String getRegistration(Model model) {
        model.addAttribute("packagesEnumList", packagesEnumList);
        model.addAttribute("gymTrainersEnums", gymTrainersEnums);
        return "Registration";  // Registration form view
    }

    // Method to generate a random password
    private String generateRandomPassword() {
        int length = 8;  // You can modify the length of the password as needed
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+";
        Random random = new Random();
        StringBuilder password = new StringBuilder();

        for (int i = 0; i < length; i++) {
            int index = random.nextInt(chars.length());
            password.append(chars.charAt(index));
        }
        return password.toString();
    }

    // Method to handle registration form submission
    @PostMapping("/registration")
    public String registration(RegistrationDto registrationDTO, Model model) {
        System.out.println("Registration Data: " + registrationDTO);

        if (registrationDTO.getEmail() == null || registrationDTO.getEmail().isEmpty()) {
            model.addAttribute("error", "Email is required!");  // Error message if email is missing
            return "Registration";  // Return to the registration form view
        }

        // Generate a random password for the user
        String generatedPassword = generateRandomPassword();

        // Set the generated password in the registration DTO (this will be saved in the DB)
        registrationDTO.setPassword(generatedPassword);

        // Save the registration details to the database
        boolean saved = gymService.validateAndSaveRegistredDetails(registrationDTO);

        if (saved) {
            // Send the registration password via email
            boolean emailSent = emailService.sendPasswordToEmail(registrationDTO.getEmail(), generatedPassword); // Pass email and password
            if (emailSent) {
                System.out.println("Password sent to: " + registrationDTO.getEmail());
            } else {
                model.addAttribute("error", "Failed to send email. Please try again.");
                return "Registration"; // Return to registration page if email sending fails
            }

            // Add the registration details to the model to display them on the confirmation page
            model.addAttribute("registerDTO", registrationDTO);

            return "DisplayRegisteredDetails";  // View to show the registration details
        }

        model.addAttribute("error", "Registration failed. Please try again.");
        return "Registration";  // If registration fails, return to the registration page
    }
}
