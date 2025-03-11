package com.xworkz.gym.service;

import com.xworkz.gym.dto.AdminDto;
import com.xworkz.gym.dto.EnquiryDto;
import com.xworkz.gym.dto.RegistrationDto;
import com.xworkz.gym.entity.AdminEntity;
import com.xworkz.gym.entity.EnquiryEntity;
import com.xworkz.gym.entity.RegistrationEntity;
import com.xworkz.gym.repo.GymRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class GymServiceImpl implements GymService {

    @Autowired
    GymRepository adminRepo;
    @Autowired
    GymRepository gymRepository;
    @Autowired
    private EmailService emailService;
    @Override
    public boolean validAndSave(AdminDto adminDto) {
        return false;
    }

    @Override
    public AdminEntity getAdminByEmail(String email,String password) {
        return adminRepo.getAdminByEmail(email,password);
    }


    @Override
    public AdminEntity getAdminDetails(AdminDto adminDto) {
        return null;
    }

    @Override
    public void validAndSaveNewPassword(AdminDto adminDto) {
    }

    @Override
    public boolean validateCustomerEnquiryDetails(EnquiryDto enquiryDto) {
        boolean valid=true;
        String name=enquiryDto.getName();
        if(name!=null && name.length()>1 && name.length()<30){
            System.out.println("name is valid");
        }
        else {
            valid=false;
            System.out.println("name is in-valid");
        }
        String email=enquiryDto.getEmail();
        if(email!=null && (email.contains("@gmail.com")||email.contains(".in"))){
            System.out.println("email valid");
        }
        else {
            valid=false;
            System.out.println("email Invalid");
        }
        String phoneNo= String.valueOf(enquiryDto.getPhoneNumber());
        if(phoneNo!=null && phoneNo.length()==10){
            System.out.println("phoneNo valid");
        }
        else {
            valid=false;
            System.out.println("phoneNo Invalid");
        }
        int age=enquiryDto.getAge();
        if(age>=12){
            System.out.println("age valid");
        }
        else {
            valid=false;
            System.out.println("age Invalid");
        }

        if(valid){
            EnquiryEntity enquiryEntity=new EnquiryEntity();
            enquiryEntity.setName(enquiryDto.getName());
            enquiryEntity.setEmail(enquiryDto.getEmail());
            enquiryEntity.setPhoneNumber(enquiryDto.getPhoneNumber());
            enquiryEntity.setAge(enquiryDto.getAge());
            enquiryEntity.setGender(enquiryDto.getGender());
            enquiryEntity.setAddress(enquiryDto.getAddress());
            enquiryEntity.setStatus("Enquiry");
            enquiryEntity.setAreaName(enquiryDto.getAreaName());
            gymRepository.saveCustomerEnquiryDetails(enquiryEntity);
        }
        return valid;
    }

    @Override
    public List<EnquiryEntity> getAllEnquiryUsersDetails() {
        List<EnquiryEntity> enquiryEntity= gymRepository.getAllEnquiryUsersDetails();
        return enquiryEntity;
    }

    @Override
    public Long getCountOfAdminUserName(String email) {
        return 0L;
    }

    @Override
    public int updateUserEnquiryDetails(int enquiryId, String status, String reason) {
        int updatedValue=gymRepository.updateUserEnquiryDetails(enquiryId,status,reason);
        return updatedValue;
    }

    @Override
    public List<EnquiryEntity> getAllUserDetailsByStatus(String status) {

        return gymRepository.getAllUserDetailsByStatus(status);
    }



    @Override
    public boolean validateAndSaveRegistredDetails(RegistrationDto registrationDto) {

        RegistrationEntity registrationEntity=new RegistrationEntity();
        registrationEntity.setName(registrationDto.getName());
        registrationEntity.setEmail(registrationDto.getEmail());
        registrationEntity.setPassword(registrationDto.getPassword());
        registrationEntity.setPhoneNo(registrationDto.getPhoneNo());
        registrationEntity.setGymPackage(registrationDto.getGymPackage());
        registrationEntity.setTrainer(registrationDto.getTrainer());
        registrationEntity.setDiscount(registrationDto.getDiscount());
        registrationEntity.setAmount(registrationDto.getAmount());
        registrationEntity.setAmountPaid(registrationDto.getAmountPaid());
        registrationEntity.setBalanceAmount(registrationDto.getBalanceAmount());
        gymRepository.saveRegistredDetails(registrationEntity);
        return true;
    }



    @Override
    public List<RegistrationEntity> getAllRegisteredUsersDetails(String email) {
        return gymRepository.getAllRegisteredUsersDetails(email);
    }

    @Override
    public int updateRegisteredUsersDetails(int id, String trainer, double amountPaid, double balanceAmount) {
        int value=gymRepository.updateRegisteredUsersDetails(id,trainer,amountPaid,balanceAmount);
        return value;
    }

    @Override
    public RegistrationEntity getUserByName(String name) {
        return gymRepository.getUserByName(name);
    }

    @Override
    public Long getCountOfEmail(String email) {

        return gymRepository.getCountOfEmail(email);
    }
    @Override
    public int validteUserPasswordByEmail(String email, String password) {

        RegistrationEntity list=gymRepository.getAllByEmail(email);
        return 0;
    }
    @Override
    public int validateAndupdateNewPassword(int id,String password, String confirmpassword) {
        if(password.equals(confirmpassword)){

            return gymRepository.validateAndupdateNewPassword(id,password,confirmpassword);

        }

        return 0;
    }

    @Override
    public int updateUserProfile(RegistrationDto registrationDto, String filePath, int id) {
        RegistrationEntity entity=new RegistrationEntity();
        entity.setName(registrationDto.getName());
        entity.setEmail(registrationDto.getEmail());
        entity.setPhoneNo(registrationDto.getPhoneNo());
        entity.setAge(registrationDto.getAge());
        entity.setWeight(registrationDto.getWeight());
        entity.setHeight(registrationDto.getHeight());
        entity.setChestSize(registrationDto.getChestSize());

        return gymRepository.updateUserProfile(entity,filePath,id);
    }

    @Override
    public List<RegistrationEntity> getAllRegisteredUsersDetailsById(int id) {
        return gymRepository.getAllRegisteredUserDetailsById(id);
    }

}
