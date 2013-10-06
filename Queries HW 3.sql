--Matthew Musich
--October 7th 2013
--CMPT 308

--1 
SELECT 
a.city
FROM 
agents a
WHERE 
a.aid IN
	(SELECT  
	 o.aid
	FROM 
	 orders o, customers c
	WHERE 
	 o.cid = c.cid AND 
	 c.cid = 'c002');
	 
--2
SELECT 
a.city
FROM 
agents a, orders o
WHERE 
a.aid = o.aid and
o.cid = 'c002';

--3
SELECT 
p.pid
FROM 
products p
WHERE 
p.pid IN
	(SELECT
	o.pid
	FROM
	orders o
	WHERE
	o.aid IN
		(SELECT
		o.aid
		FROM
		orders o
		WHERE
		o.cid IN
			(SELECT
			 c.cid
			 FROM
			 customers c
			 WHERE c.city = 'Kyoto'			 
			)
		) 
	);

--4
SELECT DISTINCT
o1.pid
FROM 
orders o1, orders o2, customers c
WHERE 
o2.cid = c.cid and
o1.cid = o2.cid and
c.city = 'Kyoto'
ORDER BY o1.pid;	

--5 
SELECT 
c.name
FROM 
customers c
WHERE 
c.cid NOT IN
	(SELECT
	o.cid
	FROM
	orders o
	);
	
--6
SELECT DISTINCT
c.name
FROM
orders o 
RIGHT OUTER JOIN 
customers c
	ON 
	c.cid = o.cid
	WHERE 
	o.cid IS NULL;

--7
SELECT DISTINCT 
c.name AS Cust_Name, 
a.name AS Agent_Name
FROM 
customers c, agents a, orders o
WHERE 
c.cid = o.cid AND 
a.aid = o.aid AND 
c.city = a.city;

--8
SELECT DISTINCT 
c.name AS Cust_Name, 
a.name AS Agent_Name,
c.city AS City
FROM 
customers c, agents a
WHERE 
c.city = a.city;	

--9
SELECT
c.name,
c.city
FROM
customers c
WHERE 
c.city IN
	(SELECT 
	p.city
	FROM 
	products p
	GROUP BY 
	p.city
	ORDER BY 
	COUNT(p.city) ASC
	LIMIT 1);

--10
SELECT
c.name,
c.city
FROM
customers c
WHERE 
c.city IN
	(SELECT 
	p.city
	FROM 
	products p
	GROUP BY 
	p.city
	ORDER BY 
	COUNT(p.city) DESC
	LIMIT 1);


	
	
	
	
