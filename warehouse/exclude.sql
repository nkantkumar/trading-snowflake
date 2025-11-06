SELECT * EXCLUDE (column1, column2)
FROM my_table;


SELECT * EXCLUDE my_prefix_*
FROM my_table;

SELECT * EXCLUDE (METADATA$FILENAME, METADATA$ROW_ID)
FROM ext_table;




COPY INTO my_table FROM (SELECT $1::INT, $2 FROM @my_stage);

INSERT INTO my_table VALUES (1, 'A'), (2, 'B'), (3, 'C');

CREATE TABLE my_clone CLONE my_table AT (OFFSET => -606024);


PUT 'file://data.csv' @~;