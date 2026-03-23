##Anomaly Analysis:

##Insert Anomaly
Insert anomaly happens when we cannot add new information into the table without adding other unnecessary data. From the file, product details are stored together with order information. Because of this, we cannot add a new product unless there is an order for that product. For example, if the company wants to add a new product to the catalog but no customer has ordered it yet, the system cannot store that product in the table. This makes it difficult to manage products independently.

##Update Anomaly
Update anomaly occurs when the same information is repeated in many rows and needs to be updated in multiple places.From flat file, sales representative information like name and office address appears in many rows because every order stores this information again. If the office address of a sales representative changes, we need to update it in every row where it appears. If some rows are updated and others are not, the database will have inconsistent data.

##Delete Anomaly
Delete anomaly happens when deleting one record also removes other important information. In the flat table, product information is stored only inside order records. If an order is deleted and that product appears only in that order, all information about that product will also be deleted from the table. This means the system will lose the record of that product even though it still exists in the catalog.

##Normalization:
At first it might look convenient to store everything in a single table, but it quickly becomes difficult to manage.
For example, product details like name and price get repeated in multiple rows. If the price changes, you have to update it everywhere. Missing even one row can create inconsistencies, which may lead to incorrect reports or decisions.
The same problem applies to customer and sales representative information. If a customer updates their email, it has to be changed in every row where it appears. This increases the chances of partial updates and data errors.
There are also issues when inserting or deleting data. You can’t add a new product or sales rep on its own without creating a dummy order, which doesn’t make sense. And deleting an order might remove the only record of a product or customer.
This is where normalization helps. By separating the data into tables like Customers, Products, Orders, and Sales Representatives, each piece of information is stored only once. This reduces duplication, keeps data consistent, and makes updates much easier.
So, normalization isn’t over-engineering—it’s simply a better and more reliable way to design a database.