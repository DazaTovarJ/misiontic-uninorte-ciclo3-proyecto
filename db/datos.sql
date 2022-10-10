-- roles
insert into gestion_vuelos.roles (nombre, descripcion)
values  ('Piloto', 'Piloto'),
        ('Superadministrador', 'Superadministrador'),
        ('Pasajero', 'Pasajero');

-- Paises

insert into gestion_vuelos.paises (pais)
values  ('Colombia'),
        ('Afganistan'),
        ('Alemania'),
        ('Arabia Saudita'),
        ('Argentina'),
        ('Australia'),
        ('Bélgica'),
        ('Bolivia'),
        ('Brasil'),
        ('Camboya'),
        ('Canadá'),
        ('Chile'),
        ('China'),
        ('Corea'),
        ('Costa Rica'),
        ('Cuba'),
        ('Dinamarca'),
        ('Ecuador'),
        ('Egipto'),
        ('El Salvador'),
        ('Escocia'),
        ('España'),
        ('Estados Unidos'),
        ('Estonia'),
        ('Etiopia'),
        ('Filipinas'),
        ('Finlandia'),
        ('Francia'),
        ('Gales'),
        ('Grecia'),
        ('Guatemala'),
        ('Haití'),
        ('Holanda'),
        ('Honduras'),
        ('Indonesia'),
        ('Inglaterra'),
        ('Irak'),
        ('Irán'),
        ('Irlanda'),
        ('Israel'),
        ('Italia'),
        ('Japón'),
        ('Jordania'),
        ('Laos'),
        ('Letonia'),
        ('Lituania'),
        ('Malasia'),
        ('Marruecos'),
        ('México'),
        ('Nicaragua'),
        ('Noruega'),
        ('Nueva Zelanda'),
        ('Panamá'),
        ('Paraguay'),
        ('Perú'),
        ('Polonia'),
        ('Portugal'),
        ('Puerto Rico'),
        ('Republica Dominicana'),
        ('Rumania'),
        ('Rusia'),
        ('Suecia'),
        ('Suiza'),
        ('Tailandia'),
        ('Taiwán'),
        ('Turquía'),
        ('Ucrania'),
        ('Uruguay'),
        ('Venezuela'),
        ('Vietnam');

-- tipos_de_documentos
insert into gestion_vuelos.tipos_de_documentos (abreviatura, nombre, pais)
values  ('CC', 'Cedula de ciudadania', 1),
        ('CE', 'Cedula de extrangeria', 1),
        ('TI', 'Tarjeta de identidad', 1);

-- nacionalidaes
insert into gestion_vuelos.nacionalidades (nacionalidad)
values  ('Afgano'),
        ('Alemán'),
        ('Árabe'),
        ('Argentino'),
        ('Australiano'),
        ('Belga'),
        ('Boliviano'),
        ('Brasileño'),
        ('Camboyano'),
        ('Canadiense'),
        ('Chileno'),
        ('Chino'),
        ('Colombiano'),
        ('Coreano'),
        ('Costarricense'),
        ('Cubano'),
        ('Danes'),
        ('Ecuatoriano'),
        ('Egipcio'),
        ('Salvadoreño'),
        ('Escoces'),
        ('Español'),
        ('Estadounidense'),
        ('Estonio'),
        ('Etiope'),
        ('Filipino'),
        ('Filandés'),
        ('Francés'),
        ('Galés'),
        ('Griego'),
        ('Guatemanteco'),
        ('Haitiano'),
        ('Holandés'),
        ('Hondureño'),
        ('Indones'),
        ('Ingles'),
        ('Iraquí'),
        ('Iraní'),
        ('Irlandés'),
        ('Israelí'),
        ('Italiano'),
        ('Japonés'),
        ('Jordano'),
        ('Laosiano'),
        ('Letón'),
        ('Letonés'),
        ('Malayo'),
        ('Marroquí'),
        ('Mexicano'),
        ('Nicaragüense'),
        ('Noruego'),
        ('Neozelandés'),
        ('Panameño'),
        ('Paraguayo'),
        ('Peruano'),
        ('Polaco'),
        ('Portugues'),
        ('Puertorriqueño'),
        ('Dominicano'),
        ('Romano'),
        ('Ruso'),
        ('Sueco'),
        ('Suizo'),
        ('Tailandés'),
        ('Taiwanes'),
        ('Turco'),
        ('Ucraniano'),
        ('Uruguayo'),
        ('Venezolano'),
        ('Vietnamita');


--  ciudades
insert into gestion_vuelos.ciudades (ciudad, pais)
values  ('Leticia', 1),
        ('Medellin', 1),
        ('Rionegro', 1),
        ('Apartado', 1),
        ('Armenia', 1),
        ('Barranquilla', 1),
        ('Bogotá', 1),
        ('Bucaramanga', 1),
        ('Cali', 1),
        ('Cúcuta', 1),
        ('Cartagena', 1),
        ('Pereira', 1),
        ('San Andres', 1),
        ('Santa Marta', 1),
        ('Montería', 1),
        ('Riohacha', 1),
        ('Bahía Solano', 1),
        ('Arauca', 1),
        ('Barrancanermeja', 1),
        ('Caucasia', 1),
        ('Florencia', 1),
        ('Guapi', 1),
        ('Ibague', 1),
        ('Ipiales', 1),
        ('La Macarena', 1),
        ('Manizales', 1),
        ('Mocoa', 1),
        ('Maicao', 1),
        ('Mitú', 1),
        ('Neiva', 1),
        ('Nuquí', 1),
        ('Pasto', 1),
        ('Pitalito', 1),
        ('Popayan', 1),
        ('Providencia', 1),
        ('Puerto Asís', 1),
        ('Puerto Gaitán', 1),
        ('Puerto Inírida', 1),
        ('Puerto Leguízamo', 1),
        ('Puerto Carreño', 1),
        ('Quibdó', 1),
        ('San Jose del Guaviare', 1),
        ('Saravena', 1),
        ('Sincelejo ', 1),
        ('Tumaco ', 1),
        ('Uribia', 1),
        ('Valledupar', 1),
        ('Villavicencio', 1),
        ('Yopal', 1),
        ('Tunja', 1),
        ('Buenaventura', 1);

--  categorias
insert into gestion_vuelos.categorias (categoria)
values  ('Capitan'),
        ('Primer Oficial');


--  Aerolineas
insert into gestion_vuelos.aerolineas (aerolinea)
values  ('Spirit Airlines'),
        ('Taca Airlines'),
        ('Jet Blue'),
        ('Insel Air'),
        ('American Airlines'),
        ('Air Panama'),
        ('Air France'),
        ('Aerolineas Argentinas'),
        ('Avianca'),
        ('ADA Colombia'),
        ('Aires'),
        ('EasyFly'),
        ('Iberia'),
        ('LAN COLOMBIA'),
        ('Vivacolombia.co'),
        ('Satena');

-- Aviones
insert into gestion_vuelos.aviones (avion, modelo, capacidad, matricula, numero_de_silla, aerolineas_id)
values  ('Airbus', 'A350-1000', 2, 'HDA325', '80', 1),
        ('Boeing', '737', 1, 'GFE254', '60', 5),
        ('Boeing ', '747', 2, 'QRS147', '96', 4),
        ('Airbus', 'A340', 1, 'JHT685', '60', 6),
        ('Airbus', '320', 2, 'KUY', '70', 5),
        ('Boeing', '777', 2, 'DFE', '90', 2);
