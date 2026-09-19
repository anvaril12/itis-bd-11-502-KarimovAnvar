CREATE TABLE owner (
  owner_id SERIAL PRIMARY KEY,
  fullname VARCHAR(100) NOT NULL,
  phone VARCHAR(20),
  email VARCHAR(100)
);
CREATE TABLE car (
  car_id SERIAL PRIMARY KEY,
  owner_id INT NOT NULL REFERENCES owner(owner_id),
  brand VARCHAR(50),
  model VARCHAR(50),
  doors_count INT
);
CREATE TABLE bike (
  bike_id SERIAL PRIMARY KEY,
  owner_id INT NOT NULL REFERENCES owner(owner_id),
  brand VARCHAR(50),
  model VARCHAR(50),
  speeds_count INT
);
CREATE TABLE motorbike (
  motorbike_id SERIAL PRIMARY KEY,
  owner_id INT NOT NULL REFERENCES owner(owner_id),
  brand VARCHAR(50),
  model VARCHAR(50),
  engine_cc INT
);
CREATE TABLE airplane (
  airplane_id SERIAL PRIMARY KEY,
  owner_id INT NOT NULL REFERENCES owner(owner_id),
  brand VARCHAR(50),
  model VARCHAR(50),
  capacity INT
);
CREATE TABLE boat (
  boat_id SERIAL PRIMARY KEY,
  owner_id INT NOT NULL REFERENCES owner(owner_id),
  brand VARCHAR(50),
  model VARCHAR(50),
  berth_number INT
);
