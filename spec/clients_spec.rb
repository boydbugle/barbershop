require("spec_helper")

  describe('Client') do
    describe('#name') do
        it("lets you read the name out") do
            test_client = Client.new({:name => "Ice Cube", :barbers_id => 1})
            expect(test_client.name()).to(eq("Ice Cube"))
        end
    end

    describe("#barbers_id") do
      it("lets you read the barber ID out") do
        test_client = Client.new({:name => "Git punk", :barbers_id => 1})
        expect(test_client.barbers_id()).to(eq(1))
      end
    end

    describe("#==") do
      it("is the same client if they have the same name") do
            client1= Client.new({:name => "Piggy Bank", :barbers_id => 1})
            client2 = Client.new({:name => "Piggy Bank", :barbers_id => 1})
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
        test_client = Client.new({:name => "Ember Geek", :barbers_id => 1})
        test_client.save()
        expect(Client.all()).to(eq([test_client]))
      end
    end 
  end