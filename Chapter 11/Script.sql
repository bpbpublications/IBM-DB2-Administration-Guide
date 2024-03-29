CREATE TABLE "ALAN_"."EMPLOYEE" (
		"EMPNO" CHAR(6 OCTETS) NOT NULL, 
		"FIRSTNME" VARCHAR(12 OCTETS) NOT NULL, 
		"MIDINIT" CHAR(1 OCTETS), 
		"LASTNAME" VARCHAR(15 OCTETS) NOT NULL, 
		"WORKDEPT" CHAR(3 OCTETS), 
		"PHONENO" CHAR(4 OCTETS), 
		"HIREDATE" DATE, 
		"JOB" CHAR(8 OCTETS), 
		"EDLEVEL" SMALLINT NOT NULL, 
		"SEX" CHAR(1 OCTETS), 
		"BIRTHDATE" DATE, 
		"SALARY" DECIMAL(9 , 2), 
		"BONUS" DECIMAL(9 , 2), 
		"COMM" DECIMAL(9 , 2)
	)
	ORGANIZE BY ROW
	DATA CAPTURE NONE 
	IN "USERSPACE1"
	COMPRESS NO;

CREATE INDEX "ALAN_"."XEMP2"
	ON "ALAN_"."EMPLOYEE"
	("WORKDEPT"		ASC)
	MINPCTUSED 0
	ALLOW REVERSE SCANS
	PAGE SPLIT SYMMETRIC
	COMPRESS NO;

ALTER TABLE "ALAN_"."EMPLOYEE" ADD CONSTRAINT "NUMBER" CHECK (PHONENO >= '0000' AND PHONENO <= '9999');

ALTER TABLE "ALAN_"."EMPLOYEE" ADD CONSTRAINT "PK_EMPLOYEE" PRIMARY KEY
	("EMPNO");

ALTER TABLE "ALAN_"."EMPLOYEE" ADD CONSTRAINT "RED" FOREIGN KEY
	("WORKDEPT")
	REFERENCES "ALAN_"."DEPARTMENT"
	("DEPTNO")
	ON DELETE SET NULL;

GRANT ALTER ON TABLE "ALAN_"."EMPLOYEE" TO USER "ALAN_" WITH GRANT OPTION;

GRANT CONTROL ON INDEX "ALAN_"."XEMP2" TO USER "ALAN_";

GRANT CONTROL ON TABLE "ALAN_"."EMPLOYEE" TO USER "ALAN_";

GRANT DELETE ON TABLE "ALAN_"."EMPLOYEE" TO USER "ALAN_" WITH GRANT OPTION;

GRANT INDEX ON TABLE "ALAN_"."EMPLOYEE" TO USER "ALAN_" WITH GRANT OPTION;
GRANT INSERT ON TABLE "ALAN_"."EMPLOYEE" TO USER "ALAN_" WITH GRANT OPTION;

GRANT REFERENCES ON TABLE "ALAN_"."EMPLOYEE" TO USER "ALAN_" WITH GRANT OPTION;

GRANT SELECT ON TABLE "ALAN_"."EMPLOYEE" TO USER "ALAN_" WITH GRANT OPTION;

GRANT UPDATE ON TABLE "ALAN_"."EMPLOYEE" TO USER "ALAN_" WITH GRANT OPTION;
