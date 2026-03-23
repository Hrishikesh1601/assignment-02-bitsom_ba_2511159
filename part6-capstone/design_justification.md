## Storage Systems:

In this architecture, different types of storage are used based on the kind of data and how it will be used. For day-to-day hospital operations, a relational database like PostgreSQL is used. This handles real-time data such as patient records, billing, and updates, and allows doctors to quickly access information without delay.
For storing large and diverse data like ICU device streams, doctor notes, and medical images, a data lake such as AWS S3 is used. This is useful because it can store structured and unstructured data at a lower cost and scale easily as the hospital grows.
For reporting and analytics, a data warehouse like Snowflake or BigQuery is used. This system stores cleaned and structured data, making it easier to generate reports like bed occupancy and department-wise costs efficiently.
To handle real-time ICU data, a streaming tool like Kafka is used. It helps capture continuous data from monitoring devices and allows quick processing so alerts can be generated when needed.
OLTP vs OLAP Boundary
The OLTP system is where all the daily hospital operations happen. This includes things like patient admissions, updates, and billing. These systems are designed for fast transactions and are used directly by hospital staff.
The OLAP system comes into play when this data is moved for analysis. Data from OLTP systems is sent to the data lake and data warehouse using ETL or streaming pipelines. Once there, it is processed and used for reporting, analytics, and machine learning.
So, the boundary between OLTP and OLAP is basically where data moves from operational systems into analytical systems through ingestion pipelines.
Trade-offs
One major trade-off in this design is between real-time processing and system complexity. Supporting both streaming data (like ICU vitals) and batch processing (like monthly reports) makes the system more complex to manage.
To handle this, a Lakehouse approach (like using Databricks) can be used. It combines the benefits of both data lakes and data warehouses, reducing duplication and simplifying the architecture. Also, using managed services like AWS Glue and managed Kafka can reduce maintenance effort and make the system more reliable.