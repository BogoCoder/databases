CREATE TABLE ventas (
	nombre_item VARCHAR NOT NULL,
    marca VARCHAR NOT NULL,
    segmento VARCHAR NOT NULL,
	talla VARCHAR NOT NULL,
    cantidad INT NOT NULL,
    PRIMARY KEY (nombre_item, marca, segmento, talla)
);
 
INSERT INTO ventas (nombre_item, marca, segmento, talla, cantidad)
VALUES
    ('pantalon', 'ABC', 'Premium', 'small', 4),
    ('pantalon', 'ABC', 'Premium', 'medium', 3),
    ('pantalon', 'ABC', 'Premium', 'large', 6),
    ('pantalon', 'XYZ', 'Premium', 'small', 2),
    ('pantalon', 'XYZ', 'Premium', 'medium', 1),
    ('pantalon', 'XYZ', 'Premium', 'large', 5),
    ('camisa', 'ABC', 'Premium', 'small', 2),
    ('camisa', 'ABC', 'Premium', 'medium', 1),
    ('camisa', 'ABC', 'Premium', 'large', 2),
    ('camisa', 'XYZ', 'Basic', 'small', 3),
    ('camisa', 'XYZ', 'Basic', 'medium', 4),
    ('camisa', 'XYZ', 'Basic', 'large', 1),
    ('falda', 'ABC', 'Premium', 'small', 2),
    ('falda', 'ABC', 'Premium', 'medium', 1),
    ('falda', 'ABC', 'Premium', 'large', 2),
    ('falda', 'XYZ', 'Premium', 'small', 3),
    ('falda', 'XYZ', 'Premium', 'medium', 4),
    ('falda', 'XYZ', 'Premium', 'large', 1),
	('falda', 'ABC', 'Basic', 'small', 8),
    ('falda', 'ABC', 'Basic', 'medium', 5),
    ('falda', 'ABC', 'Basic', 'large', 4),
    ('falda', 'XYZ', 'Basic', 'small', 1),
    ('falda', 'XYZ', 'Basic', 'medium', 2),
    ('falda', 'XYZ', 'Basic', 'large', 3)
	;
