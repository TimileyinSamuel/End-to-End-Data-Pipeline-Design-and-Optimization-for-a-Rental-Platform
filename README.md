🏡 Scalable Data Pipeline for a Rental Platform
This project delivers a robust, scalable, and analytics-ready data infrastructure for a rental platform. It transforms fragmented datasets—such as listings, bookings, customers, reviews, and external factors—into clean, structured models that support high-quality business analysis. The pipeline uses Google Cloud Storage for ingestion, Snowflake as the data warehouse, and dbt for all transformations and documentation. Final data marts enable insights into customer behavior, revenue trends, operational performance, and pricing strategies.

📌 Project Overview
This project covers the full data journey, from ingestion to curated data marts designed for business use cases.

Ingestion: Raw data is uploaded to Google Cloud Storage and ingested into Snowflake.

Transformation: dbt is used to stage, model, test, and document data using a modular star schema approach.

Output: Clean and analysis-ready data marts power advanced analytics.

<br>

🛠️ Tech Stack
Google Cloud Storage: Stores the initial raw data files.

Snowflake: Cloud data warehouse used for storing, querying, and managing data efficiently.

dbt (Data Build Tool): Handles modeling, version control, documentation, and testing.

📂 Data Sources
Listings: Contains information about properties, including location, pricing, and availability.

Customers: Captures customer details and unique identifiers for tracking repeat behavior.

Bookings: Central fact table that records rental transactions, including dates and total price.

Reviews: Collects customer feedback submitted after bookings.

Maintenance: Tracks reported issues and time to resolution for listings.

Events: Includes external occurrences like festivals or holidays that may impact bookings.

Competitor Pricing: Represents simulated data from similar listings in the market.

🔄 Data Pipeline Workflow
Raw Data Ingestion: Data is loaded from Google Cloud Storage into Snowflake as raw tables.

Transformation with dbt: All transformations are handled in dbt, including staging, snapshots, dimensional models, and data marts.

Data Marts Creation: Final tables are optimized for reporting and business intelligence.

📈 Data Marts
Revenue Analysis: Helps monitor revenue trends by listing, time period, and customer segment.

Customer Segmentation: Identifies patterns in guest demographics and booking behavior.

Operational Monitoring: Tracks issue resolution times and service reliability across listings.

Pricing Optimization: Analyzes how competitor pricing and local events impact performance.

✅ Testing & Documentation
Testing: Data quality tests are applied at both the source and model level to ensure accuracy and consistency.

Documentation: Each model is documented using dbt's built-in tools, with descriptions and tests included in schema.yml.

📚 Learn More
For a detailed explanation of the architecture, modeling strategy, and key insights, read the accompanying Medium article:

👉 Full link to article: https://medium.com/@timmy_tesla/building-a-scalable-data-pipeline-for-a-rental-platform-unlocking-actionable-insights-with-dbt-and-07916b27d9bc

