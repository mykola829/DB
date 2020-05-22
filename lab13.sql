use projectManagementSystem;

explain SELECT user.login,  user_project_task.user_role, task.description, task.title, task.deadline_time
FROM user inner JOIN user_project_task 
INNER JOIN task
ON user.user_id = user_project_task.user_id
AND task.task_id  = user_project_task.task_id
WHERE task.deadline_time between '2018-01-01 10:34:09' and '2018-12-30 10:34:09'
and length(user.login) > 5;

create index task_indx on task(deadline_time);
create unique index user_indx on user(login);

show index from task;
show index from user;

explain  SELECT straight_join user.login,  user_project_task.user_role, task.description, task.title, task.deadline_time
FROM user inner JOIN user_project_task 
INNER JOIN task
ON user.user_id = user_project_task.user_id
AND task.task_id  = user_project_task.task_id
WHERE task.deadline_time between '2018-01-01 10:34:09' and '2018-12-30 10:34:09'
and length(user.login) > 5;
