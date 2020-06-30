class CreateLectures < ActiveRecord::Migration[5.2]
  def change
    create_table :lectures do |t|
      t.string :title
      t.string :image1
      t.string :category
      t.string :image2
      t.string :image3
      t.string :image4
      t.integer :price
      t.text :contents
      t.integer :possible_time
      t.integer :class_date
      t.integer :total_class_num
      t.integer :location

      t.timestamps
    end
  end
end
