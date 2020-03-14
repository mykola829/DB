use projectManagementSystem;

create table if not exists contacts1 as select contacts_id, email, telegram from contacts where contacts_id > 3;

select * from contacts1;

create table if not exists contacts2 as select contacts_id, email, telegram from contacts where contacts_id < 5;

select * from contacts2;

select * from contacts1 union select * from contacts2; 

select * from contacts1 where contacts_id in (select contacts_id from contacts2);

select * from contacts2 where contacts_id not in (select contacts_id from contacts1);

select * from contacts1, contacts2;