ENV=['RACK_ENV'] = 'test'

require("rspec")
require("pry")
require("pg")
require("capybara")
require("sinatra")
require("sinatra/activerecord")
require("sinatra/activerecord")
require("customer")
require("product")
require("purchase")

RSpec.configure do |config|
  config.after(:each) do
    Customer.all().each() do |customer|
      customer.destroy()
    end
    Product.all().each() do |product|
      product.destroy()
    end
    Purchase.all().each() do |purchase|
      purchase.destroy()
    end
  end
end
