DROP TABLE IF EXISTS budgets;
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS merchants;
DROP TABLE IF EXISTS tags;


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
  description VARCHAR(255),
  merchant_id INT8 REFERENCES merchants(id) ON DELETE CASCADE,
  transaction_time VARCHAR(255),
  tag_id INT8 REFERENCES tags(id) ON DELETE CASCADE
);

CREATE TABLE budgets (
  id SERIAL8 PRIMARY KEY,
  tag_id INT8 REFERENCES tags(id) ON DELETE CASCADE,
  budget_limit MONEY,
  budget_cushion MONEY
);
