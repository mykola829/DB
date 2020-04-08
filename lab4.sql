use projectManagementSystem;

insert into contacts (email, telegram) values ('user1_email@gmail.com', 'https://t.me/user1_telegram'),
	('user2_email@gmail.com', 'https://t.me/user2_telegram'),
	('user3_email@gmail.com', 'https://t.me/user3_telegram'),
	('user4_email@gmail.com', 'https://t.me/user4_telegram'),
	('user5_email@ukr.net', 'https://t.me/user5_telegram'),
	('user6_email@ukr.net', 'https://t.me/user6_telegram'),
	('user7_email@ukr.net', 'https://t.me/user7_telegram'),
	('user8_email@ukr.net', 'https://t.me/user8_telegram');
    
/*LOAD DATA INFILE 'D:\mySQL\\user.txt' INTO TABLE contacts;
	
select * from contacts;
    
update contacts set  telegram = 'https://t.me/qwerty' where email = 'user1_email@gmail.com';
update contacts set contacts_id = contacts_id + 1 order by contacts_id desc;

select * from contacts;

delete from contacts where contacts_id < 4; */

select * from contacts;



