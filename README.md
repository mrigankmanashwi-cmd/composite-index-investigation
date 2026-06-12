# composite-index-investigation
# Composite Index Investigation

## Objective

Investigate how composite index ordering affects PostgreSQL query performance.

## Steps Performed

1. Created a PostgreSQL database.
2. Created the orders table.
3. Inserted 100,000 records.
4. Ran EXPLAIN ANALYZE without an index.
5. Created a composite index with one column order.
6. Tested query performance.
7. Created a composite index with the alternative column order.
8. Compared query plans and execution times.

## Files

* README.md
* Changes.md
* index_experiments.sql

## Concepts Covered

* PostgreSQL Indexing
* Composite Indexes
* EXPLAIN ANALYZE
* Bitmap Index Scan
* Sequential Scan
* Left-Most Prefix Rule
