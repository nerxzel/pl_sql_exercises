DECLARE

    TYPE SalaryArray IS VARRAY(37) OF NUMBER;
    
    v_salary_array SalaryArray; 
    v_sum NUMBER := 0 ;
    v_avg NUMBER := 0;

BEGIN

    v_salary_array := SalaryArray();
    
    SELECT SALARY 
        BULK COLLECT INTO v_salary_array
    FROM EMPLOYEES;
    
    FOR i IN 1..  v_salary_array.COUNT LOOP
        v_sum := v_sum + v_salary_array(i);
    END LOOP;
    
    v_avg := v_sum / v_salary_array.COUNT;
    
    DBMS_OUTPUT.PUT_LINE('Promedio final: ' || ROUND(v_avg, 2));
    
END;
