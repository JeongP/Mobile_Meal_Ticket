class CreateUserLectureListens < ActiveRecord::Migration[5.2]
  def change
    create_table :user_lecture_listens do |t|
      t.integer :count
      t.references :user, foreign_key: true
      t.references :lecture, foreign_key: true

      t.timestamps
    end
  end
end
