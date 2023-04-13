CREATE TABLE employee
(
    id         BIGSERIAL   NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name  VARCHAR(50) NOT NULL,
    gender     VARCHAR(6)  NOT NULL,
    age        INT         NOT NULL
);


INSERT INTO employee
    (first_name, last_name, gender, age)
VALUES ('Alena', 'Kylemina', 'female', 24),
       ('Dmitrii', 'Gienko', 'male', 39),
       ('Natalia', 'Shoma', 'female', 30),
       ('Valeriy', 'Wilgelms', 'male', 60),
       ('Ekaterina', 'Xrushina', 'female', 18);

-- Добавил в таблицу employee колонку city_id.
ALTER TABLE employee
    ADD COLUMN city_id INT;


UPDATE employee
SET city_id = 1
WHERE id = 1;
UPDATE employee
SET city_id = 2
WHERE id = 2;
UPDATE employee
SET city_id = 1
WHERE id = 3;
UPDATE employee
SET city_id = 2
WHERE id = 4;
UPDATE employee
SET city_id = 1
WHERE id = 5;


CREATE TABLE city
(
    city_id   BIGSERIAL   NOT NULL PRIMARY KEY,
    city_name VARCHAR(50) NOT NULL
);

INSERT INTO city
    (city_name)
VALUES ('Санкт-Петербург'),
       ('Новосибирск'),
       ('Москва');


ALTER TABLE employee ADD FOREIGN KEY (city_id) REFERENCES city (city_id);

SELECT employee.*, city.city_name
FROM employee
INNER JOIN city ON employee.city_id = city.city_id;

-- имена и фамилии сотрудников, а также города, в которых они проживают.
SELECT employee.first_name AS ИМЯ,
       employee.last_name  AS ФАМИЛИЯ,
       city.city_name      AS ГОРОД
FROM employee
INNER JOIN city ON employee.city_id = city.city_id;

-- города, а также имена и фамилии сотрудников, которые в них проживают.
SELECT city.city_name      AS ГОРОД,
       employee.first_name AS ИМЯ,
       employee.last_name  AS ФАМИЛИЯ
FROM employee
RIGHT JOIN city ON employee.city_id = city.city_id;

-- имена всех сотрудников и названия всех городов
SELECT employee.first_name AS ИМЯ,
       city.city_name      AS ГОРОД
FROM employee
FULL JOIN city ON employee.city_id = city.city_id;

--таблица, в которой каждому имени должен соответствовать каждый город.
SELECT employee.first_name AS ИМЯ,
       city.city_name      AS ГОРОД
FROM employee
LEFT JOIN city ON employee.city_id = city.city_id;

-- имена городов, в которых никто не живет.
SELECT city.city_name AS ГОРОД
FROM employee
RIGHT JOIN city ON employee.city_id = city.city_id
WHERE employee.first_name IS NULL;
