## Filtered Queries

1. **Null, Missing, and Valued Fields:**
   - **Null**: Represents a missing or undefined value.
   - **Missing**: Checks if a field is missing in a document.
   - **Valued**: Checks if a field has a value (not null or missing).

   ```sql
   -- Example query: Find documents where the 'email' field is null or missing
   SELECT * FROM `travel-sample` WHERE email IS NULL OR MISSING email;
   ```

   **Result Set**: This query will return documents where the 'email' field is either null or missing.

2. **Equality Operators (=, ==, !=, <>):**
   - **= or ==**: Checks if two expressions are equal.
   - **!= or <>**: Checks if two expressions are not equal.

   ```sql
   -- Example query: Find documents where the 'type' field is equal to 'hotel'
   SELECT * FROM `travel-sample` WHERE type = "hotel";
   ```

   **Result Set**: This query will return documents where the 'type' field is equal to 'hotel'.

3. **Greater Than and Less Than Operators:**
   - **Greater Than (>)/Less Than (<)**: Compares two expressions to determine if the first is greater than or less than the second.

   ```sql
   -- Example query: Find documents where the 'price' field is greater than 1000
   SELECT * FROM `travel-sample` WHERE price > 1000;
   ```

   **Result Set**: This query will return documents where the 'price' field is greater than 1000.

4. **Between Operator:**
   - **Between**: Checks if a value lies within a specified range.

   ```sql
   -- Example query: Find documents where the 'age' field is between 18 and 30
   SELECT * FROM `travel-sample` WHERE age BETWEEN 18 AND 30;
   ```

   **Result Set**: This query will return documents where the 'age' field is between 18 and 30.

5. **Multiple Where Clauses:**
   - **AND**: Combines multiple conditions, all of which must be true.

   ```sql
   -- Example query: Find hotels in New York City with a rating greater than 8
   SELECT * FROM `travel-sample` WHERE type = "hotel" AND city = "New York City" AND rating > 8;
   ```

   **Result Set**: This query will return hotel documents in New York City with a rating greater than 8.


6. **NOT Clause:**
   - **NOT**: Negates a condition.

   ```sql
   -- Example query: Find documents where the 'type' field is not equal to 'flight'
   SELECT * FROM `travel-sample` WHERE NOT type = "flight";
   ```

   **Result Set**: This query will return documents where the 'type' field is not equal to 'flight'.

7. **LET Clause:**
   - **LET**: Defines variables for use within a query.

   ```sql
   -- Example query: Calculate the total price for each document based on price and quantity
   SELECT *, LET total_price = price * quantity;
   ```

   **Result Set**: This query will return documents along with a newly defined variable `total_price`, which represents the multiplication of the `price` and `quantity` fields for each document.

## Filtered Queries with Nested structure

Certainly! Below are queries demonstrating various operations on nested structures and collections in Couchbase's N1QL query language:

1. **Arrays:**
   - Arrays are ordered collections of elements of the same or different types.
   
   ```sql
   -- Example query: Find documents where the 'amenities' array contains 'wifi'
   SELECT * FROM `travel-sample` WHERE ANY amenity IN amenities SATISFIES amenity = "wifi" END;
   ```

   **Result Set**: This query will return documents where the 'amenities' array contains the element 'wifi'.

2. **Working with Objects:**
   - Objects are collections of key-value pairs where each key is unique within the object.

   ```sql
   -- Example query: Retrieve the 'address' object for documents where the 'type' field is 'hotel'
   SELECT address FROM `travel-sample` WHERE type = "hotel";
   ```

   **Result Set**: This query will return the 'address' object for hotel documents.

3. **Arrays of Objects:**
   - Arrays of objects are collections where each element is an object.

   ```sql
   -- Example query: Find documents where the 'reviews' array contains at least one review with a rating greater than 4
   SELECT * FROM `travel-sample` WHERE ANY review IN reviews SATISFIES review.rating > 4 END;
   ```

   **Result Set**: This query will return documents where the 'reviews' array contains at least one review with a rating greater than 4.

4. **ANY Operator:**
   - The ANY operator checks if at least one element in an array satisfies a condition.

   ```sql
   -- Example query: Find documents where the 'amenities' array contains 'pool' or 'gym'
   SELECT * FROM `travel-sample` WHERE ANY amenity IN amenities SATISFIES amenity IN ["pool", "gym"] END;
   ```

   **Result Set**: This query will return documents where the 'amenities' array contains either 'pool' or 'gym'.

5. **Every Operator:**
   - The EVERY operator checks if all elements in an array satisfy a condition.

   ```sql
   -- Example query: Find documents where all elements in the 'amenities' array are of type 'string'
   SELECT * FROM `travel-sample` WHERE EVERY amenity IN amenities SATISFIES TYPE(amenity) = "string" END;
   ```

   **Result Set**: This query will return documents where all elements in the 'amenities' array are of type 'string'.

6. **First Operator:**
   - The FIRST operator retrieves the first element of an array.

   ```sql
   -- Example query: Retrieve the first element of the 'amenities' array for all documents
   SELECT ARRAY_FLATTEN([amenities[0]], 1) AS first_amenity FROM `travel-sample`;
   ```

   **Result Set**: This query will return the first element of the 'amenities' array for each document.

7. **Within Operator:**
   - The WITHIN operator checks if a value exists within a specified range.

   ```sql
   -- Example query: Find documents where the 'price' value is within the range of 100 and 200
   SELECT * FROM `travel-sample` WHERE price WITHIN 100 AND 200;
   ```

   **Result Set**: This query will return documents where the 'price' value falls within the range of 100 and 200.

8. **Array Slicing:**
   - Array slicing is used to retrieve a portion of an array.

   ```sql
   -- Example query: Retrieve the first 3 elements of the 'amenities' array for all documents
   SELECT ARRAY_SLICE(amenities, 0, 3) AS sliced_amenities FROM `travel-sample`;
   ```

   **Result Set**: This query will return the first 3 elements of the 'amenities' array for each document.

9. **Array Functions:**
   - Array functions provide various operations for manipulating arrays.

   ```sql
   -- Example query: Find documents where the number of elements in the 'amenities' array is greater than 5
   SELECT * FROM `travel-sample` WHERE ARRAY_LENGTH(amenities) > 5;
   ```

   **Result Set**: This query will return documents where the number of elements in the 'amenities' array is greater than 5.

These queries illustrate how to work with nested structures and collections in Couchbase's N1QL query language, providing powerful capabilities for querying and manipulating data.

