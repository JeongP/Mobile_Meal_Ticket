class CreateTutors < ActiveRecord::Migration[5.2]
  def change
    create_table :tutors do |t|
      t.string :image1
      t.string :phone

      t.timestamps
    end
  end
end
