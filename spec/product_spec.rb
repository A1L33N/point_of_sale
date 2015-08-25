require("spec_helper")

describe(Product) do
  describe('#purchase') do
    it 'returns what purchase the product belongs to' do
      customer1 = Customer.create({:name => "Linda Hamilton"})
      saturday_shop = Purchase.create({:customer_id => customer1.id, :total => 6.07})
      buzz_lightyear = Product.create({:name => 'Buzz Lightyear', :price => 24.97, :purchased => false, :purchase_id => saturday_shop.id})
      expect(buzz_lightyear.purchase).to eq(saturday_shop)
    end
  end
# describe(Product) do
#   describe('#purchased?') do
#     it('will return if the product has been purchased or not') do
#       product1 = Product.create({:name => ''})
#     end
#   end


end
