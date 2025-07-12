package  com.xworkz.gym.dto;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDate;

@Data
@RequiredArgsConstructor
public class RegistrationDto {
    private int id;
    private String name;
    private String email;
    private String password;
    private Long phoneNo;
    private String gymPackage;
    private String trainer;
    private double discount;
    private double amount;
    private double amountPaid;
    private double balanceAmount;
    private int age;
    private double height;
    private double weight;
    private double chestSize;
    private String profileImage;

   // @DateTimeFormat(pattern = "yyyy-MM-dd")  // Specify date format
   // private LocalDate dob;
}

