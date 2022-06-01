-- THE FIRST QUESTION I AM SEEKING TO ANSWER IS WHAT DEMOGRAPHIC FACED THE MOST POLICE BRUTALITY

SELECT manner_of_death, race
FROM project.policeshootings;

-- WHITE DEMOGRAPHIC 120
SELECT COUNT(race) FROM policeshootings
WHERE race = "W";

-- BLACK NON-HISPANIC DEMOGRAPHIC 54
SELECT COUNT(race) FROM policeshootings
WHERE race = "B";

--  ASIAN DEMO 4
SELECT COUNT(race)FROM policeshootings
WHERE race = "A";

-- NATIVE AMERICAN DEMO 1
SELECT COUNT(race) FROM policeshootings
WHERE race = "N";

-- HISPANIC DEMO 38
SELECT COUNT(race) FROM policeshootings
WHERE race = "H";

-- OTHER 
SELECT COUNT(race) FROM policeshootings
WHERE race = "O";

SELECT gender, race AS deathsperdemo
FROM policeshootings
ORDER BY race;



-- THE SECOND QUESTION I AM SEEKING TO ANSWER IS HOW MANY CASES OF DEATHS IN THIS GROUP INVOLVED UNARMED CITIZENS

SELECT COUNT(*) race, armed FROM policeshootings
WHERE armed = "unarmed"
AND race = "W"
ORDER BY race; -- 10

-- AFTER THIS, I WAS QUITE INTERESTED IN HOW MANY OF THESE PEOPLE WERE CAUGHT TRYING TO FLEE FROM THE SCENE

SELECT race, armed, flee FROM policeshootings
WHERE flee <> "Not fleeing"
AND armed = "unarmed"
AND race = "W"
ORDER BY race; -- THREE PEOPLE WERE SHOT TRYING TO FLEE FROM THE SCENE, THATS 30%

-- WHAT'S THE MOST FREQUENT AGE GROUP 

SELECT COUNT(*) age FROM policeshootings 
WHERE age BETWEEN 0 AND 18 -- 9

SELECT COUNT(*) age FROM policeshootings 
WHERE age BETWEEN 19 and 25; -- 34

SELECT COUNT(*) age FROM policeshootings 
WHERE age BETWEEN 26 AND 37; -- 87

SELECT COUNT(*) age FROM policeshootings 
WHERE age > 37; -- 88

-- WHAT PERCENTAGE OF THE SAMPLE WERE DIAGNOSED WITH MENTAL ILLNESS

SELECT COUNT(*) signs_of_mental_illness FROM policeshootings; --  TOTAL 218

SELECT COUNT(*) signs_of_mental_illness 
FROM policeshootings
WHERE signs_of_mental_illness = "TRUE"; -- TOTAL DIAGNOSED AS MENTALLY ILL 65

SELECT COUNT(signs_of_mental_illness) AS mentallyill, (COUNT(signs_of_mental_illness)/signs_of_mental_illness)*100 AS percentagementallyill
FROM policeshootings
GROUP BY signs_of_mental_illness
ORDER BY 1,2

-- OVER 50% OF THE SAMPLE WERE CLASSED AS MENTALLY ILL AT THE TIME OF THE ATTACK
