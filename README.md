# 🏡 Scalable Data Pipeline for a Rental Platform

This project delivers a robust, scalable, and analytics-ready data infrastructure for a rental platform.  
It transforms fragmented datasets such as listings, bookings, customers, reviews, and external factors into clean, structured models that support high-quality business analysis.

The pipeline uses **Google Cloud Storage** for ingestion, **Snowflake** as the data warehouse, and **dbt** for all transformations and documentation.  
Final data marts enable insights into customer behavior, revenue trends, operational performance, and pricing strategies.

---

## 📌 Project Overview

This project covers the full data journey, from ingestion to curated data marts designed for business use cases.

- **Ingestion**: Raw data is uploaded to Google Cloud Storage and ingested into Snowflake.  
- **Transformation**: dbt is used to stage, model, test, and document data using a modular star schema approach.  
- **Output**: Clean and analysis-ready data marts power advanced analytics.

---

## 🛠️ Tech Stack

- **Google Cloud Storage** – Stores the initial raw data files  
- **Snowflake** – Cloud data warehouse used for storing, querying, and managing data efficiently  
- **dbt (Data Build Tool)** – Handles modeling, version control, documentation, and testing

---

## 📂 Data Sources

- **Listings** – Information about properties, including location, pricing, and availability  
- **Customers** – Customer details and unique identifiers for tracking repeat behavior  
- **Bookings** – Central fact table that records rental transactions, including dates and total price  
- **Reviews** – Customer feedback submitted after bookings  
- **Maintenance** – Reported issues and resolution times for listings  
- **Events** – External occurrences like festivals or holidays that may impact bookings  
- **Competitor Pricing** – Simulated data from similar listings in the market

![image](https://github.com/user-attachments/assets/db6133b7-b62a-465d-942a-ae8264b9de2b)

---

## 🔄 Data Pipeline Workflow

1. **Raw Data Ingestion**  
   Data is loaded from Google Cloud Storage into Snowflake as raw tables.

2. **Transformation with dbt**  
   All transformations are handled in dbt, including staging, snapshots, dimensional models, and data marts.

3. **Data Marts Creation**  
   Final tables are optimized for reporting and business intelligence.

![image](https://github.com/user-attachments/assets/d4daf4f8-57c2-4c7d-8944-0839dcbfc318)

---

## 📈 Data Marts

- **Revenue Analysis** – Monitors revenue trends by listing, time period, and customer segment  
- **Customer Segmentation** – Identifies patterns in guest demographics and booking behavior  
- **Operational Monitoring** – Tracks issue resolution times and service reliability  
- **Pricing Optimization** – Analyzes the impact of competitor pricing and local events on performance

![image](https://github.com/user-attachments/assets/a3bfadd8-fabf-4446-afee-812e40a75167)

---

## ✅ Testing & Documentation

- **Testing**  
  Data quality tests are applied at both the source and model level to ensure accuracy and consistency.

- **Documentation**  
  Each model is documented using dbt's built-in tools, with descriptions and tests included in `schema.yml`.

---

## 📚 Learn More

For a detailed explanation of the architecture, modeling strategy, and business insights, read the accompanying Medium article:

👉 [Read the full article here](https://medium.com/@timmy_tesla/building-a-scalable-data-pipeline-for-a-rental-platform-unlocking-actionable-insights-with-dbt-and-07916b27d9bc)


