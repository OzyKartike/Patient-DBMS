<img width="930" alt="Screenshot 2023-11-03 at 7 40 51 PM" src="https://github.com/OzyKartike/Patient-DBMS/assets/64118528/585344ae-4c12-4d01-95cc-4d06ec3ea991"><img width="930" alt="Screenshot 2023-11-03 at 7 40 51 PM" src="https://github.com/OzyKartike/Patient-DBMS/assets/64118528/3da23e25-c24e-4fe6-be05-d1387eb2d119"># Patient-DBMS
## Overview
Using MySQL, Oracle, created a DBMS for "patient information system" with a unix UI. In summary, creating this project tooks months of diligent work and planning. To succesfully tackle this problem the project was broken down to parts and solved individually. First was the implementation of the ER diagram which took in the strength and type of the entities/attributes into heavy consideration. Secondly tables were created in SQL with respect to the ER diagram which in-turn created the relations diagram from oracle. Thirdly, Populated the tables with an excel sheet produced from chatGPT to create random dummy values for all parameters. Then I created some simple and advanced queries for random data accumulation. Finally the UNIX UI was implemented using shell commands.

The ER diagram is shown below:

<img width="1706" alt="Screenshot 2023-11-03 at 6 47 36 PM" src="https://github.com/OzyKartike/Patient-DBMS/assets/64118528/66042902-b1af-4091-b3b8-e53d2a546153">

With the following relational diagram:

<img width="1134" alt="Screenshot 2023-11-03 at 6 56 50 PM" src="https://github.com/OzyKartike/Patient-DBMS/assets/64118528/aaa3b4d4-14c9-4d7c-a4c9-cf54bde4512a">

For a detailed relationship analysis, Attributes analysis, Data type and length definition for attributes (integer, float, string, ...), Cardinality, and Keys analysis of entities (primary/Foreign) please read the "Patient_Information:applicabe uses.pdf" file. Additionally, you can look at some advanced queries in the "QUERY CODE.sql" 
file. For the user interface it was done connecting to the moon server and running unix shell commands: below is the main function interface alongside all the results of the different options you could have picked.

#### Main Menu

<img width="459" alt="Screenshot 2023-11-03 at 7 24 40 PM" src="https://github.com/OzyKartike/Patient-DBMS/assets/64118528/1431bbba-b591-4dcd-8c78-5e33fd13c848">

#### Drop Tables

<img width="930" alt="Screenshot 2023-11-03 at 7 40 51 PM" src="https://github.com/OzyKartike/Patient-DBMS/assets/64118528/f0434578-42f0-421a-a893-2f5939584f91">

#### Create Tables

<img width="930" alt="Screenshot 2023-11-03 at 7 40 51 PM" src="https://github.com/OzyKartike/Patient-DBMS/assets/64118528/0573c64e-ecd7-49ac-b042-7a10a08099bf">

#### Populate Tables

<img width="914" alt="Screenshot 2023-11-03 at 7 43 06 PM" src="https://github.com/OzyKartike/Patient-DBMS/assets/64118528/ac1a023e-0d0d-4887-8578-d07738e4165a">

#### Query Tables

<img width="657" alt="Screenshot 2023-11-03 at 7 44 39 PM" src="https://github.com/OzyKartike/Patient-DBMS/assets/64118528/fd17dd12-1e67-49a6-bf64-426864f2c85d">

## Future improvements:
1. Normalize all tables to be in 3NF or BCNF
2. JAVA (or Python) UI or web application implementation (upgrading from Unix UI)
