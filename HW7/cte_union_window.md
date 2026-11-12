1) CTE

1.1 Вывести модели велосипедов, у которых больше 15 скоростей и названия которых начинаются на А
with speed_count as (select * from bike_model where speeds_count > 15)
select * from speed_count where name like 'A%';
![1.1](./screenshots/1.1.png)

1.2 Вывести имя и фамилию владельца, название модели машины, у которых больше 3 дверей
with doors_count as (select * from car_model where doors_count > 3)
select o.first_name, o.last_name, dc.name from doors_count dc
join car c on dc.car_model_id = c.car_model_id
join owner o on c.owner_id = o.owner_id
![1.2](./screenshots/1.2.png)

1.3 Вывести id самолетов, у моделей которых вместимость больше 100
with capacity as (select * from airplane_model where capacity > 100)
select a.airplane_id from capacity c
join airplane a on a.airplane_model_id = c.airplane_model_id
![1.3](./screenshots/1.3.png)

2) UNION

2.1 Вывести единый список названий моделей автомобилей и велосипедов. 
Для каждой модели указать тип транспортного средства. Без повторяющихся строк
select name as model_name, 'car' as vehicle_type from car_model
union
select name as model_name, 'bike' as vehicle_type from bike_model
![2.1](./screenshots/2.1.png)

3) INTERSECT

3.1 Вывести имена и фамилии владельцев, у которых одновременно есть автомобиль и велосипед
select o.owner_id, o.last_name, o.first_name from car c join owner o on c.owner_id = o.owner_id
intersect
select o.owner_id, o.last_name, o.first_name from bike b join owner o on b.owner_id = o.owner_id
![3.1](./screenshots/3.1.png)
 
4) EXCEPT

4.1 Вывести id владельцев, у которых есть велосипед, кроме владельца с id = 1
select owner_id from bike
except
select owner_id from owner where owner_id = 1
![4.1](./screenshots/4.1.png)

5) PARTITION BY

5.1 Посчитать количество автомобилей у каждого владельца
select owner_id, car_id, count(*) over (partition by owner_id) from car
![5.1](./screenshots/5.1.png)

5.2 Пронумеровать автомобили каждого владельца начиная с 1. 
Вывести owner_id, car_id и порядковый номер автомобиля владельца
select owner_id, car_id, count(*) over (partition by owner_id) from car
![5.2](./screenshots/5.2.png)

6) PARTITION BY + ORDER BY

6.1 Пронумеровать автомобили каждого владельца начиная с 1.
Вывести owner_id, car_id и порядковый номер автомобиля владельца. Отсортировать по car_id
select owner_id, car_id, row_number() over (partition by car.owner_id order by car_id) from car;
![6.1](./screenshots/6.1.png)

6.2 Для каждой марки автомобилей определить рейтинг моделей по количеству дверей — 
от большего количества к меньшему. Вывести brand_id, название модели, количество дверей 
и её место в рейтинге
select brand_id, name, doors_count, rank() over (partition by brand_id order by doors_count desc) from car_model
![6.2](./screenshots/6.2.png)

7) ROWS

7.1 Вывести модели автомобилей и накопительное количество дверей
select name, doors_count, sum(doors_count) over (order by car_model_id rows between unbounded preceding and current row) from car_model
![7.1](./screenshots/7.1.png)

7.2 Для каждой модели посчитать среднее количество дверей у неё и у предыдущей модели
select name, doors_count, avg(doors_count) over (order by car_model_id rows between 1 preceding and current row) from car_model
![7.2](./screenshots/7.2.png)

8) RANGE

8.1 Вывести модель и количество моделей, у которых дверей не больше, чем у текущей модели
select name, count(*) over(order by doors_count range between unbounded preceding and current row ) from car_model
![8.1](./screenshots/8.1.png)

8.2 Вывести модель и накопительную сумму дверей для моделей, отсортированных по количеству дверей
select name, sum(doors_count) over (order by doors_count range between unbounded preceding and current row ) from car_model
![8.2](./screenshots/8.2.png)

9) Ранжирующие

9.1 ROW_NUMBER
Вывести название модели автомобиля, количество дверей и её порядковый номер. Нумерацию выполнить по количеству дверей от большего к меньшему
select name, row_number() over (order by doors_count desc) from car_model
![9.1](./screenshots/9.1.png)

9.2 RANK
Вывести название модели автомобиля, количество дверей и её ранг. Ранжировать модели по количеству дверей от большего к меньшему
select name, doors_count, rank() over(order by doors_count desc) from car_model
![9.2](./screenshots/9.2.png)

9.3 Вывести название модели автомобиля, количество дверей и плотный ранг модели по количеству дверей от большего к меньшему
select name, doors_count, dense_rank() over(order by doors_count desc ) from car_model
![9.3](./screenshots/9.3.png)

10) Функции смещения

10.1 Вывести название модели и название предыдущей модели по car_model_id
select name, lag(name) over (order by car_model_id) from car_model
![10.1](./screenshots/10.1.png)

10.2 Вывести название модели и название следующей модели по car_model_id
select name, lead(name) over (order by car_model_id) from car_model
![10.2](./screenshots/10.2.png)

10.3 Вывести название каждой модели и название первой модели в списке
select name, first_value(name) over (order by car_model_id) from car_model
![10.3](./screenshots/10.3.png)

10.4 Вывести название каждой модели и название последней модели в списке
select name, last_value(name) over (order by car_model_id rows between unbounded preceding and unbounded following) from car_model
![10.4](./screenshots/10.4.png)