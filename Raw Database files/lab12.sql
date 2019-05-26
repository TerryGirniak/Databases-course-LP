analyze table Workout;
Analyze Table WorkoutSet;
Analyze Table Exercise;
Analyze Table WorkoutSetValue;
Analyze Table Measurement;
Analyze Table MeasurementTable;
Analyze Table Sportsman;
Analyze Table Amateur;
Analyze Table Record;

-- Part 1
CREATE
	TRIGGER workout_delete Before Delete
	ON Workout FOR EACH ROW
	UPDATE WorkoutSet SET WorkoutSet.muscleGroup = "BACK" WHERE DIARY.WorkoutSet.muscleGroup = "ABS";
    
DELETE FROM WorkoutSet WHERE muscleGroup = "ABS"; 
SELECT * FROM WorkoutSet LIMIT 10, 5;

-- Part 2
CREATE
	TRIGGER sportsman_password BEFORE
	INSERT ON Sportsman FOR
	EACH ROW
	SET NEW.secretPassword = AES_ENCRYPT(NEW.secretPassword, 'key-key');

INSERT INTO Sportsman VALUES
(21, "John", 'Flint', 'john_password', 'john.flint', 'flint.john@yahoo.com'),
(22, "Richard", 'Snow', 'Rick_password', 'snow_rick', 'snow.rick@gmail.com');

INSERT into Sportsman (id, firstName, surname, secretPassword, login, email)
	VALUES (21, "John", 'Flint', 'john_password', 'john.flint', 'flint.john@yahoo.com'),
    (22, "Richard", 'Snow', 'Rick_password', 'snow_rick', 'snow.rick@gmail.com');
    
-- Part 3
ALTER TABLE Sportsman
ADD COLUMN lastSeen DATE DEFAULT NULL;

CREATE TRIGGER sportsman_lastseen AFTER INSERT ON WorkoutSet FOR EACH ROW UPDATE 
	Sportsman SET Sportsman.lastSeen=current_date() WHERE Sportsman.id = NEW.id;
    
INSERT INTO WorkoutSet VALUES
(21, 1, "WEIGHT", 1, 1, 0, "BACK"), (22, 2, "DISTANCE", 2, 1, 0, "CARDIO");

SELECT id, login, email, lastSeen FROM Sportsman;