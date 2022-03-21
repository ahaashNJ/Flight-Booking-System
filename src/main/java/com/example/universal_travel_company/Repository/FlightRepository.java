package com.example.universal_travel_company.Repository;

import com.example.universal_travel_company.Model.Airplane;
import com.example.universal_travel_company.Model.Flight;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

@Repository
public interface FlightRepository extends JpaRepository<Flight,Integer> {

    List<Flight> findFlightsByAirplaneAndDate(Airplane airplane, Date date);

    @Query("FROM flight f where f.toLocation LIKE %:location% OR f.fromLocation LIKE %:location%")
    List<Flight> searchFromLocation(String location);

    @Query("FROM flight f where f.time=:times")
    List<Flight> findFlightByDates(String times);


}
