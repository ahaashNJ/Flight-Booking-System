package com.example.universal_travel_company.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
public class FlightDTO {

    @Getter
    @Setter
    private String flightId;

    @Getter
    @Setter
    private String flightDate;

    @Getter
    @Setter
    private String flightTime;

    @Getter
    @Setter
    private String fromLocation;

    @Getter
    @Setter
    private String toLocation;

    @Getter
    @Setter
    private Integer noOfSeats;

    @Getter
    @Setter
    private AirplaneDTO airplaneDTO;

    @Getter
    @Setter
    private UserDTO userDTO;
}
