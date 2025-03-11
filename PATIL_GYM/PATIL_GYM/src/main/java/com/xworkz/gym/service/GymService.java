package com.xworkz.gym.service;

import com.xworkz.gym.dto.AdminDto;
import com.xworkz.gym.dto.EnquiryDto;
import com.xworkz.gym.dto.RegistrationDto;
import com.xworkz.gym.entity.AdminEntity;
import com.xworkz.gym.entity.EnquiryEntity;
import com.xworkz.gym.entity.RegistrationEntity;

import java.util.List;

public interface GymService {
    boolean validAndSave(AdminDto adminDto);
    AdminEntity getAdminByEmail(String email,String password);
    boolean validateCustomerEnquiryDetails(EnquiryDto enquiryDto);
    AdminEntity getAdminDetails(AdminDto adminLoginDTO);

    void validAndSaveNewPassword(AdminDto adminLoginDTO);

    List<EnquiryEntity> getAllEnquiryUsersDetails();

    Long getCountOfAdminUserName(String email);


    int updateUserEnquiryDetails(int enquiryId, String status, String reason);

    List<EnquiryEntity> getAllUserDetailsByStatus(String status);

    boolean validateAndSaveRegistredDetails(RegistrationDto registrationDTO);

    List<RegistrationEntity> getAllRegisteredUsersDetails(String email);

    int updateRegisteredUsersDetails(int id,  String trainer, double amountPaid, double balanceAmount);

    RegistrationEntity getUserByName(String name);

    Long getCountOfEmail(String email);
    int validteUserPasswordByEmail(String email, String password);
    int validateAndupdateNewPassword(int id,String password, String confirmpassword);
    int updateUserProfile(RegistrationDto registrationDto, String filePath,int id);

    List<RegistrationEntity> getAllRegisteredUsersDetailsById(int id);
}
