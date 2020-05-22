use projectManagementSystem;

select user_id, login 
from user 
where login like '%login%' 
order by login;

select task_id, title, description 
from task
order by deadline_time desc limit 5;

select login, task.task_id, title 
from(task inner join user_project_task)
inner join user
on task.task_id = user_project_task.task_id
and user_project_task.user_id = user.user_id;

select login, task.task_id, title 
from (task inner join user_project_task)
inner join user
on task.task_id = user_project_task.task_id
and user_project_task.user_id = user.user_id
group by login order by login desc;