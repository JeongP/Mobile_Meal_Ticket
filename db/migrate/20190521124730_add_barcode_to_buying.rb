class AddBarcodeToBuying < ActiveRecord::Migration[5.2]
  def change
    add_column :buyings, :barcode, :string
  end
end
