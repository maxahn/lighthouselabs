SELECT ROUND(AVG(cost), 2) AS "Average cost", ROUND(AVG(retail), 2) AS "Average Retail", ROUND(AVG(retail)-AVG(cost), 2) AS "Profit" FROM stock;

-- Which book ID has the most pieces in stock?

-- Hints: 1. Use an aggregate function combined with LIMIT and ORDER BY clauses. 2. No need to join with the books table since we just want the ID which is already in the editions table.

SELECT SUM(s.stock), e.book_id 
FROM stock AS s, editions AS e
WHERE s.isbn = e.isbn GROUP BY e.book_id ORDER BY SUM(s.stock) desc LIMIT 1;

List author ID along with the number of books they have written. Output 2 columns: "Full name" and "Number of Books"

SELECT (a.first_name || ' ' || a.last_name) AS "Full name", COUNT(b.id) AS "Number of books" 
FROM authors AS a
JOIN books AS b
  ON a.id = b.author_id
GROUP BY a.id
ORDER BY COUNT(b.id) desc;