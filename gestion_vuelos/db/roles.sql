USE gestion_vuelos;

SELECT * FROM roles;

INSERT INTO roles (nombre, descripcion) VALUES
	("Super Administrador", "Rol del administrador general del sistema"),
    ("Piloto", "Rol del piloto"),
    ("Pasajero", "Rol del pasajero");