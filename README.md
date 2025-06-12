## Overview

An end-to-end data engineering pipeline for Australian bushfire satellite data (2019–2020), built with Snowflake and dbt.
The project transforms raw MODIS and VIIRS (satellite types) fire detection data into business friendly models (Bronze -> Silver -> Gold), for analysis and visualization.

The pipeline was designed using an ELT (Extract -> Load -> Transform) pattern and follows modern data engineering practices.


## Architecture



## Steps Taken

1. Data copied from S3 bucket and loaded into Snowflake BRONZE raw tables

2. dbt staging models created by cleaning column names and adding metadata columns (source_type, satellite_type)

3. Unified fact table fire_detections_cleaned built in dbt CORE layer

4. Business friendly aggregated models built in dbt MARTS layer:
    - fires_by_date_source_satellite
    - fires_by_daynight
    - fires_by_confidence_level

5. dbt Docs generated such as lineage graph and model documentation

6. (todo) visualization in BI tools (Tableau, Power BI)


## Data Lineage (via dbt)

This project is documented with dbt Docs with a auto-generated lineage graph.

Example Lineage:

[![Lineage-Graph.png](https://i.postimg.cc/D0xyWSr4/Lineage-Graph.png)](https://postimg.cc/YLmwZqyt)


## Dataset

The dataset tracks fire detections in Australia during the 2019–2020 bushfire season.
Data is sourced from NASA MODIS and VIIRS satellites, Near Real-Time (NRT) and Archive versions.
The dataset is published on Kaggle (https://www.kaggle.com/datasets/nagarajbhat/australian-bush-fire-satellite-data-nasa) and contains:

-   MODIS Archive (calibrated historical detections)
-   VIIRS Archive (calibrated historical detections)
-   MODIS NRT (near real-time detections (fast, less calibrated))
-   VIIRS NRT (near real-time detections)


### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
