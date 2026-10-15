INSERT INTO car_model (brand_id, name, doors_count) VALUES
(1, 'Corolla', 4),
(2, 'X3', 5);

INSERT INTO car (owner_id, car_model_id, plate_number) VALUES
(1, (SELECT car_model_id FROM car_model WHERE name = 'Vesta'), 'D444DD'),
(2, (SELECT car_model_id FROM car_model WHERE name = 'Camry'), 'E555EE'),
(3, (SELECT car_model_id FROM car_model WHERE name = 'Camry'), 'K666KK'),
(3, (SELECT car_model_id FROM car_model WHERE name = 'Niva'), 'M777MM');

INSERT INTO bike_model (brand_id, name, speeds_count, bike_type) VALUES
(4, 'Pilot', 7, 'city'),
(5, 'Expressway', 8, 'city');

INSERT INTO bike (owner_id, bike_model_id) VALUES
(1, (SELECT bike_model_id FROM bike_model WHERE name = 'Pilot')),
(2, (SELECT bike_model_id FROM bike_model WHERE name = 'Talon'));

INSERT INTO airplane_model (brand_id, name, capacity) VALUES
(10, '182', 4),
(12, '747-model', 416);

INSERT INTO airplane (owner_id, airplane_model_id) VALUES
(1, (SELECT airplane_model_id FROM airplane_model WHERE name = '182')),
(3, (SELECT airplane_model_id FROM airplane_model WHERE name = '747-model'));
