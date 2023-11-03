--------------------------------------------------------
--  DDL for View PATIENTHEALTHRECORDS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "AKIBRIA"."PATIENTHEALTHRECORDS" ("FIRSTNAME", "LASTNAME", "HEALTHCARDNUMBER", "VITALINFO") AS 
  SELECT
    p.FIRSTNAME,
    p.LASTNAME,
    p.HEALTHCARDNUMBER,
    hr.VITALINFO
FROM
    PATIENT p
INNER JOIN
    HEALTH_RECORD hr
ON
    p.HEALTHCARDNUMBER = hr.HEALTHCARDNUMBER
;
