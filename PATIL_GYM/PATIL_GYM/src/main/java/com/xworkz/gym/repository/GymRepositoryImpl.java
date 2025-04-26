package com.xworkz.gym.repository;

import com.xworkz.gym.dto.AdminDto;
import com.xworkz.gym.entity.*;
import com.xworkz.gym.service.EmailService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Repository
@Slf4j
public class GymRepositoryImpl implements GymRepository {
    @Autowired
    EntityManagerFactory emf;
    @Autowired
    private EmailService emailService;

    private RegistrationEntity regEntity;


    @Override
    public AdminEntity getAdminByEmail(String email, String password) {
        EntityManager entityManager = emf.createEntityManager();
        EntityTransaction et = entityManager.getTransaction();
        AdminEntity admin = null;
        try {
            et.begin();
            Query query = entityManager.createNamedQuery("getAdminByEmail");
            query.setParameter("email", email);
            query.setParameter("password", password);
            admin = (AdminEntity) query.getSingleResult();
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
            e.printStackTrace();
        } finally {
            entityManager.close();
        }
        return admin;
    }

    @Override
    public Long getCountOfAdminUserName(String email) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        Object object = em.createNamedQuery("getCountOfAdminUserNameByEmail").setParameter("getEmail", email).getSingleResult();
        System.out.println(object);
        Long count = (Long) object;
        try {
            et.begin();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return count;
    }


    @Override
    public void updateAdminPasswordAndCount(AdminEntity adminEntity) {

        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        try {
            et.begin();
            em.merge(adminEntity);
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
    }


    @Override
    public void saveCustomerEnquiryDetails(EnquiryEntity enquiryEntity) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        try {
            et.begin();
            em.persist(enquiryEntity);
            log.info("from repo  " + enquiryEntity);
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
    }


    @Override
    public List<EnquiryEntity> getAllEnquiryUsersDetails() {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        List<EnquiryEntity> list = em.createNamedQuery("getAllUserDetails", EnquiryEntity.class).getResultList();


        try {
            et.begin();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return list;
    }


    @Override
    public int updateUserEnquiryDetails(int enquiryId, String status, String reason) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        int value = 0;
        try {
            et.begin();
            value = em.createNamedQuery("updateUserEnquiryDetailsById").setParameter("getStatus", status).setParameter("getReason", reason).setParameter("getId", enquiryId).executeUpdate();
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return value;
    }

    @Override
    public List<EnquiryEntity> getAllUserDetailsByStatus(String status) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        List<EnquiryEntity> list = em.createNamedQuery("getAllUserDetailsByStatus", EnquiryEntity.class).setParameter("getStatus", status).getResultList();


        try {
            et.begin();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return list;
    }

    @Override
    public void saveRegistredDetails(RegistrationEntity registrationEntity) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        try {
            et.begin();
            em.merge(registrationEntity);
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
    }


    @Override
    public List<RegistrationEntity> getAllRegisteredUsersDetails(String email) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        List<RegistrationEntity> list = em.createNamedQuery("getAllRegisteredUsersDetails", RegistrationEntity.class).getResultList();


        try {
            et.begin();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return list;
    }

    @Override
    public int updateRegisteredUsersDetails(int id, String trainer, double amountPaid, double updatedBalance) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        int updatedValue = 0;
        try {
            et.begin();
            updatedValue = em.createNamedQuery("updateRegisteredUserDetails")
                    .setParameter("getTrainer", trainer)
                    .setParameter("getAmountPaid", amountPaid)
                    .setParameter("getBalanceAmount", updatedBalance)  // Update the balanceAmount after deduction
                    .setParameter("getId", id)
                    .executeUpdate();
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
            e.printStackTrace();
        } finally {
            em.close();
        }
        return updatedValue;
    }

    @Override
    public RegistrationEntity getUserByName(String name) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        RegistrationEntity user = null;
        try {
            et.begin();
            Query query = em.createNamedQuery("getUserByName");
            query.setParameter("name", name);
            user = (RegistrationEntity) query.getSingleResult();
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return user;
    }

    @Override
    public Long getCountOfEmail(String email) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        Object object = em.createNamedQuery("getCountOfEnquiryEmail").setParameter("getEmail", email).getSingleResult();
        Long aLong = (Long) object;
        try {
            et.begin();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return aLong;
    }

    @Override
    public RegistrationEntity getAllByEmail(String email) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        RegistrationEntity registrationEntity = null;
        List<RegistrationEntity> list = em.createNamedQuery("getAllByuserEmail").setParameter("getEmail", email).getResultList();

        if (!list.isEmpty()) {
            registrationEntity = list.get(0);
        }
        System.out.println(registrationEntity);
        try {
            et.begin();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }

        return registrationEntity;
    }

