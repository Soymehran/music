-- Section1

SELECT x1.Name             artist_A,
       x.Name              artist_B,
       COUNT(x.CustomerId) num_occurrences
FROM (SELECT DISTINCT a.Name,
                      i.CustomerId
      FROM invoice i
               JOIN invoiceline il ON i.InvoiceId = il.InvoiceId
               JOIN track t on il.TrackId = t.TrackId
               JOIN album al on t.AlbumId = al.AlbumId
               JOIN artist a ON al.ArtistId = a.ArtistId
      ORDER BY CustomerId) x
         JOIN (SELECT DISTINCT a.Name,
                               i.CustomerId
               FROM invoice i
                        JOIN invoiceline il ON i.InvoiceId = il.InvoiceId
                        JOIN track t on il.TrackId = t.TrackId
                        JOIN album al on t.AlbumId = al.AlbumId
                        JOIN artist a ON al.ArtistId = a.ArtistId
               ORDER BY CustomerId) x1 on x.CustomerId = x1.CustomerId
where x1.Name < x.Name
group by x1.Name, x.Name
ORDER BY num_occurrences DESC, x1.Name, x.Name
limit 200;

-- Section2

SELECT x.FirstName,
     x.LastName,
     x.total_spent,
     CASE
         WHEN ranky > 0.7 THEN 'low'
         WHEN ranky > 0.3 THEN 'middle'
     ELSE 'top'
     END AS customer_level
FROM (SELECT c.FirstName,
             c.LastName,
             SUM(il.UnitPrice * il.Quantity) total_spent,
             PERCENT_RANK() OVER (ORDER BY SUM(il.UnitPrice * il.Quantity) DESC) AS ranky
FROM invoiceline il
JOIN invoice i ON i.InvoiceId = il.InvoiceId
JOIN customer c ON i.CustomerId = c.CustomerId
WHERE i.InvoiceDate >= '2010-01-01 00:00:00'
GROUP BY c.FirstName, c.LastName) x
ORDER BY x.total_spent DESC, x.LastName;

