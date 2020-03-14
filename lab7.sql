use projectManagementSystem;

insert into project(project_name) values ('qwerty');
insert into user_project(user_id, project_id, user_role) values (1, 1, 'admin'),
(2, 1, 'user'),
(3, 1, 'user'),
(4, 1, 'user'),
(5, 1, 'user'),
(6, 1, 'user'),
(7, 1, 'user'),
(8, 1, 'user');

insert into task (user_id, deadline_time, title, description) values (1, '2020-03-18 10:34:09', 'task1_title', 'task1_description'),
(1,'2020-03-10 10:34:09', 'task2_title', 'task2_description'),
(1, '2020-03-15 10:34:09', 'task3_title', 'task3_description'),
(1, '2020-03-14 10:34:09', 'task4_title', 'task4_description'),
(2, '2020-03-18 10:34:09', 'task5_title', 'task5_description'),
(2, '2020-03-18 10:34:09', 'task6_title', 'task6_description'),
(2, '2020-03-05 10:34:09', 'task7_title', 'task7_description'),
(3, '2020-03-06 10:34:09', 'task8_title', 'task8_description'),
(3, '2020-03-01 10:34:09', 'task9_title', 'task9_description'),
(4, '2020-03-08 10:34:09', 'task10_title', 'task10_description'),
(4, '2020-03-19 10:34:09', 'task11_title', 'task11_description'),
(5, '2020-03-20 10:34:09', 'task12_title', 'task12_description'),
(6, '2020-03-25 10:34:09', 'task13_title', 'task13_description'),
(7, '2020-03-30 10:34:09', 'task14_title', 'task14_description');


select user.password from user where user_id = 5;

SELECT login, password, name, surname, task.deadline_time, task.description
FROM user RIGHT JOIN task ON
user.user_id = task.user_id;

SELECT user.login, user_project.project_id ,user_project.user_role
FROM user JOIN user_project ON user_project.user_id = user.user_id
WHERE user_project.user_role = 'user';

SELECT user.login, user_project.user_role, task.description, task.title, task.deadline_time
FROM (user JOIN user_project) INNER JOIN task
ON user.user_id = user_project.user_id
AND task.user_id  = user.user_id 
WHERE user_project.user_role = 'user';

SELECT user.login, task.title, task.description, task.deadline_time
FROM user INNER JOIN task
ON user.user_id = task.user_id
WHERE user.user_id IN (SELECT user_project.user_id FROM user_project 
WHERE user_project.user_role = 'user') 
ORDER BY task.deadline_time DESC LIMIT 3;

SELECT user.login, user.name, user.surname FROM user
WHERE NOT EXISTS
(SELECT * FROM task WHERE task.user_id = user.user_id);

SELECT email, telegram
FROM contacts
WHERE email NOT REGEXP "^[a-z0-9](\.?[a-z0-9]){5,}@g(oogle)?mail\.com$";
