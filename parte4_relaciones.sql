CREATE TABLE proyectos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    dias_estimados INTEGER NOT NULL CHECK (dias_estimados > 0)
);

CREATE TABLE tecnologias (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    categoria VARCHAR(30) NOT NULL
);

CREATE TABLE proyectos_tecnologias (
    id_proyecto INTEGER NOT NULL,
    id_tecnologia INTEGER NOT NULL,
    CONSTRAINT pk_proyectos_tecnologias PRIMARY KEY (id_proyecto, id_tecnologia),
    CONSTRAINT fk_proyecto FOREIGN KEY (id_proyecto) REFERENCES proyectos(id) ON DELETE CASCADE,
    CONSTRAINT fk_tecnologia FOREIGN KEY (id_tecnologia) REFERENCES tecnologias(id) ON DELETE CASCADE
);

INSERT INTO proyectos (nombre, dias_estimados) VALUES
('Sistema de Ventas Online', 45),
('App Móvil de Delivery', 60),
('Plataforma de Gestión Universitaria', 90),
('E-commerce de Ropa', 35),
('Sistema de Control de Inventarios', 50);

INSERT INTO tecnologias (nombre, categoria) VALUES
('Java', 'Backend'),
('Spring Boot', 'Backend'),
('React', 'Frontend'),
('PostgreSQL', 'Base de Datos'),
('MongoDB', 'Base de Datos'),
('Flutter', 'Mobile'),
('Node.js', 'Backend'),
('Angular', 'Frontend');

INSERT INTO proyectos_tecnologias (id_proyecto, id_tecnologia) VALUES
(1, 1), (1, 2), (1, 3), (1, 4),
(2, 6), (2, 7), (2, 5),
(3, 1), (3, 2), (3, 4), (3, 8),
(4, 1), (4, 3), (4, 4),
(5, 1), (5, 2), (5, 4);

SELECT 
    t.nombre AS tecnologia,
    t.categoria
FROM proyectos p
INNER JOIN proyectos_tecnologias pt ON p.id = pt.id_proyecto
INNER JOIN tecnologias t ON t.id = pt.id_tecnologia
WHERE p.nombre = 'Sistema de Ventas Online'
ORDER BY t.nombre;

SELECT 
    p.nombre AS proyecto,
    p.dias_estimados,
    t.nombre AS tecnologia
FROM proyectos p
INNER JOIN proyectos_tecnologias pt ON p.id = pt.id_proyecto
INNER JOIN tecnologias t ON t.id = pt.id_tecnologia
WHERE t.id = 1
ORDER BY p.nombre;

SELECT 
    t.nombre AS tecnologia,
    t.categoria,
    COUNT(pt.id_proyecto) AS cantidad_proyectos
FROM tecnologias t
LEFT JOIN proyectos_tecnologias pt ON t.id = pt.id_tecnologia
GROUP BY t.id, t.nombre, t.categoria
ORDER BY cantidad_proyectos DESC, t.nombre;