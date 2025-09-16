DECLARE

    ex_precio_invalido EXCEPTION;
    ex_precio_excede EXCEPTION;
    
    v_product_id products.product_id%TYPE := 101;
    v_product_name products.product_name%TYPE;
    v_price products.price%TYPE;
    v_max_price NUMBER := 10;
    
BEGIN

    SELECT product_name, price 
        INTO v_product_name, v_price
            FROM products
                WHERE product_id = v_product_id;
            
    IF v_price < 0 THEN
        RAISE ex_precio_invalido;
    ELSIF v_price > v_max_price THEN
        RAISE ex_precio_excede;
    ELSE 
         DBMS_OUTPUT.PUT_LINE('Producto: ' || v_product_name || ', Precio: ' || v_price);
    END IF;
    
EXCEPTION
    WHEN ex_precio_invalido THEN
        DBMS_OUTPUT.PUT_LINE('Error: El precio debe ser de al menos 1');
    WHEN ex_precio_excede THEN
        DBMS_OUTPUT.PUT_LINE('Error: El precio supera el máximo permitido (' || v_max_price || ').');
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: No se encontró el producto con id ' || v_product_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado: ' || SQLERRM);
END;