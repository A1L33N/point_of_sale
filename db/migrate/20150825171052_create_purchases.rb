class CreatePurchases < ActiveRecord::Migration
  def change
    create_table(:purchases) do |t|
      t.column(:customer_id, :integer)
      t.column(:total, :float)

      t.timestamps()
    end
  end
end
