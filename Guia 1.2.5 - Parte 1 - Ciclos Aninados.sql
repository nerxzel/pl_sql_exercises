DECLARE

  CURSOR cursor_deptos IS
    SELECT department_id, 
           department_name FROM departments;
    
  CURSOR cursor_empleados(p_deptoId departments.department_id%TYPE) IS
    SELECT employee_id, salary, job_title 
    FROM employees e
    JOIN jobs j
    ON e.job_id = j.job_id
    WHERE department_id = p_deptoId;
  
  v_depto departments.department_id%TYPE;
  v_depto_name departments.department_name%TYPE;
  v_empId employees.employee_id%TYPE;
  v_salario employees.salary%TYPE;
  v_cargo jobs.job_title%TYPE;
    
BEGIN

    OPEN cursor_deptos;
        LOOP
            FETCH cursor_deptos INTO v_depto, v_depto_name;
            EXIT WHEN cursor_deptos%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('Id depto: ' || v_depto || ', Nombre depto: ' || v_depto_name);
            
            OPEN cursor_empleados(v_depto);
                LOOP
                    FETCH cursor_empleados INTO v_empId, v_salario, v_cargo;
                    EXIT WHEN cursor_empleados%NOTFOUND;
                    DBMS_OUTPUT.PUT_LINE('Id empleado: ' || v_empId || ', Salario empleado: ' || v_salario || ', Cargo empleado: ' || v_cargo);
                END LOOP;
            CLOSE cursor_empleados;
        END LOOP;
    CLOSE cursor_deptos;
END;