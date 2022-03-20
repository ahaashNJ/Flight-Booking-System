package com.example.universal_travel_company.Repository;

import com.example.universal_travel_company.Model.Airplane;
import com.example.universal_travel_company.Model.Flight;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

@Repository
public interface FlightRepository extends JpaRepository<Flight,Integer> {

    List<Flight> findFlightsByAirplaneAndDate(Airplane airplane, Date date);


}
