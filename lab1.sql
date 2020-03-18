drop database if exists projectManagementSystem;

create database if not exists projectManagementSystem;

use projectManagementSystem;


create table if not exists project(
	project_id int unsigned not null auto_increment,
    project_name varchar(40) not null,
    customer_company varchar(40) not null,
    primary key(project_id)
);	


create table if not exists contacts(
	contacts_id int unsigned not null auto_increment,
    email varchar(40) not null,
    telegram varchar(50) not null,
    unique(email, telegram),
    primary key(contacts_id)
);

create table if not exists user(
	user_id int unsigned not null auto_increment,
    contacts_id int unsigned unique not null ,
    surname varchar(30) not null,
    name varchar(30) not null,
    biography text,
    login varchar(40) not null,
    password varchar(40) not null,
	constraint user_contacts foreign key (contacts_id) references contacts (contacts_id) on delete cascade on update cascade,
    primary key(user_id)
);

create table if not exists task(
	task_id int unsigned not null auto_increment,
    deadline_time datetime not null,
    completion_time datetime,
    title varchar(50) not null,
    description text,
    status enum('done', 'in progress'),
    primary key (task_id)
);

create table if not exists user_project_task(
	user_project_task_id int unsigned not null auto_increment,
    user_id int unsigned not null,
    task_id int unsigned not null,
    project_id int unsigned not null,
    user_role enum('admin', 'user') default 'user',
    primary key(user_project_task_id),
    foreign key (user_id) references user (user_id) on delete cascade on update cascade,
    foreign key (project_id) references project (project_id) on delete cascade on update cascade,
    foreign key (task_id) references task (task_id) on delete cascade on update cascade
);



create table if not exists task_comment(
	comment_id int unsigned not null auto_increment,
	user_id int unsigned not null,
	task_id int unsigned not null,
    comment_text text not null,
    posted_time datetime not null,
    primary key(comment_id),
    constraint user_comment foreign key (user_id) references user (user_id) on delete no action on update no action,
    constraint task_comment foreign key (task_id) references task (task_id) on delete cascade on update cascade
);

show tables;



