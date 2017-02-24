require("rspec")
  require("pg")
  require("clients")
  require("barbers")

  DB = PG.connect({:dbname => "barbershop_test"})

  RSpec.configure do |config|
    config.after(:each) do
      DB.exec("DELETE FROM clients *;")
      DB.exec("DELETE FROM barbers *;")
    end
  end