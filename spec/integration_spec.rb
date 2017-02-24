require('capybara/rspec')
  require('./app')
  Capybara.app = Sinatra::Application
  set(:show_exceptions, false)

  describe('adding a new barber', {:type => :feature}) do
    it('allows a user to click a link to add barbers to listed') do
      visit('/')
      click_link('Add New barber')
      fill_in('name', :with =>'Goodie Goody')
      click_button('Add barber')
      expect(page).to have_content('Success!')
    end
  end

  describe('viewing all of the barbers', {:type => :feature}) do
    it('allows a user to see all of the lists that have been created') do
      test_barber = Barber.new({:name => 'Yule Msee'})
      test_barber.save()
      visit('/')
      click_link('View All barbers')
      expect(page).to have_content(test_barber.name)
    end
  end

  describe('seeing clients for a single barber', {:type => :feature}) do
    it('allows a user to click a barber to see the clients and details on him') do
      test_barber = Barber.new({:name => 'Yule Msee'})
      test_barber.save()
      test_client = Client.new({:name => "John doe", :barbers_id => test_barber.id()})
      test_client.save()
      visit('/barbers')
      click_link(test_barber.name())
      expect(page).to have_content(test_client.name())
    end
  end

# describe('adding clients to a barber', {:type => :feature}) do
#     it('allows a user to add a task to a list') do
#       test_barber = Barber.new({:name => 'new guy'})
#       test_barber.save()
#       visit("/barbers/#{test_barber.id()}")
#       fill_in("name", {:with => "end of coding leo"})
#       click_button("Add task")
#       expect(page).to have_content("Success")
#     end
#   end
  
