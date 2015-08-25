require("capybara/rspec")
require("./app")
Capybara.app = Sinatra::Application
set(:show_exception, false)

describe('adding a product', {:type => :feature}) do
  it('allows a user to add a product to the database') do
    visit('/')
    click_link('Available Antiques')
    fill_in('product_name', :with => 'Record Player')
    fill_in('product_price', :with => '14.95')
    click_button('Add antique')
    expect(page).to have_content('Success')
  end
end

describe('deleting a product', {:type => :feature}) do
  it('allows a user to delete a product from the database') do
    hot_wheel = Product.create({:name => 'Hot Wheel Toy', :price => 3.50, :purchased => false, :purchase_id => nil})
    visit('/products')
    click_link('hot wheel toy')
    click_button('delique ze antique')
    expect(page).to have_content('Success')
  end
end
