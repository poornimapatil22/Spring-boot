package com.xworkz.gym.controller;


import com.xworkz.gym.dto.RegistrationDto;
import com.xworkz.gym.entity.RegistrationEntity;
import com.xworkz.gym.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
        @GetMapping("/UserLogin")
        public String onLogin(){

            return "UserLoginPage";
        }
        @PostMapping("/userLogin")
        public String onUserLogin(String userEmail, String password, Model model, HttpSession httpSession){
            List<RegistrationEntity> registrationEntity=gymService.getAllRegisteredUsersDetails(userEmail);
            httpSession.setAttribute("userRegEntity",registrationEntity);
            int valid=gymService.validteUserPasswordByEmail(userEmail,password);


            return "UserLogin";
        }

        @PostMapping("/setuserPassword")
        public String onResetPassword(String password,String confirmpassword,HttpSession httpSession,Model model){
            RegistrationEntity entity=(RegistrationEntity) httpSession.getAttribute("userRegEntity");
            int id=entity.getId();
            System.out.println(id);
            int value=gymService.validateAndupdateNewPassword(id,password,confirmpassword);
            if(value>0){
                model.addAttribute("Setnewpassword","Successfully updated New Password");
                return "SetNewUserPassword";
            }
            model.addAttribute("notSetnewpassword","New Password Not Updated");
            return "SetNewUserPassword";
        }

        @GetMapping("/updateProfile")
        public String onUpdate(HttpSession httpSession,Model model){
            RegistrationEntity entity1=(RegistrationEntity) httpSession.getAttribute("userRegEntity");
            int id=entity1.getId();
            List<RegistrationEntity> entity=gymService.getAllRegisteredUsersDetailsById(id);
            model.addAttribute("entity",entity);
            return "UpdateUserProfile";
        }


        @PostMapping("/updateUserProfile")
        public String onupdate(@RequestParam("thisfile") MultipartFile multipartFile, RegistrationDto registrationDto, Model model, HttpSession httpSession) throws IOException {
            RegistrationEntity entity1 = (RegistrationEntity) httpSession.getAttribute("userRegEntity");
            int id = entity1.getId();
            String filePath;

            if (multipartFile.isEmpty()) {
                return "UpdateUserDetails.jsp";
            } else {
                System.out.println(multipartFile);
                System.out.println(multipartFile.getOriginalFilename());
                byte[] bytes = multipartFile.getBytes();
                File ProfileImagePath = null;
                Path path = Paths.get(ProfileImagePath.getPath() + System.currentTimeMillis() + ".jpg");
                Files.write(path, bytes);
                filePath = path.getFileName().toString();
            }
            int updatedValue=gymService.updateUserProfile(registrationDto,filePath,id);
            if(updatedValue>0) {
                List<RegistrationEntity> entity=gymService.getAllRegisteredUsersDetailsById(id);
                model.addAttribute("list",entity);
                return "UserPage";
            }
            return "UserPage";
        }

    }
