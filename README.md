# Operational Cost Leakage & Audit Analytics Platform

## Executive Summary
This project simulates an enterprise billing environment and implements a SQL- and Python-driven audit framework to identify operational cost leakage, billing discrepancies, and vendor non-compliance. The analysis quantifies financial impact, highlights recurring failure patterns, and demonstrates how data analytics can support financial controls and operational efficiency.

## Business Problem
Large organizations rely on multiple third-party vendors to deliver critical services. Billing errors such as overcharges, post-termination invoicing, and contract rate violations can result in significant financial leakage if not proactively monitored. This project models how an analytics team can detect, quantify, and prioritize these risks using structured audit logic.

## Data Overview
The dataset represents a relational billing system consisting of:
- Vendors with contracted service rates
- Services with lifecycle status (active or disconnected)
- Monthly invoices spanning a 12-month period

Synthetic data was generated to realistically simulate enterprise-scale billing volume and common operational failure scenarios.

## Analytical Approach
- Designed a relational data model using SQLite
- Generated synthetic billing data with injected anomalies
- Developed SQL audit queries to detect:
  - Overbilling against contract rates
  - Charges billed after service disconnection
- Aggregated findings to quantify financial exposure
- Created vendor risk scores to prioritize remediation efforts
- Visualized cost leakage trends to support executive decision-making

## Key Findings
- Identified consistent overbilling across multiple vendors
- Detected post-disconnect charges indicating process breakdowns
- Ranked vendors by risk based on frequency and magnitude of billing violations
- Highlighted recurring monthly cost leakage trends

## Project Architecture
The project follows a modular structure separating data, logic, and analysis:

- `data/`: Raw and processed data outputs (CSV)
- `sql/`: Reusable SQL audit queries
- `notebooks/`: Python notebooks for data generation, analysis, and visualization

This structure mirrors real-world analytics workflows and supports scalability and collaboration.

## Tools Used
- SQL (SQLite)
- Python (pandas, matplotlib)
- Google Colab
- GitHub

## Next Steps
- Expand audit logic to include contract expiration and rate change violations
- Implement automated alerts for real-time anomaly detection
- Develop an interactive dashboard for executive reporting
