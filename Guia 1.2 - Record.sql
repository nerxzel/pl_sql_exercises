DECLARE

TYPE DeptRec IS RECORD (
    deptno departments.department_id%TYPE,
    dname departments.department_name%TYPE,
    loc locations.city%TYPE
);

v_michi DeptRec;

BEGIN
    
    SELECT department_id, department_name, city INTO v_michi
    FROM departments d
    JOIN locations l
    ON d.location_id = l.location_id
    WHERE department_id = 10;

 DBMS_OUTPUT.PUT_LINE('Número departamento: ' || v_michi.deptno || 
                        ', Nombre departamento: ' || v_michi.dname || 
                        ', Ciudad: ' || v_michi.loc);

END;