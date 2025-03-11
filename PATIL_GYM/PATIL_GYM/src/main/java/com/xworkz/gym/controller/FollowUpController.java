package com.xworkz.gym.controller;

import com.xworkz.gym.entity.EnquiryEntity;
import com.xworkz.gym.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/")
public class FollowUpController {
    @Autowired
    private GymService gymService;

    @GetMapping("/followUp")
    public String onFollowUp(Model model){
        List<EnquiryEntity> enquiryEntity=gymService.getAllEnquiryUsersDetails();
        System.out.println(enquiryEntity);
        if(!enquiryEntity.isEmpty()){
            model.addAttribute("list",enquiryEntity);
            return "FollowUp";
        }
        return "FollowUp";
    }


    @RequestMapping("/followUpOperation")
    public String filterByStatus(String status, Model model){
        System.out.println(status);
        List<EnquiryEntity> enquiryEntity=gymService.getAllUserDetailsByStatus(status);
        System.out.println(enquiryEntity);
        if(!enquiryEntity.isEmpty()){
            model.addAttribute("list",enquiryEntity);
            return "FollowUp";
        }
        model.addAttribute("failure","No enquiry records found on '"+status+"' status");
        return "FollowUp";
    }

//    @RequestMapping(value = "/updateStatus", method = RequestMethod.POST)
//    public String updateStatus(@RequestParam("enquiryId") int enquiryId, @RequestParam("enquiryName") String enquiryName, @RequestParam("status") String status, @RequestParam("reason") String reason, Model model) {
//
//        int updatedValue=gymService.updateUserEnquiryDetails(enquiryId,status,reason);
//        if(updatedValue>0){
//            model.addAttribute("enquiryName","Successfully Updated Details Of "+ enquiryName);
//        }
//        else {
//            model.addAttribute("notUpdated","Failed to Update Details of "+enquiryName);
//        }
//        return "FollowUp";
//    }
    @RequestMapping(value = "/updateStatus", method = RequestMethod.POST)
    public String updateStatus(@RequestParam("enquiryId") int enquiryId,
                               @RequestParam("enquiryName") String enquiryName,
                               @RequestParam("status") String status,
                               @RequestParam("reason") String reason,
                               Model model) {

        // Update the user enquiry status and reason
        int updatedValue = gymService.updateUserEnquiryDetails(enquiryId, status, reason);

        // Add appropriate success or failure messages to the model
        if (updatedValue > 0) {
            model.addAttribute("enquiryName", "Successfully updated details of " + enquiryName);
            return "DisplayFollowUp";
        } else {
            model.addAttribute("notUpdated", "Failed to update details of " + enquiryName);

        }

        // Retrieve the updated list of all enquiries or filter by status if provided
        List<EnquiryEntity> enquiryEntity = gymService.getAllEnquiryUsersDetails();
        model.addAttribute("list", enquiryEntity);

        return "FollowUp";  // Return to the same view with updated data
    }




}