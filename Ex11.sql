mysql> create table animals(
    -> animal_id INT PRIMARY KEY,
    -> ainmal_name VARCHAR(50),
    -> species VARCHAR(50),
    -> habitat_id INT
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> create table habitats(
    -> habitat_id INT PRIMARY KEY,
    -> habitat_name VARCHAR(50),
    -> climate VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> INSERT INTO animals VALUES(1, 'Lion', 'Mamal', 1),(2, 'Zebra', 'Mamal', 1),(3, 'Tiger', 'Mamal', 2),(4, 'Penguin','Bird', 3);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> INSERT INTO habitats VALUES(1, 'Rainforset', 'Tropical'),(2, 'Desert', 'Arid'),(3, 'Savannah', 'Tropical');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT
    -> h.habitat_id,
    -> h.habitat_name,
    -> h.climate,
    -> COUNT(a.animal_id) AS total_animals
    -> FROM
    -> habitats h
    -> LEFT JOIN
    -> animals a ON h.habitat_id = a.habitat_id
    -> GROUP BY
    -> h.habitat_id, h.habitat_name, h.climate;
+------------+--------------+----------+---------------+
| habitat_id | habitat_name | climate  | total_animals |
+------------+--------------+----------+---------------+
|          1 | Rainforset   | Tropical |             2 |
|          2 | Desert       | Arid     |             1 |
|          3 | Savannah     | Tropical |             1 |
+------------+--------------+----------+---------------+
3 rows in set (0.01 sec)