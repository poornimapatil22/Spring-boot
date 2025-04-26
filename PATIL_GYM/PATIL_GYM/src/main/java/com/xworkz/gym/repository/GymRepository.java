package com.xworkz.gym.repository;

import com.xworkz.gym.dto.AdminDto;
import com.xworkz.gym.dto.RegistrationDto;
import com.xworkz.gym.entity.*;

import java.time.LocalDateTime;
import java.util.List;

public interface GymRepository {
   AdminEntity getAdminByEmail(String email,String password);
   void saveCustomerEnquiryDetails(EnquiryEntity enquiryEntity);
   List<EnquiryEntity> getAllEnquiryUsersDetails();
   public boolean save(AdminEntity AdminEntity);
   Long getCountOfAdminUserName(String email);
   void updateAdminPasswordAndCount(AdminEntity adminEntity);
   public Long getCountOfRegEmail(String email);
   public AdminEntity getAdminDeatilsByEmail(String email);

   boolean  validAndSaveNewPassword(String email,String password);
   int updateUserEnquiryDetails(int enquiryId, String status, String reason);

   List<EnquiryEntity> getAllUserDetailsByStatus(String status);

   void saveRegistredDetails(RegistrationEntity registrationEntity);

   List<RegistrationEntity> getAllRegisteredUsersDetails(String email);

   int updateRegisteredUsersDetails(int id,  String trainer, double amountPaid, double balanceAmount);
   RegistrationEntity getUserByName(String name);
   Long getCountOfEmail(String email);
   RegistrationEntity getAllByEmail(String email);
   void updateLockCount(String email,int count);
   void updateLockTime(String email, LocalDateTime localDateTime);
   int validateAndUpdateNewPassword(int id,String password, String confirmpassword);
   int updateUserProfile(RegistrationEntity entity, String filePath, String email);
   RegistrationEntity getAllRegisteredUserDetailsById(int id);
   public boolean saveEmail(String email, String password);
   public RegistrationEntity getUserByEmail(String email);
   public boolean save(RegistrationEntity userNewPassward);
   void saveTrainerDetails(TrainerEntity trainerEntity);

   void saveslots(SlotsEntity entity);

   List<SlotsEntity> getAllSlotsDetails();

   List<TrainerEntity> getAllTrainerDetails();

   int deleteSlotById(int idForDelete);

   void saveAssignUsersToTrainer(UserAssignedToTrainerEntity trainerUser);

   int deleteTrainerSlot(int trainerId);

   UserAssignedToTrainerEntity getTrainerAndSlotByUserName(String name);

   List<UserAssignedToTrainerEntity> getUsersAssignedToTrainerByTrainerName(String trainerName);

   int deleteUserAssignedToTrainer(String trainerName);

   void saveUserDietAndExercise(UserExcerciseAndDietEntity entity);

   List<UserUpdatedExcerciseAndDietEntity> getAlluserExerciseAndDietEntitiesById(int id);

   void saveUserUpdatedDietAndExercise(UserUpdatedExcerciseAndDietEntity entity);

   List<UserExcerciseAndDietEntity> getuserMonthlyImages(int id);

   public List<RegistrationEntity> getAllRegisteredUsersDetails();


   public List<RegistrationEntity> getAllRegisteredUsersDetailsByNameAndPhoneNo(String searchName, Long searchPhoneNo);


}
