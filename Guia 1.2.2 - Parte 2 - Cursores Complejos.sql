DECLARE

    CURSOR informeSalarios IS
        SELECT department_id,
               salary,
               first_name, 
               last_name
            FROM employees; 
                
    v_deptId  employees.department_id%TYPE;
    v_salary  employees.salary%TYPE;
    v_name employees.first_name%TYPE;
    v_last_name employees.last_name%TYPE;
    
BEGIN
    OPEN informeSalarios;
        LOOP
            FETCH informeSalarios INTO v_deptId, v_salary, v_name, v_last_name;
            EXIT WHEN informeSalarios%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('Id departamento: ' || v_deptId || ', Sueldo: ' || v_salary || ', Nombre del empleado: ' || v_name || ' ' || v_last_name);
        END LOOP;
    CLOSE informeSalarios;
    
END;