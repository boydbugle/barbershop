class Client 
    attr_reader(:name , :barbers_id, :cut_description, :booking_date)

   define_method(:initialize) do |attributes|
      @name = attributes.fetch(:name)
      @barbers_id = attributes.fetch(:barbers_id)
      @cut_description = attributes.fetch(:cut_description)
      @booking_date = attributes.fetch(:booking_date)
    end

    define_method(:==) do |other_client|
      self.name().==(other_client.name()).&(self.barbers_id().==(other_client.barbers_id()))
    end
    
    define_singleton_method(:all) do
      returned_clients = DB.exec("SELECT * FROM clients;")
      clients = []
      returned_clients.each() do |client|
        name = client.fetch("name")
        barbers_id = client.fetch("barbers_id").to_i() #returns info from db as a string
        cut_description = client.fetch("cut_description")
        booking_date = client.fetch("booking_date")
        clients.push(Client.new({:name => name, :barbers_id => barbers_id, :cut_description => cut_description, :booking_date => booking_date}))
      end
      clients
    end

    define_method(:save)do
        DB.exec("INSERT INTO clients (name, barbers_id,cut_description, booking_date) VALUES ('#{@name}', #{@barbers_id}, '#{@cut_description}', '#{@booking_date}');")
    end
end
    