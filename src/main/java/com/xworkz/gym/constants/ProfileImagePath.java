package com.xworkz.gym.constants;

import lombok.Getter;

@Getter
public enum ProfileImagePath {
   ProfileImagePath("C:\\Users\\ASUS\\Desktop\\Patil_Gym_images");
    private String path;

    ProfileImagePath(String path){
        this.path=path;
    }
}



