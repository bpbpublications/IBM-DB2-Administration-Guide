@echo off
Setlocal ENABLEEXTENSIONS
SetLocal EnableDelayedExpansion
rem -------------------------------------------------------------
rem ASB Software Development Limited DB2 GRANT SELECT BATCH FILE
rem -------------------------------------------------------------
rem Run the following command line separately to set the 
rem environment in the command window (if required)
rem db2cmd -i -w db2clpsetcp
rem Note: there is a temporary testdata.txt file created!
set ASBDB=SAMPLE
set ASBSCHEMA=ALAN_
set ASBUSER=db2admin
set MYUSER=USER1
set DBTABLES= 
db2 "CONNECT TO %ASBDB% USER %ASBSCHEMA%" 
db2 -x "SELECT tabname FROM syscat.tables WHERE tabschema=UPPER('%ASBSCHEMA%')">testdata.txt
for /f "delims=*" %%x in (testdata.txt) do set DBTABLES=!DBTABLES!%%x
)
for %%G in (%DBTABLES%) DO db2 "GRANT SELECT ON %ASBSCHEMA%.%%G TO USER %MYUSER%";
db2 "DISCONNECT %ASBDB%"
