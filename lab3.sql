use projectManagementSystem;


alter table task_comment
	drop foreign key user_comment,
    drop column posted_time;
    
show create table task_comment;

alter table contacts
	add column phone varchar(15) not null,
	modify column telegram varchar(250);
    
show create table contacts;

alter table user
	modify column biography tinytext null;
    
show create table user;

alter table task_comment
	add constraint user_comment foreign key (user_id) references user (user_id) on delete no action on update no action;
    
show create table task_comment;
