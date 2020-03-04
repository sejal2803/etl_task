ETL Starter Application
=======================

Rails application with just enough code to start AELOGICA's [ETL exercise](https://git.appexpress.io/open-source/etl-exercise).

### Prerequisites

- at least Ruby 2.3.1

### Instructions

1. Clone from https://git.appexpress.io/open-source/etl-starter-app.git
2. Fetch and checked out to branch task/nitinvupk
3. Run bundle install
4. Run rails db:setup
5. To extract, fetch and load data run :

   rake extract:data_by_csv_or_json 'data/csv/unit.csv'

   here 'data/csv/unit.csv' is the file name you can pass any from data folder of app as an argument.

6. Run the app by rails s and you can get the list of ETL data.




