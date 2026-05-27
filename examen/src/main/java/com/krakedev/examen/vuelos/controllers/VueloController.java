package com.krakedev.examen.vuelos.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.krakedev.examen.vuelos.entities.Vuelo;
import com.krakedev.examen.vuelos.services.VueloService;

@RestController
@RequestMapping("/api/vuelos")
public class VueloController {

    @Autowired
    private VueloService service;

    @GetMapping
    public ResponseEntity<?> listar() {

        try {

            return ResponseEntity.ok(service.listar());

        } catch (Exception e) {

            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error al listar vuelos");
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> buscar(@PathVariable Integer id) {

        try {

            Vuelo vuelo = service.buscar(id);

            if (vuelo == null) {
                return ResponseEntity.status(HttpStatus.NOT_FOUND)
                        .body("Vuelo no encontrado");
            }

            return ResponseEntity.ok(vuelo);

        } catch (Exception e) {

            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error al buscar vuelo");
        }
    }

    @PostMapping
    public ResponseEntity<?> guardar(@RequestBody Vuelo vuelo) {

        try {

            Vuelo creado = service.guardar(vuelo);

            return ResponseEntity.status(HttpStatus.CREATED)
                    .body(creado);

        } catch (Exception e) {

            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error al guardar vuelo");
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> actualizar(
            @PathVariable Integer id,
            @RequestBody Vuelo vuelo) {

        try {

            Vuelo existente = service.buscar(id);

            if (existente == null) {

                return ResponseEntity.status(HttpStatus.NOT_FOUND)
                        .body("Vuelo no encontrado");
            }

            existente.setCodigo(vuelo.getCodigo());
            existente.setPrecioBoleto(vuelo.getPrecioBoleto());
            existente.setAsientosDisponibles(vuelo.getAsientosDisponibles());

            return ResponseEntity.ok(
                    service.actualizar(existente));

        } catch (Exception e) {

            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error al actualizar vuelo");
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> eliminar(@PathVariable Integer id) {

        try {

            Vuelo vuelo = service.buscar(id);

            if (vuelo == null) {

                return ResponseEntity.status(HttpStatus.NOT_FOUND)
                        .body("Vuelo no encontrado");
            }

            service.eliminar(id);

            return ResponseEntity.ok("Vuelo eliminado");

        } catch (Exception e) {

            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error al eliminar vuelo");
        }
    }

    @GetMapping("/asientos/{cantidad}")
    public ResponseEntity<?> buscarPorAsientos(
            @PathVariable Integer cantidad) {

        try {

            return ResponseEntity.ok(
                    service.buscarPorAsientos(cantidad));

        } catch (Exception e) {

            return ResponseEntity.status(
                    HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error al buscar por asientos");
        }
    }
}