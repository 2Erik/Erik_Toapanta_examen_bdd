package com.krakedev.examen.vuelos.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.krakedev.examen.vuelos.entities.Vuelo;

public interface VueloRepository extends JpaRepository<Vuelo, Integer> {

    List<Vuelo> findByAsientosDisponiblesGreaterThan(Integer asientos);

}