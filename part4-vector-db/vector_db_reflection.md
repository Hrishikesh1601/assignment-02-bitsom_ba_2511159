##Vector DB Use Case

A normal keyword-based search is not enough for this kind of system. Keyword search only looks for exact words. So if a lawyer searches for something like "termination clauses", but the document uses different wording like "ending conditions of the contract", the system might not show the correct result. This can be a big problem when dealing with long and complex documents.

A vector database works differently. Instead of matching exact words, it understands the meaning of the text. It converts both the document and the user’s question into embeddings (basically numbers that represent meaning). Then it compares them to find the most relevant parts, even if the wording is different.

In this case, the 500-page contract can be broken into smaller sections and stored as embeddings in a vector database. When a lawyer asks a question in simple English, the system finds the sections that are closest in meaning and shows them as results.

So, a vector database makes the search smarter and more accurate. It helps users find what they are looking for quickly, even if they don’t use the exact words from the document.