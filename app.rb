require("sinatra")
  require("sinatra/reloader")
  also_reload("lib/**/*.rb")
  require("./lib/barbers")
  require("./lib/clients")
  require("pg")


  DB = PG.connect({:dbname => "barbershop"})

  get('/')do
    erb(:index)
  end

  get("/barber/new") do
    erb(:newbarber_form)
  end

  post("/barbers") do
    name = params.fetch("name")
    test_barber = Barber.new({:name => name, :id => nil})
    test_barber.save()
    erb(:success)
   end
  
  get('/barbers') do
    @barbers = Barber.all()
    erb(:barbers)
  end

  get("/barbers/:id") do
    @barber = Barber.find(params.fetch("id").to_i())
    erb(:barber)
  end
  