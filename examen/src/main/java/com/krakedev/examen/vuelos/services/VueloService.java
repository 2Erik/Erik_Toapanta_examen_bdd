package com.krakedev.examen.vuelos.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.krakedev.examen.vuelos.entities.Vuelo;
import com.krakedev.examen.vuelos.repositories.VueloRepository;

@Service
public class VueloService {

    @Autowired
    private VueloRepository repo;

    public List<Vuelo> listar() {
        return repo.findAll();
    }

    public Vuelo buscar(Integer id) {
        return repo.findById(id).orElse(null);
    }

    public Vuelo guardar(Vuelo vuelo) {
        return repo.save(vuelo);
    }

    public Vuelo actualizar(Vuelo vuelo) {
        return repo.save(vuelo);
    }

    public void eliminar(Integer id) {
        repo.deleteById(id);
    }
    
    public List<Vuelo> buscarPorAsientos(Integer asientos) {
        return repo.findByAsientosDisponiblesGreaterThan(asientos);
    }
}