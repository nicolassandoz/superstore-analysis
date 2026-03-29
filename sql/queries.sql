-- 1. Aperçu général
SELECT *
FROM `superstore.sales`
LIMIT 10;

-- 2. Ventes et profit total par catégorie
SELECT
  Category,
  ROUND(SUM(Sales), 2) AS total_sales,
  ROUND(SUM(Profit), 2) AS total_profit
FROM `superstore.sales`
GROUP BY Category
ORDER BY total_sales DESC;

-- 3. Top 10 sous-catégories les plus rentables
SELECT
  sub_category,
  ROUND(SUM(Profit), 2) AS total_profit
FROM (
  SELECT `Sub-Category` AS sub_category, Profit
  FROM `superstore.sales`
)
GROUP BY sub_category
ORDER BY total_profit DESC
LIMIT 10;

-- 4. Ventes par région
SELECT
  Region,
  ROUND(SUM(Sales), 2) AS total_sales,
  ROUND(SUM(Profit), 2) AS total_profit
FROM `superstore.sales`
GROUP BY Region
ORDER BY total_sales DESC;

-- 5. Segment client le plus rentable
SELECT
  Segment,
  ROUND(SUM(Profit), 2) AS total_profit,
  COUNT(DISTINCT `Order ID`) AS nb_orders
FROM `superstore.sales`
GROUP BY Segment
ORDER BY total_profit DESC;