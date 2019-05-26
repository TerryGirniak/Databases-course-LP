Update Exercise set exerciseName = aes_encrypt("Dumbbell reversed fly", "fly")
Where id = 5;
 
 INSERT into Exercise (exerciseName, timeOfCreation, typeOfTraining, muacleGroup, maxMainValue, maxSecondaryValue)
 VALUES (aes_decrypt("Dumbbell Press", "press"), current_time(), "WEIGHT", "CHEST", 0, 0);
 
 Select aes_encrypt(exerciseName, "press") from Exercise;
 
INSERT INTO Exercise
    VALUES (5, VALUE(aes_encrypt("Dumbbell Press", "press")), current_time(), "WEIGHT", "CHEST", 0, 0);
    
Select Workout.id, Workout.workoutVolume, Exercise.ExerciseName, Exercise.muacleGroup 
from Workout Left Join Exercise On Workout.id = Exercise.id;


-- Outpitting all data if id of exercise and workout matches:
Select Exercise.id, WorkoutSet.id, WorkoutSet.workoutDataType From WorkoutSet 
	Inner Join Exercise on WorkoutSet.id = 1;
    
-- Outpitting all data if workout Type matches:
Select Exercise.id, WorkoutSet.id, WorkoutSet.muscleGroup From WorkoutSet 
	Inner Join Exercise on Exercise.id = 3 where WorkoutSet.workoutDataType = "REPS";

-- Outpitting all data if workout Type matches:
Select Exercise.id, WorkoutSet.id, WorkoutSet.muscleGroup From WorkoutSet 
	Inner Join Exercise on Exercise.id = 3 where WorkoutSet.id not in 
		(Select WorkoutSet.muscleGroup from WorkoutSet where workoutSet.muscleGroup in 
			("CHEST")) Order by WorkoutSet.positionNumber Desc Limit 3;

-- Outputting Exercises with Null fields:
Select Exercise.id, Exercise.timeOfCreation From Exercise Where not exists 
	(Select * From WorkoutSet Where WorkoutSet.exerciseId = Exercise.id);

-- Outputting Exercises with positions bigger than 3
Select * From WorkoutSet Where WorkoutSet.workoutId > 1;