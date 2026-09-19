INSERT INTO owner (fullname, phone, email) VALUES
('Иван Петров', '+79150001111', 'ivan@mail.ru'),
('Анна Сидорова', '+79150002222', 'anna@mail.ru'),
('Олег Ким', '+79150003333', 'oleg@mail.ru');

INSERT INTO car (owner_id, brand, model, doors_count, plate_number) VALUES
(1, 'Toyota', 'Camry', 4, 'A111AA'),
(1, 'BMW', 'X5', 5, 'B222BB'),
(2, 'Lada', 'Vesta', 4, 'C333CC');

INSERT INTO bike (owner_id, brand, model, speeds_count) VALUES
(2, 'Stels', 'Navigator', 21),
(3, 'Giant', 'Talon', 24),
(1, 'Cube', 'Aim', 18);

INSERT INTO motorbike (owner_id, brand, model, engine_cc) VALUES
(1, 'Yamaha', 'MT-07', 689),
(3, 'Honda', 'CB500', 471),
(2, 'Kawasaki', 'Ninja', 650);

INSERT INTO airplane (owner_id, brand, model, capacity) VALUES
(3, 'Cessna', '172', 4),
(1, 'Piper', 'PA-28', 4),
(2, 'Boeing', '737-model', 180);

INSERT INTO boat (owner_id, brand, model, dock_number) VALUES
(2, 'Bayliner', 'VR5', 12),
(3, 'Quicksilver', '605', 7),
(1, 'Volzhanka', '51', 3);