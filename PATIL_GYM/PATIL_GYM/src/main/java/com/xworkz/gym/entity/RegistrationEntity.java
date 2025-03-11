package com.xworkz.gym.entity;

import lombok.Data;
import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name="gym_registration_table")
@Data
@NamedQueries({
        @NamedQuery(name = "getUserByName", query = "SELECT r FROM RegistrationEntity r WHERE r.name = :name"),
        @NamedQuery(name = "getAllRegisteredUsersDetails", query = "SELECT a FROM RegistrationEntity a"),
        @NamedQuery(name = "updateRegisteredUserDetails", query = "UPDATE RegistrationEntity a SET a.amountPaid = a.amountPaid + :getAmountPaid, a.gymPackage = :getPackage, a.trainer = :getTrainer, a.balanceAmount = :getBalanceAmount, a.amount = :getAmount WHERE a.id = :getId"),
        @NamedQuery(name = "getAllRegisteredUsersDetailsByNameAndPhoneNo", query = "SELECT a FROM RegistrationEntity a WHERE a.name = :getName AND a.phoneNo = :getPhoneNo"), // Fixed phoneNumber issue
        @NamedQuery(name = "getAllRegDetailsById", query = "SELECT a FROM RegistrationEntity a WHERE a.id = :getId"),
        @NamedQuery(name = "updateUserNewPassword", query = "UPDATE RegistrationEntity a SET a.password = :getPassword, a.lockCount = :getLockCount WHERE a.id = :getId"),
        @NamedQuery(name = "getCountOfRegisteredUserEmail", query = "SELECT COUNT(a.email) FROM RegistrationEntity a WHERE a.email = :getEmail"),
        @NamedQuery(name = "getAllByuserEmail", query = "SELECT a FROM RegistrationEntity a WHERE a.email = :getEmail"),
        @NamedQuery(name = "updateLockCount", query = "UPDATE RegistrationEntity a SET a.lockCount = :getCount WHERE a.email = :getEmail"),
        @NamedQuery(name = "updateLockTime", query = "UPDATE RegistrationEntity a SET a.lockTime = :getLockTime WHERE a.email = :getEmail"),
        @NamedQuery(name = "updateUserProfile", query = "UPDATE RegistrationEntity a SET a.profileImage = :getprofileImage, a.name = :getName, a.email = :getEmail, a.phoneNo = :getPhoneNo, a.age = :getAge, a.weight = :getWeight, a.height = :getHeight, a.chestSize = :getChestSize WHERE a.id = :getId"),
        @NamedQuery(name = "getCountOfRegEmail", query = "SELECT COUNT(a.email) FROM RegistrationEntity a WHERE a.email = :getEmail") // Fixed entity reference
})
public class RegistrationEntity extends AbstractAuditEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "customer_name")
    private String name;

    @Column(name = "customer_email")
    private String email;

    @Column(name = "customer_password")
    private String password;

    @Column(name = "customer_phoneNumber")
    private long phoneNo; // Fixed query reference issue

    @Column(name = "package")
    private String gymPackage;

    @Column(name = "customer_trainer")
    private String trainer;

    @Column(name = "discount")
    private double discount;

    @Column(name = "amount")
    private double amount;

    @Column(name = "amountPaid")
    private double amountPaid;

    @Column(name = "balanceAmount")
    private double balanceAmount;

    @Column(name = "lock_count")
    private int lockCount;

    @Column(name = "lock_time")
    private LocalDateTime lockTime;

    @Column(name = "profile_image")
    private String profileImage;

    private int age;
    private double weight;
    private double height;
    private double chestSize;
}
