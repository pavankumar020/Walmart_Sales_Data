# Walmart_Sales_Data

This repository contains a project aimed at analyzing Walmart sales data using MySQL. The goal is to provide insights into sales trends, customer behavior, and other key metrics that can help Walmart improve its business strategies. This README will guide you through the dataset, the SQL queries used, and the insights derived from the analysis.

# Introduction

Walmart is one of the largest retail corporations in the world. Analyzing its sales data can uncover valuable insights into consumer behavior, sales performance, and market trends. This project utilizes MySQL to store, manage, and analyze Walmart sales data, providing a foundation for data-driven decision-making.

# Dataset
The dataset used in this project includes detailed sales data from Walmart, which contains the following information:

Invoice ID: Unique identifier for each transaction.
Branch: The branch where the transaction occurred.
City: The city where the branch is located.
Customer type: Indicates whether the customer is a member or a normal customer.
Gender: Gender of the customer.
Product line: Category of the product sold.
Unit price: Price per unit of the product.
Quantity: Number of units sold.
Tax 5%: Tax amount applied to the transaction.
Total: Total amount including tax.
Date: Date of the transaction.
Time: Time of the transaction.
Payment: Payment method used.
cogs: Cost of goods sold.
gross margin percentage: Gross margin percentage for the transaction.
gross income: Gross income from the transaction.
Rating: Customer rating for the transaction.


# Database Schema
The database schema consists of a single table named walmart_sales, which is structured as follows:

CREATE TABLE walmart_sales (
    
    invoice_id VARCHAR(20) PRIMARY KEY,
    
    branch CHAR(1),
   
    city VARCHAR(50),
    customer_type VARCHAR(20),
    gender VARCHAR(10),
    product_line VARCHAR(50),
    unit_price DECIMAL(10, 2),
    quantity INT,
    tax_5 DECIMAL(10, 2),
    total DECIMAL(10, 2),
    date DATE,
    time TIME,
    payment VARCHAR(20),
    cogs DECIMAL(10, 2),
    gross_margin_percentage DECIMAL(5, 2),
    gross_income DECIMAL(10, 2),
    rating DECIMAL(3, 1)
);
