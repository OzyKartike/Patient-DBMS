--------------------------------------------------------
--  DDL for View HOSPITALSTAFFMAINTENANCE
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "AKIBRIA"."HOSPITALSTAFFMAINTENANCE" ("HOSPITALID", "STAFF_NAME", "OCCUPATION") AS 
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
    s.EMPLOYEEID = m.EMPLOYEEID
;
