package  com.xworkz.gym.controller;

import com.xworkz.gym.constants.GymPackagesEnum;
import com.xworkz.gym.constants.GymTrainersEnum;
import com.xworkz.gym.entity.RegistrationEntity;
import com.xworkz.gym.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/")

public class UpdateRegisteredDetailsController {

    @Autowired
    private GymService gymService;

    List<GymPackagesEnum> packagesEnumList = new ArrayList<>(Arrays.asList(GymPackagesEnum.values()));
    List<GymTrainersEnum> gymTrainersEnums = new ArrayList<>(Arrays.asList(GymTrainersEnum.values()));

    // Show the update form
    @GetMapping("/updateForm")
    public String showUpdateForm(Model model) {
        model.addAttribute("packagesEnumList", packagesEnumList);
        model.addAttribute("gymTrainersEnums", gymTrainersEnums);
        return "UpdateRegisteredDetails"; // JSP page where you will search and update the details
    }

    // Handle form submission when name is entered
    @PostMapping("/updateUserDetails")
    public String updateUserDetails(@RequestParam String name, Model model) {
        RegistrationEntity registrationEntity = gymService.getUserByName(name); // Get user by name

        if (registrationEntity != null) {
            // Add user details to the model for display in the form
            model.addAttribute("user", registrationEntity);
            model.addAttribute("packagesEnumList", packagesEnumList);
            model.addAttribute("gymTrainersEnums", gymTrainersEnums);
            return "UpdateRegisteredDetails"; // JSP page to display details in the form for editing
        } else {
            model.addAttribute("message", "User not found!");
            return "UpdateRegisteredDetails"; // Stay on the form and show error message
        }
    }

    // Handle the form submission for updating the user details
    @PostMapping("/updateRegister")
    public String updateUserDetails(@RequestParam int id,
                                    @RequestParam String trainer,
                                    @RequestParam double amountPaid,
                                    @RequestParam double balanceAmount,
                                    Model model) {
        // Calculate the new balance
        double updatedBalance = balanceAmount;  // this will be the new balance after payment

        // Call service method to update the user's details
        int updated = gymService.updateRegisteredUsersDetails(id, trainer, amountPaid, updatedBalance);

        if (updated > 0) {
            model.addAttribute("message", "User details updated successfully!");
            return "Success";  // Redirect back to search page or another page
        } else {
            model.addAttribute("message", "Error updating user details");
            return "UpdateRegisteredDetails";  // Stay on the update page if there's an error
        }
    }

}
