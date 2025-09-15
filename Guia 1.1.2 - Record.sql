DECLARE

TYPE DeptRec IS RECORD (
    deptno departments.department_id%TYPE,
    dname departments.department_name%TYPE,
    loc locations.city%TYPE
);

v_deptRec DeptRec;

BEGIN
    
    SELECT department_id, department_name, city INTO v_deptRec
    FROM departments d
    JOIN locations l
    ON d.location_id = l.location_id
    WHERE department_id = 10;

 DBMS_OUTPUT.PUT_LINE('Número departamento: ' || v_deptRec.deptno || 
                        ', Nombre departamento: ' || v_deptRec.dname || 
                        ', Ciudad: ' || v_deptRec.loc);

END;