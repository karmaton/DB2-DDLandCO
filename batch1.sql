-- BATCH1.SQL
-------------
--#SET ROWS_OUT 5
--#SET PERF_DETAIL 0
--
--#BGBLK 10

--#COMMENT JOIN TELLER,HISTORY   for BRANCH Range
--#COMMENT QUERY 1
--
SELECT HISTORY.BRANCH_ID, TELLER.TELLER_NAME, HISTORY.ACCTNAME,
 HISTORY.ACCT_ID, HISTORY.BALANCE
 FROM HISTORY AS HISTORY, TELLER AS TELLER
 WHERE HISTORY.TELLER_ID = TELLER.TELLER_ID
 AND HISTORY.BRANCH_ID BETWEEN 20 AND 29
 ORDER BY HISTORY.BRANCH_ID ASC, HISTORY.ACCT_ID ASC ;
--
--
--#COMMENT QUERY 2
--#COMMENT List HISTORY from Teller Range
--
SELECT ACCT_ID, ACCTNAME, TELLER_ID, BRANCH_ID, BALANCE
   FROM HISTORY
   WHERE TELLER_ID BETWEEN 100 AND 199;

--
--#COMMENT QUERY 3
--#COMMENT ACCT Summary Report by ACCT_GRP
--
SELECT ACCT_GRP , SUM(BALANCE) FROM ACCT
WHERE ACCT_GRP BETWEEN 100 AND 150
GROUP BY ACCT_GRP;
--
--
--#COMMENT QUERY 4
--#COMMENT Join ACCT,TELLER,HISTORY
--
SELECT ACCT.ACCT_ID, ACCT.NAME, TELLER.TELLER_ID, TELLER.TELLER_NAME,
  HISTORY.BRANCH_ID, HISTORY.BALANCE, HISTORY.PID
   FROM ACCT AS ACCT, TELLER AS TELLER, HISTORY AS HISTORY
   WHERE ACCT.ACCT_ID = HISTORY.ACCT_ID
   AND ACCT.ACCT_GRP BETWEEN 400 AND 500
   AND HISTORY.TELLER_ID = TELLER.TELLER_ID
   ORDER BY HISTORY.PID ASC ;
--
--
--#COMMENT QUERY 5
--#COMMENT Partial NAME,ADDRESS List from ACCT
--
SELECT NAME , ADDRESS FROM ACCT WHERE ACCT_GRP < 50 ORDER BY NAME ;
--#EOBLK