CREATE TABLE Alumnus(
alumId INTEGER NOT NULL,
alumFName VARCHAR(20),
alumLName VARCHAR(20),
alumGender CHAR(1),
alumDOB DATE,
contactId INTEGER,
CONSTRAINT pk_Alumnus_alumId PRIMARY KEY (alumId)
);


CREATE TABLE ContactDetails(
contactId INTEGER NOT NULL,
homePhone BIGINT,
workPhone BIGINT,
homeEmail VARCHAR(40),
workEmail VARCHAR(40),
workAddress VARCHAR(50),
CONSTRAINT fk_ContactDetails_contactId PRIMARY KEY (contactId)
);


ALTER TABLE Alumnus ADD CONSTRAINT fk_Alumnus_contactId FOREIGN KEY (contactId) REFERENCES ContactDetails (contactId) ON DELETE SET NULL ON UPDATE CASCADE;





CREATE TABLE Company(
companyId INTEGER NOT NULL,
companyName VARCHAR (25),
companyLocation VARCHAR (25),
CONSTRAINT pk_Company_companyId PRIMARY KEY (companyId)
);

CREATE TABLE Education(
schoolId INTEGER NOT NULL,
schoolName VARCHAR (25),
schoolType VARCHAR (25),
schoolGradYear DATE,
schoolGPA FLOAT,
alumId INTEGER,
CONSTRAINT pk_Education_schoolId PRIMARY KEY (schoolId),
CONSTRAINT fk_Education_alumId FOREIGN KEY (alumId)
REFERENCES Alumnus (alumId)
ON DELETE NO ACTION ON UPDATE CASCADE
);


CREATE TABLE JobDetails(
jobId INTEGER NOT NULL,
jobDomain VARCHAR (25),
jobTitle VARCHAR (25),
companyId INTEGER,
CONSTRAINT pk_JobDetails_jobId PRIMARY KEY (jobId),
CONSTRAINT fk_JobDetails_companyId FOREIGN KEY (companyId)
REFERENCES Company (companyId)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE WorkIn(
alumId INTEGER NOT NULL,
companyId INTEGER NOT NULL,
alumWorkEx Decimal(2,1),
CONSTRAINT pk_WorkIn_alumId_companyId PRIMARY KEY (alumId,companyId),
CONSTRAINT fk_WorkIn_alumId FOREIGN KEY (alumId)
REFERENCES Alumnus (alumId)
ON DELETE NO ACTION ON UPDATE CASCADE,
CONSTRAINT fk_WorkIn_companyId FOREIGN KEY (companyId)
REFERENCES Company (companyId)
ON DELETE NO ACTION ON UPDATE CASCADE
);



CREATE TABLE WorkAs(
alumId INTEGER NOT NULL,
jobId INTEGER NOT NULL,	
CONSTRAINT pk_WorkAs_alumId_jobId PRIMARY KEY (alumId, jobId),
CONSTRAINT fk_WorkAs_alumId FOREIGN KEY (alumId)
REFERENCES Alumnus (alumId)
ON DELETE NO ACTION ON UPDATE CASCADE,
CONSTRAINT fk_WorkAs_jobId FOREIGN KEY (jobId)
REFERENCES JobDetails (jobId)
ON DELETE NO ACTION ON UPDATE CASCADE
);
