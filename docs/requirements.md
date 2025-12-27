# 🍽️ Zomato Sales Analysis Project Requirements

## Project Title
**End-to-End SQL Analytics for Food Delivery (Zomato Model)**

## Overview
Analyze food delivery business metrics leveraging a realistic Zomato database schema. Address multiple business questions involving customer orders, restaurant performance, menu popularity, payments, and more using advanced SQL queries.

---

## Business Objectives

1. Identify high-value customers and top performers.
2. Rank restaurants by rating and revenue.
3. Analyze order speed and delivery performance.
4. Track revenue and popularity of food items.
5. Compare employee ratings.
6. Examine payment trends and breakdowns.
7. Reveal patterns in order timing (weekday/weekend, monthly).
8. Understand menu diversity and its impact on restaurant success.

---

## Data Model

Import and use the provided database: `zomatodb.sql`.
Main tables include:
- **customer**
- **restaurant**
- **foods**
- **zomato_employee**
- **order_detail**
- **payment_table**
- **order_food**

See ER Diagram for normalized schema and table relationships.

---

## Analytical Tasks & Metrics

Write and execute SQL queries to solve:

### Orders & Customers
- Top 3 customers by order frequency
- Most frequent customer per restaurant

### Restaurants
- Restaurant with the highest (and second highest) average rating/revenue
- Restaurant with most diverse menu

### Foods
- Top 5 most popular food items by quantity sold
- Top 5 most expensive food items (consider ties using DENSE_RANK)
- Total revenue for each food item

### Employees
- Top 3 employees by average delivery rating

### Delivery Analysis
- Orders delivered under 30 minutes
- Average delivery time on weekends vs weekdays

### Payments
- Total payment amount per payment type

### Order Timing
- Month/weekend analysis for highest order volumes

### Customer Order Value
- Average order amount per customer

---

## Requirements

- Use proper SQL syntax: JOINs, GROUP BY, window functions, filtering, aggregation.
- Date/time functions for operational metrics.
- Subqueries and derived tables for advanced ranking/popularity analysis.
- Maintain clear, readable SQL solutions.
- All analytics to be reproducible from the included `zomatodb.sql`.

---

## Deliverables

- **README.md** with project overview and result highlights
- **requirements.md** summarizing the objectives and tasks
- **interpretation.md** with result-driven business analysis
- All solution SQL scripts in `/sql/`
- Images (ER diagram, example outputs)

---

*Optional*: Extend analysis in Python/Jupyter for deeper statistics (median/mode) or visualizations.
