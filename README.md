## Evidencias y Archivos

- [Ver archivo en Google Drive](https://drive.google.com/file/d/17evZzP9MyML0E7D3yfMH2ur8tV5wpk3w/view?usp=drive_link)

## Modificaciones Realizadas - Parte 2

- **Vuelo.java**: Se agregó el atributo `destino` `@Column(name = "destino", length = 100)`.
- **VueloController.java**: Se actualizó el método `actualizar()` para incluir el campo `destino`.
- **VueloService.java**: No requirió cambios (hereda el comportamiento de `save()` de JpaRepository).
- **Payloads JSON (Postman)**: Ahora se debe incluir el campo `"destino"` en las peticiones POST y PUT.

### Ejemplo de JSON actualizado:
```json
{
  "codigo": "VUE123",
  "precioBoleto": 250.75,
  "asientosDisponibles": 120,
  "destino": "Quito - Guayaquil"
}
