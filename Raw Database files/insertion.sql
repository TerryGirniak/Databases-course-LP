INSERT INTO Workout
    VALUES (2, current_time(), current_time(), FALSE, FALSE, 0);
    
INSERT INTO Exercise
    VALUES (1, "Pull-Ups", current_time(), "WEIGHT", "BACK", 0, 0);
    
INSERT INTO Exercise
    VALUES (4, "Crunches", current_time(), "REPS", "ABS", 0, 0);
    
INSERT INTO WorkoutSet
    VALUES (1, 1, "WEIGHT", 1, 1, 0, "BACK");
    
INSERT INTO WorkoutSet
    VALUES (5, 1, "REPS", 2, 1, 0, "CHEST");
    
INSERT INTO WorkoutSet
    VALUES (3, 2, "REPS", 4, 1, 0, "ABS");
    
INSERT INTO WorkoutSetValue
    VALUES (1, current_time(), current_time(), FALSE, FALSE, 0);
    
SELECT * FROM Workout;

Select * From WorkoutSet;

Select * From Exercise;

