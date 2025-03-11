package com.xworkz.gym.entity;

import lombok.Data;
import lombok.RequiredArgsConstructor;

import javax.persistence.*;

@Entity
@Data
@RequiredArgsConstructor
@NamedQuery(name ="getAdminByEmail",query = "SELECT a FROM AdminEntity a WHERE a.email=:email and a.password=:password")
@NamedQuery(name = "getCountOfAdminUserNameByEmail", query = "select count(a.email) from AdminEntity a where a.email=:getEmail")
@Table(name="gym_admin_table")
public class AdminEntity{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name="gym_admin_email")
    private String  email;
    @Column(name="gym_admin_password")
    private  String   password;
}
