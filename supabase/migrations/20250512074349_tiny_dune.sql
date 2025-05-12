CREATE DATABASE IF NOT EXISTS hospital_management_system;
USE hospital_management_system;

CREATE TABLE IF NOT EXISTS login (
    ID VARCHAR(50),
    PW VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS room (
    room_no VARCHAR(10),
    Availability VARCHAR(20),
    Price VARCHAR(20),
    Bed_Type VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS department (
    Department VARCHAR(50),
    Phone_Number VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS emp_info (
    Name VARCHAR(50),
    Age VARCHAR(10),
    Phone_Number VARCHAR(20),
    Salary VARCHAR(20),
    Gmail VARCHAR(50),
    Aadhar_Number VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS patient_info2 (
    ID VARCHAR(20),
    number VARCHAR(20),
    Name VARCHAR(50),
    Gender VARCHAR(10),
    Disease VARCHAR(50),
    Room_Number VARCHAR(10),
    Time VARCHAR(50),
    Deposite VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS ambulance (
    Name VARCHAR(50),
    Gender VARCHAR(10),
    Car_name VARCHAR(50),
    Available VARCHAR(20),
    Location VARCHAR(100)
);

-- Insert sample login credentials
INSERT INTO login (ID, PW) VALUES ('admin', 'admin123');

-- Insert sample rooms
INSERT INTO room VALUES 
('101', 'Available', '1000', 'Single'),
('102', 'Available', '2000', 'Double'),
('103', 'Available', '3000', 'Deluxe');

-- Insert sample departments
INSERT INTO department VALUES
('Emergency', '1234567890'),
('ICU', '0987654321'),
('General Ward', '1122334455');