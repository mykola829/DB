use projectManagementSystem;

insert into user (contacts_id, surname, name, login, password) values ( 1,'surname_1', 'name_1', 'login_1', aes_encrypt('pass1', 'key-key')), 
( 2, 'surname_2', 'name_2', 'login_2',  aes_encrypt('pass123123', 'key-key')), 
( 3, 'surname_3', 'name_3', 'login_3',  aes_encrypt('pass5edgs', 'key-key')), 
( 4, 'surname_4', 'name_4', 'login_4',  aes_encrypt('pass123412', 'key-key')), 
( 5, 'surname_5', 'name_5', 'login_5',  aes_encrypt('passdfasg', 'key-key')),
( 6, 'surname_6', 'name_6', 'login_6',  aes_encrypt('pass123', 'key-key')), 
( 7, 'surname_7', 'name_7', 'login_7',  aes_encrypt('passasdfsaf', 'key-key')), 
( 8, 'surname_8', 'name_8', 'login_8',  aes_encrypt('pass1234', 'key-key'));

select * from user;

CREATE VIEW users2 AS SELECT DISTINCT user_id, login, aes_decrypt(password, 'key-key')
FROM user;

select * from users2;

SELECT *
FROM user
WHERE user_id <= 4;

SELECT user.user_id , user.login, aes_decrypt(password, 'key-key'), contacts.email, contacts.telegram
FROM user, contacts
WHERE user.contacts_id = contacts.contacts_id;

SELECT user.user_id, user.login, aes_decrypt(password, 'key-key'), contacts.email, contacts.telegram
FROM user, contacts
WHERE user.contacts_id = contacts.contacts_id AND
right(contacts.email,((CHAR_LENGTH(contacts.email))-(InStr(contacts.email,'@')))) = 'gmail.com';