use projectManagementSystem;

insert into contacts (email, telegram) values ('user1_email@gmail.com', 'https://t.me/user1_telegram'),
	('user2_email@gmail.com', 'https://t.me/user2_telegram'),
	('user3_email@gmail.com', 'https://t.me/user3_telegram'),
	('user4_email@gmail.com', 'https://t.me/user4_telegram'),
	('user5_email@gmail.com', 'https://t.me/user5_telegram'),
	('user6_email@gmail.com', 'https://t.me/user6_telegram'),
	('user7_email@gmail.com', 'https://t.me/user7_telegram'),
    ('user9_email@gmail.com', 'https://t.me/user9_telegram'),
    ('user10_email@gmail.com', 'https://t.me/user10_telegram'),
    ('user11_email@gmail.com', 'https://t.me/user11_telegram'),
    ('user12_email@ukr.net', 'https://t.me/user12_telegram'),
    ('user13_email@ugmail.com', 'https://t.me/user13_telegram'),
    ('user14_email@ukr.net', 'https://t.me/user14_telegram'),
    ('user15_email@gmail.com', 'https://t.me/user15_telegram'),
    ('user16_email@gmail.com', 'https://t.me/user16_telegram'),
	('user8_email@ukr.net', 'https://t.me/user8_telegram');


    
/*LOAD DATA INFILE 'D:\mySQL\\user.txt' INTO TABLE contacts;
	
select * from contacts;
    
update contacts set  telegram = 'https://t.me/qwerty' where email = 'user1_email@gmail.com';
update contacts set contacts_id = contacts_id + 1 order by contacts_id desc;

select * from contacts;

delete from contacts where contacts_id < 4; */

select * from contacts;



