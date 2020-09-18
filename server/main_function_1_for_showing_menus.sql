SET SERVEROUTPUT ON;

DECLARE
	EMP_EMAIL EMPLOYER.EMPLOYER_EMAIL%TYPE := &email_id;
	EMP_ID EMPLOYER.EMPLOYER_ID%TYPE:=0;
	EMP_NAME EMPLOYER.EMPLOYER_NAME%TYPE;
		
BEGIN
	--Function for employer login
	EMP_ID := isMatchedEmployer(EMP_EMAIL);
	if (EMP_ID = 0) then
	DBMS_OUTPUT.PUT_LINE('NOT FOUND');
	else
		SELECT EMPLOYER_NAME INTO EMP_NAME FROM EMPLOYER WHERE EMPLOYER_ID = EMP_ID;
		DBMS_OUTPUT.PUT_LINE('HELLO '|| EMP_NAME);
		--procedure for display menus
		procDisplayMenu;
	END IF;
END;
/