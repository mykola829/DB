use projectManagementSystem;
drop trigger if exists on_task_update;
drop trigger if exists on_contacts_delete;
drop trigger if exists on_task_create;

alter table user
	add column without_contacts bool;

insert into task (deadline_time, title, description) values ('2018-03-18 10:34:09', 'lab12', 'lab12'),


DELIMITER $$
create trigger on_task_update 
before update on task 
for each row
BEGIN
     insert into task_comment (user_id, task_id, comment_text, posted_time) values (1, new.task_id,  'task completed', current_date());
END $$ 
DELIMITER ;

update task set status = 'done' where task_id = 5;
select * from task;
select * from task_comment;

DELIMITER $$
CREATE TRIGGER on_contacts_delete
    before DELETE
    ON contacts FOR EACH ROW
BEGIN
    update user set without_contacts = true, contacts_id = null where contacts_id = old.contacts_id;
END$$    
DELIMITER ;

select * from contacts;
select * from user;
delete from contacts where contacts_id = 2;
select * from contacts;
select * from user;

DELIMITER $$

CREATE TRIGGER on_task_create
AFTER INSERT
ON task FOR EACH ROW
BEGIN
    insert into task_comment (user_id, task_id, comment_text, posted_time) values (1, new.task_id,  'task_created', current_date());
END$$

DELIMITER ;

insert into task (deadline_time, title, description) values ( '2018-03-18 10:34:09', '123', '1235');
select * from task_comment;
