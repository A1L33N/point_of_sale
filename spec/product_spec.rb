require("spec_helper")

describe(Product) do
  describe('#purchase') do #ActiveRecord::Base
    it 'returns what purchase the product belongs to' do
      customer1 = Customer.create({:name => "Linda Hamilton"})
      saturday_shop = Purchase.create({:customer_id => customer1.id, :total => 6.07})
      buzz_lightyear = Product.create({:name => 'Buzz Lightyear', :price => 24.97, :purchased => false, :purchase_id => saturday_shop.id})
      expect(buzz_lightyear.purchase).to eq(saturday_shop)
    end
  end

  describe('#purchased?') do #ActiveRecord::Base
    it('will return if the product has been purchased or not') do
      customer1 = Customer.create({:name => "Linda Hamilton"})
      saturday_shop = Purchase.create({:customer_id => customer1.id, :total => 6.07})
      buzz_lightyear = Product.create({:name => 'Buzz Lightyear', :price => 24.97, :purchased => false, :purchase_id => saturday_shop.id})
      expect(buzz_lightyear.purchased?).to eq(false)
    end
  end

  describe('#update_attribute') do #ActiveRecord::Base
    it('updates the purchased field of a product to true') do
      customer1 = Customer.create({:name => "Linda Hamilton"})
      saturday_shop = Purchase.create({:customer_id => customer1.id, :total => 6.07})
      buzz_lightyear = Product.create({:name => 'Buzz Lightyear', :price => 24.97, :purchased => false, :purchase_id => saturday_shop.id})
      buzz_lightyear.update_attribute(:purchased, true)
      expect(buzz_lightyear.purchased()).to eq(true)
    end
  end

  describe('.not_purchased') do
    it('returns products that have not been purchased') do
      hot_wheel = Product.create({:name => 'Hot Wheel Toy', :price => 3.50, :purchased => false, :purchase_id => nil})
      buzz_lightyear = Product.create({:name => 'Buzz Lightyear', :price => 24.97, :purchased => false, :purchase_id => nil})
      tamagotchi = Product.create({:name => 'Tamagotchi', :price => 17.95, :purchased => true, :purchase_id => nil})
      power_ranger = Product.create({:name => 'Power Ranger', :price => 12.49, :purchased => true, :purchase_id => nil})
      barbie = Product.create({:name => 'Limited Edition Barbie', :price => 99.95, :purchased => true, :purchase_id => nil})
      expect(Product.not_purchased()).to eq([hot_wheel, buzz_lightyear])
    end
  end


end
