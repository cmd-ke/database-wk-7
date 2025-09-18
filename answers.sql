-- Original table: ProductDetail
-- Normalize into 1NF by splitting Products

SELECT 
    OrderID,
    CustomerName,
    LTRIM(RTRIM(value)) AS Product
FROM ProductDetail
CROSS APPLY STRING_SPLIT(Products, ',');


-- Table 1: Orders (remove partial dependency)
SELECT DISTINCT
    OrderID,
    CustomerName
INTO Orders
FROM OrderDetails;

-- Table 2: OrderItems (depends on full key)
SELECT
    OrderID,
    Product,
    Quantity
INTO OrderItems
FROM OrderDetails;
