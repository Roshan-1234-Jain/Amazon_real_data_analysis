CREATE DATABASE amazon_sales;
USE amazon_sales;
CREATE TABLE amazon_orders (
    order_index INT,
    order_id VARCHAR(30),
    order_date DATE,
    status VARCHAR(50),
    fulfilment VARCHAR(50),
    sales_channel VARCHAR(30),
    ship_service_level VARCHAR(30),
    style VARCHAR(50),
    sku VARCHAR(50),
    category VARCHAR(50),
    size VARCHAR(20),
    asin VARCHAR(20),
    courier_status VARCHAR(50),
    qty INT,
    currency VARCHAR(10),
    amount DECIMAL(10,2),
    ship_city VARCHAR(50),
    ship_state VARCHAR(50),
    ship_postal_code VARCHAR(20),
    ship_country VARCHAR(20),
    fulfilment_status VARCHAR(30),
    promotion_ids TEXT,
    b2b BOOLEAN,
    fulfilled_by VARCHAR(50)
);
SHOW VARIABLES LIKE 'secure_file_priv';


LOAD DATA  INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Amazon Sale Report.csv'
INTO TABLE amazon_orders
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
IGNORE 1 ROWS
(
    order_index,              -- index
    order_id,                 -- Order ID
    @order_date,              -- Date
    status,                   -- Status
    fulfilment,               -- Fulfilment
    sales_channel,            -- Sales Channel
    ship_service_level,       -- ship-service-level
    style,                    -- Style
    sku,                      -- SKU
    category,                 -- Category
    size,                     -- Size
    asin,                     -- ASIN
    courier_status,           -- Courier Status
    qty,                      -- Qty
    currency,                 -- currency
    @amount,                   -- Amount
    ship_city,                -- ship-city
    ship_state,               -- ship-state
    ship_postal_code,         -- ship-postal-code
    ship_country,             -- ship-country
    promotion_ids,            -- promotion-ids
    @b2b,                      -- B2B
    fulfilled_by,             -- fulfilled-by
    @ignore_column            -- Unnamed: 22 (ignored)
)
SET order_date = STR_TO_DATE(@order_date, '%m-%d-%y'),
    b2b = IF(@b2b='True', 1, 0),
    amount = NULLIF(@amount, '');