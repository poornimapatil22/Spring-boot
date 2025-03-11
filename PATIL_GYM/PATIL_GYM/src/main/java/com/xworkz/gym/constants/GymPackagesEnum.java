package com.xworkz.gym.constants;

import lombok.Data;
import lombok.Getter;

@Getter
public enum GymPackagesEnum {
        PREMIUM(10000),PRO(8000),BASIC(6000),VIP(20000);
        private int price;
        GymPackagesEnum(int price) {
            this.price=price;
        }
}
