### **SQL Queries for Music Store Analysis**  

#### **1. Most Popular Artist Pairs**  
Identify pairs of artists whose tracks are frequently purchased together.  
- Output:  
  - `artist_A`: First artist (alphabetically first).  
  - `artist_B`: Second artist.  
  - `num_occurrences`: Number of customers who purchased tracks from both artists.  
- Sorting: Alphabetically by `artist_A`, then `artist_B`.  
- Limit: First 200 rows.  

#### **2. Customer Tier Classification (Post-2010)**  
Classify customers into three spending tiers based on total purchase value from 2010 onwards:  
- **Top (high spenders)**: Top 30%.  
- **Middle**: Middle 40%.  
- **Low (low spenders)**: Bottom 30%.  
- Output:  
  - `first_name`, `last_name` (customer’s name).  
  - `total_spent`: Total amount spent.  
  - `tier`: Spending category.  
- Sorting: Descending by `total_spent`, then ascending by `last_name`.  
