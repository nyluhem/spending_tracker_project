# Spending Tracker

For this solo project, I designed a web app that would allow a user to keep track of their spending habits. This project was completed in four days using Ruby with Sinatra, whilst also using PostgreSQL for databases and HTML/CSS for the front-end design.

### To run the app:

* Change into the app directory of this project.
* In the terminal, run the following commands to create the database and run the Ruby code:
  1.  psql -d spending_tracker -f db/spending.sql
  2. ruby db/seeds.rb, then exit Pry.
  3. ruby app.rb (keep this running whilst using the app)
* To view the app in the browser, head to: http://localhost:4567/
* To kill the server once you have finished, hit Ctrl+C in the terminal, on the tab where app.rb is running.

### Project Brief:

Build an app that allows a user to track their spending.

#### MVP
* The app should allow the user to create, edit and delete merchants, e.g. Tesco, Amazon, ScotRail
* The app should allow the user to create, edit and delete tags for their spending, e.g. groceries, entertainment, transport
* The user should be able to assign tags and merchants to a transaction, as well as an amount spent on each transaction.
* The app should display all the transactions a user has made in a single view, with each transaction's amount, merchant and tag, and a total for all transactions.

#### Possible Extensions
* Transactions should have a timestamp, and the user should be able to view transactions sorted by the time they took place.
* The user should be able to supply a budget, and the app should alert the user somehow when when they are nearing this budget or have gone over it.
* The user should be able to filter their view of transactions, for example, to view all transactions in a given month, or view all spending on groceries.
