class AddUseToBuying < ActiveRecord::Migration[5.2]
  def change
    add_column :buyings, :use, :boolean
  end
end
