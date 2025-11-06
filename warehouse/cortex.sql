CREATE OR REPLACE TABLE customer_reviews (
  review_id INT,
  review_text STRING
);

INSERT INTO customer_reviews VALUES
  (1, 'The product quality is excellent and delivery was prompt!'),
  (2, 'Not satisfied with the packaging.'),
  (3, 'Customer support was helpful and solved my issue quickly.');
