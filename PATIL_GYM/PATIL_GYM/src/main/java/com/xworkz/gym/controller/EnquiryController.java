package com.xworkz.gym.controller;
import com.xworkz.gym.constants.GymPlacesEnum;
import com.xworkz.gym.dto.EnquiryDto;
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

@Controller
@RequestMapping("/")
public class EnquiryController {

    @Autowired
    private GymService gymService;

    private  List<GymPlacesEnum> placesEnumList = new ArrayList<>(Arrays.asList(GymPlacesEnum.values()));

    @GetMapping("/enquiryPlaces")
    public String enquiry(Model model) {
        model.addAttribute("placesList", placesEnumList);
        return "Enquiry";
    }

    @PostMapping("/enquiry")
    public String SubmitEnquiryDetails(EnquiryDto enquiryDTO, Model model) {
        System.out.println(enquiryDTO);
        boolean valid = gymService.validateCustomerEnquiryDetails(enquiryDTO);
        if (valid) {
            model.addAttribute("enquiryDTO", enquiryDTO);
            return "DisplayEnquiryDetails";
        }
        return "Home";
    }
}
