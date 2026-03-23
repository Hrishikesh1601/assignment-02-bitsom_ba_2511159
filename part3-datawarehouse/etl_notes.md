##ETL Decisions

##Decision 1 — Fixing Date Formats
Problem: The dates in the dataset were not consistent. Some were like 01-01-2024 and others were 2024/01/01, which can create issues while storing or querying data.
Resolution: I converted all dates into a single format (YYYY-MM-DD) so that the database can handle them properly and queries work correctly.

##Decision 2 — Fixing Category Names
Problem: Product categories were written in different ways like electronics, Electronics, and ELECTRONICS. This can cause wrong grouping in reports.
Resolution: I standardized all category names into proper format (Electronics, Clothing, Groceries) so that similar data is grouped correctly.

##Decision 3 — Handling Missing Data
Problem: Some rows had missing (NULL) values, which can cause errors or incorrect analysis.
Resolution: I either removed those records or filled them with suitable default values to make sure the data remains usable and consistent.