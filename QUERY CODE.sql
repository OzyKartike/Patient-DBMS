-- 1.


--Title, Specfic filters, ODGER BY, GROUP BY, 

--PDF, .SQL, 


-- 1. RELATED TO PATIENT, HOSPITAL, HEALTH_RECORD,MEDICATIONS, OPERATIONS {
SELECT
    a.firstname,
    a.lastname,
    a.healthcardnumber,
    a.hospitalid,
    b.healthrecordid,
    b.vitalinfo,
    c.medicationid,
    d.surgeryid,
    d.surgeryname
FROM
         patient a
    INNER JOIN health_record b ON a.healthcardnumber = b.healthcardnumber
    INNER JOIN medications   c ON b.healthrecordid = c.healthrecordid
    INNER JOIN operations    d ON b.healthrecordid = d.healthrecordid
  --WHERE VITALINFO = '%Unstable%' --This code doesnt work since vital info has other words in it 
WHERE
    vitalinfo LIKE '%Unstable%'
ORDER BY
    firstname;
  -- good to shoow all the information needed for patients getting surgery including 
  --medication health record info and surgery ddetails 
  --}
  
  
  
  
  
  
  
  
  
  
  
--2.INSURANCE {

SELECT
    *
FROM
    patient
WHERE
    healthcardnumber NOT IN (
        SELECT
            healthcardnumber
        FROM
            insurance
    )
ORDER BY
    age; 
-- This code is good or finding spcefic people who do not have insurance, removing the word "NOT" gives you the opposite

--}











-- 3.NURSE RELATED  {

SELECT
    *
FROM
    assigned_nurse
WHERE
    typeofnurse = 'Gynocology Nurse'
ORDER BY
    nurseid; 
-- good way to specific nurse types
--}







--3.5. Staff and Nurse related {
SELECT
    a.name,
    a.department,
    b.typeofnurse,
    a.employeeid,
    b.nurseid
FROM
         staff a
    INNER JOIN assigned_nurse b ON a.employeeid = b.employeeid
ORDER BY
    a.employeeid;
-- Good way to see information about the nurses in hospital

--}











--4.HEALTH RECORD  {
SELECT
    *
FROM
    health_record
WHERE
        organdonor = 'No'
    AND immunizationrecord = 'Not up to date'
ORDER BY
    vitalinfo;
--Ordered by stability on patieents who are not organ donors and not immunized
--}










--5.Emergency contacts / Patient RELATED {
SELECT
    a.firstname,
    a.lastname,
    a.healthcardnumber,
    b.name,
    b.address,
    b.phonenumber
FROM
         patient a
    INNER JOIN emergency_contacts b ON a.healthcardnumber = b.healthcardnumber
ORDER BY
    healthcardnumber; 
               -- good to get what emergency contacts, patient name repeats 
               -- more then 1 emergancy contact can exist
--}












--6 Hospital and Staff related {
SELECT
    a.name,
    a.department,
    a.employeeid,
    b.name,
    b.city,
    b.street,
    b.postalcode
FROM
         staff a
    INNER JOIN hospital b ON a.hospitalid = b.hospitalid
WHERE
    department = 'Nurse'
ORDER BY
    employeeid; 
 -- good to get where each Nurse works and their employeeID
--}












--7 Operations related {
SELECT
    *
FROM
    operations
WHERE
        surgeryname = 'Lumbar Fusion'
    AND surgeonname = 'Jane Johnson'; 
       -- good to get the surgeryID and the patientID
       --}
       
    
    
    
    
    
    
    
    
    
       
--8 Medications realted {
SELECT
    dosage,
    sideeffects,
    medicationid
FROM
    medications
WHERE
        sideeffects = 'Nausea, Fatigue'
    AND dosage = '45mg'
ORDER BY
    medicationid; 
-- good to ger medicationID of common meds
--}












--9. Insurance and Coverage type related {

SELECT
    a.insuranceprovider,
    a.insurancenumber,
    b.coveragetype,
    b.copayamount
FROM
         insurance a
    INNER JOIN coverage_details b ON a.insurancenumber = b.insurancenumber
WHERE
        copayamount < 15000
    AND policyinclusionstatus = 'Included'
ORDER BY
    insuranceprovider;
-- Good to get a relationshp betwen the insurance provider and coverage type whether its
-- by the government or private company, also how much money the insurance pays
--}














--10. Maintance relateed {
SELECT
    occupation,
    wardofresponsibility
FROM
    maintenance
WHERE
        occupation = 'Electrician'
    AND wardofresponsibility = 'Ward D';
-- Since we want to find the electriction whos in a specific ward, we use 
-- this code to help with that, NO NEED TO ORDER
--}









--11.Staff and Doctor related {
SELECT
    a.name,
    a.department,
    b.specialty,
    a.employeeid
FROM
         staff a
    INNER JOIN doctor b ON a.employeeid = b.employeeid
ORDER BY
    employeeid;
-- Good to see what doctors are what specality and their employeeID
--}








--12. Coverage details Reelated (
SELECT
    *
FROM
    coverage_details
WHERE
        policyinclusionstatus = 'Not Included'
    AND coveragetype = 'N/A'
ORDER BY
    coverageid;
-- good code to see which people with insurance no longer have it and 
-- what we can do with them e.g remove
-- }







--13. Emergancy contact related {
SELECT DISTINCT
    healthcardnumber
FROM
    emergency_contacts
WHERE
    phonenumber LIKE '%416%';
-- if you want to reach a specific emergency contact based on the area code
--}








--14. Operations related  {
SELECT
    surgeryid,
    surgeryname,
    surgeonname
FROM
    operations
ORDER BY
    surgeonname;
-- Good to see what doctor is doing what surgery and surgeryid
--}









--15.COVERAGE_DETAILS / INSURANCE {
SELECT
    *
FROM
    coverage_details
WHERE
    copayamount > 7500
ORDER BY
    copayamount;
-- selectively choose all options above threshold of 7500

---}




--15.5. Coverage details related {
SELECT
    coveragetype,
    SUM(copayamount) AS totalpayed
FROM
    coverage_details
GROUP BY
    coveragetype
ORDER BY totalpayed;
    
-- Total payout of each hospital plan and how much they give.
--}






--16.Coverage details related {
SELECT
    coveragetype,
    COUNT(*) AS frequency
FROM
    coverage_details
GROUP BY
    coveragetype
ORDER BY
    frequency;
-- How many patients are assigned to each coverage type
--}






--17.INSURANCE related {
SELECT
    insuranceprovider,
    COUNT(*) AS frequency
FROM
    insurance
GROUP BY
    insuranceprovider
ORDER BY
    frequency;
-- How many patients are assigned to each Insurance provider
--}





CREATE TABLE can_teach (
CourseNo INTEGER REFERENCES course(CourseNo)

ON DELETE CASCADE,

ProfName VARCHAR2(25) REFERENCES
professor(ProfName)

ON DELETE CASCADE,
Preference NUMBER DEFAULT 0,
Evaluation NUMBER(2,1) DEFAULT NULL,
PRIMARY KEY (CourseNo, ProfName));


;







