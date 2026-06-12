# Composite Index Investigation

## Query Tested

```sql
SELECT *
FROM orders
WHERE customer_id = 100
AND status = 'completed';
```

## Initial Analysis

Without an index, PostgreSQL performed a Sequential Scan.

Execution Time: 14.378 ms

Rows Removed by Filter: 99949

This means PostgreSQL scanned almost the entire table.

## Incorrect Index Experiment

```sql
CREATE INDEX idx_wrong
ON orders(status, customer_id);
```

Result:

* Bitmap Index Scan
* Execution Time: 0.270 ms

## Corrected Index

```sql
CREATE INDEX idx_correct
ON orders(customer_id, status);
```

Result:

* Bitmap Index Scan
* Execution Time: 0.284 ms

## Left-Most Prefix Rule

For a composite index:

(customer_id, status)

PostgreSQL can efficiently use:

* WHERE customer_id = 100
* WHERE customer_id = 100 AND status = 'completed'

The database starts searching from the left-most indexed column.

## Conclusion

Without indexes, PostgreSQL scanned the entire table.

Both composite indexes significantly improved performance because both columns were filtered using equality conditions.

The corrected index follows common indexing best practices and aligns with the query's filtering pattern.
