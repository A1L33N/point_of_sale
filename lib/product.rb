class Product < ActiveRecord::Base
  belongs_to(:purchase)

  scope(:not_purchased, -> do
    where({:purchased => false})
  end)
end
