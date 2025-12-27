# 🍽️ Zomato Sales & Analytics SQL Project

<p align="center">
  <img src="images/zomato_schema.png" alt="zomato_schema" width="500">
</p>

## 📋 Table of Contents
- [Project Overview](#project-overview)
- [Business Questions](#business-questions)
- [Dataset Description](#dataset-description)
- [Methodology](#methodology)
- [SQL Solution Approach](#sql-solution-approach)
- [Results](#results)
- [Key Insights & Interpretation](#key-insights--interpretation)
- [Technical Skills Demonstrated](#technical-skills-demonstrated)
- [Project Structure](#project-structure)
- [How to Run](#how-to-run)
- [Future Improvements](#future-improvements)
---

## 🎯 Project Overview

This SQL project analyzes the sales, performance, customer behavior and operational metrics for an online food delivery system modeled after Zomato. The goal is to answer business-critical questions such as revenue trends, popular menu items, top customers, and more using a relational database.

---

## ❓ Business Questions

Key questions addressed in this analysis:
| # | Question |
|---|----------|
| 1 | Who are the top customers by number of orders? |
| 2 | Which restaurant achieves the highest average rating? |
| 3 | Which orders are delivered fastest (under 30 minutes)? |
| 4 | What revenue does each food item generate? |
| 5 | Which restaurant generates the second highest revenue? |
| 6 | Which foods are most popular? |
| 7 | Which employees have the highest average delivery ratings? |
| 8 | In which month are the most orders placed? |
| 9 | What is the average order amount per customer? |
| 10 | Who is the most frequent customer for each restaurant? |
| 11 | How many orders are placed on weekends? |
| 12 | What is the average delivery time on weekends vs weekdays? |
| 13 | What are the most expensive food items? |
| 14 | Which restaurant has the most diverse menu? |
| 15 | What’s the total payment amount per payment type? |

---

## 🗄️ Dataset Description

### Database: `zomatodb`

The project uses a normalized dataset with the following tables:
| Table | Description |
|-------|-------------|
| customer | Registered customers and their details |
| restaurant | Restaurant info and ratings |
| foods | Food menu and pricing |
| zomato_employee | Delivery staff details and avg ratings |
| order_detail | All placed orders with times and status |
| payment_table | Payments and their types/status |
| order_food | Order items – quantity and food IDs per order |

#### Data Relationships (see ER diagram above)
- Orders link customers, employees and restaurants.
- Payment is linked to orders.
- Ordered food captures many-to-many between orders and foods.

---

## 🔬 Methodology

The analysis is performed fully in SQL through subqueries, joins, aggregations and window functions. Each business question (see above) is solved through precise SELECT statements, joining and grouping across related tables.

---

## 💻 SQL Solution Approach

For each metric and business question, standard SQL approaches are employed:
- JOINs for relational context (customer, restaurant, food, order)
- GROUP BY and aggregates for totals, averages, counts
- Subqueries and window functions for ranking, filtering
- Date functions (MONTH, DAYOFWEEK, TIMESTAMPDIFF, etc)
- RANK & DENSE_RANK for handling ties (e.g. expensive foods)
- HAVING, WHERE for filtering on computed metrics

All queries are available in the `sql/` directory.

---

## 📈 Results

Highlights include:
- **Top customers** by order count
- **Restaurant with highest/second-highest revenue**
- **Fast delivery performance** (<30 min orders)
- **Top 5 food items** by quantity sold
- **Most diverse menu** among restaurants
- **Average order value per customer**
- **Total payment breakdown** by payment type
- **Order patterns by weekday/weekend, month**

(See full result tables in `docs/interpretation.md` and query outputs.)

---

## 💡 Key Insights & Interpretation

- Customer and food order behavior is highly concentrated – some users are much more frequent and some foods much more popular.
- Revenue is not evenly distributed—certain restaurants and dishes dominate.
- Timing reveals user preferences (fast delivery, order spikes on weekends/months).
- Employee performance and ratings can be tracked and improved.
- Menu diversity influences restaurant success.

For detailed interpretation, see [`docs/interpretation.md`](docs/interpretation.md).

---

## 🛠️ Technical Skills Demonstrated

| Category | Skills                 |
|----------|------------------------|
| **SQL Joins**     | Multiple-table inner & left joins |
| **Aggregations**  | SUM, COUNT, AVG, MIN, MAX |
| **Date Handling** | DATEDIFF, MONTH, DAYOFWEEK |
| **Window Functions** | RANK, DENSE_RANK, PARTITION BY |
| **Subqueries**    | Derived tables for advanced metrics |
| **Statistical Analysis** | Averages, modes, ranking |
| **Business Logic**| Translating requirements into SQL |

---

## 📁 Project Structure

```
zomato-sales-analytics/
│
├── README.md                        # Main documentation
│
├── data/
│   └── zomatodb.sql                 # Full database schema and sample data
│
├── docs/
│   ├── requirements.md              # Problem statement & business objectives
│   └── interpretation.md            # Analysis and interpretation
│
├── images/
│   └── zomato_schema.png            # ER diagram (see above)
│
└── sql/
    ├── zomato_sol_tusharv.sql       # All solution queries (15+)
    └── ...                          # Additional ad-hoc queries
```

---

## 🚀 How to Run

### Prerequisites
- MySQL Server 8.0+ (or compatible SQL engine)
- MySQL Workbench or preferred SQL client

### Steps

1. **Clone this repository**
   ```bash
   git clone https://github.com/TusharVarma077/zomato-sales-analytics.git
   ```

2. **Import the database**
   ```sql
   SOURCE data/zomatodb.sql;
   ```

3. **Run solution queries**
   ```sql
   SOURCE sql/zomato_sol_tusharv.sql;
   ```
   - Explore results in client or export as needed.

---

## 🔜 Future Improvements

- [ ] Python/Jupyter analytics for deeper statistics & visualization
- [ ] Detailed cohort & segmented behavioral analysis
- [ ] Live dashboard/report (Tableau, PowerBI)
- [ ] Predictive analytics for sales/delivery efficiency
- [ ] Enhanced employee/menu optimization metrics

---

## 📚 What I Learned

- Designing normalized schemas for analytics
- Solving realistic business issues with SQL only
- Window functions for ranking
- Transforming raw metrics into actionable business insights

---

## 👤 Author

**Tushar Varma**
- GitHub: [@TusharVarma077](https://github.com/TusharVarma077)

---

*Project completed: December 2025*
