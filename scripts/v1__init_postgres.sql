-- scripts/v1__init_postgres.sql
SET search_path TO public;

-- FOODTRUCKS
CREATE TABLE foodtrucks (
    foodtruck_id   INT      PRIMARY KEY,   -- ID viene del CSV
    name           VARCHAR(255)         NOT NULL,
    cuisine_type   VARCHAR(255) not NULL,
    city           VARCHAR(255) not NULL
);

-- PRODUCTS
CREATE TABLE products (
    product_id     INT      PRIMARY KEY,
    foodtruck_id   INT     NOT NULL,
    name           VARCHAR(255)  NOT NULL,
    price          DECIMAL(18,2) NOT NULL,
    stock          INT
);

-- ORDERS
CREATE TABLE  orders (
    order_id       INT       PRIMARY KEY,
    foodtruck_id   INT     NOT NULL,
    order_date     DATE     NOT NULL,
    status         VARCHAR(255)   NOT NULL,
    total          DECIMAL(18,2) NOT NULL
);

-- ORDER_ITEMS
CREATE TABLE order_items (
    order_item_id  INT      PRIMARY KEY,
    order_id       INT     NOT NULL,
    product_id     INT      NOT NULL,
    quantity       INT    NOT null
);

-- LOCATIONS
CREATE TABLE locations (
    location_id    INT      PRIMARY KEY,
    foodtruck_id   INT     NOT NULL,
    location_date  DATE          NOT NULL,
    zone           VARCHAR(255)         NOT NULL
);
