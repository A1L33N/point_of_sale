class Product < ActiveRecord::Base
  belongs_to(:purchase)
  validates(:name, {:presence => true, :length => { :maximum => 50 }})
  validates(:price, {:presence => true, :numericality => { :greater_than => 0.0 }})
  before_save(:downcase_name)

  scope(:not_purchased, -> do
    where({:purchased => false})
  end)

private
  define_method(:downcase_name) do
    self.name = name.downcase
  end
end
