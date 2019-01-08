SELECT * FROM Alumnus AS a JOIN Education AS e ON a.alumId = e.alumId 
WHERE schoolGPA >= 3.5 AND schoolGradYear < ‘2014-01-01’ 
ORDER BY a.alumFName, a.alumLName, a.alumId, e.schoolGradYear;


SELECT a.*,c.* FROM Alumnus AS a JOIN Workin AS w ON a.alumid = w.alumid
JOIN Company AS c ON c.companyid = w.companyid
 WHERE companyLocation = ‘Chicago’  
ORDER BY alumFName, alumLName;