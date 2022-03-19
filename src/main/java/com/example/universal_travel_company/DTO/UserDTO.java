package com.example.universal_travel_company.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
public class UserDTO {

    @Getter
    @Setter
    private String email;

    @Getter
    @Setter
    private String firstName;

    @Getter
    @Setter
    private String lastName;

    @Getter
    @Setter
    private Date dob;

    @Getter
    @Setter
    private String password;

    @Getter
    @Setter
    private String userType;

    @Getter
    @Setter
    private Integer contactNumber;

    @Getter
    @Setter
    private String approveStatus;
}
