CREATE TABLE user_data (
  id INT,
  info VARIANT
);

INSERT INTO user_data VALUES
(1, PARSE_JSON('{"name": "Alice", "age": 30, "contacts": ["email", "phone"]}'));

SELECT id, info:name AS name, info:contacts[0] AS first_contact FROM user_data;

PUT file:///Users/nishi/Documents/GitHub/trading-snowflake/athena.jpeg @trading_stage/uploaded_files/;

