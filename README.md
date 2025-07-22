# 🚗 SQL Portfolio Project: Analyzing Operational Challenges at Tesla Motors

![tesla](https://github.com/user-attachments/assets/ba159cda-168d-47af-a3b7-bbb433ea7f35)


## 📘 About the Project

In this **SQL-driven data analysis project**, I explored key operational challenges and business opportunities within **Tesla Motors** using structured data from five major domains: **Sales, Inventory, Customer Feedback, Service Records**, and **Vehicles**.

The goal was to turn raw business data into **actionable insights** that help Tesla’s leadership make **smarter, data-backed decisions**.

### 👨‍💻 Skills Demonstrated

- Multi-domain business analysis (Sales, Feedback, Inventory, Service)
- Writing optimized SQL queries in SQL Server
- Identifying trends, correlations, and bottlenecks
- Translating technical findings into business strategy

---

## ❓ Problem Statement

Tesla operates in a fast-paced, competitive auto-tech environment. Efficiently managing **sales**, **inventory**, **customer sentiment**, and **after-sales service** is vital to remain competitive.

Without proper data analysis, Tesla risks:

- Overlooking key sales patterns and seasonal trends  
- Letting customer dissatisfaction go unresolved  
- Mismanaging vehicle inventory leading to stockouts  
- Escalating service costs with no strategic response

---

## ✅ Business Problems Solved with SQL

### 🔥 Sales Performance
- Identified **top-selling vehicle models**
- Revealed **seasonal sales patterns** for forecasting

### 🧠 Customer Feedback
- Calculated **average ratings per model**
- Extracted **themes from customer comments**
- Determined **feedback participation rates**

### 📦 Inventory Management
- Analyzed **inventory levels** by vehicle model
- Examined **correlation between inventory and sales**

### 🛠️ Service Records
- Found **most common service issues**
- Identified **high-maintenance vehicle models**
- Assessed how **service frequency affects satisfaction**

---

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


## 💡 Key Insights & Recommendations

### 🔥 Sales Trends
- **Insight**: Model X had the highest sales volume over the past year  
  **Recommendation**: Prioritize production and advertising for Model X

- **Insight**: Q2 and Q4 show peak seasonal demand  
  **Recommendation**: Align promotional campaigns and inventory stocking with these periods

---

### 🧠 Customer Feedback
- **Insight**: Average ratings differ significantly across models  
  **Recommendation**: Improve after-sales support for lower-rated models

- **Insight**: Text feedback indicates issues with **charging stations** and **service delays**  
  **Recommendation**: Apply **NLP techniques** to extract feedback themes at scale, and invest in station infrastructure

---

### 📦 Inventory Challenges
- **Insight**: High-demand vehicles often have low stock levels  
  **Recommendation**: Adjust production schedules to match model-specific sales patterns

- **Insight**: Inventory mismatch across geographic locations  
  **Recommendation**: Improve location-based demand forecasting using historical sales

---

### 🛠️ Service Operations
- **Insight**: Frequent service issues include **battery problems** and **software bugs**  
  **Recommendation**: Enhance predictive maintenance and push over-the-air (OTA) software updates

- **Insight**: High service frequency is linked to **lower customer satisfaction**  
  **Recommendation**: Audit high-service-frequency models to identify design flaws or recurring issues

---

## 🛠️ Tools & Technologies Used

| Tool        | Purpose                                       |
|-------------|-----------------------------------------------|
| **SQL Server** | Data querying, joining, and aggregations      |
| **T-SQL**      | Advanced grouping, filtering, and time logic |
| **Excel**      | Initial data validation and summaries         |
| **PowerPoint** | Business report and presentation visuals      |
| *(Optional)* Power BI | Future integration for dashboards     |

---

## 🧩 Challenges Faced

- **Complex Joins**: Multiple tables and relationships required optimized joins  
- **Text Feedback**: Manual review of customer comments, future scope for automation with Python NLP  
- **Service Data**: Inconsistent service descriptions needed cleaning and categorization  
- **Missing Data**: Nulls and incomplete records were handled using filters and `LEFT JOIN` logic

---

## 📌 Conclusion

This project offers **deep operational insights** into Tesla’s core business areas. Using structured SQL logic, I transformed raw transactional data into a **strategic decision-making tool**.

✅ An excellent portfolio project to showcase:

- **Relational database querying**
- **Operational and business insight extraction**
- **SQL-based problem solving**
- **Real-world data interpretation**

---

🔗 *Ideal for Data Analyst, BI Developer, and Data Science roles seeking candidates with business acumen and SQL expertise.*

