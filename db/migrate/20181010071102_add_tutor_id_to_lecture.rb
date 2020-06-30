class AddTutorIdToLecture < ActiveRecord::Migration[5.2]
  def change
    add_reference :lectures, :tutor, foreign_key: true
  end
end
