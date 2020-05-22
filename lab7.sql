use projectManagementSystem;

insert into project(project_name, customer_company) values('project1', 'qwerty');

insert into task (deadline_time, title, description) values ( '2018-03-18 10:34:09', 'task1_title', 'task1_description'),
('2018-01-10 10:34:09', 'task2_title', 'task2_description'),
('2018-02-15 10:34:09', 'task3_title', 'task3_description'),
('2018-02-14 10:34:09', 'task4_title', 'task4_description'),
('2018-02-18 10:34:09', 'task5_title', 'task5_description'),
('2018-07-18 10:34:09', 'task6_title', 'task6_description'),
('2019-01-05 10:34:09', 'task7_title', 'task7_description'),
('2019-01-06 10:34:09', 'task8_title', 'task8_description'),
('2019-02-01 10:34:09', 'task9_title', 'task9_description'),
('2019-02-08 10:34:09', 'task10_title', 'task10_description'),
('2019-03-19 10:34:09', 'task11_title', 'task11_description'),
('2019-03-20 10:34:09', 'task12_title', 'task12_description'),
('2019-03-25 10:34:09', 'task13_title', 'task13_description'),
('2019-04-30 10:34:09', 'task14_title', 'task14_description');

insert task_comment(user_id, task_id, comment_text, posted_time) values (1, 1,  'comment_text1', '2019-03-10 10:34:09'),
(1, 1,  'comment_text15', '2020-03-10 10:34:09'),
(1, 1,  'comment_text61', '2020-03-11 10:34:09'),
(1, 1,  'comment_text17', '2020-03-18 10:34:09'),
(1, 2,  'comment_text115235', '2020-03-15 10:34:09'),
(1, 2,  'comment_text1235', '2020-03-05 10:34:09'),
(1, 3,  'comment_text1234', '2020-03-07 10:34:09'),
	(1, 2, 'comment_text2', '2020-03-01 10:34:09'),
    (1, 3, 'comment_text3', '2020-07-15 10:34:09'),
    (1, 4, 'comment_text4', '2020-05-05 10:34:09'),
    (2, 5, 'comment_text5', '2020-03-07 10:34:09'),
    (2, 6,'comment_text6', '2020-01-25 10:34:09'),
    (2, 7, 'comment_text7', '2020-05-10 10:34:09'),
    (3, 8, 'comment_text8', '2020-04-26 10:34:09'),
    (3, 9, 'comment_text9', '2020-01-14 10:34:09'),
    (4, 10, 'comment_text10', '2020-03-17 10:34:09'),
    (5, 11,'comment_text11', '2020-03-10 10:34:09'),
    (6, 12, 'comment_text12', '2020-03-11 10:34:09'),
    (7, 13, 'comment_text13', '2020-04-09 10:34:09'),
    (7, 14, 'comment_text14', '2020-04-21 10:34:09');
    
select * from task_comment;

insert into user_project_task(user_id,  task_id, project_id, user_role) values (1,1,1,'user'),
(2,2,1,'user'),
(2,3,1,'user'),
(2,4,1,'user'),
(2,5,1,'user'),
(2,6,1,'user'),
(2,7,1,'user'),
(3,7,1,'user'),
(3,7,1,'user'),
(4,7,1,'user'),
(5,7,1,'user'),
(6,7,1,'user'),
(7,7,1,'user'),
(7,7,1,'user');


select user.password from user where user_id = 5;

SELECT login, password, name, surname, task_comment.posted_time, task_comment.comment_text
FROM user RIGHT JOIN task_comment ON
user.user_id = task_comment.user_id;

SELECT contacts.email, user.login, task_comment.posted_time , task_comment.comment_text
FROM user JOIN task_comment ON task_comment.user_id = user.user_id join contacts on contacts.contacts_id = user.user_id
WHERE task_comment.posted_time > '2020-03-10 10:34:09';

SELECT user.login, project.project_name, project.customer_company, user_project_task.user_role, task.description, task.title, task.deadline_time
FROM user inner JOIN user_project_task 
INNER JOIN task
inner join project
ON user.user_id = user_project_task.user_id
AND task.task_id  = user_project_task.task_id
and project.project_id = user_project_task.project_id
WHERE user_project_task.user_role = 'user';

SELECT user.login, task_comment.comment_text, task_comment.posted_time
FROM user INNER JOIN task_comment
ON user.user_id = user.user_id
WHERE user.user_id IN (SELECT user_project_task.user_id FROM user_project_task 
WHERE user_project_task.user_role = 'user') 
ORDER BY task_comment.posted_time DESC LIMIT 3;

SELECT user.login, user.name, user.surname FROM user
WHERE NOT EXISTS
(SELECT * FROM task_comment WHERE task_comment.user_id = user.user_id);

SELECT email, telegram
FROM contacts
WHERE email NOT REGEXP "^[a-z0-9](\.?[a-z0-9]){5,}@g(oogle)?mail\.com$";
