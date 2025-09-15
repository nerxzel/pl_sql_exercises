DECLARE

-- Primero declaro el Varray
TYPE DeptIDArray IS VARRAY(10) OF NUMBER;

-- Luego declaro la variable del Varray
v_DeptID_Array DeptIDArray;

BEGIN

-- Luego inicializo la variable del Varray
v_DeptID_Array := DeptIDArray(10, 20, 30, 40, 50);

-- Realizo la consulta que le dara los datos al Varray
SELECT DEPARTMENT_ID 
    BULK COLLECT INTO v_DeptID_Array
FROM DEPARTMENTS WHERE ROWNUM <= 10;

-- Creo el loop que imprimira la informacion en consola
FOR i IN 1.. v_DeptID_Array.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE('Department ID: ' || v_DeptID_Array(i));
END LOOP;
END;