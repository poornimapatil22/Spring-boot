package com.xworkz.gym.dto;

import lombok.Data;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;




@Data
@RequiredArgsConstructor
public class AdminDto {

   @NonNull
    private String  email;
    private  String password;
    private String confirmPassword;
}
