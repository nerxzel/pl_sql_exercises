DECLARE

    TYPE SalaryArray IS VARRAY(37) OF NUMBER;
    
    v_Salary_Array SalaryArray; 
    v_sum NUMBER := 0 ;
    v_promedio NUMBER := 0;

BEGIN

    v_Salary_Array := SalaryArray(2500, 2600, 2800, 2900, 3100, 4200, 4400, 4800);
    
    SELECT SALARY 
        BULK COLLECT INTO v_Salary_Array
    FROM EMPLOYEES;
    
    FOR i IN 1..  v_Salary_Array.COUNT LOOP
        v_sum := v_sum + v_Salary_Array(i);
    END LOOP;
    
    v_promedio := v_sum / v_Salary_Array.COUNT;
    
    
    DBMS_OUTPUT.PUT_LINE('Promedio final: ' || ROUND(v_promedio, 2));
    
END;
