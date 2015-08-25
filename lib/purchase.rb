class Purchase < ActiveRecord::Base
  belongs_to(:customer)
  has_many(:products)

  define_method(:total) do
    prices = []
    self.products().each() do |product|
      prices.push(product.price())
    end
    prices.inject{|sum,x| sum + x}
  end
end
