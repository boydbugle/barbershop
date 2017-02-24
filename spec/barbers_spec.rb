require("spec_helper")

  describe('Barber')do

  describe(".all") do
      it("starts off with no barbers") do
        expect(Barber.all()).to(eq([]))
      end
    end

   describe("#name") do
      it("tells you barber's name") do
        test_barber = Barber.new({:name => "Comb master", :id => nil})
        expect(test_barber.name()).to(eq("Comb master"))
      end
    end

    describe("#id") do
      it("sets id when you save it") do
        test_barber = Barber.new({:name => "Comb master", :id => nil})
        test_barber.save()
        expect(test_barber.id()).to(be_an_instance_of(Fixnum))
      end
    end

    describe("#save") do
      it("lets you save barbers to the database") do
        test_barber = Barber.new({:name => "Comb master", :id => nil})
        test_barber.save()
        expect(Barber.all()).to(eq([test_barber]))
      end
    end

    describe("#==") do
      it("is the same barber if has the same name") do
        barber1 = Barber.new({:name => "Cease cuts", :id => nil})
        barber2 = Barber.new({:name => "Cease cuts", :id => nil})
        expect(barber1).to(eq(barber2))
      end
    end

     describe(".find") do
      it("returns a barber by his ID") do
        test_barber = Barber.new({:name => "Kunyoa upara", :id => nil})
        test_barber.save()
        test_barber2 = Barber.new({:name => "This manenos", :id => nil})
        test_barber2.save()
        expect(Barber.find(test_barber2.id())).to(eq(test_barber2))
      end
    end

    describe("#clients") do
      it("returns an array of clients for that barber") do
        test_barber = Barber.new({:name => "Epicodus stuff", :id => nil})
        test_barber.save()
        test_client = Client.new({:name => "Learn SQL", :barbers_id => test_barber.id()})
        test_client.save()
        test_client2 = Client.new({:name => "Review Ruby", :barbers_id => test_barber.id()})
        test_client2.save()
        expect(test_barber.clients()).to(eq([test_client, test_client2]))
      end
    end
  end