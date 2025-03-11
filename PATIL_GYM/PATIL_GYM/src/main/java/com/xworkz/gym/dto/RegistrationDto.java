package com.xworkz.gym.dto;

import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
public class RegistrationDto {
    private String name;
    private String email;
    private String password;
    private long phoneNo;
    private String gymPackage;
    private String trainer;
    private double discount;
    private double amount;
    private double amountPaid;
    private double balanceAmount;
    private int age;
    private double height;
    double weight;
    private double chestSize;
}
