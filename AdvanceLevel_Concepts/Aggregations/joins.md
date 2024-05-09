# Couchbase Joins 

## Introduction

Couchbase is a distributed NoSQL database designed for high performance, scalability, and flexibility. When modeling data in Couchbase and querying it, it's important to understand how to structure your data to optimize performance and minimize the need for joins.

## Data Modeling Example: E-commerce Platform

Consider an e-commerce platform where users can browse products, add them to their cart, and place orders.

### User Document

```json
{
  "userId": "U001",
  "username": "john_doe",
  "email": "john@example.com",
  "cart": ["P001", "P002"]
}
```

### Product Document

```json
{
  "productId": "P001",
  "name": "Laptop",
  "price": 999.99,
  "stock": 10
}
```

### Order Document

```json
{
  "orderId": "O001",
  "userId": "U001",
  "products": [
    {"productId": "P001", "quantity": 1},
    {"productId": "P002", "quantity": 2}
  ],
  "totalAmount": 2399.97
}
```

## N1QL Queries and Joins

Let's explore different types of joins using N1QL queries.

### Inner Join

An inner join returns only the documents that have matching keys in both buckets.

```sql
SELECT u.username, o.orderId, p.name, p.price
FROM `user` AS u
JOIN `order` AS o ON KEYS u.userId
UNNEST o.products AS op
JOIN `product` AS p ON KEYS op.productId;
```

### Left Join

A left join returns all documents from the left bucket, and the matched documents from the right bucket. If there are no matches, it returns null values for the right bucket fields.

```sql
SELECT u.username, o.orderId, p.name, p.price
FROM `user` AS u
LEFT JOIN `order` AS o ON KEYS u.userId
UNNEST o.products AS op
LEFT JOIN `product` AS p ON KEYS op.productId;
```

### Right Join

A right join returns all documents from the right bucket, and the matched documents from the left bucket. If there are no matches, it returns null values for the left bucket fields.

```sql
SELECT u.username, o.orderId, p.name, p.price
FROM `user` AS u
RIGHT JOIN `order` AS o ON KEYS u.userId
UNNEST o.products AS op
RIGHT JOIN `product` AS p ON KEYS op.productId;
```

### Lookup Join

Lookup join allows joining documents in different scopes or buckets using a specified key.

```sql
SELECT u.username, o.orderId, p.name, p.price
FROM `user` AS u
JOIN `order` AS o ON KEYS u.userId
UNNEST o.products AS op
LOOKUP `product` AS p ON KEYS op.productId;
```

### Index Join

Index join leverages secondary indexes created on one or both buckets involved in the join operation to efficiently perform the join.

```sql
CREATE INDEX idx_product ON `product`(productId);
CREATE INDEX idx_order ON `order`(userId);
CREATE INDEX idx_user ON `user`(userId);

SELECT u.username, o.orderId, p.name, p.price
FROM `user` AS u
JOIN `order` AS o ON u.userId = o.userId
UNNEST o.products AS op
JOIN `product` AS p ON op.productId = p.productId;
```

### Hash Join

Hash join is an optimization technique used by Couchbase to perform joins efficiently by hashing join keys and partitioning data across multiple nodes.

```sql
SELECT u.username, o.orderId, p.name, p.price
FROM `user` AS u
JOIN `order` AS o ON HASH(u.userId) = HASH(o.userId)
UNNEST o.products AS op
JOIN `product` AS p ON HASH(op.productId) = HASH(p.productId);
```

### Join Using Array

Couchbase also supports joining documents using array elements, where documents contain arrays of keys that can be used for join operations.

```sql
SELECT u.username, o.orderId, p.name, p.price
FROM `user` AS u
JOIN `order` AS o ON ANY op IN o.products SATISFIES op.productId = u.userId END
UNNEST o.products AS op
JOIN `product` AS p ON op.productId = p.productId;
```

## Conclusion

By following these data modeling practices and leveraging Couchbase's features such as document denormalization, nested documents, key-value lookups, and N1QL queries with different types of joins, you can optimize performance and efficiently query your data without the need for complex join operations.
