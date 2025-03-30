### Designing a Scalable Data Pipeline and Analytics Framework for a Rental Platform Using dbt and Snowflake

1. Executive Summary
In the rapidly growing short-term rental industry, data plays a critical role in driving strategic decisions, from optimizing pricing and maximizing occupancy to enhancing customer experience and streamlining operations. However, raw data sourced from various operational systems is often fragmented, inconsistent, and difficult to analyze in its original form.

This project focuses on building a reliable, scalable, and analytics-ready data infrastructure for a rental platform. The objective was to transform disparate datasets (such as property listings, bookings, customer activity, reviews, and external factors) into a clean and well-structured data model that supports high-quality business analysis.

Using data tools like Google Cloud Storage for ingestion, Snowflake for warehousing, and dbt for modeling and transformation, the project delivers a centralized analytics environment powered by a modular star schema. Final outputs include curated data marts designed to provide insights into customer behavior, revenue trends, operational performance, and pricing optimization.

This project emphasizes thoughtful architecture, rigorous testing, and documentation, all designed to ensure data trust, usability, and scalability for decision-makers across the business. The github repository can be found here.

2. Data Ingestion & Integration
2.1 Tooling
Google Cloud Storage served as the centralized location for initial data ingestion, from which raw data was imported into the pipeline.
Snowflake served as the central data warehouse.
dbt handled all modeling, transformation logic, documentation, testing, and version control.
2.2 Data Sources
The project used a combination of data covering:

Listings: The listings dataset serves as the foundational catalog of properties available on the rental platform. Each record represents a unique rental unit with key information about its characteristics, pricing, and availability. This table is essential for identifying the types of properties offered (e.g., apartments, private rooms), the nightly cost of each listing, and how often each property is available throughout the year.
Customers: This dataset captures profile-level information about guests who book properties. It provides insight into the demographic composition of users, including age groups and travel purposes. It also supports the derivation of behavioral traits such as loyalty levels or frequency of bookings.
Bookings: The bookings dataset is the central fact table of the data model, recording every rental transaction that occurs on the platform. It includes information such as the booking duration, total price, and links to the property and customer involved.
Reviews: This dataset contains post-booking feedback submitted by customers. It reflects the subjective experience of guests and provides a valuable source of qualitative insight into listing quality, host performance, and customer satisfaction.
Maintenance: The maintenance dataset tracks issues reported for listings and the time taken to resolve them. This data supports internal operations by offering visibility into the platform’s service quality and responsiveness.
Events: The events dataset captures external occurrences that may influence booking patterns, such as local festivals, concerts, or public holidays. These events are associated with bookings and carry an estimated impact score.
Competitor Pricing: This dataset simulates external market intelligence by providing average pricing data from competing listings in the same area.

![alt text](image.png)

