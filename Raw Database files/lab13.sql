Analyze Table Workout;
Analyze Table WorkoutSet;


-- Part 1
SHOW INDEX FROM Workout;

SHOW INDEX FROM WorkoutSet;

-- Part 2
CREATE INDEX workoutINDX3 on Workout(id, startTime); 
CREATE INDEX workoutSetINDX3 on WorkoutSet(id, muscleGroup); 

SHOW INDEX FROM Workout;

Explain Select Workout.id As most_active_workout, (Count(Distinct WorkoutSet.id) + Workout.workoutVolume) As rating
	From(Workout straight_join WorkoutSet On Workout.id = WorkoutSet.id)
		Where MONTH(Workout.startTime) = (MONTH(CURRENT_DATE))
			Group By Workout.id Order By rating Desc Limit 1;

