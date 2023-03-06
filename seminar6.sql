-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
CREATE TABLE time_to_date
  (time_id INT PRIMARY KEY AUTO_INCREMENT, 
  seconds INT);

INSERT INTO time_to_date (seconds) 
VALUES (123456),(578909), (765432);

DELIMITER |
CREATE FUNCTION format_time(val INT)
RETURNS char(50)
DETERMINISTIC
BEGIN
	DECLARE DD CHAR(3);
	DECLARE HH, MM, SS CHAR(2);
	DECLARE result CHAR(50);
	SET DD = cast(floor(VAL/60/60/24) AS CHAR(3));
	SET HH = cast(floor(MOD(VAL/60/60/24,1)*24) AS CHAR(2));
	SET MM = cast(floor(MOD(MOD(VAL/60/60/24,1)*24,1)*60) AS CHAR(2));
	SET SS = cast(round(MOD(MOD(MOD(VAL/60/60/24,1)*24,1)*60,1)*60) AS CHAR(2));
  SET result = concat(DD,' day(s) ',HH,' hour(s) ',MM,' minute(s) ',SS,' second(s) ');
RETURN result;
END |

SElECT format_time(seconds) AS result from time_to_date; 

-- Выведите только четные числа от 1 до 10.
-- Пример: 2,4,6,8,10
DROP TABLE IF EXISTS nums;
CREATE TABLE nums 
  (id_nums INT PRIMARY KEY AUTO_INCREMENT, 
	odd_nums VARCHAR(4));

INSERT INTO nums (odd_nums) 
VALUES ('Even'), ('Odd'),
       ('Even'), ('Odd'),
       ('Even'), ('Odd'),
       ('Even'), ('Odd'),
       ('Even'), ('Odd');

SELECT id_nums FROM nums WHERE id_nums % 2 = 0; 