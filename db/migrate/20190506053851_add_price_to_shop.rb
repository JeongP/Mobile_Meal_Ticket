class AddPriceToShop < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :price, :integer
  end
end
