require("spec_helper")

describe(Purchase) do
  describe('#products') do #ActiveRecord::Base
    it 'will return the products related to a purchase' do
      customer1 = Customer.create({:name => "Linda Hamilton"})
      saturday_shop = Purchase.create({:customer_id => customer1.id, :total => 6.07})
      hot_wheel = Product.create({:name => 'Hot Wheel Toy', :price => 3.50, :purchased => false, :purchase_id => saturday_shop.id})
      buzz_lightyear = Product.create({:name => 'Buzz Lightyear', :price => 24.97, :purchased => false, :purchase_id => saturday_shop.id})
    end
  end

  describe('#customer') do #ActiveRecord::Base
    it 'will return the customer the purchase belongs to' do
      customer1 = Customer.create({:name => "Linda Hamilton"})
      saturday_shop = Purchase.create({:customer_id => customer1.id, :total => 6.07})
      expect(saturday_shop.customer).to eq(customer1)
    end
  end

  describe('#total') do
    it 'will return the total cost of a purchase' do
      customer1 = Customer.create({:name => "Linda Hamilton"})
      saturday_shop = Purchase.create({:customer_id => customer1.id, :total => nil})
      hot_wheel = Product.create({:name => 'Hot Wheel Toy', :price => 3.50, :purchased => false, :purchase_id => saturday_shop.id})
      power_ranger = Product.create({:name => 'Power Ranger', :price => 12.25, :purchased => false, :purchase_id => saturday_shop.id})
      expect(saturday_shop.total()).to eq(15.75)
    end
  end
end
