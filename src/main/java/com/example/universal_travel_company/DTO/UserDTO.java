package com.example.universal_travel_company.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

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
    private String dob;

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
