package com.xworkz.gym.entity;


import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
    @Table(name = "UserAssignedToTrainer")
    @Data
    @NoArgsConstructor
    @NamedQuery(name = "getTrainerAndSlotByUserName",query = "select a from UserAssignedToTrainerEntity a where a.userName=:getUserName")
    @NamedQuery(name = "getUsersAssignedToTrainerByTrainerName",query = "select a from UserAssignedToTrainerEntity a where a.trainerName=:getTrainerName")
    @NamedQuery(name = "deleteUserAssignedToTrainer",query = "DELETE  from UserAssignedToTrainerEntity a where a.trainerName=:getTrainerName")

    public class UserAssignedToTrainerEntity {
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private int id;
        private String trainerName;
        private String userName;
        private String slot;

        public UserAssignedToTrainerEntity(String trainerName, String userName, String slot) {
            this.trainerName = trainerName;
            this.userName = userName;
            this.slot=slot;
        }
}
