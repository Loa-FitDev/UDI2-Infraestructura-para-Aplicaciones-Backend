-- init.sql
CREATE TABLE IF NOT EXISTS "Items" (
    "Id" SERIAL PRIMARY KEY,
    "Name" VARCHAR(200) NOT NULL,
    "CreatedAt" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
-- Inserción de datos iniciales de prueba (Seeding)
INSERT INTO "Items" ("Name", "CreatedAt") VALUES 
('Procesador', NOW()),
('Memoria RAM', NOW()),
('Disco rígido HDD', NOW()),
('Fuente de alimentación', NOW());
