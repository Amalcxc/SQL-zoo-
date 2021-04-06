
/*
*****TUTORIAL 1*****
*/

SELECT population FROM world
  WHERE name = 'Germany'

SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

SELECT name, area FROM world
  WHERE area BETWEEN 200000  AND 250000

  /*
*****TUTORIAL 2*****
*/

SELECT name, continent, population FROM world

SELECT name
  FROM world
 WHERE population > 200000000

 SELECT name, gdp/population
  FROM world
 WHERE population > 200000000

 SELECT name, population/1000000
  FROM world
 WHERE continent = 'South America'

 SELECT name, population
  FROM world
 WHERE name IN ('France','Germany','Italy');

 SELECT name
  FROM world
 WHERE name LIKE '%United%'

SELECT name, population, area
  FROM world
 WHERE area > 3000000 OR population >= 250000000
 
SELECT name, population, area
  FROM world
 WHERE (area > 3000000 AND population < 250000000)
    OR (area < 3000000 AND population > 250000000)


SELECT name, ROUND(population/1000000,2), ROUND(gdp/1000000000,2)
  FROM world
 WHERE continent = 'South America'

 SELECT name, ROUND(gdp/population,-3)
  FROM world
 WHERE gdp > 1000000000000

 SELECT name,
       capital
  FROM world
 WHERE LEN(name) LIKE LEN(capital)

 SELECT name, capital 
FROM world
WHERE LEFT(name,1) = LEFT(capital,1) AND name !=capital

SELECT name
   FROM world
WHERE name LIKE '%e%' and 
      name LIKE '%i%' and
      name LIKE '%o%' and
      name LIKE '%u%'    
  AND name NOT LIKE '% %'

    /*
*****TUTORIAL 3*****
*/

SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

 SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

SELECT yr, subject
  FROM nobel
 WHERE winner = 'Albert Einstein'

 SELECT winner
  FROM nobel
 WHERE subject = 'Peace' AND yr >= 2000

 SELECT yr, subject, winner
  FROM nobel
 WHERE subject = 'Literature' AND yr >=1980 AND yr <=1989 

 SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter', 'Barack Obama')