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
end