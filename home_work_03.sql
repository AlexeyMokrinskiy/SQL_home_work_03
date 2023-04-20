USE home_work_03;

CREATE TABLE salespeople (
snum INT,
sname VARCHAR(20) NOT NULL,
city VARCHAR(20)
);

-- Наполнение данными
INSERT INTO salespeople (snum, sname, city)
VALUES
('1001', 'Peel', 'London'),
('1002', 'Serres', 'SanJose'),
('1004', 'Motika', 'London'),
('1007', 'Rifkin', 'Barcelona'),
('1003', 'Axelrod', 'NewYork');

SELECT * FROM salespeople;

CREATE TABLE customers (
snum INT,
sname VARCHAR(20) NOT NULL,
city VARCHAR(20),
rating INT
);

-- Наполнение данными
INSERT INTO customers (snum, sname, city, rating)
VALUES
('2001', 'Hoffman', 'London', 100),
('2002', 'Giovanni', 'Rome', 200),
('2003', 'Liu', 'SanJose',200),
('2004', 'Grass', 'Berlin', 300),
('2006', 'Clemens', 'London', 100),
('2008', 'Cisneros', 'SanJose', 300),
('2007', 'Pereira', 'Rome', 100);

SELECT * FROM customers;

CREATE TABLE orders (
onum INT,
amt FLOAT,
odate VARCHAR(20),
cnum INT,
snum INT
);

-- Наполнение данными
INSERT INTO orders (onum, amt, odate, cnum, snum)
VALUES
(3001, 18.69, '10/03/1990', 2008, 1007),
(3003, 767.19, '10/03/1990', 2001, 1001),
(3002, 1900.10, '10/03/1990',2007, 1004),
(3005, 5160.45, '10/03/1990',2003, 1002),
(3006, 1098.16, '10/03/1990', 2008, 1007),
(3009, 1713.23, '10/04/1990', 2002, 1003),
(3007, 75.75, '10/04/1990', 2004, 1002),
(3008, 4723.00, '10/05/1990', 2006, 1001),
(3010, 1309.95, '10/06/1990', 2004, 1002),
(3011, 9891.88, '10/06/1990', 2006, 1001);

-- 1.	 Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: city, sname, snum, comm. 
--       (к первой или второй таблице, используя SELECT)

SELECT city, sname, snum, rating FROM customers;

-- 2.	 Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”)

SELECT rating, sname AS 'Заказчички' 
FROM customers
WHERE city = 'SanJose';

-- 3.	 Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов без каких бы то ни было повторений. (уникальные значения в  “snum“ “Продавцы”)

SELECT DISTINCT(snum) AS 'уникальные значения в  “snum“ Продавцы' FROM salespeople;

-- 4*. 	Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. Используется оператор "LIKE": (“заказчики”) https://dev.mysql.com/doc/refman/8.0/en/string-comparison-functions.html

SELECT sname AS 'Заказчики' FROM customers
WHERE sname LIKE 'G%';

-- 5. 	Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000. (“Заказы”, “amt”  - сумма)

SELECT onum, amt AS 'сумма', odate, cnum, snum FROM orders
WHERE amt > 1000;

-- 6.	Напишите запрос который выбрал бы наименьшую сумму заказа. (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)

SELECT MIN(amt) FROM orders;

-- 7. 	Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, у которых рейтинг больше 100 и они находятся не в Риме.

SELECT * FROM customers
WHERE rating > 100 AND city = 'Rome';

CREATE TABLE staff (
id INT AUTO_INCREMENT PRIMARY KEY,
firstname VARCHAR(45),
lastname VARCHAR(45),
post VARCHAR(100),
seniority INT,
salary INT,
age INT
);

INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
('Вася', 'Петров', 'Начальник', '40', 100000, 60),
('Петр', 'Власов', 'Начальник', '8', 70000, 30),
('Катя', 'Катина', 'Инженер', '2', 70000, 25),
('Саша', 'Сасин', 'Инженер', '12', 50000, 35),
('Иван', 'Иванов', 'Рабочий', '40', 30000, 59),
('Петр', 'Петров', 'Рабочий', '20', 25000, 40),
('Сидр', 'Сидоров', 'Рабочий', '10', 20000, 35),
('Антон', 'Антонов', 'Рабочий', '8', 19000, 28),
('Юрий', 'Юрков', 'Рабочий', '5', 15000, 25),
('Максим', 'Максимов', 'Рабочий', '2', 11000, 22),
('Юрий', 'Галкин', 'Рабочий', '3', 12000, 24),
('Людмила', 'Маркина', 'Уборщик', '10', 10000, 49);

-- 8. Отсортируйте поле “зарплата” в порядке убывания и возрастания

SELECT * FROM staff
ORDER BY salary DESC;

-- 9. ** Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой (возможен подзапрос)

SELECT * FROM staff
ORDER BY salary DESC LIMIT 5;

-- 10. Выполните группировку всех сотрудников по специальности , суммарная зарплата которых превышает 100000

SELECT post, SUM(salary) AS sum 
FROM staff
GROUP BY post
HAVING sum >= 100000;
