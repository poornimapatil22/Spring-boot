package com.xworkz.gym;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class GymApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(GymApplication.class, args);
        System.out.println("Application started!");
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(GymApplication.class);
    }
}
