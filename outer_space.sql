-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
);

  CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  galaxy_id INTEGER REFERENCES categories,
  moons_id INTEGER REFERENCES categories
);


INSERT INTO galaxies (name)
VALUES
('Milky Way');

INSERT INTO moons (name)
VALUES
('The Moon'),
('Phobos'), 
('Deimos'),
('Naiad'), 
('Thalassa'),
('Despina'), 
('Galatea'), 
('Larissa'), 
('S/2004 N 1'), 
('Proteus'), 
('Triton'),
('Nereid'), 
('Halimede'),
('Sao'),
('Laomedeia'),
('Psamathe'),
('Neso');


INSERT INTO planets
  (name, orbital_period_in_years, orbits_around)
VALUES
  ('Earth', 1.00, 'The Sun'),
  ('Mars', 1.88, 'The Sun'),
  ('Venus', 0.62, 'The Sun'),
  ('Neptune', 164.8, 'The Sun'),
  ('Gliese 876 b', 0.23, 'Gliese 876');

