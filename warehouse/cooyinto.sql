COPY INTO @my_s3_stage/sales_apac.csv
FROM (
  SELECT order_id, total, to_date(order_date) as order_date
  FROM sales
  WHERE region = 'APAC'
)
FILE_FORMAT = (TYPE='CSV', HEADER=TRUE);
