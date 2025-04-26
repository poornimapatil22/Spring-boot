package com.xworkz.gym.service;

import com.xworkz.gym.dto.*;
import com.xworkz.gym.entity.*;
import com.xworkz.gym.repository.GymRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class GymServiceImpl implements GymService {

    @Autowired
    GymRepository adminRepo;
    @Autowired
    GymRepository gymRepository;
    @Autowired
    private EmailService emailService;

    private AdminEntity adminEntity;

    @Override
    public boolean validAndSave(AdminDto adminDto) {
        return false;
    }

    @Override
    public AdminEntity getAdminByEmail(String email,String password) {
        return adminRepo.getAdminByEmail(email,password);
    }

    @Override
    public boolean save(AdminEntity adminEntity) {
        this.gymRepository.save(adminEntity);
        return true;
    }


    @Override
    public AdminEntity getAdminDetails(AdminDto adminDto) {
        return null;
    }

    @Override
    public AdminEntity getAdminDeatilsByEmail(String email) {
        return gymRepository.getAdminDeatilsByEmail(email);
    }

    @Override
    public boolean validAndSaveNewPassword(String  email,String password) {

        return gymRepository.validAndSaveNewPassword(email,password);
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
        return gymRepository.getCountOfAdminUserName(email);
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
    public int validateAndUpdateNewPassword(int id,String password, String confirmpassword) {
        if(password.equals(confirmpassword)){

            return gymRepository.validateAndUpdateNewPassword(id,password,confirmpassword);

        }

        return 0;
    }


//@Override
//public int updateUserProfile(RegistrationDto registrationDto, String profileImage, int id) {
//    // Fetch the existing user entity by ID
//        RegistrationEntity entity=new RegistrationEntity();
//        entity.setName(registrationDto.getName());
//        entity.setEmail(registrationDto.getEmail());
//        entity.setPhoneNo(registrationDto.getPhoneNo());
//        entity.setAge(registrationDto.getAge());
//        entity.setWeight(registrationDto.getWeight());
//        entity.setHeight(registrationDto.getHeight());
//        entity.setChestSize(registrationDto.getChestSize());
//
//        return gymRepository.updateUserProfile(entity,profileImage,id); // If the user wasn't found or update failed
//}

    public int updateUserProfile(RegistrationDto registrationDTO, String profileImagePath, String email) {
        RegistrationEntity entity = gymRepository.getUserByEmail(email);

        if (entity != null) {
            entity.setName(registrationDTO.getName());
            entity.setAge(registrationDTO.getAge());
            entity.setWeight(registrationDTO.getWeight());
            entity.setHeight(registrationDTO.getHeight());
            entity.setProfileImage(profileImagePath);

            gymRepository.save(entity);
            return 1; // Successfully updated
        }

        return 0; // No user found
    }



//    @Override
//    public List<RegistrationEntity> getAllRegisteredUsersDetailsById(int id) {
//        return Collections.emptyList();
//    }

//

    @Override
    public List<RegistrationEntity> getAllRegisteredUsersDetailsByNameAndPhoneNo(String searchName, Long searchPhoneNo) {


        return gymRepository.getAllRegisteredUsersDetailsByNameAndPhoneNo( searchName, searchPhoneNo);
    }

    @Override
    public Long getCountOfRegEmail(String email) {
        return gymRepository.getCountOfRegEmail(email);
    }


    @Override
    public RegistrationEntity getUserByEmail(String email) {
        return gymRepository.getUserByEmail(email);

    }

    @Override
    public boolean save(RegistrationEntity userNewPassward) {
        return gymRepository.save(userNewPassward);
    }

    @Override
    public RegistrationEntity getAllRegisteredUsersDetailsById(int id) {
        return gymRepository.getAllRegisteredUserDetailsById(id);
    }


    @Override
    public int saveTrainerDetails(TrainerDto trainerDTO) {
        boolean valid=true;
        String name=trainerDTO.getTrainer();
        if(name!=null && name.length()>1 && name.length()<30){
            System.out.println("name is valid");
        }
        else {
            valid=false;
            System.out.println("name is in valid");
        }
        String phoneNo=String.valueOf(trainerDTO.getPhoneNo());
        if(phoneNo!=null && phoneNo.length()==10){
            System.out.println("phoneNo valid");
        }
        else {
            valid=false;
            System.out.println("phoneNo Invalid");
        }
        if(valid) {
            TrainerEntity trainerEntity = new TrainerEntity();
            trainerEntity.setTrainerName(trainerDTO.getTrainer());
            trainerEntity.setPhoneNo(trainerDTO.getPhoneNo());
            trainerEntity.setSlotTime(trainerDTO.getTrainerDropdown());
            System.out.println(trainerEntity);

            gymRepository.saveTrainerDetails(trainerEntity);
            return 1;
        }
        return 0;
    }

    @Override
    public void saveslots(String startTime, String endTime, String duration) {
        SlotsEntity entity =new SlotsEntity();
        entity.setStartTime(startTime);
        entity.setEndTime(endTime);
        entity.setDuration(duration);
        gymRepository.saveslots(entity);
    }

    @Override
    public List<SlotsEntity> getAllSlotsDetails() {

        return gymRepository.getAllSlotsDetails();
    }

    @Override
    public List<TrainerEntity> getAllTrainerDetails() {

        return gymRepository.getAllTrainerDetails();
    }

    @Override
    public int deleteSlotById(int idForDelete) {
        return gymRepository.deleteSlotById(idForDelete);
    }

    @Override
    public void assignUsersToTrainer(String trainerName, List<String> userNames,String slot) {
        for (String username : userNames) {
            UserAssignedToTrainerEntity trainerUser = new UserAssignedToTrainerEntity(trainerName, username,slot);
            gymRepository.saveAssignUsersToTrainer(trainerUser);
        }
    }

    @Override
    public int deleteTrainerSlot(int trainerId) {
        return gymRepository.deleteTrainerSlot(trainerId);
    }

    @Override
    public UserAssignedToTrainerEntity getTrainerAndSlotByUserName(String name) {
        return  gymRepository.getTrainerAndSlotByUserName(name);
    }

    @Override
    public List<UserAssignedToTrainerEntity> getUsersAssignedToTrainerByTrainerName(String trainerName) {
        return  gymRepository.getUsersAssignedToTrainerByTrainerName(trainerName);
    }

    @Override
    public int deleteUserAssignedToTrainer(String trainerName) {
        return gymRepository.deleteUserAssignedToTrainer(trainerName);
    }

    @Override
    public void saveUserDietAndExercise(int id, String filePath, UserExcerciseAndDietDto userExerciseAndDietDTO) {
        UserExcerciseAndDietEntity entity=new UserExcerciseAndDietEntity();
        entity.setId(id);
        entity.setMonday(userExerciseAndDietDTO.getMonday());
        entity.setTuesday(userExerciseAndDietDTO.getTuesday());
        entity.setWednesday(userExerciseAndDietDTO.getWednesday());
        entity.setThursday(userExerciseAndDietDTO.getThursday());
        entity.setFriday(userExerciseAndDietDTO.getFriday());
        entity.setSaturday(userExerciseAndDietDTO.getSaturday());
        entity.setSunday(userExerciseAndDietDTO.getSunday());
        entity.setMonth(userExerciseAndDietDTO.getMonth());
        entity.setDietPlan(userExerciseAndDietDTO.getDietPlan());
        entity.setUsermonthlyImage(filePath);
        gymRepository.saveUserDietAndExercise(entity);
        UserUpdatedExcerciseAndDietEntity userUpdatedExerciseAndDietEntity=new UserUpdatedExcerciseAndDietEntity();
        userUpdatedExerciseAndDietEntity.setId(id);
        userUpdatedExerciseAndDietEntity.setMonday(userExerciseAndDietDTO.getMonday());
        userUpdatedExerciseAndDietEntity.setTuesday(userExerciseAndDietDTO.getTuesday());
        userUpdatedExerciseAndDietEntity.setWednesday(userExerciseAndDietDTO.getWednesday());
        userUpdatedExerciseAndDietEntity.setThursday(userExerciseAndDietDTO.getThursday());
        userUpdatedExerciseAndDietEntity.setFriday(userExerciseAndDietDTO.getFriday());
        userUpdatedExerciseAndDietEntity.setSaturday(userExerciseAndDietDTO.getSaturday());
        userUpdatedExerciseAndDietEntity.setSunday(userExerciseAndDietDTO.getSunday());
        userUpdatedExerciseAndDietEntity.setMonth(userExerciseAndDietDTO.getMonth());
        userUpdatedExerciseAndDietEntity.setDietPlan(userExerciseAndDietDTO.getDietPlan());
        userUpdatedExerciseAndDietEntity.setUsermonthlyImage(filePath);
        gymRepository.saveUserUpdatedDietAndExercise(userUpdatedExerciseAndDietEntity);
    }

    @Override
    public List<UserUpdatedExcerciseAndDietEntity> getAlluserExerciseAndDietEntitiesById(int id) {
        return gymRepository.getAlluserExerciseAndDietEntitiesById(id);
    }

    @Override
    public List<UserExcerciseAndDietEntity> getuserMonthlyImages(int id) {
        return gymRepository.getuserMonthlyImages(id);
    }

    @Override
    public List<RegistrationEntity> getAllRegisteredUsersDetails() {
        return gymRepository.getAllRegisteredUsersDetails();
    }


}





