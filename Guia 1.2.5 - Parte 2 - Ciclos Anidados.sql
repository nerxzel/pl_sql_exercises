DECLARE

    CURSOR cursor_tienda IS
        SELECT store_id, 
               store_name FROM stores;
        
    CURSOR cursor_productos(p_store stores.store_id%TYPE) IS
        SELECT p.product_id, product_name, quantity
        FROM products p
        JOIN order_items o
        ON p.product_id = o.product_id
        WHERE store_id = p_store;

v_store stores.store_id%TYPE;
v_store_name stores.store_name%TYPE;
v_product products.product_id%TYPE;
v_product_name products.product_name%TYPE;
v_quantity order_items.quantity%TYPE;

BEGIN

    OPEN cursor_tienda;
        LOOP 
            FETCH cursor_tienda INTO v_store, v_store_name;
            EXIT WHEN cursor_tienda%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('Id tienda: ' || v_store || ', Nombre tienda: ' || v_store_name);
            
                OPEN cursor_productos(v_store);
                    LOOP
                        FETCH cursor_productos INTO v_product, v_product_name, v_quantity;
                        EXIT WHEN cursor_productos%NOTFOUND;
                         DBMS_OUTPUT.PUT_LINE('Id producto: ' || v_product || ', Nombre producto: ' || v_product_name || ', Cantidad vendida: ' || v_quantity);
                    END LOOP;
                CLOSE cursor_productos;
        END LOOP;
    CLOSE cursor_tienda;
                          
END;

--Hice estos INSERT para simular la base que piden para hacer este ejercicio
-- ==============================
-- INSERTS DE TIENDAS
-- ==============================
INSERT INTO stores (store_id, store_name, location)
VALUES (1, 'Tienda Central', 'Santiago');

INSERT INTO stores (store_id, store_name, location)
VALUES (2, 'Sucursal Norte', 'Antofagasta');

-- ==============================
-- INSERTS DE PRODUCTOS
-- ==============================
INSERT INTO products (product_id, product_name, price, store_id)
VALUES (101, 'Laptop', 800.00, 1);

INSERT INTO products (product_id, product_name, price, store_id)
VALUES (102, 'Mouse', 20.00, 1);

INSERT INTO products (product_id, product_name, price, store_id)
VALUES (103, 'Teclado', 35.00, 2);

INSERT INTO products (product_id, product_name, price, store_id)
VALUES (104, 'Monitor', 200.00, 2);

-- ==============================
-- INSERTS DE PEDIDOS
-- ==============================
INSERT INTO orders (order_id, order_date, store_id)
VALUES (201, DATE '2024-09-10', 1);

INSERT INTO orders (order_id, order_date, store_id)
VALUES (202, DATE '2024-09-12', 2);

-- ==============================
-- INSERTS DE DETALLE DE PEDIDOS
-- ==============================
INSERT INTO order_items (order_item_id, order_id, product_id, quantity)
VALUES (301, 201, 101, 2);

INSERT INTO order_items (order_item_id, order_id, product_id, quantity)
VALUES (302, 201, 102, 5);

INSERT INTO order_items (order_item_id, order_id, product_id, quantity)
VALUES (303, 202, 103, 3);

INSERT INTO order_items (order_item_id, order_id, product_id, quantity)
VALUES (304, 202, 104, 1);

COMMIT;