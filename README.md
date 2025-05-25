# 🚗 SQL Portfolio Project: Analyzing Operational Challenges at Tesla Motors

![tesla](https://github.com/user-attachments/assets/ba159cda-168d-47af-a3b7-bbb433ea7f35)


#  📌 Project Overview

In this SQL-driven data analysis project, I examined key operational challenges and business insights at Tesla Motors using structured data from their sales, inventory, service, and customer feedback domains. The project focuses on transforming raw business data into actionable insights that can aid decision-making for Tesla’s executive and operational teams.

This project demonstrates my ability to:

  - Perform multi-domain analysis (Sales, Feedback, Inventory, Service)

  - Write efficient SQL queries in SQL Server

  - Uncover trends, correlations, and performance gaps

  - Translate data into business value

#  🗃️ Data Domains Analyzed

  - Orders – Vehicle sales data

  - Vehicles – Product catalog

  - Inventory – Stock availability

  - CustomerFeedback – Ratings and text reviews

  - ServiceRecords – Vehicle servicing data

# 📊 Key Business Questions & SQL Solutions

1. 🔥 Sales Performance Analysis
   
1.1 Which vehicle model has the highest sales volume?

    SELECT TOP 1 v.VehicleID, v.Model, SUM(o.TotalAmount) AS highest_sales_volume
    FROM Orders o
    JOIN Vehicles v ON o.VehicleID = v.VehicleID
    GROUP BY v.VehicleID, v.Model
    ORDER BY highest_sales_volume DESC;
    
1.2 Are there any seasonal trends in vehicle sales?

    SELECT 
    v.Model,
    YEAR(o.OrderDate) AS SaleYear,
    MONTH(o.OrderDate) AS SaleMonth,
    SUM(o.TotalAmount) AS TotalSales
    FROM Orders o
    JOIN Vehicles v ON o.VehicleID = v.VehicleID
    GROUP BY YEAR(o.OrderDate), MONTH(o.OrderDate), v.Model
    ORDER BY SaleYear, SaleMonth, TotalSales DESC;

2. 🧠 Customer Feedback Insights
   
2.1 What is the average rating for each vehicle model?

    SELECT model, AVG(rating) AS average_rating
    FROM Vehicles v
    JOIN CustomerFeedback cf ON v.VehicleID = cf.VehicleID
    GROUP BY model;

2.2 Are there any common themes in customer comments?

    SELECT comments
    FROM CustomerFeedback;
(This query provides raw feedback. Text mining or keyword extraction could be a next step using Python/NLP.)

2.3 How many customers have provided feedback?

    SELECT COUNT(*) AS number_of_customers
    FROM CustomerFeedback;

3. 📦 Inventory Management
   
3.1 What is the current inventory level for each vehicle model?

    SELECT v.Model, i.QuantityAvailable
    FROM Vehicles v
    JOIN Inventory i ON v.VehicleID = i.VehicleID;

3.2 How does inventory correlate with sales data over the past year?

    SELECT 
    v.Model,
    SUM(o.TotalAmount) AS TotalSales,
    i.QuantityAvailable
    FROM Orders o
    JOIN Vehicles v ON o.VehicleID = v.VehicleID
    JOIN Inventory i ON v.VehicleID = i.VehicleID
    WHERE o.OrderDate >= DATEADD(YEAR, -1, GETDATE())
    GROUP BY v.Model, i.QuantityAvailable;

4. 🛠️ Service Record Analysis
   
4.1 What are the most common types of service requests?

    SELECT description, COUNT(ServiceID) AS no_of_requests
    FROM ServiceRecords
    GROUP BY description
    ORDER BY no_of_requests DESC;

4.2 Which vehicle models have the highest service costs?

    SELECT VehicleID, SUM(Cost) AS service_cost
    FROM ServiceRecords
    GROUP BY VehicleID;

4.3 Is there a correlation between service frequency and customer satisfaction?

    SELECT 
    v.VehicleID, 
    COUNT(sr.ServiceID) AS service_frequency,
    AVG(cf.Rating) AS average_rating
    FROM Vehicles v
    LEFT JOIN ServiceRecords sr ON v.VehicleID = sr.VehicleID
    LEFT JOIN CustomerFeedback cf ON v.VehicleID = cf.VehicleID
    GROUP BY v.VehicleID;

#  🛠️ Tools & Technologies Used

  - SQL Server: Query execution and analysis

  - T-SQL: Writing optimized, production-ready queries

  - Excel/PowerPoint: Visual presentation of findings

  - (Optional Extension): Power BI for dashboards

#  📈 Key Business Insights

  - Identified Tesla’s top-selling vehicle model

  - Revealed seasonal trends in vehicle sales

  - Quantified customer satisfaction per model

  - Highlighted inventory pressure points

  - Discovered which vehicles incur the most service costs

  - Connected service frequency with customer ratings
