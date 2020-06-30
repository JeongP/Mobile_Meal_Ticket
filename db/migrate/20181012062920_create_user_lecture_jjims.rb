class CreateUserLectureJjims < ActiveRecord::Migration[5.2]
  def change
    create_table :user_lecture_jjims do |t|
      t.references :user, foreign_key: true
      t.references :lecture, foreign_key: true

      t.timestamps
    end
  end
end
