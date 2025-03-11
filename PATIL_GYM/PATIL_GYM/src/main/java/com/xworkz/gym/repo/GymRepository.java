package com.xworkz.gym.repo;

import com.xworkz.gym.entity.AdminEntity;
import com.xworkz.gym.entity.EnquiryEntity;
import com.xworkz.gym.entity.RegistrationEntity;

import java.time.LocalDateTime;
import java.util.List;

public interface GymRepository {
   AdminEntity getAdminByEmail(String email,String password);
   void saveCustomerEnquiryDetails(EnquiryEntity enquiryEntity);
   List<EnquiryEntity> getAllEnquiryUsersDetails();

   long getCountOfAdminUserName(String email);
   void updateAdminPasswordAndCount(AdminEntity adminEntity);

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
   int validateAndupdateNewPassword(int id,String password, String confirmpassword);
   int updateUserProfile(RegistrationEntity entity, String filePath,int id);
   List<RegistrationEntity> getAllRegisteredUserDetailsById(int id);
   public boolean saveEmail(String email, String password);
}
