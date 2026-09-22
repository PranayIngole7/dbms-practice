-- CITYCARE HOSPITAL DATABASE

-- DATABASE INITIALIZATION & SCHEMA SETUP

-- Create the hospital database
CREATE DATABASE IF NOT EXISTS citycare_db;
USE citycare_db;

-- Create patients table
CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(80) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE,
    gender VARCHAR(10),
    age INT,
    city VARCHAR(50),
    blood_group VARCHAR(5)
);

-- Create doctors table
CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(80) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE,
    specialization VARCHAR(60),
    experience_years INT,
    consultation_fee DECIMAL(10,2) CHECK (consultation_fee > 0),
    doctor_status VARCHAR(20) DEFAULT 'Active'
);

-- Create appointments table
CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    appointment_time TIME,
    reason VARCHAR(120),
    appointment_status VARCHAR(20) DEFAULT 'Scheduled',
    room_no INT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- Create bills table
CREATE TABLE bills (
    bill_id INT PRIMARY KEY,
    patient_id INT,
    appointment_id INT,
    bill_date DATE,
    consultation_fee DECIMAL(10,2),
    medicine_fee DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    payment_status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

-- Insert dummy records into patients
INSERT INTO patients (patient_id, patient_name, email, phone, gender, age, city, blood_group) 
VALUES 
(101, 'Rohan Patil', 'rohan@gmail.com', '9876510001', 'Male', 29, 'Pune', 'B+'),
(102, 'Kavita Joshi', 'kavita@gmail.com', '9876510002', 'Female', 34, 'Mumbai', 'A+'),
(103, 'Akash More', 'akash@gmail.com', '9876510003', 'Male', 42, 'Nashik', 'O+'),
(104, 'Snehal Pawar', 'snehal@gmail.com', '9876510004', 'Female', 27, 'Pune', 'AB+'),
(105, 'Nitin Kale', 'nitin@gmail.com', '9876510005', 'Male', 51, 'Nagpur', 'O+'),
(106, 'Meena Shinde', 'meena@gmail.com', '9876510006', 'Female', 45, 'Pune', 'B-'),
(107, 'Vijay Jadhav', 'vijay@gmail.com', '9876510007', 'Male', 38, 'Satara', 'A-'),
(108, 'Pallavi Deshmukh', 'pallavi@gmail.com', '9876510008', 'Female', 31, 'Kolhapur', 'B+');

-- Insert dummy records into doctors
INSERT INTO doctors (doctor_id, doctor_name, email, phone, specialization, experience_years, consultation_fee, doctor_status) 
VALUES 
(201, 'Dr. Anil Kulkarni', 'anil@hospital.com', '9876520001', 'Cardiologist', 12, 1200, 'Active'),
(202, 'Dr. Priya Shah', 'priya@hospital.com', '9876520002', 'Dermatologist', 8, 800, 'Active'),
(203, 'Dr. Mahesh Patil', 'mahesh@hospital.com', '9876520003', 'Orthopedic', 15, 1000, 'Active'),
(204, 'Dr. Neha Joshi', 'neha@hospital.com', '9876520004', 'Pediatrician', 10, 900, 'Active'),
(205, 'Dr. Amit More', 'amit@hospital.com', '9876520005', 'Neurologist', 18, 1500, 'Active'),
(206, 'Dr. Riya Kale', 'riya@hospital.com', '9876520006', 'Gynecologist', 11, 1100, 'Active'),
(207, 'Dr. Suresh Pawar', 'suresh@hospital.com', '9876520007', 'ENT', 9, 700, 'Inactive'),
(208, 'Dr. Pooja Shinde', 'pooja@hospital.com', '9876520008', 'General Physician', 7, 600, 'Active');

-- Insert dummy records into appointments
INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, appointment_time, reason, appointment_status, room_no) 
VALUES 
(301, 101, 201, '2026-09-10', '10:00:00', 'Chest pain', 'Scheduled', 101),
(302, 102, 202, '2026-09-10', '11:00:00', 'Skin allergy', 'Completed', 102),
(303, 103, 203, '2026-09-11', '09:30:00', 'Knee pain', 'Scheduled', 103),
(304, 104, 204, '2026-09-11', '12:00:00', 'Fever', 'Completed', 104),
(305, 105, 205, '2026-09-12', '10:30:00', 'Headache', 'Scheduled', 105),
(306, 106, 206, '2026-09-12', '14:00:00', 'Routine checkup', 'Cancelled', 106),
(307, 107, 208, '2026-09-13', '15:00:00', 'Cold', 'Scheduled', 107),
(308, 108, 203, '2026-09-14', '16:00:00', 'Back pain', 'Completed', 108);

