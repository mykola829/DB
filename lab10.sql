use projectManagementSystem;
SET GLOBAL log_bin_trust_function_creators = 1;
drop function if exists encode;
drop function if exists decode;
drop function if exists is_valid_date_range;
drop procedure if exists confirm_task;

CREATE FUNCTION encode (pass CHAR(48)) 
	RETURNS TINYBLOB
	RETURN AES_ENCRYPT(pass, 'key-key');

CREATE FUNCTION decode (pass TINYBLOB)
	RETURNS CHAR(48)
	RETURN AES_DECRYPT(pass, 'key-key');

DELIMITER $$
create function is_valid_date_range(date1 date, date2 date)
	returns varchar(100)
    DETERMINISTIC
	begin
    declare result boolean;
	IF (date1<=date2) THEN
		SET result = true;
    ELSE
        SET result = false;
	END IF;
    return result;
    end $$
	DELIMITER ;
    
select is_valid_date_range('2019-03-1', '2020-03-20');

    
DELIMITER //
CREATE PROCEDURE confirm_task(id int unsigned)
BEGIN
update task set status = 'done', 
completion_time = current_time() 
where task_id = id;
END// DELIMITER ;

    
select * from task;
call confirm_task(2);
select * from task;