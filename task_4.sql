-- Script: task_4.sql
-- Prints the full description of the table books
-- Database name will be passed as argument

SELECT 
    COLUMN_NAME AS 'Field',
    COLUMN_TYPE AS 'Type',
    IS_NULLABLE AS 'Null',
    COLUMN_KEY AS 'Key',
    COLUMN_DEFAULT AS 'Default',
    EXTRA AS 'Extra'
FROM 
    information_schema.columns
WHERE 
    table_schema = DATABASE()
    AND table_name = 'books';
