class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :img
      t.string :tel
      t.string :location
      t.integer :runningtime

      t.timestamps
    end
  end
end
