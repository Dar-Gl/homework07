HOMEWORK 7 — INTRODUCTION TO DATABASE PROGRAMMING
Darius Sweatman | CIST2342: C# Programming II

CONTENTS
1. Written_Answers.docx            Part 1 concept questions, plus Part 2 key/relationship notes
2. Bookstore_ERD.png               Part 2 entity-relationship diagram
3. SQL_Work.docx                   Part 3 create/insert SQL, 5 queries, and local verified examples
4. Bookstore_Homework7_SQLServer.sql  SQL Server script for tables, inserts, and all queries
5. Local_Verification_Query_1-5.png  Results from an actual local SQLite test (NOT SSMS)
6. Bookstore_ERD_Source.dot        Optional editable Graphviz diagram source

IMPORTANT BEFORE TURNING IT IN
The teacher requires SCREENSHOTS FROM MICROSOFT SQL SERVER MANAGEMENT STUDIO
(or Azure Data Studio) with each query in the upper editor and the results below.
These cannot be produced truthfully here without access to SSMS. The result
panels supplied in the SQL Work document come from a local SQLite test of the
same logic, and are marked accordingly. To satisfy the exact assignment:
  1. Open SSMS or Azure Data Studio and select a database you can edit.
  2. Run the table/setup + insert statements from the .sql file.
  3. Run query 1; capture the query text and result grid in one screenshot.
  4. Repeat for queries 2 through 5 in order.
  5. Replace the local example panels in SQL_Work.docx with those screenshots.
  6. Save SQL_Work.docx; rezip the three required files (Written_Answers.docx,
     Bookstore_ERD.png, SQL_Work.docx) as Sweatman_DBIntroHW.zip.

The SQL Server script first drops and re-creates the named tables and is for a
homework/test database only. Running Query 4 twice applies the 10% increase
twice. Query 5 deletes book 105. Reset with the setup statements if necessary.

Local SQLite test: all five queries completed on the provided sample data.
