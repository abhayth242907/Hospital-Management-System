/*
  # Hospital Management System Schema

  1. New Tables
    - login: Store user credentials
    - room: Store room information
    - department: Store department details
    - emp_info: Store employee information
    - patient_info2: Store patient records
    - ambulance: Store ambulance details

  2. Security
    - Enable RLS on all tables
    - Add policies for authenticated users
*/

-- Create tables
CREATE TABLE IF NOT EXISTS login (
    id text PRIMARY KEY,
    password text NOT NULL
);

CREATE TABLE IF NOT EXISTS room (
    room_no text PRIMARY KEY,
    availability text NOT NULL,
    price decimal NOT NULL,
    bed_type text NOT NULL
);

CREATE TABLE IF NOT EXISTS department (
    department text PRIMARY KEY,
    phone_number text NOT NULL
);

CREATE TABLE IF NOT EXISTS emp_info (
    name text PRIMARY KEY,
    age integer NOT NULL,
    phone_number text NOT NULL,
    salary decimal NOT NULL,
    email text NOT NULL,
    aadhar_number text UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS patient_info2 (
    id text NOT NULL,
    number text PRIMARY KEY,
    name text NOT NULL,
    gender text NOT NULL,
    disease text NOT NULL,
    room_number text REFERENCES room(room_no),
    time timestamptz DEFAULT now(),
    deposit decimal NOT NULL
);

CREATE TABLE IF NOT EXISTS ambulance (
    name text PRIMARY KEY,
    gender text NOT NULL,
    car_name text NOT NULL,
    available boolean DEFAULT true,
    location text NOT NULL
);

-- Enable RLS
ALTER TABLE login ENABLE ROW LEVEL SECURITY;
ALTER TABLE room ENABLE ROW LEVEL SECURITY;
ALTER TABLE department ENABLE ROW LEVEL SECURITY;
ALTER TABLE emp_info ENABLE ROW LEVEL SECURITY;
ALTER TABLE patient_info2 ENABLE ROW LEVEL SECURITY;
ALTER TABLE ambulance ENABLE ROW LEVEL SECURITY;

-- Add RLS policies
CREATE POLICY "Allow authenticated read access" ON login FOR SELECT TO authenticated USING (true);
CREATE POLICY "Allow authenticated read access" ON room FOR SELECT TO authenticated USING (true);
CREATE POLICY "Allow authenticated read access" ON department FOR SELECT TO authenticated USING (true);
CREATE POLICY "Allow authenticated read access" ON emp_info FOR SELECT TO authenticated USING (true);
CREATE POLICY "Allow authenticated read access" ON patient_info2 FOR SELECT TO authenticated USING (true);
CREATE POLICY "Allow authenticated read access" ON ambulance FOR SELECT TO authenticated USING (true);

-- Insert initial data
INSERT INTO login (id, password) VALUES ('admin', 'admin123');

INSERT INTO room (room_no, availability, price, bed_type) VALUES 
('101', 'Available', 1000, 'Single'),
('102', 'Available', 2000, 'Double'),
('103', 'Available', 3000, 'Deluxe');

INSERT INTO department (department, phone_number) VALUES
('Emergency', '1234567890'),
('ICU', '0987654321'),
('General Ward', '1122334455');