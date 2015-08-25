require("spec_helper")

describe(Customer) do
  describe("#purchases") do #ActiveRecord::Base
    it 'returns the purchases the customer has made' do
      customer1 = Customer.create({:name => "Linda Hamilton"})
      saturday_shop = Purchase.create({:customer_id => customer1.id, :total => 6.07})
      sunday_shop = Purchase.create({:customer_id => customer1.id, :total => 51.89})
      expect(customer1.purchases).to eq([saturday_shop, sunday_shop])
    end
  end

  it('validates the presence of a name') do
    customer1 = Customer.new({:name => ""})
    expect(customer1.save()).to eq(false)
  end

  it('converts the name to downcase letters before saving to database') do
    customer1 = Customer.create({:name => "Linda Hamilton"})
    expect(customer1.name).to eq('linda hamilton')
  end
end
