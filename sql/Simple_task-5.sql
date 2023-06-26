-- 1st alternative:
UPDATE todo SET done = true WHERE user_id = 2;
SELECT * FROM todo;
SELECT * FROM "user";

-- 2nd alternative:
SELECT todo.*, "user".name FROM todo INNER JOIN "user" ON todo.user_id = "user".id WHERE "user".name = 'John';

UPDATE todo
SET done = TRUE
FROM "user"
WHERE "user".id = todo.user_id AND "user".name = 'John';

SELECT * FROM todo;