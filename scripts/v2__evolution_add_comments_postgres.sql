-- scripts/v2__evolution_add_comments_postgres.sql
SET search_path TO public;

-- 1) Agregar columna (NULL por defecto para no romper inserts existentes)
ALTER TABLE orders
  ADD COLUMN IF NOT EXISTS comments TEXT;

-- 2) (Opcional) Si querés valor por defecto en nuevos pedidos:
-- ALTER TABLE orders ALTER COLUMN comments SET DEFAULT '';

-- 3) (Opcional) Backfill de ejemplo (rellenar algunos comentarios)
-- UPDATE orders SET comments = 'Carga histórica' WHERE comments IS NULL;
