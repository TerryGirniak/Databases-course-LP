CREATE DATABASE IF NOT EXISTS DIARY;
USE DIARY;

CREATE TABLE Workout (
    id int NOT NULL AUTO_INCREMENT,
    startTime TIMESTAMP,
    endTime TIMESTAMP,
    isEmpty BOOLEAN,
    isCompleted BOOLEAN,
    workoutVolume double,
    PRIMARY KEY (id)
);

CREATE TABLE Exercise(
  id int NOT NULL AUTO_INCREMENT,
    exerciseName varchar(40),
    timeOfCreation timestamp,
    typeOfTraining varchar(40),
    muacleGroup varchar(40),
    maxMainValue int,
    maxSecondaryValue int,
    PRIMARY KEY(id)
);

CREATE TABLE WorkoutSet(
  id int NOT NULL AUTO_INCREMENT,
    workoutId int,
    workoutDataType varchar(40),
    exerciseId int,
    positionNumber int,
    workoutSetVolume int,
    muscleGroup varchar(40),
    CONSTRAINT FOREIGN KEY(workoutId)
    REFERENCES Workout(id),
    CONSTRAINT FOREIGN KEY(exerciseId)
    REFERENCES Exercise(id),
    PRIMARY KEY(id)
);

CREATE TABLE WorkoutSetValue(
  id int NOT NULL AUTO_INCREMENT,
    workoutSetId int NOT NULL,
    mainValue float,
    timeOfCreation timestamp,
    secondaryValue int,
    CONSTRAINT FOREIGN KEY(workoutSetId)
    REFERENCES WorkoutSet(id),
    PRIMARY KEY(id)
);

CREATE TABLE Record(
  id int NOT NULL AUTO_INCREMENT,
  exerciseId int NOT NULL,
    valueId int NOT NULL,
    recordType varchar(40),
    recordValue float,
    timeOfRecord timestamp,
    CONSTRAINT FOREIGN KEY(valueId)
    REFERENCES WorkoutSetValue(id),
  CONSTRAINT FOREIGN KEY(exerciseId)
    REFERENCES Exercise(id),
  PRIMARY KEY(id)
);

CREATE TABLE Measurement(
  id int NOT NULL AUTO_INCREMENT,
    measurementName varchar(40),
    measurementUnit varchar(20),
    PRIMARY KEY(id)
);

CREATE TABLE MeasurementValue(
  id int NOT NULL AUTO_INCREMENT,
    measurementId int NOT NULL,
    measurementValue float,
    timeOfCreation timestamp,
    CONSTRAINT FOREIGN KEY(measurementId)
    REFERENCES Measurement(id),
    PRIMARY KEY(id)
);