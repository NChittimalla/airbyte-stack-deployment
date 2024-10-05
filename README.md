#   Modern Data Stack for Advanced Data Analytics

Please review the [ASSUMPTIONS.md](https://github.com/mthammus/modern_data_stack/blob/master/ASSUMPTIONS.md) file to ensure you meet the prerequisites before proceeding.

#   Summary
This repository contains the Docker Compose setup to quickly deploy a modern data stack. The stack includes various services like PostgreSQL, MongoDB, MinIO, Dagster, Dremio, Apache Superset, and Spark, among others. This setup is designed to support data orchestration, storage, and analytics, providing a comprehensive data infrastructure.

#   Stack Components and Capabilities
-   **Airbyte:** An open-source data integration platform that helps you to connect and synchronize data between various sources and destinations. It is capable of extracting data from APIs, databases, and other data sources and loading it into data warehouses, lakes, and other destinations.

-   **MinIO:** A high-performance, S3-compatible object storage service. MinIO can store large amounts of unstructured data, such as files, images, and backups.

-   **Nessie:** A transactional catalog for data lakes, providing version control for your data. Nessie allows you to track changes to your datasets over time, making it easy to manage data versions and support reproducibility.

-   **Dremio:** A data lake engine that enables fast and interactive queries on your data lake. It connects to various data sources, including MinIO, and provides a unified SQL interface for data analytics and BI tools.

-   **MongoDB:** A NoSQL database for storing and retrieving large volumes of unstructured or semi-structured data. MongoDB is used for applications requiring flexible schema designs and high scalability.

-   **Apache Superset:** An open-source data visualization and exploration platform. Superset connects to various data sources and allows users to create dashboards and visualizations to gain insights from their data.

-   **Apache Spark:** An open-source unified analytics engine for big data processing, with built-in modules for SQL, streaming, machine learning, and graph processing. PySpark is the Python API for Spark.

-   **DBT (Data Build Tool):** A tool for transforming data within your data warehouse. DBT allows you to write SQL transformations and manage them as software projects, enabling version control and automated testing of data transformations.

-   **PostgreSQL:** A powerful, open-source relational database management system. PostgreSQL is used for storing structured data and is often used as the primary database for transactional applications.

-   **Dagster:** An orchestrator for running data pipelines. Dagster manages the execution of tasks, ensuring that data workflows are executed reliably and efficiently.

#   Data Flow in the Stack

##  Data Ingestion with Airbyte:

-   Airbyte extracts data from various sources (e.g., APIs, databases) and loads it into destinations like PostgreSQL or directly into data lakes (e.g., MinIO).

##  Data Storage:

-   PostgreSQL: Stores structured transactional data.

-   MinIO: Stores large volumes of unstructured data and files.

-   MongoDB: Stores semi-structured and unstructured data.

##  Version Control with Nessie:

-   Nessie tracks changes to datasets stored in MinIO, providing version control and enabling reproducible data processing.

##  Data Processing with Spark:

-   Spark (PySpark) processes large datasets stored in MinIO, MongoDB, or PostgreSQL. Spark jobs can perform complex transformations, aggregations, and machine learning tasks.

##  Data Orchestration with Dagster:

-   Dagster schedules and orchestrates data workflows, ensuring tasks are executed in the correct order. It coordinates data ingestion, processing, and transformation tasks across the stack.

##  Data Transformation with DBT:

-   DBT transforms raw data in PostgreSQL (or other data warehouses) into cleaned, modeled datasets. These transformations are version-controlled and tested.

##  Data Querying with Dremio:

-   Dremio provides an SQL interface to query data stored in MinIO and other sources. It enables fast, interactive queries and connects to BI tools like Superset.

###  Data Visualization with Superset:

-   Superset connects to Dremio, PostgreSQL, and other data sources to create dashboards and visualizations. Users can explore and analyze data through an intuitive web interface.

#   Deployment Instructions for the Tech Stack

##   Clone the current repository 

-   git clone --depth=1 https://github.com/mthammus/modern_data_stack

-   cd modern_data_stack

##  Clone Airbyte from GitHub

-   git clone --depth=1 https://github.com/airbytehq/airbyte.git

##  Switch into Airbyte directory

-   cd airbyte

##  Start Airbyte

-   ./run-ab-platform.sh

-   nohup ./run-ab-platform.sh &    (This command runs in the background)

-   nohup ./run-ab-platform.sh > airbyte.log 2>&1 &     (This command runs in background and outputs to the log file)

##  In your browser, check if airbyte is launching

-   visit http://localhost:8000

-   Airbyte Username - airbyte 

-   Airbyte Password - password

#   Go back to the previous folder (modern_data_stack)

-   cd ..

#   Build and Start all the services

-   docker-compose up --build

#   DBT Tool Set-up

-   Be in the **Modern_data_Stack** directory

-   Run the below commands 
-   pip install dbt-dremio  (We are using dremio as the datalake engine, so installing the dremio dbt plugins)
-   dbt init fnbanalytics_warehouse     (This step is not necessary if you are cloning the above repository, as additional setup and configuration will be needed to set up the profiles.yml file. Since we are copying the existing profiles.yml and dbt_project.yml files, no further configuration is required.)
-   copy the **profiles.yml** in the **fnbanalytics_warehouse** and place it in the **/Users/USERNAME/.dbt/profiles.yml**
-   Go to the fnbanalytics_warehouse and run the models using dbt run commands

#   Super Set Initialization

-   docker exec -it superset superset init

-   Super set credentails - admin/admin

-   Super set configuration -   dremio+flight://USERNAME:PASSWORD@dremio:32010/?UseEncryption=false

#  Access the services:

-   pgAdmin:        http://localhost:8120

-   Airbyte:        http://localhost:8000

-   MinIO Console:  http://localhost:9001

-   Nessie:         http://localhost:19120/

-   Dremio:         http://localhost:9047

-   Superset:       http://localhost:8088

-   Spark Notebook: http://127.0.0.1:8888

-   Dagster:        http://localhost:3000

#   Shutdown the services

-   docker-compose down

#   Use the below commands to complete clean up the docker system

-   docker-compose down -v

-   docker network prune -f

-   docker volume prune -f

-   docker system prune -f

-   docker rmi -f $(docker images -aq)

#   Frequent git commands

-   git add .  

-   git commit -m "description of changes"

-   git remote add origin https://github.com/username/repository.git

-   git push -u origin master   

-   git push origin master   

-   git clone --depth=1 https://github.com/username/repository.git
