package com.xworkz.gym.constants;

public enum GymPlacesEnum {

    RAJAJINAGAR("RAJAJINAGAR"),
    VIJAYNAGAR("VIJAYNAGAR"),
    MGROAD("MGROAD"),
    WHITEFIELD("WHITEFIELD");

    private final String displayName;

    GymPlacesEnum(String displayName) {
        this.displayName = displayName;
    }

    @Override
    public String toString() {
        return displayName;
    }
}
