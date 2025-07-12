package com.xworkz.gym.entity;

import lombok.Data;
import lombok.RequiredArgsConstructor;

import javax.persistence.*;
@Entity
@Table(name = "gym_enquiry_table")
@Data
@RequiredArgsConstructor
@NamedQuery(name = "getAllUserDetailsByStatus", query = "select a from EnquiryEntity a WHERE a.status=:getStatus")
@NamedQuery(name = "getAllUserDetails", query = "select a from EnquiryEntity a")
@NamedQuery(name = "updateUserEnquiryDetailsById", query = "UPDATE EnquiryEntity a SET a.status=:getStatus,a.reason=:getReason where a.id=:getId")
@NamedQuery(name = "getCountOfEnquiryEmail", query = "select count(a.email) from EnquiryEntity a where a.email=:getEmail")

    public class EnquiryEntity {
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private int id;
        @Column(name = "customer_name")
        private String name;
        @Column(name = "customer_email")
        private String email;
        @Column(name = "customer_phoneNumber")
        private long phoneNumber;
        @Column(name = "customer_age")
        private int age;
        @Column(name = "customer_gender")
        private String gender;
        @Column(name = "customer_address")
        private String address;
        @Column(name = "customer_status")
        private String status;
        @Column(name = "customer_area")
        private String areaName;
        @Column(name = "customer_reason")
        private String reason;
    }

