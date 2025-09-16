DECLARE

    v_empID employees.employee_id%TYPE;
    v_empName employees.first_name%TYPE;

BEGIN

    SELECT first_name INTO v_empName 
        FROM employees
            WHERE department_id = 50;
        
    DBMS_OUTPUT.PUT_LINE('Nombre empleado: ' || v_empName);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se ha encontrado un empleado con ese ID');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Existe más de un departamento con este ID');
        
END;

INSERT INTO departments (department_id, department_name, location_id)
VALUES (50, 'SALES', 1700);