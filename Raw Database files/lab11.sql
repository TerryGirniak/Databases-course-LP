Start Transaction;
	Insert Into Exercise Value(20, "Biceps Dumbbell Curl", current_time(), "WEIGHT", "BICEPS", 0, 0);
    Insert Into Exercise Value(21, "Biceps Barbell Curl", current_time(), "WEIGHT", "BICEPS", 0, 0);
    Insert Into Exercise Value(22, "Cable fly", current_time(), "WEIGHT", "CHEST", 0, 0);
    Insert Into Exercise Value(23, "Pull-Over", current_time(), "WEIGHT", "BACK", 0, 0);
Commit;


Start Transaction;
	Insert Into Exercise Value(20, "Biceps Dumbbell Curl", current_time(), 32, "BICEPS", 0, 0);
    Insert Into Exercise Value(21, "Biceps Barbell Curl", "User22", "WEIGHT", "BICEPS", 0, 0);
Commit;

Select * From Exercise;
