
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


SELECT winner FROM nobel
 WHERE winner LIKE 'John%' 

SELECT yr, subject, winner
  FROM nobel
 WHERE (subject = 'Physics' AND yr =1980) OR (subject = 'Chemistry' AND yr = 1984)
  

SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1980 AND subject != 'Chemistry' AND subject !=  'Medicine'

 SELECT yr, subject, winner
  FROM nobel
  WHERE (subject = 'Medicine' AND yr < 1910) OR (subject = 'Literature' AND yr >= 2004) 

  SELECT *
  FROM nobel
  WHERE winner ='PETER GRÜNBERG'

SELECT *
  FROM nobel
  WHERE winner = 'EUGENE O''NEILL'


SELECT winner, yr, subject
  FROM nobel
  WHERE winner LIKE 'Sir%'
  ORDER BY yr DESC, winner ASC;


SELECT winner, yr, subject
  FROM nobel
  WHERE winner LIKE 'Sir%'
  ORDER BY yr DESC, winner ASC;

SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY 
 CASE WHEN subject IN ('Physics','Chemistry') THEN 1 ELSE 0 END,
 subject, winner;

    /*
*****TUTORIAL 4*****
*/

SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')


SELECT name 
FROM world 
WHERE continent ='Europe'  AND gdp/population > (SELECT gdp/population FROM world WHERE name='United Kingdom')


SELECT name, continent
FROM world
WHERE continent = (SELECT continent FROM world WHERE name = 'Argentina')
  OR continent = (SELECT continent FROM world WHERE name = 'Australia')
ORDER BY name

SELECT name, population
FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Canada')
  AND population < (SELECT population FROM world WHERE name = 'Poland')


SELECT name, CONCAT(CONVERT(INT, ROUND((population/
    (SELECT population 
    FROM world 
    WHERE name = 'Germany')) * 100, 0)), '%') 
FROM world
WHERE continent = 'Europe';

SELECT name
FROM world
WHERE gdp > (SELECT MAX(gdp)
               FROM world
              WHERE continent = 'Europe')


SELECT continent, name, area FROM world x
  WHERE area >= ALL(SELECT area FROM world y WHERE y.continent=x.continent
          AND area>0);



SELECT continent, name FROM world x
  WHERE name = ALL(SELECT TOP 1 name FROM world y WHERE y.continent=x.continent);


SELECT name, continent, population
  FROM world x 
  WHERE 25000000 >= ALL(SELECT population FROM world y WHERE x.continent = y.continent 
       AND population > 0)

SELECT name, continent
FROM world x
WHERE population > ALL(SELECT population*3 FROM world y WHERE x.continent = y.continent AND y.name != x.name)


