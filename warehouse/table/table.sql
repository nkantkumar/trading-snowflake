-- Create schema
CREATE SCHEMA IF NOT EXISTS trading_app;

-- Create table for instruments (stocks, bonds, etc.)
CREATE TABLE IF NOT EXISTS trading_app.instruments (
  instrument_id INT AUTOINCREMENT PRIMARY KEY,
  symbol VARCHAR(20) NOT NULL,
  name VARCHAR(100) NOT NULL,
  instrument_type VARCHAR(50),       -- e.g., stock, bond, option
  exchange VARCHAR(50),
  currency VARCHAR(10),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create table for users/traders
CREATE TABLE IF NOT EXISTS trading_app.users (
  user_id INT AUTOINCREMENT PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  full_name VARCHAR(100),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create table for orders placed by users
CREATE TABLE IF NOT EXISTS trading_app.orders (
  order_id INT AUTOINCREMENT PRIMARY KEY,
  user_id INT NOT NULL REFERENCES trading_app.users(user_id),
  instrument_id INT NOT NULL REFERENCES trading_app.instruments(instrument_id),
  order_type VARCHAR(20),        -- buy, sell, limit, market
  quantity INT,
  price DECIMAL(18, 4),
  status VARCHAR(20),            -- pending, completed, cancelled
  order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create table for executed trades
CREATE TABLE IF NOT EXISTS trading_app.trades (
  trade_id INT AUTOINCREMENT PRIMARY KEY,
  order_id INT NOT NULL REFERENCES trading_app.orders(order_id),
  trade_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  quantity INT,
  price DECIMAL(18, 4)
);
