require("spec_helper")

describe(Purchase) do
  describe('#products') do
    it 'will return the products related to a purchase' do
      customer1 = Customer.create({:name => "Linda Hamilton"})
      saturday_shop = Purchase.create({:customer_id => customer1.id, :total => 6.07})
      hot_wheel = Product.create({:name => 'Hot Wheel Toy', :price => 3.50, :purchased => false, :purchase_id => saturday_shop.id})
      buzz_lightyear = Product.create({:name => 'Buzz Lightyear', :price => 24.97, :purchased => false, :purchase_id => saturday_shop.id})

    end
  end
  describe('#customer') do
    it 'will return the customer the purchase belongs to'do
      customer1 = Customer.create({:name => "Linda Hamilton"})
      saturday_shop = Purchase.create({:customer_id => customer1.id, :total => 6.07})
      expect(saturday_shop.customer).to eq(customer1)
    end
  end

end
