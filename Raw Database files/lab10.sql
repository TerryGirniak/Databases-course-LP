-- Part 1
CREATE FUNCTION mycms_encode (pass varbinary(48)) RETURNS TINYBLOB 
DETERMINISTIC READS SQL DATA
	RETURN AES_ENCRYPT(pass, 'key-key');
    
CREATE FUNCTION mycms_decode (pass varchar(40)) RETURNS CHAR(48)
	DETERMINISTIC READS SQL DATA
	RETURN AES_DECRYPT(pass, 'key-key');
    
-- Part 2
DELIMITER $$
CREATE PROCEDURE sportsman_name_selection_procedure(
  IN inputName VARCHAR(255)
)
BEGIN

  SELECT id,
         firstName,
         surname,
         login,
         email
    FROM Sportsman
   WHERE firstName = inputName;

END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sportsman_selection_procedure_secured(
  IN inputName VARCHAR(255),
  IN inputSurname VARCHAR(255),
  IN secretNumber int
)
BEGIN

	DECLARE error varchar(255);
	SET error = 'Wrong secret number';
    
	IF secretNumber = 6 Then
		  SELECT id,
				 firstName,
				 surname,
				 login,
				 email
			FROM Sportsman
		   WHERE firstName = inputName AND surname = inputSurname;
		ELSE SELECT error;
	End if;

END $$
DELIMITER ;

-- Part 3
SELECT login, mycms_decode("openup_miamipolice") FROM Sportsman LIMIT 4;

CALL sportsman_name_selection_procedure('John');
CALL sportsman_selection_procedure_secured('John', "Flint", 2);

