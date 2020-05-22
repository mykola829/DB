use projectManagementSystem;

SET autocommit=0;

start transaction;
	savepoint sp1;
	insert into user value (9, 9, 'surname_9', 'name_9', '9','login_9', aes_encrypt('passqaerd', 'key-key'));
	insert into user value (10, 10, 'surname_10', 'name_10', '10', 'login_10', aes_encrypt('passqaerd', 'key-key'));
	insert into user value (11, 11, 'surname_11', 'name_11', '11', 'login_11', aes_encrypt('passerdasd', 'key-key'));
	insert into user value (12, 11, 'surname_12', 'name_12', '12', 'login_12', aes_encrypt('passq12aerd', 'key-key'));
    rollback to savepoint sp1;
commit;

select * from user;

start transaction;
savepoint sp2;
insert into user value (13, 13, 'surname_13', 'name_13','13', 'login_13', aes_encrypt('passqaerd', 'key-key'));
insert into user value (14, 14, 'surname_14', 'name_14','10', 'login_14', aes_encrypt('passqaerd', 'key-key'));
insert into user value (15, 15, 'surname_15', 'name_15', '15','login_15', aes_encrypt('passerdasd', 'key-key'));
insert into user value (16, 16, 'surname_16', 'name_16','16', 'login_16', aes_encrypt('passq12aerd', 'key-key'));
commit;

select * from user;

