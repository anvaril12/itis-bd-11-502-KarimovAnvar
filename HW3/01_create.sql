CREATE TABLE owner (
  owner_id SERIAL PRIMARY KEY,
  last_name VARCHAR(50) NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  phone VARCHAR(20),
  email VARCHAR(100)
);
CREATE TABLE brand (
  brand_id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE car_model (
  car_model_id SERIAL PRIMARY KEY,
  brand_id INT NOT NULL REFERENCES brand(brand_id),
  name VARCHAR(50) NOT NULL,
  doors_count INT,
  UNIQUE (brand_id, name)
);
CREATE TABLE car (
  car_id SERIAL PRIMARY KEY,
  owner_id INT NOT NULL REFERENCES owner(owner_id),
  car_model_id INT NOT NULL REFERENCES car_model(car_model_id),
  plate_number VARCHAR(20) UNIQUE
);

CREATE TABLE bike_model (
  bike_model_id SERIAL PRIMARY KEY,
  brand_id INT NOT NULL REFERENCES brand(brand_id),
  name VARCHAR(50) NOT NULL,
  speeds_count INT,
  bike_type VARCHAR(30) DEFAULT 'mountain',
  UNIQUE (brand_id, name)
);
CREATE TABLE bike (
  bike_id SERIAL PRIMARY KEY,
  owner_id INT NOT NULL REFERENCES owner(owner_id),
  bike_model_id INT NOT NULL REFERENCES bike_model(bike_model_id)
);

CREATE TABLE motorbike_model (
  motorbike_model_id SERIAL PRIMARY KEY,
  brand_id INT NOT NULL REFERENCES brand(brand_id),
  name VARCHAR(50) NOT NULL,
  engine_cc BIGINT,
  UNIQUE (brand_id, name)
);
CREATE TABLE motorbike (
  motorbike_id SERIAL PRIMARY KEY,
  owner_id INT NOT NULL REFERENCES owner(owner_id),
  motorbike_model_id INT NOT NULL REFERENCES motorbike_model(motorbike_model_id)
);

CREATE TABLE airplane_model (
  airplane_model_id SERIAL PRIMARY KEY,
  brand_id INT NOT NULL REFERENCES brand(brand_id),
  name VARCHAR(50) NOT NULL,
  capacity INT,
  UNIQUE (brand_id, name)
);
CREATE TABLE airplane (
  airplane_id SERIAL PRIMARY KEY,
  owner_id INT NOT NULL REFERENCES owner(owner_id),
  airplane_model_id INT NOT NULL REFERENCES airplane_model(airplane_model_id)
);

CREATE TABLE boat_model (
  boat_model_id SERIAL PRIMARY KEY,
  brand_id INT NOT NULL REFERENCES brand(brand_id),
  name VARCHAR(50) NOT NULL,
  UNIQUE (brand_id, name)
);
CREATE TABLE boat (
  boat_id SERIAL PRIMARY KEY,
  owner_id INT NOT NULL REFERENCES owner(owner_id),
  boat_model_id INT NOT NULL REFERENCES boat_model(boat_model_id),
  dock_number INT
);
