#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64  "ak----/0-----31@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF







-----------------------------------------------------------------------

-----------------------------------------------------------------------

-- This SQL query lists patients with their names, sorted by the number of surgeries they've had, in descending order.

SELECT p.FIRSTNAME, p.LASTNAME, COUNT(o.SURGERYID) AS SurgeryCount
FROM PATIENT p
LEFT JOIN HEALTH_RECORD h ON p.HEALTHCARDNUMBER = h.HEALTHCARDNUMBER
LEFT JOIN OPERATIONS o ON h.HEALTHRECORDID = o.HEALTHRECORDID
GROUP BY p.FIRSTNAME, p.LASTNAME
ORDER BY SurgeryCount DESC;

---------------------------------------------------

/* List the names of patients who have not had any surgeries */

SELECT p.FIRSTNAME, p.LASTNAME
FROM PATIENT p
LEFT JOIN HEALTH_RECORD h ON p.HEALTHCARDNUMBER = h.HEALTHCARDNUMBER
LEFT JOIN OPERATIONS o ON h.HEALTHRECORDID = o.HEALTHRECORDID
WHERE o.SURGERYID IS NULL;

--------------------------------------------------

/* Retrieve patient names along with their health record information, only 
for patients who have a corresponding health record in the database. */

SELECT
    a.FIRSTNAME,
    a.LASTNAME,
    b.HEALTHRECORDID,
    b.VITALINFO
FROM
    PATIENT a
INNER JOIN
    HEALTH_RECORD b 
ON
    a.HEALTHCARDNUMBER = b.HEALTHCARDNUMBER;

----------------------------------------

/* Retrieve hospital IDs, staff names, and their respective 
occupations within the maintenance department. */  

SELECT
    h.HOSPITALID,
    s.NAME AS STAFF_NAME,
    m.OCCUPATION
FROM
    HOSPITAL h
INNER JOIN
    STAFF s
ON
    h.HOSPITALID = s.HOSPITALID
INNER JOIN
    MAINTENANCE m
ON
    s.EMPLOYEEID = m.EMPLOYEEID;

 -------------------------------------------------------

/* Group patients into age ranges. */

SELECT
    CASE
        WHEN AGE BETWEEN 0 AND 18 THEN '0-18'
        WHEN AGE BETWEEN 19 AND 35 THEN '19-35'
        WHEN AGE BETWEEN 36 AND 55 THEN '36-55'
        ELSE '56+'
    END AS AGE_RANGE,
    COUNT(*) AS PATIENT_COUNT
FROM PATIENT
GROUP BY
    CASE
        WHEN AGE BETWEEN 0 AND 18 THEN '0-18'
        WHEN AGE BETWEEN 19 AND 35 THEN '19-35'
        WHEN AGE BETWEEN 36 AND 55 THEN '36-55'
        ELSE '56+'
    END;

------------------------------------------------------------------

/* Retrieve patients with unstable vital information in their health records. */

SELECT p.FIRSTNAME, p.LASTNAME, h.VITALINFO
FROM PATIENT p
JOIN HEALTH_RECORD h ON p.HEALTHCARDNUMBER = h.HEALTHCARDNUMBER
WHERE UPPER(h.VITALINFO) LIKE '%UNSTABLE%'
ORDER BY p.LASTNAME, p.FIRSTNAME;

----------------------------------------------------------------------

-- Related to PATIENT, HOSPITAL, HEALTH_RECORD, MEDICATIONS, OPERATIONS 

SELECT a.firstname,
       a.lastname,
       a.healthcardnumber,
       a.hospitalid,
       b.healthrecordid,
       b.vitalinfo,
       c.medicationid,
       d.surgeryid,
       d.surgeryname
FROM   patient a
       INNER JOIN health_record b
               ON a.healthcardnumber = b.healthcardnumber
       INNER JOIN medications c
               ON b.healthrecordid = c.healthrecordid
       INNER JOIN operations d
               ON b.healthrecordid = d.healthrecordid
WHERE  UPPER(b.vitalinfo) LIKE '%UNSTABLE%'
ORDER  BY a.firstname;



----------------------------------------------------------------------


-- Retrieve the names of patients who have either had surgery or have unstable vital information.

SELECT p.FIRSTNAME, p.LASTNAME
FROM PATIENT p
JOIN HEALTH_RECORD h ON p.HEALTHCARDNUMBER = h.HEALTHCARDNUMBER
WHERE EXISTS (
    SELECT 1
    FROM OPERATIONS o
    WHERE o.HEALTHRECORDID = h.HEALTHRECORDID
)
UNION
SELECT p.FIRSTNAME, p.LASTNAME
FROM PATIENT p
JOIN HEALTH_RECORD h ON p.HEALTHCARDNUMBER = h.HEALTHCARDNUMBER
WHERE UPPER(h.VITALINFO) LIKE '%UNSTABLE%'
MINUS
SELECT p.FIRSTNAME, p.LASTNAME
FROM PATIENT p
JOIN HEALTH_RECORD h ON p.HEALTHCARDNUMBER = h.HEALTHCARDNUMBER
JOIN OPERATIONS o ON h.HEALTHRECORDID = o.HEALTHRECORDID;



exit;
EOF
