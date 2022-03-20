package com.example.universal_travel_company.DTO;

import com.example.universal_travel_company.Model.Airplane;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Time;
import java.sql.Date;

@NoArgsConstructor
@AllArgsConstructor
public class FlightDTO {

    @Getter
    @Setter
    private Integer flightId;

    @Getter
    @Setter
    private Date flightDate;

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
    private Integer remainingSeats;

    @Getter
    @Setter
    private Airplane airplane;

}
