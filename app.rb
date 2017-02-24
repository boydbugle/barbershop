require("sinatra")
  require("sinatra/reloader")
  also_reload("lib/**/*.rb")
  require("./lib/barbers")
  require("./lib/clients")
  require("pg")


  DB = PG.connect({:dbname => "barbershop"})