Select Exercise.exerciseName As Name_Of_The_Exercise, Count(Workout.id) As workouts 
	From (Workout Inner Join Exercise) Inner Join WorkoutSet
		On Workout.id = Exercise.id and Exercise.id = WorkoutSet.id
			Group by Exercise.exerciseName;

Select YEAR(timeOfCreation) As year, MONTHNAME(timeOfCreation) As month, 
	Count(exerciseName) as names
		From Exercise Group By year, month With Rollup;
        
Select AVG(CHAR_LENGTH(Exercise.exerciseName)) as Average_ExerciseName_length
	From Exercise Inner Join Workout On Workout.id = Exercise.id;
    
Update Workout Set workoutVolume = 500 Where id = 2;
        
Select Workout.id As most_active_workout, (Count(Distinct WorkoutSet.id) + Workout.workoutVolume) As rating
	From(Workout Inner Join WorkoutSet On Workout.id = WorkoutSet.id)
		Where MONTH(Workout.startTime) = (MONTH(CURRENT_DATE))
			Group By Workout.id Order By rating Desc Limit 1;