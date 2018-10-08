DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS merchants;


CREATE TABLE tags (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE merchants (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  time_added VARCHAR(255)
);

CREATE TABLE transactions (
  id SERIAL8 PRIMARY KEY,
  amount MONEY,
  merchant_id INT8 REFERENCES merchants(id) ON DELETE CASCADE,
  transaction_time VARCHAR(255),
  tag_id INT8 REFERENCES tags(id) ON DELETE CASCADE
);

CREATE TABLE users (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  email_address VARCHAR(255),
  transaction_id INT8 REFERENCES transactions(id) ON DELETE CASCADE
);