-- Insert dummy records into bills
INSERT INTO bills (bill_id, patient_id, appointment_id, bill_date, consultation_fee, medicine_fee, total_amount, payment_status) 
VALUES 
(401, 101, 301, '2026-09-10', 1200, 500, 1700, 'Paid'),
(402, 102, 302, '2026-09-10', 800, 350, 1150, 'Paid'),
(403, 103, 303, '2026-09-11', 1000, 700, 1700, 'Pending'),
(404, 104, 304, '2026-09-11', 900, 300, 1200, 'Paid'),
(405, 105, 305, '2026-09-12', 1500, 900, 2400, 'Pending'),
(406, 106, 306, '2026-09-12', 1100, 250, 1350, 'Cancelled'),
(407, 107, 307, '2026-09-13', 600, 200, 800, 'Paid'),
(408, 108, 308, '2026-09-14', 1000, 450, 1450, 'Pending');



-- Q21. Try inserting a child row with a foreign-key value that does not exist in the parent table.
/*
INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, appointment_time, reason, appointment_status, room_no) 
VALUES (309, 999, 201, '2026-09-15', '11:00:00', 'Consultation', 'Scheduled', 109);
*/

-- Q22. Update the name of one record in the first table (patients).
UPDATE patients SET patient_name = 'Rohan Rajendra Patil' WHERE patient_id = 101;

-- Q23. Update one email or phone field using the primary key.
UPDATE patients SET phone = '9876599999' WHERE patient_id = 102;

-- Q24. Update one numeric field.
UPDATE patients SET age = 35 WHERE patient_id = 102;

-- Q25. Update the status of two or more records using a condition.
UPDATE doctors SET doctor_status = 'Active' WHERE specialization IN ('ENT', 'Dermatologist');

-- Q26. Increase a price, fee, package or credit limit for selected records.
UPDATE doctors SET consultation_fee = consultation_fee + 100 WHERE specialization = 'Cardiologist';

-- Q27. Decrease a stock quantity or other numeric value for selected records.
UPDATE doctors SET experience_years = experience_years - 1 WHERE doctor_id = 207;

-- Q28. Change a city/location for one record.
UPDATE patients SET city = 'Navi Mumbai' WHERE patient_id = 102;

-- Q29. Update a date field for one selected record.
UPDATE appointments SET appointment_date = '2026-09-11' WHERE appointment_id = 301;

-- Q30. Change a record from one valid status to another valid status.
UPDATE appointments SET appointment_status = 'Completed' WHERE appointment_id = 301;

-- Q31. Delete one specific record using its primary key.
DELETE FROM bills WHERE bill_id = 408;

-- Q32. Delete records matching a non-primary-key condition.
DELETE FROM appointments WHERE appointment_status = 'Cancelled';

-- Q33. Delete records having a particular status.
DELETE FROM doctors WHERE doctor_status = 'Inactive';

-- Q34. Delete a child record and verify that the parent remains.
DELETE FROM bills WHERE bill_id = 401;

-- Q35. Attempt to delete a parent referenced by a child table and observe foreign-key behavior.
/*
DELETE FROM patients WHERE patient_id = 102;
*/

-- Q36. Delete a parent only after checking related child records.
DELETE FROM bills WHERE patient_id = 102;
DELETE FROM appointments WHERE patient_id = 102;
DELETE FROM patients WHERE patient_id = 102;

-- Q37. Add a new column using ALTER TABLE.
ALTER TABLE patients ADD COLUMN emergency_contact VARCHAR(15);

-- Q38. Modify the definition of an existing column using ALTER TABLE.
ALTER TABLE patients MODIFY COLUMN emergency_contact VARCHAR(20);

-- Q39. Rename one column using ALTER TABLE ... RENAME COLUMN.
ALTER TABLE patients RENAME COLUMN emergency_contact TO alt_phone;

-- Q40. Add a UNIQUE constraint to an existing column.
ALTER TABLE patients ADD CONSTRAINT uk_alt_phone UNIQUE (alt_phone);

