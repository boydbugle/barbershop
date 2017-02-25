require("sinatra")
  require("sinatra/reloader")
  also_reload("lib/**/*.rb")
  require("./lib/barbers")
  require("./lib/clients")
  require("pg")


  DB = PG.connect({:dbname => "barbershop"})

  get('/')do
  @barbers = Barber.all()
    erb(:index)
  end

  # get("/barber/new") do
  #   erb(:newbarber_form)
  # end

  post("/barbers") do
    name = params.fetch("det")
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
  
  post("/clients") do
    name = params.fetch("name")
    barbers_id = params.fetch("barbers_id").to_i()
    @barber = Barber.find(barbers_id)
    @client = Client.new({:name => name, :barbers_id => barbers_id})
    @client.save()
    erb(:success)
  end

  get("/barbers/:id/edit") do
    @barber = Barber.find(params.fetch("id").to_i())
    erb(:barber_edit)
  end

  patch("/barbers/:id") do
    name = params.fetch("name")
    @barber = Barber.find(params.fetch("id").to_i())
    @barber.update({:name => name})
    erb(:barber)
  end
  
  delete("/barbers/:id") do
    @barber = Barber.find(params.fetch("id").to_i())
    @barber.delete()
    @barbers = Barber.all()
    erb(:index)
  end