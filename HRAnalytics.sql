--CREATE JOINS TABLE

SELECT *
FROM Absenteeism_at_work a
LEFT JOIN compensation b
ON a.ID = b.ID
LEFT JOIN Reasons r ON
a.Reason_for_absence = r.Number; 

---FIND THE HEALTHIEST EMPLOYEES FOR BONUS
SELECT *
FROM Absenteeism_at_work
WHERE Social_drinker = 0 AND  Social_smoker = 0
AND Body_mass_index <25 AND absenteeism_time_in_hours < (SELECT AVG(absenteeism_time_in_hours) FROM Absenteeism_at_work) 

--CONPENSATION RATE INCREASE FOR NON-SMOKERS/BUDGET 983,211 so .68 increase per hour/ 1,414.4 per year
SELECT COUNT(*) AS Nonsmokers
FROM Absenteeism_at_work
WHERE Social_smoker = 0


--OPTIMIZE QUERY 
SELECT a.ID, r. Reason, Month_of_absence, Body_mass_index, 
CASE WHEN Body_mass_index <18.5 THEN 'Underweight'
     WHEN Body_mass_index BETWEEN 18.5 AND 25 THEN 'Healthy Weight'
	 WHEN Body_mass_index BETWEEN 25 AND 30 THEN 'Overweight'
	 WHEN Body_mass_index >18.5 THEN 'Obsese'
	 ELSE 'Unknown' END AS BMI_Category, 
CASE WHEN Month_of_Absence IN (12,1,2) THEN 'Winter'
	WHEN Month_of_Absence IN (3,4,5) THEN 'Spring'
	WHEN Month_of_Absence IN (6,7,8) THEN 'Summer'
	WHEN Month_of_Absence IN (9,10,11) THEN 'Fall'
	ELSE 'Unknown' END AS Season_Names, 
	Month_of_absence, 
	Day_of_the_week,
	Transportation_expense, 
	Education, 
	Son, 
	Social_drinker, 
	Social_smoker, 
	Pet, 
	Disciplinary_failure, 
	Age, 
	Work_load_Average_day,
	Absenteeism_time_in_hours
FROM Absenteeism_at_work a
LEFT JOIN compensation b
ON a.ID = b.ID
LEFT JOIN Reasons r ON
a.Reason_for_absence = r.Number;