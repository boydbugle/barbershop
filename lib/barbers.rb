class Barber
    attr_reader(:name, :id)
    define_method(:initialize)do |attributes|
        @name = attributes.fetch(:name)
        @id = attributes[:id] #notethischange
    end

    define_method(:save)do
      result = DB.exec("INSERT INTO barbers (name) VALUES ('#{@name}') RETURNING id;")
      @id = result.first().fetch("id").to_i()
   end

   define_singleton_method(:all) do
      returned_barbers = DB.exec("SELECT * FROM barbers;")
      barbers = []
      returned_barbers.each() do |barber|
        name = barber.fetch("name")
        id = barber.fetch("id").to_i()
        barbers.push(Barber.new({:name => name, :id => id}))
      end
      barbers
    end

    define_method(:==) do |other_barber|
      self.name().==(other_barber.name()).&(self.id().==(other_barber.id()))
    end

    define_singleton_method(:find) do |id|
      found_barber = nil
      Barber.all().each() do |barber|
        if barber.id().==(id)
          found_barber = barber
        end
      end
      found_barber
    end

    define_method(:clients) do
      list_clients = []
      clients = DB.exec("SELECT * FROM clients WHERE barbers_id = #{self.id()};")
      clients.each() do |client|
        name = client.fetch("name")
        barbers_id = client.fetch("barbers_id").to_i()
        cut_description = client.fetch("cut_description")
        booking_date = client.fetch("booking_date")
        list_clients.push(Client.new({:name => name, :barbers_id => barbers_id, :cut_description => cut_description, :booking_date => booking_date}))
      end
      list_clients
    end

    define_method(:update) do |attributes|
      @name = attributes.fetch(:name)
      @id = self.id()
      DB.exec("UPDATE barbers SET name = '#{@name}' WHERE id = #{self.id()};")
    end
    

    define_method(:delete) do
      DB.exec("DELETE FROM barbers WHERE id = #{self.id()};")
      DB.exec("DELETE FROM clients WHERE barbers_id = #{self.id()};")
  end
end