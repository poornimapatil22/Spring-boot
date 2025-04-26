package com.xworkz.gym.dto;


import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data

@RequiredArgsConstructor
public class TrainerDto {
    private String trainer;
    private  Long phoneNo;
    private String trainerDropdown;
}
