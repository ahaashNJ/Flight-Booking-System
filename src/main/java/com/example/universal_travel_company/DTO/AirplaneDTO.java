package com.example.universal_travel_company.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
public class AirplaneDTO {

    @Getter
    @Setter
    private Integer airplaneId;

    @Getter
    @Setter
    private String airplaneName;

    @Getter
    @Setter
    private Integer noOfSeats;

    @Getter
    @Setter
    private Integer costPerSeat;
}