    @Override
    public AdminEntity getAdminDeatilsByEmail(String email) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        AdminEntity adminEntity = null;
        List<AdminEntity> list = em.createNamedQuery("getAllByEmail").setParameter("getEmail", email).getResultList();

        if (!list.isEmpty()) {
            adminEntity = list.get(0);
        }
        System.out.println(adminEntity);
        try {
            et.begin();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }

        return adminEntity;
    }

    @Override
    public boolean validAndSaveNewPassword(String  email,String password) {
        EntityManager em=emf.createEntityManager();
        EntityTransaction et=em.getTransaction();
        try{
            et.begin();
            int value = em.createNamedQuery("updatePassword").setParameter("getEmail", email).setParameter("getPassword", password).executeUpdate();
            et.commit();
        }
        catch(Exception e)
        {
            if(et.isActive())
            {
                et.rollback();
            }
        }
        finally {
            em.close();
            //` emf.close();
        }
        return true;

    }


    @Override
    public void updateLockCount(String email, int count) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            int value = em.createNamedQuery("updateLockCount").setParameter("getEmail", email).setParameter("getCount", count).executeUpdate();
            System.out.println("updateLockCount " + value);
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
    }


    @Override
    public void updateLockTime(String email, LocalDateTime localDateTime) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            int value = em.createNamedQuery("updateLockTime").setParameter("getEmail", email).setParameter("getLockTime", localDateTime).executeUpdate();
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }

    }

    @Override
    public int validateAndUpdateNewPassword(int id, String password, String confirmPassword) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        int value = 0;
        try {
            if (!password.equals(confirmPassword)) {
                // Return an error if the passwords don't match
                return -1;
            }

            et.begin();
            value = em.createNamedQuery("updateUserNewPassword")
                    .setParameter("getPassword", password)
                    .setParameter("getLockCount", 1)
                    .setParameter("getId", id)
                    .executeUpdate();
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
            e.printStackTrace();
        } finally {
            em.close();
        }
        return value;
    }


    @Override
    public RegistrationEntity getUserByEmail(String email) {
        EntityManager em = emf.createEntityManager();
        RegistrationEntity registrationEntity = null;

        try {
            // Create and configure the query with the named query "getUserByEmail"
            Query query = em.createNamedQuery("getUserByEmail");
            query.setParameter("email", email);  // Setting the "email" parameter

            System.out.println("Executing query for email: " + email);  // Debugging output

            // Execute the query and retrieve the single result
            registrationEntity = (RegistrationEntity) query.getSingleResult();

            System.out.println("User found: " + registrationEntity);  // Debugging output for successful result
        } catch (NoResultException e) {
            // If no result is found, handle gracefully
            System.out.println("No user found for email: " + email);  // Debugging output
        } catch (Exception e) {
            // Catch any other exceptions and print stack trace for debugging
            System.err.println("Error occurred while retrieving user by email: " + email);
            e.printStackTrace();  // Printing full stack trace for debugging
        } finally {
            // Ensure that the EntityManager is closed to avoid resource leaks
            em.close();
        }

        return registrationEntity;  // Return null if no user was found, or the entity if found
    }






    @Override
    public int updateUserProfile(RegistrationEntity entity, String filePath, String email) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        int value = 0;
        try {
            et.begin();
            value = em.createNamedQuery("updateUserProfile")
                    .setParameter("getprofileImage", filePath)
                    .setParameter("getName", entity.getName())
                   // .setParameter("getEmail", entity.getEmail())
                    .setParameter("getPhoneNo", entity.getPhoneNo())
                    .setParameter("getAge", entity.getAge())
                    .setParameter("getWeight", entity.getWeight())
                    .setParameter("getHeight", entity.getHeight())
                    //.setParameter("getDob", entity.getDob())
                            .setParameter("getEmail", entity.getEmail()).executeUpdate();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return value;
    }

    @Override
    public RegistrationEntity getAllRegisteredUserDetailsById(int id) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        RegistrationEntity list = em.createNamedQuery("getAllRegDetailsById", RegistrationEntity.class).setParameter("getId", id).getSingleResult();
        try {
            et.begin();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        System.out.println(list);
        return list;
    }

    @Override
    public boolean saveEmail(String email, String password) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        try {
            et.begin();
            em.persist(regEntity);
            log.info("from reg repo  " + regEntity);
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return false;
    }

    public boolean save(RegistrationEntity userNewPassward) {
        System.out.println("Running on a save in a repoimpl");
        System.out.println("data in repoImpl:"+userNewPassward.toString());
        EntityManager em=emf.createEntityManager();
        EntityTransaction et=em.getTransaction();
        try{
            et.begin();
            em.merge(userNewPassward);
            et.commit();
        }
        catch(Exception e)
        {
            if(et.isActive())
            {
                et.rollback();
            }
        }
        finally {
            em.close();
            //` emf.close();
        }
        return false;
    }


    @Override
    public void saveTrainerDetails(TrainerEntity trainerEntity) {

        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        try {
            et.begin();
            em.persist(trainerEntity);
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }

    }

    @Override
    public void saveslots(SlotsEntity entity) {

        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        try {
            et.begin();
            em.persist(entity);
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
    }

    @Override
    public List<SlotsEntity> getAllSlotsDetails() {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        List<SlotsEntity> slotsEntityList=em.createNamedQuery("getAllSlotsDetails", SlotsEntity.class).getResultList();
        System.out.println(slotsEntityList);
        try {
            et.begin();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return slotsEntityList;
    }

    @Override
    public List<TrainerEntity> getAllTrainerDetails() {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        List<TrainerEntity> trainerEntities=em.createNamedQuery("getAllTrainerDetails", TrainerEntity.class).getResultList();
        System.out.println(trainerEntities);
        try {
            et.begin();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return trainerEntities;
    }

    @Override
    public int deleteSlotById(int idForDelete) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        int val=0;
        try {
            et.begin();
            val=em.createNamedQuery("deleteSlotById").setParameter("getId",idForDelete).executeUpdate();
            System.out.println(val);
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return val;
    }

    @Override
    public void saveAssignUsersToTrainer(UserAssignedToTrainerEntity trainerUser) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        try {
            et.begin();
            em.persist(trainerUser);
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
    }

    @Override
    public int deleteTrainerSlot(int trainerId) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        int val=0;
        try {
            et.begin();
            val=em.createNamedQuery("deleteTrainerSlotById").setParameter("getId",trainerId).executeUpdate();
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }        } finally {
            em.close();
        }
        return val;
    }

    @Override
    public UserAssignedToTrainerEntity getTrainerAndSlotByUserName(String name) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        UserAssignedToTrainerEntity entity= null;

        try {
            et.begin();
            List<UserAssignedToTrainerEntity> trainerEntities=em.createNamedQuery("getTrainerAndSlotByUserName",UserAssignedToTrainerEntity.class).setParameter("getUserName",name).getResultList();
            if(!trainerEntities.isEmpty()){
                entity=trainerEntities.get(0);
            }
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }        } finally {
            em.close();
        }
        return entity;
    }

    @Override
    public List<UserAssignedToTrainerEntity> getUsersAssignedToTrainerByTrainerName(String trainerName) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        List<UserAssignedToTrainerEntity> trainerEntities=em.createNamedQuery("getUsersAssignedToTrainerByTrainerName",UserAssignedToTrainerEntity.class).setParameter("getTrainerName",trainerName).getResultList();
        System.out.println(trainerEntities);
        try {
            et.begin();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }        } finally {
            em.close();
        }

        return trainerEntities;
    }

    @Override
    public int deleteUserAssignedToTrainer(String trainerName) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        int val=0;
        try {
            et.begin();
            val=em.createNamedQuery("deleteUserAssignedToTrainer").setParameter("getTrainerName",trainerName).executeUpdate();
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }        } finally {
            em.close();
        }
        return val;
    }

    @Override
    public void saveUserDietAndExercise(UserExcerciseAndDietEntity entity) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        try {
            et.begin();
            em.persist(entity);
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }        } finally {
            em.close();
        }
    }



    @Override
    public void saveUserUpdatedDietAndExercise(UserUpdatedExcerciseAndDietEntity entity) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        try {
            et.begin();
            em.merge(entity);
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }        } finally {
            em.close();
        }
    }


    @Override
    public List<UserUpdatedExcerciseAndDietEntity> getAlluserExerciseAndDietEntitiesById(int id) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        List<UserUpdatedExcerciseAndDietEntity> list= em.createNamedQuery("getAlluserExerciseAndDietEntitiesById",UserUpdatedExcerciseAndDietEntity.class).setParameter("getId",id).getResultList();

        try {
            et.begin();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }        } finally {
            em.close();
        }

        System.out.println(list);
        return list;
    }


    @Override
    public List<UserExcerciseAndDietEntity> getuserMonthlyImages(int id) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        List<UserExcerciseAndDietEntity> list= em.createNamedQuery("getuserMonthlyImages",UserExcerciseAndDietEntity.class).setParameter("getId",id).getResultList();

        try {
            et.begin();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }        } finally {
            em.close();
        }

        System.out.println(list);
        return list;
    }



        // Assuming this is your EntityManagerFactory or @PersistenceContext

    @Override
    public List<RegistrationEntity> getAllRegisteredUsersDetails() {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        List<RegistrationEntity> list= em.createNamedQuery("getAllRegisteredUsersDetails",RegistrationEntity.class).getResultList();

        try {
            et.begin();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return list;
    }

    @Override
    public List<RegistrationEntity> getAllRegisteredUsersDetailsByNameAndPhoneNo(String searchName, Long searchPhoneNo) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        List<RegistrationEntity> list=em.createNamedQuery("getAllRegisteredUsersDetailsByNameAndPhoneNo").setParameter("getName",searchName).setParameter("getPhoneNo",searchPhoneNo).getResultList();
        try {
            et.begin();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }

        return list;
    }

    @Override
    public Long getCountOfRegEmail(String email) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        Object object = em.createNamedQuery("getCountOfRegEmail").setParameter("getEmail", email).getSingleResult();
        System.out.println(object);
        Long count = (Long) object;
        try {
            et.begin();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return count;
    }



    @Override
    public boolean save(AdminEntity AdminEntity) {
        System.out.println("Running on a save in a repoimpl");
        System.out.println("data in repoImpl:"+AdminEntity.toString());
        EntityManager em=emf.createEntityManager();
        EntityTransaction et=em.getTransaction();
        try{
            et.begin();
            em.merge(AdminEntity);
            et.commit();
        }
        catch(Exception e)
        {
            if(et.isActive())
            {
                et.rollback();
            }
        }
        finally {
            em.close();
            //` emf.close();
        }
        return true;
    }

    }






