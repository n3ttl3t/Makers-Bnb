require 'pg'

def setup_test_database
  p "Setting up database"

  connection = PG.connect(dbname: 'makers_bnb')

  connection.exec("TRUNCATE space;")
end
