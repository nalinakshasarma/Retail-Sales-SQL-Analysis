# Retail Sales Analysis Using MySQL

## Project Overview

This project analyzes a retail sales dataset containing 2,000 transactions using MySQL.

The objective is to explore sales performance, customer behavior, product categories, monthly sales trends, and transaction patterns using SQL queries.

## Dataset

- Dataset size: 2,000 retail transactions
- Database: MySQL
- Main table: `retail_sales_1`

### Key Columns

- `transactions_id` – Unique transaction identifier
- `sale_date` – Date of sale
- `sale_time` – Time of sale
- `customer_id` – Customer identifier
- `gender` – Customer gender
- `age` – Customer age
- `category` – Product category
- `quantiy` – Quantity purchased
- `price_per_unit` – Price per unit
- `cogs` – Cost of goods sold
- `total_sale` – Total transaction value

## Tools Used

- MySQL
- SQL
- MySQL Workbench

## Project Objectives

The analysis focuses on:

- Exploring the retail sales dataset
- Checking data quality and missing values
- Understanding sales and customer volume
- Analyzing category-wise sales
- Identifying high-value transactions
- Analyzing customer purchasing behavior
- Identifying top customers
- Analyzing monthly sales patterns
- Analyzing transactions by gender and category
- Understanding order patterns by time of day

## SQL Analysis Performed

### Data Exploration

- Total number of sales transactions
- Number of unique customers
- Number of unique product categories
- Available product categories

### Sales Analysis

- Transactions on a specific date
- Clothing transactions in November 2022
- Total sales and number of orders by category
- Transactions with sales above 1,000

### Customer Analysis

- Average customer age for the Beauty category
- Top 5 customers based on total sales
- Number of unique customers in each category

### Sales Trend Analysis

- Average sales by month
- Best-performing month within each year using the `RANK()` window function

### Transaction Analysis

- Number of transactions by gender and category
- Orders by time-of-day shift using `CASE`

## SQL Concepts Used

- `SELECT`
- `WHERE`
- `GROUP BY`
- `ORDER BY`
- `COUNT()`
- `COUNT(DISTINCT)`
- `SUM()`
- `AVG()`
- `ROUND()`
- `LIMIT`
- `DISTINCT`
- `CASE`
- Date functions
- `DATE_FORMAT()`
- `YEAR()`
- `MONTH()`
- Subqueries
- Window functions
- `RANK()`

## Project Structure

```text
Retail-Sales-SQL-Analysis/
│
├── README.md
└── retail_sales_analysis.sql
