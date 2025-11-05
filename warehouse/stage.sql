


CREATE STAGE trading_stage;

DESC STAGE trading_stage;

SELECT *
FROM snowflake.information_schema.stages
WHERE stage_name = 'trading_stage';