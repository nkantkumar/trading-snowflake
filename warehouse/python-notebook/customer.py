# Step 1: Set up variables
table_name = "CUSTOMER_DATA"
region_allowed = "APAC"

# Step 2: Build a SQL query using Python variable substitution
query = f"""
    SELECT *
    FROM {table_name}
    WHERE REGION = '{region_allowed}'
"""

# Step 3: Run the query (using Snowflake Notebooks/Snowpark session)
result_df = session.sql(query).to_pandas()

# Step 4: Display the result
print(result_df)
