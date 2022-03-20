package com.example.universal_travel_company.Service;

import com.example.universal_travel_company.DTO.AirplaneDTO;
import com.example.universal_travel_company.DTO.UserDTO;
import com.example.universal_travel_company.Model.Airplane;
import com.example.universal_travel_company.Model.User;
import com.example.universal_travel_company.Repository.AirplaneRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class AirplaneService {

    @Autowired
    private AirplaneRepository airplaneRepository;

    //List to select plane when scheduling flights
    public List<AirplaneDTO> getAllPlanesForFlights() {
        List<AirplaneDTO> list = new ArrayList<>();
        for (Airplane airplane : airplaneRepository.findAll()) {
            AirplaneDTO dto = new AirplaneDTO();
            dto.setAirplaneId(airplane.getAirplaneId());
            dto.setAirplaneName(airplane.getAirplaneName());
            dto.setCostPerSeat(airplane.getCostPerSeat());
            dto.setNoOfSeats(airplane.getNoOfSeats());
            list.add(dto);
        }
        return list;
    }
}
