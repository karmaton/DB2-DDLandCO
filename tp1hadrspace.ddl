-- Create TABLESPACE FOR HADR TESTS
CONNECT TO TP1;
-- Create Objects
CREATE TABLESPACE TP1HADR
    USING STOGROUP TP1SG1 INITIALSIZE 5M  
    increasesize 4 m  ;
CONNECT RESET;