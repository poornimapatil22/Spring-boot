package com.xworkz.gym.entity;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Data
@RequiredArgsConstructor
@NamedQuery(name ="getAdminByEmail",query = "SELECT a FROM AdminEntity a WHERE a.email=:email and a.password=:password")
@NamedQuery(name = "getCountOfAdminUserNameByEmail", query = "select count(a.email) from AdminEntity a where a.email=:getEmail")
@NamedQuery(name = "getAllByEmail", query = "select a from AdminEntity a where a.email=:getEmail")
@NamedQuery(name = "updatePassword", query = "UPDATE AdminEntity a SET a.password = :getPassword WHERE a.email = :getEmail")
@Table(name="gym_admin_table")
public class AdminEntity{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name="gym_admin_email")
    private String  email;
    @Column(name="gym_admin_password")
    private  String   password;
    @Column(name = "gym_admin_name")
    private String name;
    @Column(name = "login_count")
    private Integer login_count;
    @Column(name="isLocked")
    private Boolean isLocked;
    @Column(name="failedAttempt")
    private Integer failedAttempt;
    @Column(name="lockTime")
    private LocalDateTime lockTime;
   // @Column(name = "admin_profile_image")
   // private  String image;
}
