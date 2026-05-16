# Gold Layer Data Catalog

## Overview

The Gold layer contains business-ready tables designed for analytics and reporting.  
It follows a star schema model with dimension tables and fact tables.

---

# 1. gold.dim_customers

## Purpose
Stores customer information used for customer analytics and reporting.

| Column Name | Data Type | Description |
|---|---|---|
| customer_key | INT | Surrogate key for each customer |
| customer_id | INT | Original customer ID from CRM system |
| customer_number | NVARCHAR(50) | Customer business key |
| first_name | NVARCHAR(50) | Customer first name |
| last_name | NVARCHAR(50) | Customer last name |
| marital_status | NVARCHAR(50) | Customer marital status |
| gender | NVARCHAR(50) | Customer gender |
| birthdate | DATE | Customer date of birth |
| country | NVARCHAR(50) | Customer country |

---

# 2. gold.dim_products

## Purpose
Stores product information used for product and category analysis.

| Column Name | Data Type | Description |
|---|---|---|
| product_key | INT | Surrogate key for each product |
| product_id | INT | Original product ID from CRM system |
| product_number | NVARCHAR(50) | Product business key |
| product_name | NVARCHAR(50) | Product name |
| category_id | NVARCHAR(50) | Product category ID |
| category | NVARCHAR(50) | Product category |
| subcategory | NVARCHAR(50) | Product subcategory |
| maintenance | NVARCHAR(50) | Maintenance information |
| cost | INT | Product cost |
| product_line | NVARCHAR(50) | Product line |
| start_date | DATE | Product active start date |
| end_date | DATE | Product active end date |

---

# 3. gold.fact_sales

## Purpose
Stores sales transaction data used for revenue, quantity, and product performance analysis.

| Column Name | Data Type | Description |
|---|---|---|
| order_number | NVARCHAR(50) | Sales order number |
| product_key | INT | Foreign key linked to gold.dim_products |
| customer_key | INT | Foreign key linked to gold.dim_customers |
| order_date | DATE | Date when order was placed |
| shipping_date | DATE | Date when order was shipped |
| due_date | DATE | Expected delivery date |
| sales_amount | INT | Total sales amount |
| quantity | INT | Quantity sold |
| price | INT | Unit price |

---
