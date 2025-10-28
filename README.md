# 🛍️ Customer Shopping Behavior Analysis

## 📖 Project Overview

This project analyzes customer shopping behavior using transactional data from 3,900 purchases across various product categories.
The goal is to uncover insights into spending patterns, customer segments, product preferences, and subscription behavior to guide data-driven business decisions.

---

## 📊 Dataset Summary

* Rows: 3,900
* Columns: 18
* Key Features:

  * Customer demographics: `age`, `gender`, `location`, `subscription_status`
  * Purchase details: `item_purchased`, `category`, `purchase_amount`, `season`, `size`, `color`
  * Shopping behavior: `discount_applied`, `previous_purchases`, `frequency_of_purchases`, `review_rating`, `shipping_type`
  * Missing Data: 37 missing values in the `review_rating` column

---

## 🧮 Exploratory Data Analysis (Python)

Data cleaning and transformation were performed using Python (pandas, numpy, matplotlib, seaborn).

### Key Steps:

* Data Loading: Imported the dataset using `pandas`.
* Exploration: Used `df.info()` and `df.describe()` to understand structure and summary stats.
* Handling Missing Data: Filled missing review ratings with median values grouped by product category.
* Column Standardization: Converted all column names to `snake_case`.
* Feature Engineering:
  * Created `age_group` by binning ages.
  * Created `purchase_frequency_days` from purchase timestamps.
  * Data Validation: Checked redundancy between `discount_applied` and `promo_code_used` and dropped unnecessary columns.
  * Database Integration: Loaded the cleaned dataset into MYSQL for SQL analysis.

---

## 🧠 SQL Analysis (Business Insights)

Using PostgreSQL, several key business questions were answered:

1. Revenue by Gender – Compared total revenue by male vs. female customers.
2. High-Spending Discount Users – Identified customers using discounts but spending above average.
3. Top 5 Products by Rating – Listed products with highest average reviews.
4. Shipping Type Comparison – Compared average purchase amounts by shipping type.
5. Subscribers vs. Non-Subscribers – Compared total revenue and spending behavior.
6. Discount-Dependent Products – Found products most frequently bought on discount.
7. Customer Segmentation – Classified customers as *New*, *Returning*, or *Loyal*.
8. Top 3 Products per Category – Highlighted the best-selling items in each category.
9. Repeat Buyers & Subscriptions – Checked subscription likelihood among repeat buyers.
10. Revenue by Age Group – Analyzed revenue contribution across age brackets.

---

## 📈 Power BI Dashboard

An interactive Power BI dashboard was developed to visualize insights, including:

* Revenue trends by category, gender, and age group
* Subscription-based revenue comparison
* Shipping preferences and their impact on sales
* Top-rated and best-selling products
* Customer segmentation overview

---

## 💡 Business Recommendations

Based on insights from analysis and visualization:

* Boost Subscriptions: Promote exclusive offers for subscribers.
* Reward Loyalty: Create programs for repeat buyers to improve retention.
* Optimize Discounts: Balance discount rates to maintain profit margins.
* Product Positioning: Highlight best-rated and top-selling items in marketing.
* Targeted Marketing: Focus campaigns on profitable age groups and express-shipping users.

---

## 🛠️ Tech Stack

* Python: Data cleaning, preprocessing, and EDA
* MYSQL: Business query analysis
* Power BI: Interactive data visualization
* Libraries Used: pandas, numpy, matplotlib, seaborn, psycopg2


## 📬 Author

Rabin Shahi
📍 Lincoln, UK



