CREATE TABLE vuelos (
    id SERIAL PRIMARY KEY,
    codigo VARCHAR(10) NOT NULL UNIQUE,
    precio_boleto NUMERIC(10,2) NOT NULL CHECK (precio_boleto >= 0),
    asientos_disponibles INTEGER NOT NULL CHECK (asientos_disponibles >= 0)
);

INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('AA-101', 120.50, 30);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('LA-202', 250.75, 12);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('AV-303', 180.00, 4);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('IB-404', 320.90, 0);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('CM-505', 140.20, 18);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('UA-606', 450.00, 2);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('DL-707', 275.30, 25);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('AM-808', 199.99, 0);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('AR-909', 350.40, 6);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('BA-111', 500.00, 3);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('AF-222', 410.60, 20);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('KL-333', 290.80, 1);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('LH-444', 610.00, 15);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('QF-555', 720.25, 0);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('EK-666', 890.50, 8);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('TK-777', 430.00, 4);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('AZ-888', 210.70, 14);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('AC-999', 375.90, 0);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('JL-121', 650.30, 9);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('SQ-131', 980.00, 2);

SELECT *
FROM vuelos
WHERE asientos_disponibles < 5;

UPDATE vuelos
SET precio_boleto = precio_boleto * 1.15
WHERE id = 3;

DELETE FROM vuelos
WHERE asientos_disponibles = 0;

ALTER TABLE vuelos ADD COLUMN destino VARCHAR(100);

SELECT * FROM vuelos;