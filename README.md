# 📊 Netflix SQL Analysis Project

This project explores the **Netflix dataset** using **SQL queries** to derive insights such as content distribution, trends over time, top contributors, and more.

---

## 📁 Database Setup

```sql
CREATE DATABASE IF NOT EXISTS NETFLIX;
USE NETFLIX;
````

> Ensure your dataset is loaded into a table named `titles` with appropriate columns like `title`, `type`, `director`, `country`, `date_added`, `release_year`, `rating`, `duration`, and `listed_in`.

---

## 📌 SQL Query List and Descriptions

### 1. ✅ Count Total Number of Records

```sql
SELECT COUNT(*) AS total_records FROM titles;
```

Returns the total number of entries in the dataset.

---

### 2. ✅ Distribution by Type (Movie or TV Show)

```sql
SELECT type, COUNT(*) AS count 
FROM titles 
GROUP BY type 
ORDER BY count DESC;
```

---

### 3. ✅ Distribution by Rating

```sql
SELECT rating, COUNT(*) AS count 
FROM titles 
GROUP BY rating 
ORDER BY count DESC;
```

---

### 4. ✅ Distribution by Release Year

```sql
SELECT release_year, COUNT(*) AS count 
FROM titles 
GROUP BY release_year 
ORDER BY release_year;
```

---

### 5. ✅ Top 10 Most Common Directors

```sql
SELECT director, COUNT(*) AS count 
FROM titles 
WHERE director IS NOT NULL AND director != ''
GROUP BY director 
ORDER BY count DESC 
LIMIT 10;
```

---

### 6. ✅ Top 10 Countries by Content Count

```sql
SELECT country, COUNT(*) AS count 
FROM titles 
WHERE country IS NOT NULL AND country != ''
GROUP BY country 
ORDER BY count DESC 
LIMIT 10;
```

---

### 7. ✅ Records Added per Month

```sql
SELECT DATE_FORMAT(STR_TO_DATE(date_added,'%b %d, %Y'),'%Y-%m') AS month, COUNT(*) AS count
FROM titles
WHERE date_added IS NOT NULL
GROUP BY month 
ORDER BY month;
```

---

### 8. ✅ Records Added per Year

```sql
SELECT YEAR(STR_TO_DATE(date_added,'%b %d, %Y')) AS year, COUNT(*) AS count
FROM titles
WHERE date_added IS NOT NULL
GROUP BY year 
ORDER BY year;
```

---

### 9. ✅ Count of Drama Titles

```sql
SELECT COUNT(*) AS count 
FROM titles 
WHERE LOWER(listed_in) LIKE '%drama%';
```

---

### 10. ✅ Average Duration of Movies (in Minutes)

```sql
SELECT AVG(CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED)) AS average_duration 
FROM titles 
WHERE duration REGEXP '^[0-9]+ min$';
```

---

### 11. ✅ Records Without Director Information

```sql
SELECT COUNT(*) AS count 
FROM titles 
WHERE director IS NULL OR director = '';
```

---

### 12. ✅ Titles Released in the Last 5 Years

```sql
SELECT * 
FROM titles 
WHERE release_year >= YEAR(CURDATE()) - 5;
```

---

### 13. ✅ Titles Available in India

```sql
SELECT type, title 
FROM titles 
WHERE LOWER(country) = 'india';
```

---

### 14. ✅ Titles with Seasons

```sql
SELECT * 
FROM titles 
WHERE duration LIKE '%season%';
```

---

### 15. ✅ Titles with More Than 2 Seasons

```sql
SELECT * 
FROM titles 
WHERE duration LIKE '%season%' 
AND CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) > 2;
```

---

## 📈 Future Enhancements

* Visualization dashboard (Power BI / Tableau / Python)
* Data cleaning and normalization scripts
* Jupyter notebook integration for Python analysis

## 🙋‍♂️ Contact

For questions or suggestions, feel free to open an issue or reach out!
