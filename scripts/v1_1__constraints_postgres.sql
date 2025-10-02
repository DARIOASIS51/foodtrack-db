-- scripts/v1_1__constraints_postgres.sql
SET search_path TO public;

---------------------------
-- FOREIGN KEYS - CREANDO LAS RELACIONES
---------------------------
ALTER TABLE products
  ADD CONSTRAINT fk_products_foodtrucks
  FOREIGN KEY (foodtruck_id) REFERENCES foodtrucks(foodtruck_id)
  ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE orders
  ADD CONSTRAINT fk_orders_foodtrucks
  FOREIGN KEY (foodtruck_id) REFERENCES foodtrucks(foodtruck_id)
  ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE order_items
  ADD CONSTRAINT fk_order_items_orders
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
  ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE order_items
  ADD CONSTRAINT fk_order_items_products
  FOREIGN KEY (product_id) REFERENCES products(product_id)
  ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE locations
  ADD CONSTRAINT fk_locations_foodtrucks
  FOREIGN KEY (foodtruck_id) REFERENCES foodtrucks(foodtruck_id)
  ON UPDATE CASCADE ON DELETE RESTRICT;

---------------------------
-- UNIQUE
-- (nombre de producto único dentro de cada foodtruck)
---------------------------
ALTER TABLE products
  ADD CONSTRAINT uq_products_name_per_truck UNIQUE (foodtruck_id, name);

---------------------------
-- CHECKS
---------------------------
ALTER TABLE products
  ADD CONSTRAINT ck_products_price_nonneg CHECK (price >= 0);

ALTER TABLE order_items
  ADD CONSTRAINT ck_order_items_qty_pos CHECK (quantity > 0);

---------------------------
-- ÍNDICES (consultas típicas)
---------------------------
CREATE INDEX IF NOT EXISTS ix_orders_date           ON orders (order_date);
CREATE INDEX IF NOT EXISTS ix_orders_status         ON orders (status);
CREATE INDEX IF NOT EXISTS ix_order_items_order     ON order_items (order_id);
CREATE INDEX IF NOT EXISTS ix_products_truck        ON products (foodtruck_id);
CREATE INDEX IF NOT EXISTS ix_locations_truck_date  ON locations (foodtruck_id, location_date);
