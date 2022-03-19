package com.example.universal_travel_company.Model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Date;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "user")
public class User {

    @Id
    @Column(name = "email")
    @NotNull(message = "Email Cannot Be Null")
    @Getter
    @Setter
    private String email;

    @Column(name = "first_name")
    @NotNull(message = "First Name Cannot Be Null")
    @Getter
    @Setter
    private String firstName;

    @Column(name = "last_name")
    @NotNull(message = "Last Name Cannot Be Null")
    @Getter
    @Setter
    private String lastName;

    @Column(name = "contact_number")
    @NotNull(message = "Contact Number Cannot Be Null")
//    @Size(min = 10, max = 10, message = "Contact Number Should Contain 10 Characters")
    @Getter
    @Setter
    private String contactNumber;

    @Column(name = "password")
    @NotNull(message = "Password Cannot Be Null")
    @Getter
    @Setter
    private String password;

    @Column(name = "DOB")
//    @NotNull(message = "Date of Birth Cannot Be Null")
    @Getter
    @Setter
    private Date DOB;

    @Column(name = "approve_status")
    @Getter
    @Setter
    private String approveStatus;

    @Column(name = "user_type")
    @Getter
    @Setter
    private String userType;

}
