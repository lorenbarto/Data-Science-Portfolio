
---- DELIVERABLE 1: Extract information on pets names and owner names side-by-side ----
SELECT p.Name AS Pet_Name, o.Name AS Owner_Name
FROM Pets AS p
LEFT JOIN Owners AS o
ON p.OwnerID = o.OwnerID

---- DELIVERABLE 2: Find out which pets from this clinic had procedures performed ----
SELECT p.Name, h.PetID, h.ProcedureType, h.ProcedureDate
FROM Pets As p
INNER JOIN ProceduresHistory AS h
ON p.Petid = h.PetID
ORDER BY p.Name

---- DELIVERABLE 3: Match up all procedures performed to their descriptions ----
SELECT h.ProcedureType, h.ProcedureSubCode, d.Description, d.Price
FROM ProceduresDetails AS d
FULL JOIN ProceduresHistory AS h
ON d.ProcedureType = h.ProcedureType 
AND d.ProcedureSubCode = h.ProcedureSubCode

---- DELIVERABLE 4: Match up all procedures to their descriptions, only for pets from the clinic in question ----
SELECT p.Petid, h.ProcedureType, h.ProcedureSubCode, d.Description, d.Price
FROM Pets AS p
INNER JOIN ProceduresHistory AS h
ON p.Petid = h.PetID
LEFT JOIN ProceduresDetails AS d
ON h.ProcedureType = h.ProcedureType 
AND d.ProcedureSubCode = h.ProcedureSubCode

---- DELIVERABLE 5: Table of individual costs incurred by owners of pets from the clinic in question (owner and price side by side) ----
SELECT	--p.Petid, 
				  p.OwnerID,
				--h.ProcedureType,
				--h.ProcedureSubCode,
				--d.Description, 
				d.Price
FROM Pets AS p
INNER JOIN ProceduresHistory AS h
ON p.Petid = h.PetID
LEFT JOIN ProceduresDetails AS d
ON h.ProcedureType = h.ProcedureType 
AND d.ProcedureSubCode = h.ProcedureSubCode




