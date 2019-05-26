Select * From Exercise Where muacleGroup Like "%CHEST%" 
	Order By exerciseName Asc;
    
Select * From Exercise Order By timeOfCreation Desc Limit 4;

Select * From(Exercise Inner Join WorkoutSet) Inner Join Workout
	On Exercise.id = WorkoutSet.id And WorkoutSet.id = Workout.id;
    