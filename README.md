# Portfolio_MySQL_Churn_Analysis
## Database Overview
This project creates a database named churn to manage customer, transaction, and subscription data. The goal is to analyze customer churn, purchase behavior, and subscription usage patterns. The database uses normalized tables with well-defined relationships to organize the data.

##  Database Schema

Tables:
- Location: Stores information about various locations (e.g., city, country, and location name).
- Customers: Contains customer details such as name, gender, age, and location.
- Products: Categorizes products into groups like clothing, accessories, etc.
-  Transactions: Tracks purchase transactions made by customers, including date, amount, and product category.
-  PremiumPlans: Holds subscription plans with monthly and annual costs.
-  PlanUsers: Manages customer subscriptions with details on start and end dates.

Relationships:
- Customers → Location: Foreign key (location_id).
- Transactions → Customers: Foreign key (customer_id).
- Transactions → Products: Foreign key (category_id).
- PlanUsers → Customers and PremiumPlans: Foreign keys (customer_id, plan_id).

## Data Insights and Analysis
*Inactive Customers*: Identifies customers inactive for over 60 days to monitor churn and engagement.

*Churn Analysis*: Calculates inactive customer percentage and groups cities by inactivity.

*Transaction Classification*: Categorizes transactions as High, Medium, or Low to analyze spending behavior.

*Purchases by Category*: Retrieves customers by product category for targeted marketing.

*Total Spend*: Calculates total spending per customer for loyalty tracking.
