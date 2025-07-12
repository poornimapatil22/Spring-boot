package com.xworkz.gym.controller;


import com.xworkz.gym.constants.ProfileImagePath;
import com.xworkz.gym.dto.RegistrationDto;
import com.xworkz.gym.entity.RegistrationEntity;
import com.xworkz.gym.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Controller
    @RequestMapping("/")
    public class UserLoginController {

    @Autowired
    private GymService gymService;

    @GetMapping("/userLogin1")
    public String onLogin() {
        return "UserProfile";
    }


    @PostMapping("/userLogin")
    public String onUserLogin(@RequestParam String email, @RequestParam String password, Model model, HttpSession session) {
        RegistrationEntity registrationEntity = gymService.getUserByEmail(email);

        if (registrationEntity == null) {
            model.addAttribute("failure", "User not found. Please check your email or register.");
            return "UserLogin";  // Redirect back to login page with error message
        }

        if (!registrationEntity.getPassword().equals(password)) {
            model.addAttribute("failure", "Invalid password. Please try again.");
            return "UserLogin";  // Redirect with error message
        }

        if (registrationEntity.getCount() == 0) {
            return "UserSetNewPassword";  // If first-time login, ask user to set a new password
        }

        // Store user in session
        session.setAttribute("userRegEntity", registrationEntity);

        return "UserProfile";  // Redirect to user profile
    }



    @PostMapping("setUserNewPassword")
    public String resetPassword(@RequestParam String email, @RequestParam String newPassword, Model model, String oldPassword, @RequestParam String confirmPassword) {
        RegistrationEntity registrationEntity = gymService.getUserByEmail(email);

        if (registrationEntity != null) {

            if (registrationEntity.getPassword().equals(oldPassword) && newPassword.equals(confirmPassword)) {
                registrationEntity.setPassword(String.valueOf(newPassword));
                registrationEntity.setCount(1);
                gymService.save(registrationEntity);
                model.addAttribute("passwordSuccess","password changed successfully!!");
                return "UserProfile";
            } else {
                return "UserSetNewPassword";

            }

        } else {

            return "UserLogin";
        }
    }


//    @GetMapping("/updateProfile")
//    public String onUpdate(HttpSession httpSession, Model model) {
//        RegistrationEntity entity1 = (RegistrationEntity) httpSession.getAttribute("userRegEntity");
//        int id = entity1.getId();
//        RegistrationEntity entity = gymService.getAllRegisteredUsersDetailsById(id);
//        model.addAttribute("user", entity);
//        return "UserProfile";
//    }

//

    @GetMapping("/photo/{imageName}")
    @ResponseBody
    public ResponseEntity<Resource> getImage(@PathVariable String imageName) throws IOException {
        Path path = Paths.get(ProfileImagePath.ProfileImagePath.getPath(), imageName);
        Resource resource = new UrlResource(path.toUri());

        if (resource.exists()) {
            return ResponseEntity.ok()
                    .contentType(MediaType.IMAGE_JPEG)
                    .body(resource);
        } else {
            return ResponseEntity.notFound().build();
        }
    }




    @PostMapping("/updateUserProfile")
    public String onUpdate(@RequestParam("thisfile") MultipartFile multipartFile,
                           RegistrationDto registrationDTO,
                           Model model,
                           HttpSession httpSession) throws IOException {

        // ✅ Retrieve logged-in user from session
        RegistrationEntity entity = (RegistrationEntity) httpSession.getAttribute("userRegEntity");

        if (entity == null) {
            model.addAttribute("error", "User is not logged in.");
            return "UserLogin"; // Redirect to login page if session expired
        }

        //  Use email as a unique identifier
        String email = entity.getEmail();
        String filePath = entity.getProfileImage(); // Default to old image

        // Handle profile image upload
        if (!multipartFile.isEmpty()) {
            // Ensure the directory exists
            File directory = new File(ProfileImagePath.ProfileImagePath.getPath());
            if (!directory.exists()) {
                directory.mkdirs(); // Create directory if it doesn't exist
            }

            // Preserve file extension
            String originalFileName = multipartFile.getOriginalFilename();
            String fileExtension = originalFileName.substring(originalFileName.lastIndexOf(".")); // Extract extension

            //  Generate a new file name with timestamp
            Path path = Paths.get(ProfileImagePath.ProfileImagePath.getPath(), System.currentTimeMillis() + fileExtension);
            Files.write(path, multipartFile.getBytes());

            filePath = path.getFileName().toString(); // Store filename in DB
        }

        // ✅ Call service to update user details
        int updatedValue = gymService.updateUserProfile(registrationDTO, filePath, email);

        if (updatedValue > 0) {
            // ✅ Update session with new user details
            RegistrationEntity updatedEntity = gymService.getUserByEmail(email);
            httpSession.setAttribute("userRegEntity", updatedEntity);

            model.addAttribute("list", updatedEntity);
            return "DisplayUpdatedUserProfile";
        }

        return "UpdateUserProfile";
    }









}







