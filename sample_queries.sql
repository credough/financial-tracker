-- Sample Queries for Budget Tracking
-- Aaron Creed P. Celindro

-- 1. List all Expenses
SELECT * FROM Expenses;

-- 2. Show expenses with category names
SELECT e.date, e.description, e.amount, c.name AS category
FROM Expenses e
JOIN Categories c ON e.category_id = c.category_id
ORDER BY e.date DESC;


-- 3. Total spending per category
SELECT c.name, SUM(e.amount) AS total_spent
FROM Expenses e
JOIN Categories c ON e.category_id = c.category_id
GROUP BY c.name;


-- 4. Compare monthly expenses and budget
SELECT 
  c.name AS category, 
  SUM(e.amount) AS spent, 
  b.amount AS budget,
  (SUM(e.amount) - b.amount) AS difference
FROM Expenses e
JOIN Categories c ON e.category_id = c.category_id
JOIN MonthlyBudget b ON e.category_id = b.category_id
WHERE b.month = 12 AND b.year = 2025
GROUP BY c.name;