package com.xworkz.gym.repo;

import com.xworkz.gym.entity.AdminEntity;
import com.xworkz.gym.entity.EnquiryEntity;
import com.xworkz.gym.entity.RegistrationEntity;
import com.xworkz.gym.service.EmailService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Properties;

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
    public long getCountOfAdminUserName(String email) {
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
    public int validateAndupdateNewPassword(int id, String password, String confirmpassword) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        int value = 0;
        try {
            et.begin();
            value = em.createNamedQuery("updateUserNewPassword").setParameter("getPassword", password).setParameter("getLockCount", 0).setParameter("getId", id).executeUpdate();

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
    public int updateUserProfile(RegistrationEntity entity, String filePath, int id) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        int value = 0;
        try {
            et.begin();
            value = em.createNamedQuery("updateUserProfile").setParameter("getprofileImage", filePath).setParameter("getName", entity.getName()).setParameter("getEmail", entity.getEmail()).setParameter("getPhoneNo", entity.getPhoneNo()).setParameter("getAge", entity.getAge()).setParameter("getWeight", entity.getWeight()).setParameter("getHeight", entity.getHeight()).setParameter("getChestSize", entity.getChestSize()).setParameter("getId", id).executeUpdate();

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
    public List<RegistrationEntity> getAllRegisteredUserDetailsById(int id) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        List<RegistrationEntity> list = em.createNamedQuery("getAllRegDetailsById", RegistrationEntity.class).setParameter("getId", id).getResultList();
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


}


