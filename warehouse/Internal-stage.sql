CREATE OR REPLACE STAGE my_user_stage
  FILE_FORMAT = (TYPE = 'CSV' FIELD_DELIMITER = ',' SKIP_HEADER = 1);
CREATE USER my_loader_user
  PASSWORD = 'SecurePassword123!'
  DEFAULT_ROLE = 'PUBLIC'
  MUST_CHANGE_PASSWORD = FALSE
  COMMENT = 'User for CSV staging and loading';

GRANT USAGE ON STAGE my_user_stage TO USER my_loader_user;
GRANT USAGE ON WAREHOUSE my_wh TO USER my_loader_user;
GRANT USAGE ON DATABASE my_db TO USER my_loader_user;
