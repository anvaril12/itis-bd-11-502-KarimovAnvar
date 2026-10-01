INSERT INTO owner (last_name, first_name, phone, email) VALUES
('Петров', 'Иван', '+79150001111', 'ivan@mail.ru'),
('Сидорова', 'Анна', '+79150002222', 'anna@mail.ru'),
('Ким', 'Олег', '+79150003333', 'oleg@mail.ru');

INSERT INTO brand (name) VALUES
('Toyota'), ('BMW'), ('Lada'),
('Stels'), ('Giant'), ('Cube'),
('Yamaha'), ('Honda'), ('Kawasaki'),
('Cessna'), ('Piper'), ('Boeing'),
('Bayliner'), ('Quicksilver'), ('Volzhanka');

INSERT INTO car_model (brand_id, name, doors_count) VALUES
(1, 'Camry', 4),
(2, 'X5', 5),
(3, 'Vesta', 4);
INSERT INTO car (owner_id, car_model_id, plate_number) VALUES
(1, 1, 'A111AA'),
(1, 2, 'B222BB'),
(2, 3, 'C333CC');

INSERT INTO bike_model (brand_id, name, speeds_count) VALUES
(4, 'Navigator', 21),
(5, 'Talon', 24),
(6, 'Aim', 18);
INSERT INTO bike (owner_id, bike_model_id) VALUES
(2, 1),
(3, 2),
(1, 3);

INSERT INTO motorbike_model (brand_id, name, engine_cc) VALUES
(7, 'MT-07', 689),
(8, 'CB500', 471),
(9, 'Ninja', 650);
INSERT INTO motorbike (owner_id, motorbike_model_id) VALUES
(1, 1),
(3, 2),
(2, 3);

INSERT INTO airplane_model (brand_id, name, capacity) VALUES
(10, '172', 4),
(11, 'PA-28', 4),
(12, '737-model', 180);
INSERT INTO airplane (owner_id, airplane_model_id) VALUES
(3, 1),
(1, 2),
(2, 3);

INSERT INTO boat_model (brand_id, name) VALUES
(13, 'VR5'),
(14, '605'),
(15, '51');
INSERT INTO boat (owner_id, boat_model_id, dock_number) VALUES
(2, 1, 12),
(3, 2, 7),
(1, 3, 3);
