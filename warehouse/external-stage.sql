CREATE OR REPLACE STAGE my_ext_stage
  URL = 's3://my-bucket/path/'
  STORAGE_INTEGRATION = my_integration
  FILE_FORMAT = (TYPE = 'CSV' FIELD_DELIMITER = ',' SKIP_HEADER = 1);

CREATE OR REPLACE STORAGE INTEGRATION my_integration
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = 'S3'
  ENABLED = TRUE
  STORAGE_AWS_ROLE_ARN = '<aws_iam_role_arn>'
  STORAGE_ALLOWED_LOCATIONS = ('s3://my-bucket/path/');

  
CREATE USER my_data_user
  PASSWORD = 'StrongPassword!'
  DEFAULT_ROLE = 'PUBLIC'
  MUST_CHANGE_PASSWORD = FALSE;



GRANT USAGE ON STAGE my_ext_stage TO USER my_data_user;

GRANT USAGE ON WAREHOUSE my_wh TO USER my_data_user;
GRANT USAGE ON DATABASE my_db TO USER my_data_user;
GRANT USAGE ON SCHEMA my_db.public TO USER my_data_user;
