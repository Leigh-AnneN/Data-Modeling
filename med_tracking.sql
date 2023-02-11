DROP DATABASE IF EXISTS medical_tracking_db;

CREATE DATABASE medical_tracking_db; 

\c medical_tracking_db;
-- Connect to database

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY, dr_name TEXT NOT NULL UNIQUE, speciality TEXT NOT NULL 
    ); 

CREATE TABLE patients (
    id SERIAL PRIMARY KEY, patient_name TEXT NOT NULL UNIQUE, insurance TEXT, birthday DATE NOT NULL
    ); 

CREATE TABLE visits (
    id SERIAL PRIMARY KEY, doctors_id INTEGER REFERENCES doctors ON DELETE CASCADE, patients_id  INTEGER REFERENCES patients ON DELETE CASCADE, visit_date DATE NOT NULL
    ); 

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY, disease_name TEXT NOT NULL UNIQUE, disease_description TEXT
    ); 

CREATE TABLE diagnoses(
    id SERIAL PRIMARY KEY, visits_id INTEGER REFERENCES visits ON DELETE CASCADE, disease_id  INTEGER REFERENCES diseases ON DELETE CASCADE, notes TEXT
    ); 

INSERT INTO doctors (dr_name, speciality)
VALUES 
('Kobus Ross', 'Dermatologists'), 
('Eloise Williams', 'Family Medicine'), 
('William Kant', 'Family Medicine'); 

INSERT INTO patients (patient_name, insurance, birthday) 
VALUES 
('Leigh Dale', 'Jesgardins', '1981-10-07'), 
('Sadie Dale', 'Homebrew', '2010-10-30'),
('Kate Kate', 'Relectins','1975-01-07');

INSERT INTO diseases (disease_name, disease_description) 
VALUES 
('Low blood pressure', 'Has low blood pressure'), 
('Anxiety', 'Anxiety attacks and heart palpitations'), 
('Bronchitis', 'Infection of the brochial echoli'); 