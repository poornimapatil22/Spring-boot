package com.xworkz.gym.service;

import com.xworkz.gym.dto.*;
import com.xworkz.gym.entity.*;

import java.util.List;

public interface GymService {
    boolean validAndSave(AdminDto adminDto);

    AdminEntity getAdminByEmail(String email, String password);
    public boolean save(AdminEntity AdminEntity);
    boolean validateCustomerEnquiryDetails(EnquiryDto enquiryDto);

    AdminEntity getAdminDetails(AdminDto adminLoginDTO);
    AdminEntity getAdminDeatilsByEmail(String email);

    boolean validAndSaveNewPassword(String  email,String password);

    List<EnquiryEntity> getAllEnquiryUsersDetails();

    Long getCountOfAdminUserName(String email);


    int updateUserEnquiryDetails(int enquiryId, String status, String reason);

    List<EnquiryEntity> getAllUserDetailsByStatus(String status);

    boolean validateAndSaveRegistredDetails(RegistrationDto registrationDTO);

    List<RegistrationEntity> getAllRegisteredUsersDetails(String email);

    int updateRegisteredUsersDetails(int id, String trainer, double amountPaid, double balanceAmount);

    RegistrationEntity getUserByName(String name);

    Long getCountOfEmail(String email);

    int validteUserPasswordByEmail(String email, String password);

    int validateAndUpdateNewPassword(int id, String password, String confirmpassword);

    int updateUserProfile(RegistrationDto registrationDto, String filePath, String email);

    // List<RegistrationEntity> getAllRegisteredUsersDetailsById(int id);
    public RegistrationEntity getUserByEmail(String email);

    public boolean save(RegistrationEntity userNewPassward);
    //RegistrationEntity getAllRegisteredUserDetailsById(int id);

    public RegistrationEntity getAllRegisteredUsersDetailsById(int id);

    int saveTrainerDetails(TrainerDto trainerDTO);

    void saveslots(String startTime, String endTime, String duration);

    List<SlotsEntity> getAllSlotsDetails();

    List<TrainerEntity> getAllTrainerDetails();

    int deleteSlotById(int idForDelete);

    void assignUsersToTrainer(String trainerName, List<String> userNames, String slot);

    int deleteTrainerSlot(int trainerId);

    UserAssignedToTrainerEntity getTrainerAndSlotByUserName(String name);

    List<UserAssignedToTrainerEntity> getUsersAssignedToTrainerByTrainerName(String trainerName);

    int deleteUserAssignedToTrainer(String trainerName);

    void saveUserDietAndExercise(int id, String filePath, UserExcerciseAndDietDto userExerciseAndDietDTO);

    List<UserUpdatedExcerciseAndDietEntity> getAlluserExerciseAndDietEntitiesById(int id);

    List<UserExcerciseAndDietEntity> getuserMonthlyImages(int id);


    public List<RegistrationEntity> getAllRegisteredUsersDetails();

    public List<RegistrationEntity> getAllRegisteredUsersDetailsByNameAndPhoneNo(String searchName, Long searchPhoneNo);

    public Long getCountOfRegEmail(String email);

}