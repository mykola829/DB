use projectManagementSystem;

select login, count(task.task_id) as tasksCount
from (task inner join user_project_task)
inner join user
on task.task_id = user_project_task.task_id
and user_project_task.user_id = user.user_id
group by login;

select year(posted_time) as year, monthname(posted_time) as month,
count(comment_id) as comments
from task_comment group by year, month with rollup;

select year(deadline_time) as year, monthname(deadline_time) as month,
count(task_id) as tasks
from task group by year, month with rollup;

select login as user, avg(char_length(comment_text)) as avgdescription
from user inner join task_comment on
user.user_id = task_comment.user_id
group by user;

select login as bestUser, (count(task_comment.comment_id)) as rating
from user inner join task_comment 
on user.user_id = task_comment.user_id
where month(task_comment.posted_time) = (month(current_date) - 1)
group by login order by rating desc limit 3;