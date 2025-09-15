DECLARE
    --Declaro el cursor, sus parámetros y el tipo de dato de estos
    CURSOR cursorSalarioMin (p_deptId employees.department_id%TYPE, p_minSalary employees.salary%TYPE) IS
        --Hago la consulta que le pasará los datos al parametro
        SELECT department_id,
               salary,
               first_name, 
               last_name
            FROM employees 
                WHERE department_id = p_deptId AND salary >= p_minSalary; --Acá uso los parámetros como filtro
    
    --Declaro las variables que usaré en el FETCH
    v_deptId  employees.department_id%TYPE;
    v_salary  employees.salary%TYPE;
    v_name employees.first_name%TYPE;
    v_last_name employees.last_name%TYPE;
    
BEGIN
    --Abro el cursor con pasándole valores al filtro
    OPEN cursorSalarioMin(90, 2000);
        LOOP --el FETCH lleva en el INTO las variables en el mismo orden del SELECT
            FETCH cursorSalarioMin INTO v_deptId, v_salary, v_name, v_last_name;
            EXIT WHEN cursorSalarioMin%NOTFOUND; --SE TERMINA CUANDO YA NO ENCUENTRA MÁS DATOS
            DBMS_OUTPUT.PUT_LINE('Id departamento: ' || v_deptId || ', Sueldo: ' || v_salary || ', Nombre del empleado: ' || v_name || ' ' || v_last_name);
        END LOOP;
    CLOSE cursorSalarioMin;
    
END;