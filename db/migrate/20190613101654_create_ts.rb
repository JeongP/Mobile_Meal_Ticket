class CreateTs < ActiveRecord::Migration[5.2]
  def change
    create_table :ts do |t|
      t.string :title

      t.timestamps
    end
  end
end
