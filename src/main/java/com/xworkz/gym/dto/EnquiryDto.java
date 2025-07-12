package com.xworkz.gym.dto;

import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
public class EnquiryDto {
    private String name;
    private String email;
    private long phoneNumber;
    private int age;
    private String gender;
    private String address;
    private String areaName;
}
