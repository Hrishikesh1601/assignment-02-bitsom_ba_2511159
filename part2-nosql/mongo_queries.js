// OP1: insertMany() — insert all 3 documents from sample_documents.json

db.products.insertMany([
{
product_id: "ELEC001",
name: "Samsung 55 inch Smart TV",
category: "Electronics",
price: 45000
},
{
product_id: "CLOT001",
name: "Men Cotton Shirt",
category: "Clothing",
price: 1500
},
{
product_id: "GROC001",
name: "Organic Almonds",
category: "Groceries",
price: 800,
expiry_date: "2024-12-01"
}
])

// OP2: find() — retrieve all Electronics products with price > 20000

db.products.find({
category: "Electronics",
price: { $gt: 20000 }
})


// OP3: find() — retrieve all Groceries expiring before 2025-01-01

db.products.find({
category: "Groceries",
expiry_date: { $lt: "2025-01-01" }
})


// OP4: updateOne() — add discount_percent field

db.products.updateOne(
{ product_id: "ELEC001" },
{ $set: { discount_percent: 10 } }
)


// OP5: createIndex() — create index on category field

db.products.createIndex({ category: 1 })