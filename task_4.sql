-- task_4.sql
-- Print full description of the table 'books' without using DESCRIBE, EXPLAIN, or ANALYZE

SELECT 
    COLUMN_NAME AS `Column`,
    COLUMN_TYPE AS `Type`,
    IS_NULLABLE AS `Nullable`,
    COLUMN_KEY AS `Key`,
    COLUMN_DEFAULT AS `Default`,
    EXTRA AS `Extra`
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_SCHEMA = DATABASE()  -- Use the database passed to mysql command
    AND TABLE_NAME = 'books'
ORDER BY 
    ORDINAL_POSITION;
