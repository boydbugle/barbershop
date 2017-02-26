require("spec_helper")

  describe('Client') do
    describe('#name') do
        it("lets you read the name out") do
            test_client = Client.new({:name => "Ice Cube", :barbers_id => 1, :cut_description => "box cut with  comb and scissors", :booking_date => "02/08/2017"})
            expect(test_client.name()).to(eq("Ice Cube"))
        end
    end

    describe("#barbers_id") do
      it("lets you read the barber ID out") do
        test_client = Client.new({:name => "Git punk", :barbers_id => 1, :cut_description => "box cut with  comb and scissors", :booking_date => "02/08/2017"})
        expect(test_client.barbers_id()).to(eq(1))
      end
    end

    describe('#cut_description') do
        it("lets you read the clients cut_description") do
            test_client = Client.new({:name => "Ice Cube", :barbers_id => 1, :cut_description => "box cut with  comb and scissors", :booking_date => "02/08/2017"})
            expect(test_client.cut_description()).to(eq("box cut with  comb and scissors"))
        end
    end

    describe('#booking_date') do
        it("lets you read the clients booking_date") do
            test_client = Client.new({:name => "Ice Cube", :barbers_id => 1, :cut_description => "box cut with  comb and scissors", :booking_date => "02/08/2017"})
            expect(test_client.booking_date()).to(eq("02/08/2017"))
        end
    end

    describe("#==") do
      it("is the same client if they have the same name") do
            client1= Client.new({:name => "Piggy Bank", :barbers_id => 1, :cut_description => "box cut with  comb and scissors", :booking_date => "02/08/2017"})
            client2 = Client.new({:name => "Piggy Bank", :barbers_id => 1, :cut_description => "box cut with  comb and scissors", :booking_date => "02/08/2017"})
            expect(client1).to(eq(client2))
        end
    end
    
    describe('.all') do
    it("is empty at first") do
      expect(Client.all()).to(eq([]))
    end
  end

    describe("#save") do
      it("adds a client to the array of saved clients") do
        test_client = Client.new({:name => "Ember Geek", :barbers_id => 1, :cut_description => "box cut with  comb and scissors", :booking_date => "02/08/2017"})
        test_client.save()
        expect(Client.all()).to(eq([test_client]))
      end
    end 
  end