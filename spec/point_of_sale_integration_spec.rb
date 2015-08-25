# require("capybara/rspec")
# require("./app")
# Capybara.app = Sinatra::Application
# set(:show_exception, false)
#
# describe('adding a product', {:type => :feature}) do
#   it('allows a user to add a product to the database') do
#     visit('/')
#     click_link('Available Antiques')
#     fill_in('product_name', :with => 'Record Player')
#     fill_in('product_price', :with => '14.95')
#     click_button('Add Antique')
#     expect(page).to have_content('Success')
#   end
# end
