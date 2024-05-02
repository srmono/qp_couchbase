1. **Logical Processing Order:**
   - **FROM**: The table or tables from which to retrieve data.
   - **WHERE**: Filters rows based on specified conditions.
   - **GROUP BY**: Groups rows sharing a property into summary rows.
   - **HAVING**: Filters grouped rows based on specified conditions.
   - **SELECT**: Specifies the columns to be included in the result set and may contain expressions, aggregate functions, or aliases.
   - **ORDER BY**: Sorts the rows of the result set based on specified criteria.
   - **LIMIT/OFFSET**: Limits the number of rows returned or skips a specified number of rows.

2. **Using Aliases:**
   - Aliases defined in the SELECT clause are typically not available in the WHERE or HAVING clauses because the WHERE and HAVING clauses are logically processed before the SELECT clause.
   - However, aliases defined in the SELECT clause can be used in the ORDER BY and GROUP BY clauses because they are logically processed after the SELECT clause.

3. **Examples:**
   - Here's an example to illustrate:

   ```sql
   SELECT age * 2 AS double_age
   FROM employees
   WHERE double_age > 30
   ```

   This query will result in an error because `double_age` is an alias defined in the SELECT clause and not available in the WHERE clause. Instead, you should repeat the expression:

   ```sql
   SELECT age * 2 AS double_age
   FROM employees
   WHERE age * 2 > 30
   ```

   - However, you can use the alias in the ORDER BY or GROUP BY clauses:

   ```sql
   SELECT age * 2 AS double_age
   FROM employees
   GROUP BY double_age
   ORDER BY double_age
   ```

   This is because the logical processing order allows aliases defined in the SELECT clause to be available in the GROUP BY and ORDER BY clauses.

Understanding the logical processing order of SQL queries can help you write queries more effectively and avoid errors related to alias usage.