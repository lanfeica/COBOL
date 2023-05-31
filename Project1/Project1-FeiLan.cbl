      ******************************************************************
      * Author: Fei Lan
      * Date: May-25-2023
      * Purpose: Write Student Records to an external file
      *          from the data fields entered at the keyboard.
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROJECT_01.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT STUDENT-FILE-OUT ASSIGN TO "../STUDENT.TXT"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.

       FD STUDENT-FILE-OUT.
       01 STUDENT-RECORD.
           05 STUDENT-NAME PIC X(40).
           05 STUDENT-NUMBER PIC 9(7).
           05 TUITION-OWED PIC 9(5).

       WORKING-STORAGE SECTION.
       01 CONTRO-FILE.
           05 NEW-RECORD-PROMPT PIC A(1).

       PROCEDURE DIVISION.
       100-CREATE-STUDENT-RECORDS.
           PERFORM 201-INITIALIZE-STUEDT-RECORDS.
           PERFORM 202-CREATE-STUDENT-RECORDS
               UNTIL NEW-RECORD-PROMPT = "N" or "n".
           PERFORM 203-CLOSE-STUDENT-FILE-OUT.
           STOP RUN.

       201-INITIALIZE-STUEDT-RECORDS.
           PERFORM 301-OPEN-STUDENT-FILE.
           PERFORM 302-PROMPT-NEW-RECORD.

       202-CREATE-STUDENT-RECORDS.
           PERFORM 303-PROMPT-STUDENT-DATA.
           PERFORM 304-WRITE-STUDENT-RECORD.
           PERFORM 302-PROMPT-NEW-RECORD.

       203-CLOSE-STUDENT-FILE-OUT.
           CLOSE STUDENT-FILE-OUT.

       301-OPEN-STUDENT-FILE.
           OPEN OUTPUT STUDENT-FILE-OUT.

       302-PROMPT-NEW-RECORD.
           DISPLAY "DO YOU WANT TO CREATE A NEW RECORD (Y/N)?".
           ACCEPT NEW-RECORD-PROMPT.

       303-PROMPT-STUDENT-DATA.
           DISPLAY "PLEASE ENTER YOUR STUDENT NAME: ".
           ACCEPT STUDENT-NAME.
           DISPLAY "PLEASE ENTER YOUR STUDENT NUMBER: ".
           ACCEPT STUDENT-NUMBER.
           DISPLAY "PLEASE ENTER YOUR TUITION OWED$: $".
           ACCEPT TUITION-OWED.

       304-WRITE-STUDENT-RECORD.
           WRITE STUDENT-RECORD.

       END PROGRAM PROJECT_01.
