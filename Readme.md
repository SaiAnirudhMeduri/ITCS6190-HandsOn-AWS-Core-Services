# AWS Core Services Hands-On Assignment

## Overview
This assignment introduces how to use AWS core services to analyze a dataset. Amazon S3 is used as a cloud storage for any data that other AWS services such as Glue, CloudWatch, and Athena process and rely on. Amazon IAM controls the permissions between AWS services allowing services such as Glue to have access to the S3 bucket it wouldn't have had without IAM. AWS Glue examines the structure of data and determines column names, data types, and table names and creates a sort of schema for the dataset of this assignment that helps Athena interpret the CSV file. Amazon CloudWatch monitors AWS services and is used to verify if Glue runs properly for this assignment. Amazon Athena runs SQL on files stored in S3 and creates resulting CSV files that are stored in the processed-data folder inside AWS services.

## Approach
First, the dataset downloaded from Kaggle was uploaded into Amazon S3, then cataloged using AWS Glue, after which it was monitored using CloudWatch, and then finally it was queried using Amazon Athena. The SQL queries and their resulting CSV files are both stored in their queries and results folders respectively.

## Screenshots
<img width="1000" height="500" alt="Screenshot 2026-06-19 at 10 40 38 AM" src="https://github.com/user-attachments/assets/28f18dee-3b76-4891-9a01-5a00ed8dc780" />

<img width="1000" height="500" alt="Screenshot 2026-06-19 at 10 43 35 AM" src="https://github.com/user-attachments/assets/9fcf0095-50ae-4c5f-87b5-6aa8e288e614" />

<img width="1000" height="500" alt="Screenshot 2026-06-19 at 10 52 36 AM" src="https://github.com/user-attachments/assets/8937b81f-15f6-4e81-810c-db3b58218ee2" />

<img width="1000" height="500" alt="Screenshot 2026-06-19 at 11 01 19 AM" src="https://github.com/user-attachments/assets/8131b801-3840-4c9e-ba72-2c845427e2d9" />

> **Note:** Please refer to the initial project requirements in the [itcs6190_aws_core_services.pdf](https://github.com/ITCS6190-Summer2026/Hands-on-AWS-Core-Services/blob/main/itcs6190_aws_core_services.pdf) file before proceeding with the configurations below.

## AWS Core Services Assignment Guide

### 1. S3 Bucket Setup & Structure
* **Global Uniqueness:** S3 bucket names must be globally unique across all AWS accounts. Append a unique identifier, such as your student ID or initials (e.g., `itcs6190-raw-data-[yourinitials]`).
* **Recommended Structure:** Create either two separate buckets or one main bucket with two folders:
  * `raw-data/` -> Upload your downloaded Kaggle CSV here.
  * `processed-data/` -> Designate this for Athena query results.

### 2. IAM Role Configuration
To give your Glue Crawler permission to access your data, create an IAM Role with the following parameters:
* **Trusted Entity Type:** AWS Service
* **Service:** `Glue`
* **Permissions Policies to Attach:**
  * `AWSGlueServiceRole` (Provides basic crawler permissions)
  * `AmazonS3ReadOnlyAccess` (Allows the crawler to read data from your S3 bucket)

### 3. Glue Crawler Navigation (AWS Console)
Because the AWS Console UI updates frequently, use the search bar at the top of the AWS Console to find **AWS Glue**:
1. In the left sidebar, click on **Crawlers** under the *Data Catalog* section.
2. Click **Create crawler**.
3. Name your crawler and specify the S3 path to your `raw-data/` folder as the data store.
4. Assign the IAM role created in the previous step.
5. Configure the output to point to a database (create a new database if you don't have one yet).
